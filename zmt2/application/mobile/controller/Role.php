<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/27
 * Time: 10:09
 */
namespace app\mobile\controller;
use app\common\model\Shop;
use app\common\model\GoodsCate;
use app\common\model\ShopGroup;
use app\common\model\ShopGroupAuth;
use think\Config;
use think\Cookie;
use think\Db;
use think\Url;

class Role extends Base{
    protected $shop_id;
    protected $user_id;
    protected function _initialize()
    {
        parent::_initialize();
		$this->shop = new Shop();
		$this->goods_cate = new GoodsCate();
		$this->shop_group = new ShopGroup();
		$this->shop_group_auth = new ShopGroupAuth();
        $this->mpage = Config::get('mobile_page')?:5;
		$this->shop_id = Cookie::get('shop_id');
		$this->user_id = Cookie::get('user_id');

        if((!$this->user_id)  &&  (!$this->shop_id)){
            header("location:".Url::build('mobile/Users/login'));
            exit;
        }
        $this->assign('shop_id',$this->shop_id);
    }
    /*用户中心*/
    public function index()
    {
		$shop_group_auth = $this->shop_group_auth->getAllAuth(['status'=>1]);
		return view("role/index",[
				'shop_group_auth'=>$shop_group_auth,
			]);
    }
	
    public function rulecate(){
		$id = input('param.id');
		$cate_list = array();
		$auth_list = $this->shop_group->getCateAuthList($this->shop_id,$id);
		foreach($auth_list as $k=>$v){
			$cate_list = getCateArrayByList($v);
		}
		$cate_list2 = (array_unique($cate_list));
		$cate_list3 = $this->goods_cate->goodsCateList();
		foreach($cate_list3 as $k=>$v){
			if(in_array($v['id'],$cate_list2)){
				$cate_list3[$k]['is_use']=1;
			}
			else{
				$cate_list3[$k]['is_use']=0;
			}
		}
		return view('role/index2',[
				'cate_list'=>$cate_list3,
				'type'=>$id,
			]);
	}
	public function postauth(){
		$type = input('param.type');
		$cate = input('param.cate');
		return $this->shop_group->post_auth($this->shop_id,$type,$cate);

	}
	
}