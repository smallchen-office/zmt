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

class Shops extends Base{

    protected function _initialize(){
        parent::_initialize();
		$this->shop = new Shop();
		$this->shop_cate = new ShopCate();
		$this->admin_users = new AdminUsers();
		$this->admin_shop = new AdminShop();
    }

	/*商品列表*/
    public function audit()
    {
        return view('shops/audit_shop_list',[
            'cate_list'=>$this->shop_cate->getCateList(),
        ]);
    }
    /*ajax商品列表*/
    public function ajaxShopsAuditList()
    {
        $cate_id = input('param.cate_id');
        $keywords = input('param.keywords');
        $where ='( status=-2 )';
        if($cate_id){//分类
            $where .= " and (cate_id = $cate_id)";
        }
        if($keywords){
            $where .= " and ( (name like '%$keywords%'))";
        }
        list($list,$page) = $this->shop->getPageList($where,$this->page,['id'=>'desc']);
        $ajax_page=preg_replace("(<a[^>]*page[=|/](\d+).+?>(.+?)<\/a>)","<a data-p=$1 href='javascript:void($1);'>$2</a>",$page);
        if($list){
            foreach($list as $k=>$v){
                $v['cate_id'] = getTableColumn('shop_cate','name',['id'=>$v['cate_id']]);
            }
        }
        return view('shops/ajax_shop_audit_list',[
            'lists'=>$list,
            'page'=>$ajax_page,
        ]);
    }
	public function delAuditDel(){
		return $this->shop->del(input('param.ids/a'),0);
	}
	/*添加、修改配置*/
    public function shopHandle()
    {
        $id = input('param.id');
        if(request()->isPost()){
            $dt = input("param.");
			$dt['content'] = imgHandle($_POST['content'],'article');
            if($id >0){//修改
				unset($dt['id']);
                $rs = $this->shop->ShopHandle($dt,$id);
            }
            $rs['code'] ==1 ? $this->success('操作成功',url('shops/index')):$this->error($rs['msg']);
        }
		$info = $this->shop->getColumn(['id'=>$id],'*',1);
		
		$province = regionHandle(getRegionList(),1,1);//省份
		$city = regionHandle(getRegionList(),2,$info['province_id']);//省份
		$area = regionHandle(getRegionList(),3,$info['city_id']);//省份
        
        return view('shops/_shop',[
            'info'=>$info,
			'cate_list'=>$this->shop_cate->column('id,name'),
			'province'=>$province,
			'city'=>$city,
			'area'=>$area,
        ]);
    }
	/*商品列表*/
    public function index()
    {
        return view('shops/shop_list',[
            'cate_list'=>$this->shop_cate->getCateList(),
        ]);
    }
    /*ajax商品列表*/
    public function ajaxShopsList()
    {
        $cate_id = input('param.cate_id');
        $keywords = input('param.keywords');
        $where ='( status!=-2 )';
        if($cate_id){//分类
            $where .= " and (cate_id = $cate_id)";
        }
        if($keywords){
            $where .= " and ( (name like '%$keywords%'))";
        }
        list($list,$page) = $this->shop->getPageList($where,$this->page,['id'=>'desc']);
        $ajax_page=preg_replace("(<a[^>]*page[=|/](\d+).+?>(.+?)<\/a>)","<a data-p=$1 href='javascript:void($1);'>$2</a>",$page);
        if($list){
            foreach($list as $k=>$v){
                $v['cate_id'] = getTableColumn('shop_cate','name',['id'=>$v['cate_id']]);
            }
        }
        return view('shops/ajax_shop_list',[
            'lists'=>$list,
            'page'=>$ajax_page,
        ]);
    }
	public function delShop(){
		return $this->shop->del(input('param.ids/a'),1);
	}
}