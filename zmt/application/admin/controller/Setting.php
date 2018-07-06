<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/14
 * Time: 9:52
 */
namespace app\admin\controller;
use app\common\model\Auth;
use app\common\model\Shop;
use app\common\model\ShopCate;
use app\common\model\ShopAuth;
use app\common\model\Goods;
use app\common\model\GoodsCate;
use app\common\model\Brand;
use app\common\model\Spec;
use think\Controller;

class Setting extends Base{

    protected function _initialize(){
        parent::_initialize();
		$this->auth = new Auth();
		$this->shop = new Shop();
		$this->shop_cate = new ShopCate();
		$this->shop_auth = new ShopAuth();
		$this->goods = new Goods();
		$this->goods_cate = new GoodsCate();
		$this->brand = new Brand();
		$this->spec = new Spec();
    }

    /*品牌管理*/
    public function brandlist()
    {
        return view('setting/brand_list',[
            'lists'=>$this->brand->getAll(),
        ]);
    }
	/*添加|修改商品品牌*/
    public function brandHandle()
    {
        $id = (int) input('param.id');
        if(request()->isPost()){
            $dt = input("param.");
            if($id >0){//修改
                $rs = $this->brand->handle($dt,$id);
            }else{//添加
                unset($dt['id']);
                $rs = $this->brand->handle($dt);
            }
            $rs['code'] ==1 ? $this->redirect(url('Setting/brandlist')):$this->error($rs['msg']);
        }
        $info = $this->brand->get($id);
        return view('setting/_brand',[
            'info'=>$info,
            'id'=>$id,
        ]);
    }
    /*删除品牌*/
    public function delBrand()
    {
        return $this->brand->del(input('param.ids'));
    }
	/*品牌管理*/
    public function speclist()
    {
        return view('setting/spec_list',[
            'lists'=>$this->spec->getAll(),
        ]);
    }
	/*添加|修改商品类型*/
    public function specHandle()
    {
        $id = (int) input('param.id');
        if(request()->isPost()){
            $dt = input("param.");
            if($id >0){//修改
                $rs = $this->spec->handle($dt,$id);
            }else{//添加
                unset($dt['id']);
                $rs = $this->spec->handle($dt);
            }
            $rs['code'] ==1 ? $this->redirect(url('setting/speclist')):$this->error($rs['msg']);
        }
        $info = $this->spec->where('id',$id)->find();
        return view('setting/_spec',[
            'info'=>$info,
            'id'=>$id,
        ]);
    }
    /*删除商品规格*/
    public function delSpec()
    {
        return $this->spec->del(input('param.ids'));
    }
	
	/*商品分类列表*/
    public function goodsCate()
    {
        return view('setting/goods_cate_list',[
            'lists'=>$this->goods_cate->goodsCateList(['status'=>['neq','-1']]),
        ]);
    }
	 /*添加|修改商品分类*/
    public function categoryHandle()
    {
        $id = (int) input('param.id');
        if(request()->isPost()){
            $dt = input("param.");
            //$dt['pid'] = ($dt['pid1'] < 1) ?$dt['pid']:$dt['pid1'];
            if($id >0){//修改
                $pinfo = $this->goods_cate->where('id',$dt['pid'])->find();
                if($pinfo){
                    if(in_array($id,explode('_',$pinfo['pid_path']))){
                        $this->error('上级节点不能是自己或自己的后代');
                    }
                }
                $rs = $this->goods_cate->handle($dt,$id);
            }else{//添加
                unset($dt['id']);
                $rs = $this->goods_cate->handle($dt);
            }
            $rs['code'] ==1 ? $this->success('操作成功',url('setting/goodsCate')):$this->error($rs['msg']);
        }
        $info = $this->goods_cate->where('id',$id)->find();
        $clevel = $this->goods_cate->findCurCate($id);
        return view('setting/_cate',[
            'info'=>$info,
             'id'=>$id,
             'lists'=>$this->goods_cate->goodsCateList(['status'=>['neq','-1'],'deep'=>['in','0,1']]),
             'c_level'=> $clevel
        ]);
    }
	/*获取多级联动的商品分类*/
    public function ajaxGetNext()
    {
        $list = $this->goods_cate->where(['pid'=>input('param.pid')])->column('id,name,pid');
        $htm = '';
        if($list){
            foreach($list as $k=>$v){
                $htm .= "<option value='{$k}'>{$v['name']}</option>";
            }
        }
        exit($htm);
    }
	/*删除商品分类*/
    public function delCategory()
    {
        return $this->goods_cate->del(input('param.ids'));
    }
	//商品
	/*商品列表*/
    public function goodslist()
    {
        return view('setting/goods_list',[
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
            $where .= " and (cate_id = $cate_id)";
        }
        if($brand_id){//品牌
            $where .= " and (brand_id = $brand_id)";
        }

        if($keywords){
            $where .= " and ( (name like '%$keywords%') or (longname like '%$keywords%'))";
        }
        list($list,$page) = $this->goods->getPageList($where,$this->page,'*',['id'=>'desc']);
        $ajax_page=preg_replace("(<a[^>]*page[=|/](\d+).+?>(.+?)<\/a>)","<a data-p=$1 href='javascript:void($1);'>$2</a>",$page);
        if($list){
            foreach($list as $k=>$v){
                $v['cate_id'] = getTableColumn('goods_cate','name',['id'=>$v['cate_id']]);
                $v['brand_id'] = getTableColumn('brand','name',['id'=>$v['brand_id']]);
            }
        }
        return view('setting/ajax_goods_list',[
            'lists'=>$list,
            'page'=>$ajax_page,
        ]);
    }
	
	/*添加|修改商品*/
    public function goodsHandle()
    {
        $id = (int) input('param.id');
        if(request()->isPost()){
            $dt = input("param.");
			
            if($id >0){//修改
                $rs = $this->goods->handle($dt,$id);
            }else{//添加
                unset($dt['id']);
                $rs = $this->goods->handle($dt);
            }
            $rs['code'] ==1 ? $this->success('操作成功',url('setting/goodsList')):$this->error($rs['msg']);
        }
        $info = $this->goods->where('id',$id)->find();

        return view('setting/_goods',[
            'info'=>$info,
            'id'=>$id,
            'p_list'=>$this->goods_cate->goodsCateList(),//所属商品分类
            'brand_list' => $brand = $this->brand->column('id,name'),//商品通用信息-品牌
        ]);
    }
	public function delGoods(){
		return $this->goods->del(input('param.ids'));
	}
	/*商铺分类列表*/
    public function shopCate()
    {
        return view('setting/shop_cate_list',[
            'lists'=>$this->shop_cate->select(),
        ]);
    }
	/*添加|修改权限列表*/
    public function shopCateHandle()
    {
        $id = input('param.id');
        if(request()->isPost()){
            $dt = input("param.");
            if($id >0){//修改
                $rs = $this->shop_cate->handle($dt,$id);
            }else{//添加
                unset($dt['id']);
                $rs = $this->shop_cate->handle($dt);
            }
            $rs['code'] ==1 ? $this->redirect(url('setting/shopCate')):$this->error($rs['msg']);
        }
        $info = $this->shop_cate->where('id',$id)->find();
        //所拥有的权限
        $right = $this->auth->where("status =1")->select();
        foreach($right as $v){
            if($info){
                $v['default'] = in_array($v['id'],explode(',',$info['auth']))?1:0;
            }else{
                $v['default'] = 0;
            }
        }
        return view('setting/_role',[
            'id'=>$id,
            'modules'=>$right,
            'info'=>$info,
        ]);
    }
	public function delShopCate(){
		return $this->shop_cate->del(input('param.ids'));
	}
}