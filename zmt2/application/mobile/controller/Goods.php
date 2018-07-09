<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/21
 * Time: 15:55
 */
namespace app\mobile\controller;
use app\common\model\GoodsDetail;
use app\common\model\GoodsImg;
use app\common\model\Brand;
use app\common\model\Spec;
use think\Cache;
use think\Config;
use think\Cookie;
use think\Db;
use think\exception\HttpException;
use think\View;

class Goods extends Base{
    protected $goods;
    protected $goodsLogic;
    protected $mpage;
    protected function _initialize(){
        parent::_initialize();
        $this->goods = new \app\mobile\model\Goods();
        $this->goodsLogic = new \app\common\logic\ApiGoods();
		$this->goods_detail = new GoodsDetail();
		$this->goods_img = new GoodsImg();
		$this->brand = new Brand();
		$this->spec = new Spec();
        $this->mpage = Config::get('mobile_page')?:5;
    }
    /*分类列表导航*/
    public function categoryList()
    {
        return view('goods/category_list');
    }

    /*商品列表*/
    public function goodsList()
    {
        $filter_param = array(); // 筛选数组
        $id = $this->request->param('id')?:0; // 当前分类id
        $brand_id = $this->request->param('brand_id')?:0;

        $keywords = trimall($this->request->param('keywords'))?:'';

        $sort = $this->request->param('sort')?:'id'; // 排序
        $sort_asc = $this->request->param('sort_asc')?:'asc'; // 排序

        $price = $this->request->param('price')?:''; // 价钱
        //筛选条件
        $filter_param['id'] = $id;
        $brand_id  && ($filter_param['brand_id'] = $brand_id);
        $price  && ($filter_param['price'] = $price);

        $cat_id_arr = getCatGrandson ($id);//找到当前分类的下级、下下级
        $map['a.cate_id'] =['in',$cat_id_arr];
		$map['b.status']=1;
		$map['b.is_show']=1;
        $filter_goods_id = Db::name('goods')->alias('a')->join('goods_detail b','a.id=b.goods_id')
											->where($map)
											->field('b.*,a.name')
											->cache(true)
											->column('b.id');//当前选中分类下面的商品id都找出来

        if($brand_id || $price){// 存在品牌或者价格筛选时
            $goods_id_1 = $this->goodsLogic->getGoodsIdByBrandOePrice($brand_id,$price); // 根据 品牌 或者 价格范围 查找所有商品id
            $filter_goods_id= array_intersect($filter_goods_id,$goods_id_1); // 获取多个筛选条件的结果 的交集
        }
        $filter_price = $this->goodsLogic->getFilterPrice($filter_goods_id,$filter_param,'goodsList'); // 筛选的价格期间
        $filter_brand = $this->goodsLogic->getFilterBrand($filter_goods_id,$filter_param,'goodsList',1); // 获取指定分类下的筛选品牌
        $per = $this->request->param('p')?:'1';
        list($goods_list,$page) = $this->goods_detail->getFileGoodsList($cat_id_arr,$brand_id,$price,$per,[$sort=>$sort_asc]);
	
        $this->assign('goods_list',$goods_list);
        $this->assign('filter_brand',$filter_brand);// 列表页帅选属性 - 商品品牌
        $this->assign('filter_price',$filter_price);// 帅选的价格期间
        $this->assign('filter_param',$filter_param); // 帅选条件
        $this->assign('cat_id',$id);
        $this->assign('sort_ascnow', $sort_asc);
        $this->assign('sort_asc', $sort_asc == 'asc' ? 'desc' : 'asc');

        $this->assign('sort', $sort);
        $this->assign('keywords', $keywords);
        if(input('param.is_ajax')> 0){
            return $this->fetch('goods/ajax_goods_list');
        }else{
            return $this->fetch('goods/goods_list');
        }
    }
	/*商品详情*/
    public function goodsInfo()
    {
        $goods_id = $this->request->param('id');
        $map['goods_id']=$goods_id;
        $imgList = $this->goods_img->where($map)->field('url')->select();//商品相册
        $goods = $this->goods_detail->getGoodsInfo($goods_id);
        if(empty($goods)){
            throw new HttpException(404,'商品不存在或已经下架');
        }
        if($goods['brand_id']){
            $goods['brand_name'] = $this->brand->where($goods['brand_id'])->value('name');
        }
		if($goods['spec_id']){
            $goods['spec_name'] = $this->spec->where($goods['spec_id'])->value('name');
        }
        $this->goods_detail->where(['id'=>$goods_id])->setInc('click_count'); // 统计点击数+1
        //TODO 评论、已出售数量

		$goods['discount'] = round($goods['sale_money']/$goods['special_money'],2)*10;//折扣率
        $now_time = date('Y-m-d H:i:s',time());
        return view('goods/goods_info',[
            'imgList'=>$imgList,
            'goods'=>$goods,
        ]);
    }
}