<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/14
 * Time: 9:51
 */
namespace app\common\model;
use think\Model;

class AdminShop extends Model{
	public function getColumn($where=1,$field="*",$isinfo=0){
        $result = $this->where($where)->column($field);
        if(count($result)>0){
            if(1 == $isinfo)
                return reset($result);
        }
    }

}