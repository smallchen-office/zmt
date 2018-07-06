<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/2/26
 * Time: 14:06
 */
namespace app\common\model;
use app\admin\controller\Uploadify;
use think\Db;
use think\Model;

class Goods extends Model{
    /**
     * 列表页
     *@param $where 条件
     *@param $per  每页有几条
     *@param $field 要查找的字段
     *@param $order_cloumn 排序字段
     *@param $order_type   升序或降序
     */
    public function getPageList($where=1,$per=20,$field="*",$order=['sort'=>'asc']){
        $goods_list = $this->where($where)->field($field)->order($order)->paginate($per,false,[
            'page'=>input('param.page'),
            'list_rows'=>$per
        ]);
        return [$goods_list,$goods_list->render()];
    }

    /**
     * 添加|修改
     *@param $data数据
     *@param $id >0表示修改、否则表示添加
     */
    public function handle($data,$id=0)
    {
        $rules =  [
            ['name','unique:goods','商品已经存在'],
        ];
		$data['firstcode']=getFirstCharter($data['name']);
        if($id >0){//TODO // 修改商品后购物车的商品价格也修改一下
            try{
                $result = $this->allowField(true)->validate($rules)->where(['id'=>$id])->update($data);
                if(false ===$result){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
                    return ['code'=>1,'data'=>'','msg'=>'商品修改成功'];
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
                    return ['code'=>1,'data'=>'','msg'=>'商品添加成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }
    }
	//删除
	public function del($id){
		$goods_sum = Db::name('goods_detail')->where('goods_id',$id)->count();
		if($goods_sum){
			return ['code'=>0,'data'=>'','msg'=>"存在商品禁止删除"];
		}else{
			$result = $this->where('id',$id)->delete();
			if(false ===$result){
				return ['code'=>0,'data'=>'','msg'=>$this->getError()];
			}else{
				return ['code'=>1,'data'=>'','msg'=>'商品删除成功'];
			}
		}
	}
}