<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/27
 * Time: 16:46
 */
namespace app\common\model;
use think\Model;

class ShopGroup extends Model{
	/*
		获取权限之后分类列表
	*/
	public function getCateAuthList($shop_id,$auth_id){
		return $this->where('shop_id',$shop_id)->where('auth_id',$auth_id)->column('cate_id');
	}
	
	public function post_auth($shop_id,$auth_id,$cate_id){
		$data = [
				'shop_id'=>$shop_id,
				'auth_id'=>$auth_id,
				'cate_id'=>$cate_id,
			];
		if($this->where($data)->count()){
			return ['code'=>0,'msg'=>'该权限已存在或已提交过，请等待！','url'=>''];
		}
		else{
			$result = $this->insert($data);
			if($result == false){
				return ['code'=>0,'msg'=>'提交失败！','url'=>''];
			}
			else{
				return ['code'=>1,'msg'=>'提交成功，请等待审核！','url'=>''];
			}
		}
	}
	public function getAuthCate($shop_id,$auth_id=1){
		return $cate_list4;
	}
}