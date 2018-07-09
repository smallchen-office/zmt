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

class Spec extends Model{
	public function getAll($where=1){
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
        $rules =  [
            ['name','unique:spec','规格名称已经存在'],
        ];
        if($id >0){
            try{
                $result = $this->allowField(true)->validate($rules)->where(['id'=>$id])->update($data);
                if(false ===$result){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
                    return ['code'=>1,'data'=>'','msg'=>'规格修改成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }else{
            try{
                $result = $this->allowField(true)->validate($rules)->insert($data);
                if(false ===$result){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
                    return ['code'=>1,'data'=>'','msg'=>'规格添加成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }
    }
	/**
     * 删除商品类型规格
     *@param $ids
     */
    public function del($ids)
    {
        Db::startTrans();
        try{
            Db::name('goods_spec_item')->where(['goods_spec_id'=>$ids])->delete();
            $info = $this->get($ids);
            $this->where(['id'=>['in',$ids]])->delete();
            Db::commit();
            adminLog("删除商品规格[".$info['name']."]",req('url'));
            return ['code'=>1,'data'=>'','msg'=>'删除成功'];
        } catch (\Exception $e) {
            Db::rollback();
            return ['code'=>0,'data'=>'','msg'=>'删除失败，请重试'];
        }
    }
}