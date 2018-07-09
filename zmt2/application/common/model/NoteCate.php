<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/30
 * Time: 11:16
 */
namespace app\common\model;
use think\Model;

class NoteCate extends Model{
	/**
     * 获取排好序的节点列表
     *@param
     *@param
     */
    public function getSortList()
    {
        $all_menu = $this->order(['sort'=>'asc'])->column('id,name,id,pid');
        $all_menu = subTree($all_menu);
        foreach($all_menu as $k=>$v){
            $all_menu[$k] = $v;
        }
        return $all_menu;
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
            ['name','unique:note_cate','分类名称已经存在'],
        ];
        if($id >0){
            try{
                $result = $this->allowField(true)->validate($rules)->where(['id'=>$id])->update($data);
                if(false ===$result){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
                    return ['code'=>1,'data'=>'','msg'=>'文章分类修改成功'];
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
                    return ['code'=>1,'data'=>'','msg'=>'文章分类添加成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }
    }
    /**
     * 删除节点
     *@param $ids
     */
    public function del($ids)
    {
        //检查是否可以删除
        $all_menu = $this->where(1)->column('id,name,pid');
        $sun_ids = findSunTree($all_menu,$ids);
        if(count($sun_ids) >0){
            return ['code'=>0,'data'=>'','msg'=>'有下级，不允许删除'];
        }
        //检查下面有没有文章
        $sun_art = Db::name('note')->where(['cate_id'=>$ids])->find();
        if($sun_art){
            return ['code'=>0,'data'=>'','msg'=>'分类下面有文章，不允许删除'];
        }
        $rs = $this->where(['id'=>['eq',$ids]])->delete();
        return $rs ? ['code'=>1,'data'=>'','msg'=>'删除成功']:['code'=>0,'data'=>'','msg'=>'删除失败，请重试'];
    }
}