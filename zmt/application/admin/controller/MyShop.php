<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/14
 * Time: 9:52
 */
namespace app\admin\controller;
use app\common\model\Shop;
use app\common\model\ShopCate;
use app\common\model\AdminShop;
use app\common\model\AdminUsers;
use app\common\model\Goods;
use app\common\model\GoodsCate;
use app\common\model\Brand;
use app\common\model\GoodsDetail;
use think\Controller;

class MyShop extends Base{

    protected function _initialize(){
        parent::_initialize();
		$this->shop = new Shop();
		$this->shop_cate = new ShopCate();
		$this->admin_users = new AdminUsers();
		$this->admin_shop = new AdminShop();
		$this->goods = new Goods();
		$this->goods_cate = new GoodsCate();
		$this->goods_detail = new GoodsDetail();
		$this->brand = new Brand();
    }
    
    /*添加、修改配置*/
    public function index()
    {
        $id = input('param.id');
        if(request()->isPost()){
            $dt = input("param.");
			$dt['content'] = imgHandle($_POST['content'],'article');
            if($id >0){//修改
				unset($dt['id']);
                $rs = $this->shop->ShopHandle($dt,$id);
            }
            $rs['code'] ==1 ? $this->success('操作成功',url('MyShop/index')):$this->error($rs['msg']);
        }
		$info = $this->shop->getColumn(['id'=>session('admin_shop_id')],'*',1);
		
		$province = regionHandle(getRegionList(),1,1);//省份
		$city = regionHandle(getRegionList(),2,$info['province_id']);//省份
		$area = regionHandle(getRegionList(),3,$info['city_id']);//省份
        
        return view('myshop/_index',[
            'info'=>$info,
			'cate_list'=>$this->shop_cate->column('id,name'),
			'province'=>$province,
			'city'=>$city,
			'area'=>$area,
        ]);
    }
    /*我的管理员*/
    public function admin()
    {
        return view('myshop/admin_list',[
            'lists'=>$this->admin_users->getAllUser(['id'=>['in',$this->admin_shop->where('shop_id',session('admin_shop_id'))->column('admin_id')]]),
        ]);
    }
	/*是否禁用权限菜单开关*/
    public function powerSwitch()
    {
        $res = $this->admin_users->where(['id'=>input('param.id')])->update(['status'=>input('param.val'),'update_at'=>date('Y-m-d H:i:s',time())]);
        (input('param.val')==0)? $this->success('已启用'):$this->error('已冻结');
    }
	/*添加|修改管理员*/
    public function userHandle()
    {
        $id = input('param.id');
        if(request()->isPost()){
            $dt = input("param.");
            if($id >0){//修改
				if($id==1){
					if(!empty(trimall($dt['password']))){
						$data['password'] = encrypt(trimall($dt['password']));
					}
					$data['author'] = trimall($dt['realname']);
					$data['telephone'] = trimall($dt['telephone']);
					$rs = $this->shop->ShopHandle($data,$id);
				}
				else{
					$rs = $this->admin_users->handle($dt,$id);
				}	
            }else{//添加
                unset($dt['id']);
                $rs = $this->admin_users->handle($dt,0);
				$result = $this->admin_shop->insert(['admin_id'=>$rs['data'],'shop_id'=>session('admin_shop_id'),'attr'=>'all']);
            }
            $rs['code'] ==1 ? $this->redirect(url('MyShop/admin')):$this->error($rs['msg']);
        }
		if($id==1){
			$info = $this->shop->getColumn(['id'=>$id],'username,author,telephone',1);
			$info['realname']=$info['author'];
			unset($info['author']);
		}
		else{
			$info = $this->admin_users->getColumn(['id'=>$id],'username,realname,telephone',1);
		}
        return view('myshop/_admin',[
            'info'=>$info,
			'id'=>$id,
        ]);
    }
	/*删除管理员*/
    public function delUser()
    {
        return $this->admin_users->delUser(input('post.ids/a'));
    }
	
	//商品
	/*商品列表*/
    public function goods()
    {
        return view('myshop/goods_list',[
            'cate_list'=>$this->goods_cate->goodsCateList(),
            'brand_list'=>$this->brand->column('id,name'),
        ]);
    }
    /*ajax商品列表*/
    public function ajaxGoodsList()
    {
        $cate_id = input('param.cate_id');
        $brand_id = input('param.brand_id');
        $keywords = input('param.keywords');
        $where =1;
        if($cate_id){//分类
            $where .= " and (n.cate_id = $cate_id)";
        }
        if($brand_id){//品牌
            $where .= " and (n.brand_id = $brand_id)";
        }

        if($keywords){
            $where .= " and ( (n.name like '%$keywords%') or (m.title like '%$keywords%'))";
        }
        list($list,$page) = $this->goods_detail->getPageList($where,$this->page,['m.id'=>'desc']);
        $ajax_page=preg_replace("(<a[^>]*page[=|/](\d+).+?>(.+?)<\/a>)","<a data-p=$1 href='javascript:void($1);'>$2</a>",$page);
        if($list){
            foreach($list as $k=>$v){
                $v['cate_id'] = getTableColumn('goods_cate','name',['id'=>$v['cate_id']]);
                $v['brand_id'] = getTableColumn('brand','name',['id'=>$v['brand_id']]);
            }
        }
        return view('myshop/ajax_goods_list',[
            'lists'=>$list,
            'page'=>$ajax_page,
        ]);
    }
}