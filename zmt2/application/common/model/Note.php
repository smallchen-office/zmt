<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/30
 * Time: 11:16
 */
namespace app\common\model;
use think\Model;

class Note extends Model{
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
	
	public function getNoteList($where=1){
		return $this->alias('a')->join('note_cate b','a.pid=b.id')->join('goods_cate c','a.cate_id=c.id')
								->field('a.id,a.head_img,a.title,a.abstract,a.link,b.name,c.name name2,a.status')
								->where($where)
								->select();
	}
	public function getNoteInfo($id){
		return $this->where('id',$id)->find();
	}
	/**
     * 添加|修改
     *@param $data数据
     *@param $id >0表示修改、否则表示添加
     */
    public function handle($data,$id=0)
    {
        $data['title'] = trimall($data['title']);
        if($id >0){
            try{
                $result = $this->allowField(true)->where(['id'=>$id])->update($data);
                if(false ===$result){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
                    return ['code'=>1,'data'=>'','msg'=>'数据保存成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }else{
            $data['create_at'] = date('Y-m-d H:i:s',time());
			$data['status']=-2;
            try{
                $result = $this->allowField(true)->insertGetId($data);
                if($result<1){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
                    return ['code'=>1,'data'=>'','msg'=>'文章添加成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }
    }
	/**
     * 删除
     *@param $ids
     */
    public function del($ids,$type=0)
    {
		if($type==0){
			//检查是否可以删除
			$is_show = $this->where(['id'=>$ids])->value('is_show');
			if($is_show ==1){
				return ['code'=>0,'data'=>'','msg'=>'不能删除显示状态的文章'];
			}
			$rs = $this->where(['id'=>$ids])->update(['status'=>0]);
			return $rs ? ['code'=>1,'data'=>'','msg'=>'删除成功']:['code'=>0,'data'=>'','msg'=>'删除失败，请重试'];
		}
        else{
			$rs = $this->where(['id'=>$ids])->delete();
			return $rs ? ['code'=>1,'data'=>'','msg'=>'删除成功']:['code'=>0,'data'=>'','msg'=>'删除失败，请重试'];
		}
    }
}