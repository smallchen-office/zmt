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

class ApiGoods extends Model{
    /**
     * 根据条件获取商品id
     * @param  $brand_id 帅选品牌id
     * @param  $price 帅选价格
     * @return array|mixed
     */
    public function getGoodsIdByBrandOePrice($brand_id, $price)
    {
        if (empty($brand_id) && empty($price)) return array();
        $where="(b.status = 1) and (b.is_show=1) ";
        if($brand_id){
            $where .= " and (a.brand_id = ".$brand_id.") ";
        }
        if ($price){// 价格查询
            $price = explode('-', $price);
            $sprice = $price[0];
            $eprice = isset($price[1])?$price[1]:0;
            if($sprice) $where .= " and (b.sale_money >=$sprice )";
            if($eprice) $where .= " and (b.sale_money <=$eprice)";
        }
        return Db::name('goods')->alias('a')->join('goods_detail b','a.id=b.goods_id')->where($where)->field('b.*,a.name')->column('b.id');
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
        $priceList = Db::name('goods')->alias('a')
										->join('goods_detail b','a.id=b.goods_id')
										->where(['b.id'=>['in',$goods_id_arr]])
										->column('sale_money','b.id');
        rsort($priceList);
        $max_price = Db::name('goods')->alias('a')->join('goods_detail b','a.id=b.goods_id')->where(['b.id'=>['in',$goods_id_arr]])->max('sale_money');
        $psize = ceil($max_price / $c)+1; // 进一法取整
        $parr = array();
        for($i = 0; $i < $c; $i++){
            $start = $i * $psize;
            $end = $start + $psize;

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
     * @param $goods_id_arr
     * @param $filter_param
     * @param $action
     * @param int $mode 0  返回数组形式  1 直接返回result
     * @return array|mixed 这里状态一般都为1 result 不是返回数据 就是空
     * 获取 商品列表页帅选品牌
     */
    public function getFilterBrand($goods_ids, $filter_param, $action, $mode = 0)
    {
//        if (!empty($filter_param['goods_brand_id'])) return array();
        if(empty($goods_ids)) return [];
        $goods_ids = $goods_ids ? $goods_ids : '0';
        $list_brand = Db::name('brand')->limit('30')->select();//goods_brand品牌表
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
	
	
}