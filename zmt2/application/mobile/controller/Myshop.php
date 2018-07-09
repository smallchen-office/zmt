<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/27
 * Time: 10:09
 */
namespace app\mobile\controller;
use app\common\model\Shop;
use app\common\model\ShopCate;
use app\common\model\ShopGroup;
use app\common\model\Goods;
use app\common\model\Spec;
use app\common\model\Note;
use app\common\model\NoteCate;
use app\common\model\GoodsDetail;
use app\common\model\GoodsCate;
use app\common\model\GoodsImg;
use think\Config;
use think\Cookie;
use think\Db;
use think\Session;
use think\Url;

class Myshop extends Base{
    protected $shop_id;
    protected $user_id;
    protected $order;
    protected $mpage;
    protected function _initialize()
    {
        parent::_initialize();
		$this->shop = new Shop();
		$this->shop_cate = new ShopCate();
		$this->goods = new Goods();
		$this->spec = new Spec();
		$this->note = new Note();
		$this->note_cate = new NoteCate();
		$this->goods_detail = new GoodsDetail();
		$this->goods_cate = new GoodsCate();
		$this->goods_img = new GoodsImg();
        $this->mpage = Config::get('mobile_page')?:5;
		$this->shop_group = new ShopGroup();
		$this->shop_id = Cookie::get('shop_id');
		$this->user_id = Cookie::get('user_id');
        if((!$this->user_id) && (!$this->shop_id)){
            header("location:".Url::build('mobile/Users/login'));
            exit;
        }
        $this->assign('shop_id',$this->shop_id);
    }
    /*用户中心*/
    public function goods()
    {
		$cate_id = input('param.cate_id');
		return view('myshop/goods',[
				'cate_id'=>$cate_id,
			]);
    }
	/*获取自己门店的商品列表*/
    public function ajaxGoodsList()
    {
		$cate_id = input('param.cate_id');
		$cate_ids = getCatGrandson($cate_id);
		$cartList = $this->goods_detail->getPageGoodsDetailList(['n.cate_id'=>['in',$cate_ids],'m.shop_id'=>$this->shop_id]);
		return view("myshop/ajax_goods_list",[
			'cate_id'=>$cate_id,
			'cartList'=>$cartList,
		]);
    }
	public function goodsHandle(){
		$id=input('param.ids');
		$type=input('param.type');
		$cate_id = input('param.cate_id');
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
			if($rs['code'] ==0){
				return ['code'=>0,'data'=>'','msg'=>'操作失败'.$rs['msg'],'url'=>''];
			}else{
				return ['code'=>1,'data'=>'','msg'=>'操作成功','url'=>'/mobile/myshop/goods/cate_id/'.$cate_id];
			}
		}
		$result = $this->goods_detail->getGoodsInfo($id);
		$cate_ids = getCatGrandson($cate_id);
		return view('myshop/_goods',[
				'id'=>$id,
				'info'=>$result,
				'spec'=>$this->spec->column('id,name'),
				'cate_id'=>$cate_id,
				'goods_list' => $this->goods->where(['cate_id'=>['in',$cate_ids]])->column('id,cate_id,brand_id,name,longname'),
				'images' =>$this->goods_img->where('goods_id',$id)->column('id,url'),
				'spec_list'=>$this->spec->column('id,name'),
			]);
	}
	public function note()
    {
		$cate_id = input('param.cate_id');
		return view('myshop/note',[
				'cate_id'=>$cate_id,
			]);
    }
	/*获取自己门店的商品列表*/
    public function ajaxNoteList()
    {
		$cate_id = input('param.cate_id');
		$cate_ids = getCatGrandson($cate_id);
		$cartList = $this->note->getNoteList(['a.cate_id'=>['in',$cate_ids],'a.shop_id'=>$this->shop_id]);
		return view("myshop/ajax_note_list",[
			'cate_id'=>$cate_id,
			'cartList'=>$cartList,
		]);
    }
	
	public function noteHandle(){
		$id=input('param.ids');
		$type=input('param.type');
		$cate_id=input('param.cate_id');
		if(request()->isPost()){
			$dt = input("param.");
			$dt['shop_id'] = $this->shop_id;
			$dt['note'] = imgHandle($_POST['note'],'article');
            if($id >0){//修改
                $rs = $this->note->handle($dt,$id);
            }else{//添加
                unset($dt['id']);
                $rs = $this->note->handle($dt);
            }
			if($rs['code'] ==1){
				return ['code'=>1,'data'=>'','msg'=>'操作成功','url'=>'/mobile/myshop/note/cate_id/'.$cate_id];
			}else{
				return ['code'=>0,'data'=>'','msg'=>'操作失败'.$rs['msg'],'url'=>''];
			}
		}
		$result = $this->note->getNoteInfo($id);

		return view('myshop/_note',[
				'id'=>$id,
				'cate_id'=>$cate_id,
				'info'=>$result,
				'note_cate'=>$this->note_cate->column('id,name'),
			]);
	}
	public function article(){
		$cate_id = input('param.cate_id');
		$list = $this->note->getNoteList(['a.cate_id'=>$cate_id,'a.status'=>1,'a.is_show'=>1]);
		return view('myshop/article',[
				'cate_id' => $cate_id,
				'list' =>$list,
			]);
	}
}