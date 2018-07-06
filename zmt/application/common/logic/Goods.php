<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/24
 * Time: 13:03
 */
namespace app\common\logic;
use think\Cache;
use think\Db;
use think\Exception;
use think\Model;
use think\Url;

class Goods extends Model{
    /**
     * 获取商品规格
     *@param $goods_id 商品id
     */
    public function getGoodsSpec($goods_id=0)
    {
        $keys = Db::name('goods_spec_price')->where(['goods_id'=>$goods_id])->column("id,GROUP_CONCAT(`key_ids` SEPARATOR '_') ");//规格价格表
        $filter_spec = array();
        if($keys){
            $specImage = Db::name('goodsSpecImages')->where(['goods_id'=>$goods_id])->column('id,url');//规格对应的图片表
            $keys = str_replace('_',',',$keys);
            if($keys) $keys = implode(',',$keys);
            $filter_spec2 = Db::table('pc_goods_spec_item')->alias('b')->join('pc_goods_spec a','a.id=b.goods_spec_id')
                ->where(['b.id'=>['in',$keys]])
                ->order('b.id')
                ->field('a.*,b.item,b.id as item_id')
                ->select();
            if($filter_spec2){
                foreach ($filter_spec2 as $key => $val) {
                    $filter_spec[$val['name']][] = array(
                        'item_id' => $val['item_id'],
                        'item' => $val['item'],
                        'src' => isset($specImage[$val['id']])?$specImage[$val['id']]:'',
                    );
            }
            }
        }
        return $filter_spec;
    }
    /**
     * 商品收藏
     *@param $user_id 用户id
     *@param $goods_id 商品id
     */
    public function collectGoods($user_id,$goods_id)
    {
        if(!is_numeric($user_id) || $user_id <1){
            return ['code'=>-1,'msg'=>'请先登录','url'=>'','data'=>''];
        }
        //查看是否已收藏过
        $count = Db::name('goods_collect')->where(['users_id'=>$user_id,'goods_id'=>$goods_id])->count();
        if($count >0){
            return ['code'=>0,'msg'=>'您已经收藏过该商品了','url'=>'','data'=>''];
        }
        $rs = Db::name('goods_collect')->insert(['users_id'=>$user_id,'goods_id'=>$goods_id,'add_time'=>time()]);
        if($rs)  return ['code'=>1,'msg'=>'收藏成功，请前往个人中心查看','url'=>'','data'=>''];
        return ['code'=>0,'msg'=>'系统出错了','url'=>'','data'=>''];

    }
    /**
     * 根据条件获取商品id
     * @param  $brand_id 帅选品牌id
     * @param  $price 帅选价格
     * @return array|mixed
     */
    public function getGoodsIdByBrandOePrice($brand_id, $price)
    {
        if (empty($brand_id) && empty($price)) return array();
        $where="b.status = 1";
        if($brand_id){
            $brand_id_arr = explode('_', $brand_id);
            $where .= " AND a.brand_id IN(" . implode(',', $brand_id_arr) . ")";
        }
        if ($price){// 价格查询
            $price = explode('-', $price);
            $sprice = $price[0];
            $eprice = isset($price[1])?$price[1]:0;
            if($sprice) $where .= " AND b.sale_money >=$sprice";
            if($eprice) $where .= " AND b.sale_money <=$eprice";
        }
        return Db::name('goods')->alias('a')->join('goods_detail b','a.id=b.goods_id')->where($where)->column('id');
    }
    /**
     * @param $goods_id_arr
     * @param $filter_param
     * @param $action
     * @param int $mode 0  返回数组形式  1 直接返回result
     * @return array|mixed 这里状态一般都为1 result 不是返回数据 就是空
     * 获取 商品列表页帅选品牌
     */
    public function getFilterBrand($goods_id_arr, $filter_param, $action, $mode = 0)
    {
//        if (!empty($filter_param['goods_brand_id'])) return array();
        if(empty($goods_id_arr)) return [];

        $goods_id_str = implode(',', $goods_id_arr);
        $goods_id_str = $goods_id_str ? $goods_id_str : '0';
        $where = "id IN (select brand_id FROM zmt_goods WHERE brand_id > 0 AND id in($goods_id_str))";
        $list_brand = Db::name('brand')->where($where)->limit('30')->select();//goods_brand品牌表
        if($list_brand){
            foreach ($list_brand as $k => $v){
                // 帅选参数
                $filter_param['brand_id'] = $v['id'];
                $list_brand[$k]['href'] = Url::build("Goods/$action", $filter_param, '');
            }
        }

        if ($mode == 1) return $list_brand;
        return array('status' => 1, 'msg' => '', 'data' => $list_brand);

    }

    /**
     * * 帅选的价格期间
     * @param $goods_id_arr 帅选的分类id
     * @param $filter_param
     * @param $action
     * @param int $c 分几段 默认分5 段
     * @return array
     */
    public function getFilterPrice($goods_id_arr, $filter_param, $action, $c = 5)
    {
//        if(!empty($filter_param['price'])) return array();
        if(empty($goods_id_arr)) return [];
        $priceList = Db::name('goods')->alias('a')->join('goods_detail b','a.id=b.goods_id')->where(['b.id'=>['in',$goods_id_arr]])->column('sale_money','b.id');
        rsort($priceList);
        $max_price = Db::name('goods')->alias('a')->join('goods_detail b','a.id=b.goods_id')->where(['b.id'=>['in',$goods_id_arr]])->max('sale_money');
        $psize = ceil($max_price / $c); // 进一法取整
        $parr = array();
        for($i = 0; $i < $c; $i++){
            $start = $i * $psize;
            $end = $start + $psize;

            // 如果没有这个价格范围的商品则不列出来
            $in = false;
            foreach ($priceList as $k => $v) {
                if ($v > $start && $v < $end)
                    $in = true;
            }
            if ($in == false)
                continue;

            $filter_param['price'] = "{$start}-{$end}";
            if ($i == 0)
                $parr[] = array('value' => "{$end}元以下", 'href' => Url::build("mobile/Goods/$action", $filter_param, ''));
            elseif ($i == ($c - 1))
                $parr[] = array('value' => "{$end}元以上", 'href' => Url::build("mobile/Goods/$action", $filter_param, ''));
            else
                $parr[] = array('value' => "{$start}-{$end}元", 'href' => Url::build("mobile/Goods/$action", $filter_param, ''));
        }
        return $parr;
    }

    
    /**
     * 传入当前分类 如果当前是 2级 找一级
     * 如果当前是 3级 找2 级 和 一级
     * @param  $goodsCate 分类详细信息
     */
    public function getGoodsCate($goodsCate)
    {
        if (empty($goodsCate)) return array();
        $cateAll = getGoodsCatTree();//所有分类

        if ($goodsCate['deep'] == 0) {//顶级
            $cateArr = $cateAll[$goodsCate['id']]['tmenu'];
            $goodsCate['parent_name'] = $goodsCate['name'];
            $goodsCate['select_id'] = 0;
        }elseif($goodsCate['deep'] == 1){//1级
            $cateArr = $cateAll[$goodsCate['pid']]['tmenu'];
            $goodsCate['parent_name'] = $cateAll[$goodsCate['pid']]['name'];//顶级分类名称
            $goodsCate['open_id'] = $goodsCate['id'];//默认展开分类
            $goodsCate['select_id'] = 0;
        }else{
            $parent = Db::name('goods_cate')->where(["id"=> $goodsCate['pid']])->order('sort desc')->find();//父类
			print_r($cateAll);
            $cateArr = $cateAll[$parent['pid']]['tmenu'];
            $goodsCate['parent_name'] = $cateAll[$parent['pid']]['name'];//顶级分类名称
            $goodsCate['open_id'] = $parent['id'];
            $goodsCate['select_id'] = $goodsCate['id'];//默认选中分类
        }
        return $cateArr;

    }
}