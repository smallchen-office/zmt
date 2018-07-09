<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/2/11
 * Time: 14:24
 */
namespace app\admin\controller;
use app\common\model\GoodsCate;
use app\common\model\GoodsImg;
use app\common\model\GoodsDetail;
use app\common\model\Brand;
use app\common\model\Shop;
use app\common\model\Spec;
use think\Db;

class Goods extends Base{
    protected $goodsCategory;
    protected $goodsType;
    protected $goodsAttribute;
    protected $goodsSpec;
    protected $goods;
    protected $goodsImg;
    protected $uploadify;
    /*商品分类列表*/
    protected function _initialize()
    {
        parent::_initialize();
        $this->goods_cate = new GoodsCate();
		$this->goods_img = new GoodsImg();
		$this->goods_detail = new GoodsDetail();
        $this->brand = new Brand() ;
		$this->shop = new Shop() ;
		$this->spec = new Spec() ;
        $this->goods = new \app\admin\model\Goods();
        $this->uploadify = new Uploadify();
    }
    
    /*商品列表*/
    public function index()
    {
        return view('goods/goods_list',[
            'cate_list'=>$this->goods_cate->goodsCateList(),
            'brand_list'=>$this->brand->column('id,name'),
			'shop_list'=>$this->shop->column('id,name'),
        ]);
    }
    /*ajax商品列表*/
    public function ajaxGoodsList()
    {
        $cate_id = input('param.cate_id');
        $brand_id = input('param.brand_id');
		$shop_id = input('param.shop_id');
        $keywords = input('param.keywords');
        $where ='( m.status =1 )';
        if($cate_id){//分类
            $where .= " and (n.cate_id = $cate_id)";
        }
        if($shop_id){//店铺
            $where .= " and (m.shop_id = $shop_id)";
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
				$v['shop_id'] = getTableColumn('shop','name',['id'=>$v['shop_id']]);
            }
        }
        return view('goods/ajax_goods_list',[
            'lists'=>$list,
            'page'=>$ajax_page,
        ]);
    }
    /*添加|修改商品*/
    public function goodsHandle()
    {
        $id=input('param.id');
		if(request()->isPost()){
			$dt = input("param.");
			$dt['shop_id'] = $this->shop_id;
			$dt['detail'] = imgHandle($_POST['detail'],'goods');
            if(!isset($dt['images'])) $dt['images']=[];
            if($id >0){//修改
                $rs = $this->goods_detail->handle($dt,$id);
            }else{//添加
                unset($dt['id']);
                $rs = $this->goods_detail->handle($dt);
            }
			if($rs['code'] ==1){
				return ['code'=>1,'data'=>'','msg'=>'操作成功','url'=>'/admin/goods/index'];
			}else{
				return ['code'=>0,'data'=>'','msg'=>'操作失败'.$rs['msg'],'url'=>''];
			}
		}
		$result = $this->goods_detail->getGoodsInfo($id);
		$cate_list = $this->goods_cate->goodsCateList();
		return view('goods/_goods',[
				'id'=>$id,
				'info'=>$result,
				'goods_list' => $this->goods->column('id,cate_id,brand_id,name,longname'),
				'cate_list'  => $cate_list,
				'images' =>$this->goods_img->where('goods_id',$id)->column('id,url'),
				'spec_list'=>$this->spec->column('id,name'),
				'brand'=>$this->brand->column('id,name'),
				'shop_list'=>$this->shop->column('id,name'),
			]);
    }

    /*删除商品*/ //TODO 删除商品
    public function delGoods()
    {
		return $this->goods_detail->del(input('param.ids/a'));
    }
    /*商品列表*/
    public function audit()
    {
        return view('goods/audit_list',[
            'cate_list'=>$this->goods_cate->goodsCateList(),
            'brand_list'=>$this->brand->column('id,name'),
			'shop_list'=>$this->shop->column('id,name'),
        ]);
    }
    /*ajax商品列表*/
    public function ajaxAuditList()
    {
        $cate_id = input('param.cate_id');
        $brand_id = input('param.brand_id');
		$shop_id = input('param.shop_id');
        $keywords = input('param.keywords');
        $where ='( m.status =-2 )';
        if($cate_id){//分类
            $where .= " and (n.cate_id = $cate_id)";
        }
        if($shop_id){//店铺
            $where .= " and (m.shop_id = $shop_id)";
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
				$v['shop_id'] = getTableColumn('shop','name',['id'=>$v['shop_id']]);
            }
        }
        return view('goods/ajax_audit_list',[
            'lists'=>$list,
            'page'=>$ajax_page,
        ]);
    }
}