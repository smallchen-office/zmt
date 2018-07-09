<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/27
 * Time: 10:09
 */
namespace app\mobile\controller;
use app\common\model\Area;
use app\common\model\Shop;
use app\common\model\ShopCate;
use think\Config;
use think\Cookie;
use think\Db;
use think\Session;
use think\Url;

class Urlser extends Base{
    protected $user_id;
    protected $shop_id;
    protected $area;
    protected $mpage;
    protected function _initialize()
    {
        parent::_initialize();
		$this->shop = new Shop();
        $this->user_id = Cookie::get('user_id');
		$this->shop_id = Cookie::get('shop_id');
		$this->shop_cate = new ShopCate();
        $this->area = new Area();
        $this->mpage = Config::get('mobile_page')?:5;
        
        $this->assign('shop_id',$this->shop_id);
    }
	public function reg()
	{
		//登录状态判断,如果登录则退出
        if($this->user_id){
            header("location:".Url::build('mobile/Users/logout'));
            exit;
        }
		$recommend = empty(input('param.recommend_id'))?input('param.recommend_id'):0;
		if(request()->isPost()){
			$dt = input("param.");
			$dt['spread']=$recommend;
			$dt['password']=encrypt(trimall($dt['password']));
            $rs = $this->shop->ShopHandle($dt);
            $rs['code'] ==1 ? $this->success('操作成功',url('users/login')):$this->error($rs['msg']);
		}
		$province = regionHandle(getRegionList(),1,1);//省份
		$city = regionHandle(getRegionList(),2,0);//省份
		$area = regionHandle(getRegionList(),3,0);//省份
		return view('urlser/reg',[
				'cate_list'=>$this->shop_cate->column('id,name'),
				'province'=>$province,
				'recommend'=>$recommend,
				'city'=>$city,
				'area'=>$area,
			]);
	}
	public function shopinfo(){
		$info = $this->shop->getColumn(['id'=>$this->shop_id],'*',1);
		if(request()->isPost()){
			$dt = input("param.");
            $rs = $this->shop->ShopHandle($dt,$this->shop_id);
            $rs['code'] ==1 ? $this->success('操作成功',url('users/login')):$this->error($rs['msg']);
		}
		$province = regionHandle(getRegionList(),1,1);//省份
		$city = regionHandle(getRegionList(),2,$info['province_id']);//省份
		$area = regionHandle(getRegionList(),3,$info['city_id']);//省份
		return view('urlser/shopinfo',[
				'info'=>$info,
				'cate_list'=>$this->shop_cate->column('id,name'),
				'province'=>$province,
				'city'=>$city,
				'area'=>$area,
			]);
	}
}