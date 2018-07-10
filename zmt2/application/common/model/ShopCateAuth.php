<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/27
 * Time: 16:46
 */
namespace app\common\model;
use think\Model;

class ShopCateAuth extends Model{
	public function getAllAuth($where=1){
		return $this->where($where)->select();
	}
	/**
     * 按条件查找
     *@param $where 查询条件
     *@param $field 查询字段
     *@param $isinfo 1表示查询一条数据
     */
    public function getColumn($where=1,$field="*",$isinfo=1){
        $result = $this->where($where)->column($field);
        if(count($result)>0){
            if(1 == $isinfo)
                return reset($result);
        }
    }
	
	public function getAuthList($shop_id){
		return $this->alias('a')->join('shop_group b','a.id=b.auth_id')->where(['b.shop_id'=>$shop_id,'a.status'=>1,'b.status'=>1])
								->field('a.*')
								->column('b.cate_id,a.id,a.title,a.link,a.ico');
	}
}