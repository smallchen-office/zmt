<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/27
 * Time: 16:46
 */
namespace app\common\model;
use app\admin\validate\ShopValidate;
use think\Model;

class Shop extends Model{
	/**
     * 列表页
     *@param $where 条件
     *@param $per  每页有几条
     *@param $field 要查找的字段
     *@param $order_cloumn 排序字段
     *@param $order_type   升序或降序
     */
    public function getPageList($where=1,$per=20,$order=['sort'=>'asc']){
        $group_list = $this->where($where)->order($order)->paginate($per,false,[
            'page'=>input('param.page'),
            'list_rows'=>$per
        ]);
        return [$group_list,$group_list->render()];
    }
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
	/*添加|修改管理员*/
    public function ShopHandle($data,$id=0)
    {
        if($id >0){
            $data['update_at'] = date('Y-m-d H:i:s',time());
            try{
                $result = $this->allowField(true)->where(['id'=>$id])->update($data);
                if(false ===$result){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
                    return ['code'=>1,'data'=>'','msg'=>'店铺'.$id.'修改成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }else{
            $data['create_at'] = date('Y-m-d H:i:s',time());
			unset($data['id']);
			$data['status']='-2';
            try{
				$shop_name=$this->where('name',$data['name'])->count();
				if($shop_name>0){
					return ['code'=>0,'data'=>'','msg'=>'该公司名称已存在'];
				}
				$username=$this->where('username',$data['username'])->count();
				if($username>0){
					return ['code'=>0,'data'=>'','msg'=>'该用户名称已存在'];
				}
                $result = $this->allowField(true)->insert($data);
                if(false ===$result){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
                    return ['code'=>1,'data'=>'','msg'=>'店铺'.$id.'提交成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }
    }
	public function del($id,$type=0){
		if($type)
			$result=$this->where('id',$id)->update(['status'=>-1]);
		else
			$result=$this->where('id',$id)->delete();
		if(false ===$result){
			return ['code'=>0,'data'=>'','msg'=>$this->getError()];
		}else{
			return ['code'=>1,'data'=>'','msg'=>'店铺'.$id.'提交成功'];
		}
	}
}