<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/27
 * Time: 16:46
 */
namespace app\common\model;
use think\Model;
use think\Db;

class Cate extends Model{
	public function getCateList($where=1){
		return $this->where($where)->select();
	}
	/**
     * 添加|修改
     *@param $data数据
     *@param $id >0表示修改、否则表示添加
     */
    public function handle($data,$id=0)
    {
        $data['name'] = trimall($data['name']);
        $data['auth'] = isset($data['auth'])?implode(',',$data['auth']):'';
        if($id >0){
            $data['update_at'] = date('Y-m-d H:i:s',time());
            try{
                $result = $this->allowField(true)->where(['id'=>$id])->update($data);
                if(false ===$result){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
                    return ['code'=>1,'data'=>'','msg'=>'角色修改成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }else{
            $data['create_at'] = date('Y-m-d H:i:s',time());
            try{
                $result = $this->allowField(true)->insert($data);
                if(false ===$result){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
                    return ['code'=>1,'data'=>'','msg'=>'角色添加成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }
    }
	/**
     * 删除菜单
     *@param $ids
     */
    public function del($ids)
    {
        //检查是否可以删除
        $shop_sum = Db::name('shop')->where('cate_id',$ids)->count();
        if($shop_sum){
            return ['code'=>0,'data'=>'','msg'=>'有角色正在使用权限，不允许删除'];
        }
        $rs = $this-> where(['id'=>$ids])->delete();
        return $rs ? ['code'=>1,'data'=>'','msg'=>'删除成功']:['code'=>0,'data'=>'','msg'=>'删除失败，请重试'];
    }
	
}