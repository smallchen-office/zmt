<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/2/13
 * Time: 13:43
 */
namespace app\common\model;
use think\Db;
use think\Model;

class GoodsCate extends Model{
    /**
     * 获得所有分类
     */
    public function goodsCateList($where=1)
    {
        global $goods_category,$goods_category1;
        $goods_category = $this->where($where)->order(['sort'=>'asc'])->column('*');
        if(empty($goods_category)) return [];
        foreach($goods_category as $k=>$v){
            $goods_category[$k]['has_son'] = 0;
        }
        foreach($goods_category as $k=>$v){
            if($v['deep'] == 0)
                $this->getCateTree($k);
        }
        return $goods_category1;
    }
    /**
     * 获取指定id下的 所有分类
     *@param $id 指定的分类id
     */
    protected function getCateTree($id =0){
        global $goods_category,$goods_category1;

        $goods_category1[$id] = $goods_category[$id];
        foreach($goods_category as $k=>$v){
            if($v['pid'] == $id){
                $this->getCateTree($v['id']);
                $goods_category1[$id]['has_son'] = 1;
            }
        }
    }
    /**
     * 获取当前的商品分类
     *@param $id 要获取的分类id
     */
    public function findCurCate($id =0){
        if(!$id){
            return [0,0,0];
        }
        $cat_list =  $this->column('id,pid,deep');//所有分类
        $cat_level_arr[$cat_list[$id]['deep']] = $id;//当前的id

        // 找出他老爸
        $parent_id = $cat_list[$id]['pid'];//父id
        if($parent_id > 0){
            $cat_level_arr[$cat_list[$parent_id]['deep']] = $parent_id;
            // 找出他爷爷
            $grandpa_id = $cat_list[$parent_id]['pid'];//爷爷的id
            if($grandpa_id > 0){
                $cat_level_arr[$cat_list[$grandpa_id]['deep']] = $grandpa_id;//父id
                // 建议最多分 3级, 不要继续往下分太多级
                // 找出他祖父
                $grandfather_id = $cat_list[$grandpa_id]['pid'];// 祖父id
                if($grandfather_id > 0){
                    $cat_level_arr[$cat_list[$grandfather_id]['deep']] = $grandfather_id;//爷爷的id
                }
            }
        }
        if(count($cat_level_arr) ==1 ){
            $cat_level_arr[1] =0;
            $cat_level_arr[2] =0;
        }
        if(count($cat_level_arr) ==2 ){
            $cat_level_arr[2] =0;
        }
        return $cat_level_arr;
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
            ['name','unique:goods_cate','分类名称已经存在'],
        ];
        if($id >0){
            try{
                $result = $this->allowField(true)->validate($rules)->where(['id'=>$id])->update($data);
                if(false ===$result){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
                    $this->refreshCat($id);
                    return ['code'=>1,'data'=>'','msg'=>'商品分类修改成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }else{
            try{
                $result = $this->allowField(true)->validate($rules)->insertGetId($data);
                if(!$result){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
                    $this->refreshCat($result);
                    return ['code'=>1,'data'=>'','msg'=>'商品分类添加成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }
    }

    /**
     * 改变或者添加分类时 需要修改他下面的 pid_path  和 level
     * @param $new_id 新添加|修改的id
     *
     */
    protected function refreshCat($new_id){
        $cat = $this->where('id',$new_id)->find(); // 找出他自己
        // 刚新增的分类先把它的值重置一下
        if(!$cat['pid_path']){
            $cat['pid'] == 0 && $this->allowField(true)->where(['id'=>$new_id])->save(['pid_path'=>"0_$new_id"]);
            Db::execute("UPDATE zmt_goods_cate AS a ,zmt_goods_cate AS b SET a.pid_path = CONCAT_WS('_',b.pid_path,'$new_id'),a.deep = (b.deep+1) WHERE a.pid=b.id AND a.id = $new_id");
            $cat = $this->get($new_id); // 重新找出他自己
        }
        $parent_cat = [];
        if($cat['pid'] ==0){//有可能是顶级分类 他没有老爸
            $parent_cat['pid_path'] = '0';
            $parent_cat['deep'] = '0';
            $replace_level = $cat['deep'];
            $replace_str = "0_".$new_id;
        }else{
            $parent_cat =$this->where(['id'=>$cat['pid']])->find();//找出他老爸的pid_path
            $replace_level = $cat['deep'] - ($parent_cat['deep']+1); // 看看他 相比原来的等级 升级了多少  ($parent_cat['deep'] + 1) 他老爸等级加一 就是他现在要改的等级
            $replace_str = $parent_cat['pid_path'].'_'.$new_id;
        }
        Db::execute("UPDATE `zmt_goods_cate` SET pid_path = REPLACE(pid_path,'{$cat['pid_path']}','$replace_str'), deep = (deep-$replace_level) WHERE  pid_path LIKE '{$cat['pid_path']}%'");

    }
    /**
     * 删除商品分类
     *@param $ids
     */
    public function del($ids)
    {
        //检查下级分类
        $sun_ids = $this->where(['pid'=>$ids])->find();
        if($sun_ids){
            return ['code'=>0,'data'=>'','msg'=>'还有下级分类，不允许删除'];
        }
        //检查商品
        $goods = Db::name('goods')->where(['cate_id'=>$ids])->find();
        if($sun_ids){
            return ['code'=>0,'data'=>'','msg'=>'分类下面有商品存在，不允许删除'];
        }
        $rs = $this->where(['id'=>['in',$ids]])->update(['status'=>-1]);
        return $rs ? ['code'=>1,'data'=>'','msg'=>'删除成功']:['code'=>0,'data'=>'','msg'=>'删除失败，请重试'];
    }
}