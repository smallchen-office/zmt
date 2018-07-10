<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/20
 * Time: 18:54
 */
namespace app\common\model;
use think\Loader;
use think\Model;

class User extends Model{
	/**
     * 按条件查找
     *@param $where 查询条件
     *@param $field 查询字段
     *@param $isinfo 1表示查询一条数据
     */
    public function getColumn($where=1,$field="*",$isinfo=0){
        $result = $this->where($where)->column($field);
        if(count($result)>0){
            if(1 == $isinfo)
                return reset($result);
        }
    }
    /**
     * 列表页
     *@param $where 条件
     *@param $per  每页有几条
     *@param $field 要查找的字段
     *@param $order_cloumn 排序字段
     *@param $order_type   升序或降序
     */
    public function getPageList($where=1,$per=20,$field="*",$order=['sort'=>'asc']){
        $group_list = $this->where($where)->field($field)->order($order)->paginate($per,false,[
            'page'=>input('param.page'),
            'list_rows'=>$per
        ]);
        return [$group_list,$group_list->render()];
    }
    /**
     * 添加|修改
     *@param $data数据
     *@param $id >0表示修改、否则表示添加
     */
    /**
     * 添加|修改
     *@param $data数据
     *@param $id >0表示修改、否则表示添加
     */
    public function handle($data,$id=0)
    {
        unset($data['id']);
        if(empty(trimall($data['password']))){
            unset($data['password']);
        }else{
            $data['password'] = encrypt(trimall($data['password']));
        }
        if($id >0){
            $data['update_at'] = date('Y-m-d H:i:s',time());
            try{
                $result = $this->allowField(true)->where(['id'=>$id])->update($data);
                if(false ===$result){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
                    return ['code'=>1,'data'=>'','msg'=>'管理员修改成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }else{
			$data['username'] = trimall($data['username']);
            $data['create_at'] = date('Y-m-d H:i:s',time());
            try{
                $result = $this->allowField(true)->insertGetId($data);

                if(false === $result){
                    return ['code'=>0,'data'=>$id,'msg'=>$this->getError()];
                }else{
                    return ['code'=>1,'data'=>$id,'msg'=>'管理员添加成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }
    }
}