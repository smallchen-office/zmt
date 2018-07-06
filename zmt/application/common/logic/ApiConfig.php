<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/14
 * Time: 13:38
 */
namespace app\common\logic;
use think\Db;

class ApiConfig {
    /**
     * 获取数据库中的配置列表
     */
    public static function configList(){
        return config('WEB_CONFIG');
    }
    /**
     * 解析系统配置
     *@param $type 类型
     *@param $value 值
     */
    protected static function parseCf($type,$value){
        if(empty($value)) return [];
        switch($type){
            case 5://解析数组
               $value = explode(',',$value);
                break;
        }
        return $value;
    }
}