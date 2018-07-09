<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2016/12/28
 * Time: 18:55
 */
namespace app\admin\controller;
use app\common\model\Shop;
use app\common\model\ShopCate;
use app\common\model\AdminAuth;
use app\common\model\AdminUsers;
use app\common\model\AdminShop;

use think\Controller;
use think\Db;

class Base extends Controller{
    protected $auth;
	
    protected $shop;
    protected $shop_cate;
    protected $shop_auth;
	protected $admin_users;
	protected $admin_shop;
    protected $admin_id;
	protected $shop_id;
    /*
     * 初始化操作
     * */
    protected function _initialize()
    {
        parent::_initialize();
        $this->shop = new Shop();
        $this->shop_cate = new ShopCate();
        $this->admin_auth = new AdminAuth();
		$this->admin_users = new AdminUsers();
        $this->admin_shop = new AdminShop();
		
        needCacheConfig('system_config_data');//判断是否需要缓存配置文件
        $this->page = config('list_pages')?:'20';//分页大小
        $this->admin_id = session('admin_user_id');
		$this->shop_id = session('admin_shop_id');
		
//        $this->page = 3;
        //登录检测及主页权限
        if(in_array(req('action'),['login','logout','checkverify','getverify']) || in_array(req('controller'),['ueditor','uploadify'])){//过滤不需要登录即可操作的行为
            return true;
        }else{
            if(session('admin_user_id') >0&&session('admin_shop_id') >0){
				
                $shop_info = $this->shop->where(['id'=>session('admin_shop_id')])->find();
				if(session('admin_user_id')==1){
					$shop_info['act_list'] = 'all';
				}
				else{
					$admin_role =$result = $this->admin_shop->getColumn(['admin_id'=>$user_info['id'],
											'shop_id'=>$shopid,
											],'attr',1);
					$shop_info['act_list'] = $admin_role['attr'];
				}
                $this->auth = $shop_info;
                $this->checkPrivilege();
				
            }else{//跳转到登录页面
				session(null);
                $this->redirect(url('Admin/login'));
            }
        }
        if(config('web_site_status') == 1 && $this->shop_id !=1 ){
            $this->error('站点已经关闭，请稍后访问~');
        }
        $this->assign([
            'admin_info'=>$this->auth,
        ]);
    }
    /*
     * 后台权限检测
     * */
    protected function checkPrivilege(){
        $controller = req('controller');
        $action = req('action');
        $act_list = $this->auth['act_list'];
        //无需验证权限的操作
        $uneed_check = ['login','loginout','upload'];
        if(($controller == 'index') || ($act_list=='all')){//后台首页或超级管理员
            return true;
        }elseif(strpos('ajax',$action) || in_array($action,$uneed_check)){//所有Ajax请求无需验证
            return true;
        }else{
            $right_arr=$this->admin_auth->getRights($act_list);
            if(empty($right_arr)){
                $right_arr = [];
            }
            if(!in_array(strtolower($controller).'@'.strtolower($action),$right_arr)){
                $this->error('您没有操作权限,请联系超级管理员分配权限',url('Index/welcome'));
            }
        }
    }
}