<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/27
 * Time: 16:46
 */
namespace app\common\model;
use think\Model;

class ShopAuth extends Model{
	/**
     * 获取权限菜单
     *@param $where 查询条件
     *@param $filed 要查询的字段
     */
    public function getAllRight($where=1)
    {
       return $this->field('*')->where($where)->order(['sort'=>'desc'])->select();
    }
}