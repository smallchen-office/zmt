<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/13
 * Time: 9:36
 */
namespace app\mobile\controller;
use app\home\logic\UserLogic;

use think\Config;
use think\Controller;
use think\Cookie;
use think\Db;
use think\Request;
use think\Session;

class Base extends Controller{
    protected $session_id;
    protected $cateTree;
    protected $mpage;

    protected function _initialize()
    {
        parent::_initialize();
        //Session::start();//启动session以获取session_id
        $this->session_id = session_id();
        $this->cateTree = [];
        //define('SESSION_ID',$this->session_id); //将当前的session_id保存为常量，供其它方法调用
		
		$this->user_id = Cookie::get('user_id');
		$this->area_id = Cookie::get('area_id');
		
        needCacheConfig('system_config_data');//判断是否需要缓存配置文件

        //判断当前用户是否为手机
        if(isMobile()){
            Cookie::set('is_mobile','1',3600);// 设置Cookie 有效期为 3600秒
        }else{
            Cookie::set('is_mobile','0',3600);// 设置Cookie 有效期为 3600秒
        }
        $this->publicAssign();

    }
    /*渲染变量到模板方法*/ //TODO
    private function publicAssign(){
        $this->cateTree  = getGoodsCatTree(1);
        $this->assign(['goods_category_tree'=>$this->cateTree]);
    }
}