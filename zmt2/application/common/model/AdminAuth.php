<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/1/2
 * Time: 20:39
 */
namespace app\common\model;
use think\Model;

class AdminAuth extends  Model{
     /**
     * 根据act_list获取权限数组
     *@$act_list
     */
    public function getRights($act_list=0){
        $right_menu = $this->where(['id'=>['in',$act_list],'status'=>['eq',0]])->column('control');
        if(empty($right_menu)) return '';//如果一条权限都没有，返回空
        $right_menu_list='';
        foreach($right_menu as $k=>$v){
            $right_menu_list .= strtolower($v).',';
        }
        return explode(',',$right_menu_list);
    }
	 /**
     * 获取所有菜单
     *@param
     */
    public function getAllMenu($where='1'){
        $all_menu = $this->where($where)->order(['sort'=>'asc'])->select();
        $menu = prePareMenu(objToArray($all_menu));
        return $menu;
    }
	/**
     * 根据act_list获取权限菜单
     *@param $act_list 权限菜单
     *@param $all_menu 所有菜单
     */
   public function getRightList($act_list=0,$all_menu){
        if(strtolower($act_list) !='all'){
            //权限菜单列表
            $right_menu_list = $this->getRights($act_list);
            if(empty($right_menu_list)){
                $right_menu_list = [];
            }
            foreach($all_menu as $k=>$v){
              if(isset($v['sun'])){
                  foreach($v['sun'] as $kk=>$vv){
                      if(!in_array(strtolower($vv['control']).'@'.strtolower($vv['action']),$right_menu_list)){
                          unset($all_menu[$k]['sun'][$kk]);
                      }
                  }
              }
            }
        }
       return $all_menu;
   }
}