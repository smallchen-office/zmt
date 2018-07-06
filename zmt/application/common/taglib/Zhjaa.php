<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/22
 * Time: 13:09
 */
namespace app\common\taglib;
use think\Cache;
use think\Db;
use think\template\TagLib;

class Zhjaa extends TagLib{
    /**
     * 定义标签列表
     */
    protected $tags = [
                'adv' => array('attr'=>'limit,order,where,item','is_open'=>1),
                'fortable' => ['attr' => 'table,column,order,limit,where,item,key', 'is_open' => 1],
            ];

    /**
     * 广告标签
     * @access public
     * @param array $tag 标签属性
     * @param string $content  标签内容
     * @return string
     */
    public function tagAdv($tag,$content){
        $limit = !empty($tag['limit']) ?$tag['limit'] :'1';
        $item  = !empty($tag['item']) ? $tag['item'] : 'item';// 返回的变量item
        $key  =  !empty($tag['key']) ? $tag['key'] : 'key';// 返回的变量key
        $pid  =  !empty($tag['pid']) ? $tag['pid'] : '0';// 返广告位id

        $str = '<?php ';
        $str .= '$pid ='.$pid.';';
        $str .= '$result = think\Db::name("ad")->where("pid=$pid  and is_open = 1 and start_at < now() and end_at > now()")->order(["sort"=>"asc"])->limit("'.$limit.'")->select();';
        $str .='
            foreach($result as $'.$key.'=>$'.$item.'):
            ?>';
        $str .=  $content;
        $str .= '<?php endforeach; ?>';
        return $str;
        }
    /**
 * 通用单表查询循环标签
 * @access public
 * @param array $tag 标签属性
 * @param string $content  标签内容
 * @return string
 */
    public function tagFortable($tag,$content)
    {
        $table = $tag['table'];//表名，必填
        $column = !empty($tag['column'])?$tag['column']:'*';//字段名
        $order = $tag['order'];//排序
        $limit = !empty($tag['limit']) ?$tag['limit'] :'1';//取多少条
        $where = $tag['where'];//查询条件

        $item  = !empty($tag['item']) ? $tag['item'] : 'item';// 返回的变量item
        $key  =  !empty($tag['key']) ? $tag['key'] : 'key';// 返回的变量key

        $str = '<?php ';
        $str .='$result=think\Db::name("'.$table.'")->where("'.$where.'")->order("'.$order.'")->limit("'.$limit.'")->field("'.$column.'")->select();';
        $str .='
            foreach($result as $'.$key.'=>$'.$item.'):
            ?>';
        $str .=  $content;
        $str .= '<?php endforeach; ?>';
        return $str;
    }
}