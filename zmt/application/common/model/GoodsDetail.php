<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/2/20
 * Time: 21:36
 */
namespace app\common\model;
use think\Db;
use think\Model;

class GoodsDetail extends Model{
	
	public function getGoodsInfo($id){
		$result= $this->alias('a')->join('goods b','a.goods_id=b.id')
								->field('b.cate_id,b.brand_id,b.name,b.longname,a.*')
								->where('a.id',$id)
								->find();
		return $result;
	}
    /**
     * 列表页
     *@param $where 条件
     *@param $per  每页有几条
     *@param $field 要查找的字段
     *@param $order_cloumn 排序字段
     *@param $order_type   升序或降序
     */
    public function getPageList($where=1,$per=20,$order='create_at asc'){
        $group_list = $this->alias('m')
						->join('goods n','m.goods_id=n.id')
						->where($where)
						->field('m.id,m.shop_id,n.cate_id,n.brand_id,n.name,n.longname,m.title,m.detail,m.create_at,m.update_at,m.status')
						->order($order)
						->paginate($per,false,[
								'page'=>input('param.page'),
								'list_rows'=>$per
							]);
        return [$group_list,$group_list->render()];
    }
	public function getPageGoodsDetailList($where=1,$order=['m.id'=>'desc']){
		return $this->alias('m')
						->join('goods n','m.goods_id=n.id')
						->where($where)
						->field('m.id,n.cate_id,n.brand_id,n.name,n.longname,m.title,m.img,m.detail,m.create_at,m.update_at,m.stock,m.status')
						->order($order)
						->select();
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
            $data['update_at'] = date('Y-m-d H:i:s',time());
            try{
                $result = $this->allowField(true)->where(['id'=>$id])->update($data);
                if(false ===$result){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
					$this->afterSave($id,$data['images']);
                    return ['code'=>1,'data'=>'','msg'=>'商品类型修改成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }else{
            $data['create_at'] = date('Y-m-d H:i:s',time());
			$data['status']=-2;
            try{
                $id = $this->allowField(true)->insertGetId($data);
                if($id<1){
                    return ['code'=>0,'data'=>'','msg'=>$this->getError()];
                }else{
					$this->afterSave($id,$data['images']);
                    return ['code'=>1,'data'=>'','msg'=>'商品类型添加成功'];
                }
            }catch(\PDOException $e){
                return ['code'=>0,'data'=>'','msg'=>$e->getMessage()];
            }
        }
    }
	/**
     * 后置操作方法
     * 自定义的一个函数 用于数据保存后做的相应处理操作, 使用时手动调用
     * @param int $goods_id 商品id
     * @param  $img 商品相册
     */
    protected function afterSave($goods_id=0,$img){
        //重新生成商品相册
        $nprefix = '/uploads/goods/thumb/photo_'.$goods_id;//要上传到哪里
        $all = str_replace('\\','/',ROOT_PATH.'public');//硬盘上文件目录
        foreach($img as $k=>$v){
            $new =$nprefix.'/'.basename($v);
            if(!is_dir($all.$nprefix)) mkdir($all.$nprefix,0700,true);
            $img[$k] = $new;
            rename($all.$v,$all.$new);//文件移动
        }
//        if(count($img) >0){
            $has_imgs =  Db::name('goods_img')->where(['goods_id'=>$goods_id])->column('id,url');
            //删除图片
            foreach($has_imgs as $k=>$v){
                if(!in_array($v,$img)){
                    Db::name('goods_img')->delete($k);
                    file_exists($all.$v) && unlink($all.$v);
                }
            }
            //添加图片
            foreach($img as $k=>$v){
//                if(!$v) continue;
                if(!in_array($v,$has_imgs)){
                   Db::name('goods_img')->insert(['goods_id'=>$goods_id,'url'=>$v]);
                }
            }
    }
    /**
     * 删除商品类型
     *@param $ids
     */
    public function del($ids)
    {
        $rs = $this->where(['id'=>['in',$ids]])->update(['status'=>0]);
        return $rs ? ['code'=>1,'data'=>'','msg'=>'删除成功']:['code'=>0,'data'=>'','msg'=>'删除失败，请重试'];
    }
	public function getFileGoodsList($cate_ids,$brand_id,$price,$page=1,$order=['a.id'=>'desc']){
		$map = [];
		$where = 1;
		if(!empty($cate_ids)){
			$map['b.cate_id'] = ['in',$cate_ids];
		}
		if(!empty($brand_id)){
			$map['b.brand_id'] = $brand_id;
		}
		if(!empty($price)){
			$price = explode('-', $price);
            $sprice = $price[0];
            $eprice = isset($price[1])?$price[1]:0;
            if($sprice) $where .= " and (a.sale_money >=$sprice )";
            if($eprice) $where .= " and (a.sale_money <=$eprice)";
		}
		$count = $this->alias('a')->join('goods b','b.id=a.goods_id')->field('b.name,a.*')->where($where)->where($map)->count();
		$group_list = $this->alias('a')
										->join('goods b','b.id=a.goods_id')
										->field('b.name,a.*')
										->where($where)
										->where($map)
										->order($order)
										->paginate(8,$count,[
												'page'=>$page,
												'list_rows'=>8
											]);
        return [$group_list,$group_list->render()];
	}
}