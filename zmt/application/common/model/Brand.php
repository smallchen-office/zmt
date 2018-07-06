<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/19
 * Time: 16:57
 */
namespace app\common\model;
use think\Model;
use think\Db;

class Brand extends Model{
    public function getAll($where=1)
    {
        return $this->where($where)->order(['id'=>'desc'])->select();
    }
	public function getColumn($where=1,$field="*",$isinfo=0){
        $result = $this->where($where)->column($field);
        if(count($result)>0){
            if(1 == $isinfo)
                return reset($result);
        }
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
            ['name','unique:brand','品牌已经存在'],
        ];
        if($id >0){
            try{
                $result = $this->allowField(true)->validate($rules)->where(['id'=>$id])->update($data);
                if(false ===$result){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
                    return ['code'=>1,'data'=>'','msg'=>'品牌修改成功'];
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
                    return ['code'=>1,'data'=>'','msg'=>'品牌添加成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }
    }
    /**
     * 删除商品品牌
     *@param $ids
     */
    public function del($ids)
    {
        //检查商品规格
        $sun_spec = Db::name('goods')->where(['brand_id'=>$ids])->find();
        if($sun_spec){
            return ['code'=>0,'data'=>'','msg'=>'有商品在使用该品牌，不允许删除'];
        }
        $rs = $this->where(['id'=>['in',$ids]])->delete();
        return $rs ? ['code'=>1,'data'=>'','msg'=>'删除成功']:['code'=>0,'data'=>'','msg'=>'删除失败，请重试'];
    }
}