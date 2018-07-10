<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/27
 * Time: 9:07
 */
namespace app\mobile\controller;
use app\common\model\Auth;
use app\common\model\GoodsDetail;
use app\common\model\Shop;
use app\common\model\Cate;
use app\common\model\ShopGroup;
use app\common\model\GoodsCate;
use app\common\model\ShopCateAuth;
use app\common\model\GoodsStock;
use think\Config;
use think\Cookie;
use think\Db;
use think\Session;
use think\Url;

class Shops extends Base{
    protected $cartLogic;
    protected $user_info;
    protected $user_id;
    protected function _initialize()
    {
        parent::_initialize();
		$this->auth = new Auth();
		$this->goods_detail = new GoodsDetail();
		$this->cate = new Cate();
		$this->goods_cate = new GoodsCate();
		$this->shop_group = new ShopGroup();
		$this->goods_stock = new GoodsStock();
		$this->shop_cate_auth = new ShopCateAuth();
		$this->shop = new Shop();
		$this->user_id = Cookie::get('user_id');
		$this->user_info = Cookie::get('user_info');
        if((!$this->user_id)){
            header("location:".Url::build('mobile/Users/login'));
            exit;
        }
		$this->assign('user_info',$this->user_info);
    }
    public function Auth()
    {
		$id = input('param.id');
		$info = $this->shop->where(['shop_cate_id'=>$id,'user_id'=>$this->user_id,'status'=>1])->find();
		$cates = $this->shop_cate_auth->where(['shop_id'=>$info['id'],'shop_cate_id'=>$id,'status'=>1])->column('goods_cate_id');
		$cate_list = $this->goods_cate->where(['id'=>['in',$cates],'pid'=>0,'status'=>1])->order('sort asc')->select();
		return view('shops/index',[
				'id'=>$id,
				'info'=>$info,
				'cate_list'=>$cate_list,
			]);
    }
	public function Auth2(){
		$id = input('param.id');
		$cate_id = input('param.cate_id');
		$pid = input('param.pid')?input('param.pid'):0;
		$info = $this->auth->where(['id'=>$pid])->find();
		$shop_info = $this->shop->where(['shop_cate_id'=>$id,'user_id'=>$this->user_id,'status'=>1])->find();
		$shop_cate = $this->cate->where(['id'=>$id,'status'=>1])->value('auth');
		$auth_list = $this->auth->where(['pid'=>$pid,'status'=>1,'id'=>['in',$shop_cate]])->order('sort asc')->column('id,pid,name,long_name,href,logo');
		
		$info['long_name'] = getTableColumn('cate','name',['id'=>$id ]).'-'.getTableColumn('goods_cate','name',['id'=>$cate_id ]).$info['long_name'];
		return view('shops/index2',[
				'cate_id'=>$cate_id,
				'pid'=>$pid,
				'id'=>$id,
				'info'=>$info,
				'auth_list'=>$auth_list,
			]);
	}
	public function Data_create(){
		$cate_id = input('param.cate_id');
		if(request()->isPost()){
			$dt = input("param.");
			
			$stock = $this->goods_detail->where('id',$dt['goods_id'])->find();
			$number2 = $stock['stock']+$dt['number1'];
			$result = $this->goods_stock->insert([
											'shop_id'=>$this->shop_id,
											'goods_id'=>$dt['goods_id'],
											'goods_name'=>$stock['title'],
											'num0'=>$stock['stock'],
											'num1'=>$dt['number1'],
											'num2'=>$number2,
											'per_money'=>$stock['sale_money'],
											'detail'=>$dt['detail'],
											'create_at'=>date('Y-m-d H:i:s',time()),
										]);
			if($result==false){
				return ['code'=>0,'data'=>'','msg'=>'操作失败','url'=>''];
			}
			else{
				$this->goods_detail->where('id',$dt['goods_id'])->update(['stock'=>$number2]);
				return ['code'=>1,'data'=>'','msg'=>'操作成功','url'=>'/mobile/shops/auth2/cate_id/'.$cate_id];
			}
		}
		$cate_ids = getCatGrandson($cate_id);
		//$cate_list = $this->goods_cate->where(['status'=>1,'id'=>['in',$cate_ids]])->order('sort asc')->column('id,pid,name,deep');
		$goods_list = $this->goods_detail->getPageGoodsDetailList(['n.cate_id'=>['in',$cate_ids],'m.shop_id'=>$this->shop_id]);
		return view('shops/data_create',[
				'goods_list' => $goods_list,
				'cate_id' => $cate_id,
			]);
	}
	public function getStock0(){
		$stock = $this->goods_detail->where('id',input('param.goods_id'))->find();
		echo $stock['stock'];
	}
	public function Data_analyse(){
		$cate_id = input('param.cate_id');
		$cate_ids = getCatGrandson($cate_id);
		$goods_list = $this->goods_detail->getPageGoodsDetailList(['n.cate_id'=>['in',$cate_ids],'m.shop_id'=>$this->shop_id]);
		$result = $this->goods_stock->where('shop_id',$this->shop_id)->order('id desc')->field('goods_name,per_money,create_at,num1,detail')->select();
		return view('shops/data_analyse',[
				'result'=>$result,
				'goods_list' => $goods_list,
			]);
	}
	public function near(){
		$lng = input('param.lng');
		$lat = input('param.lat');
		$cate_id = input('param.pid');
		$where['status'] = 1 ;
		if($cate_id){
			$where['cate_id'] = $cate_id;
		}
		$page = input('param.p')?input('param.p'):1;
		$shop_list = $this->shop->where($where)->select();
		foreach($shop_list as $k=>$v){
			$maps = explode(',',$v['map'],2);
			$shop_list[$k]['range']=getdistance(119.14308218667,36.5813308172,$maps[1],$maps[0]);
		}
		return view('shops/near',[
				'shop_list'=>$shop_list,
			]);
	}
}