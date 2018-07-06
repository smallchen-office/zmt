<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/27
 * Time: 10:09
 */
namespace app\mobile\controller;
use app\common\model\Shop;
use app\common\model\ShopCate;
use app\common\model\AdminUsers;
use app\common\model\AdminShop;
use think\Config;
use think\Cookie;
use think\Db;
use think\Session;
use think\Url;

class Users extends Base{
    protected $shop_info;
    protected $user_id;
    protected $userAddress;
    protected $region;
    protected $userLogic;
    protected $order;
    protected $mpage;
    protected function _initialize()
    {
        parent::_initialize();
		$this->shop = new Shop();
		$this->shop_cate = new ShopCate();
		$this->admin_users = new AdminUsers();
		$this->admin_shop = new AdminShop();
		
        $this->mpage = Config::get('mobile_page')?:5;
		
		$this->shop_id = Cookie::get('shop_id');
		$this->user_id = Cookie::get('user_id');
        //登录状态判断
        $no_login = [
            'login', 'popLogin', 'doLogin', 'logout', 'verify', 'setPwd', 'finished',
            'verifyHandle', 'reg', 'sendSmsRegCode', 'findPwd', 'checkValidateCode',
            'forgetPwd', 'checkCaptcha', 'checkUsername', 'sendValidateCode', 'express',
        ];

        if((!$this->user_id)  && (!in_array(req('action'),$no_login)) && (!$this->shop_id)){
            header("location:".Url::build('mobile/Users/login'));
            exit;
        }
        $this->assign('shop_id',$this->shop_id);
    }
    /*用户中心*/
    public function index()
    {
		$shop_info = $this->shop->getColumn(['id'=>$this->shop_id],'*',1);
		$cate_info = $this->shop_cate->where('id',$shop_info['cate_id'])->find();
		$shop_info['cate_name'] = $cate_info['name'];
		return view("users/index",[
				'shop_info'=>$shop_info,
			]);
    }
    /*用户登录*/
    public function login()
    {
		if($this->user_id > 0 ){
            header("location:".Url::build('mobile/Users/index'));
            exit;
        }
		if($this->request->isPost()){
            $data = $this->request->param("");
			if($data['username']==='')
				return ['code'=>0,'msg'=>'用户名不能为空','url'=>''];
			if($data['password']==='')
				return ['code'=>0,'msg'=>'登陆密码不能为空','url'=>''];
			if(!strpos($data['username'],'@')){
				$shop_info = $this->shop->getColumn(['username'=>$data['username'],'password'=>encrypt($data['password'])],'*',1);
				if($shop_info){
					if($shop_info['status'] ==-2){
						return ['code'=>0,'msg'=>'店铺仍在审核中,请保持电话畅通！','url'=>''];	
					}
					if($shop_info['status'] ==-1){
						return ['code'=>0,'msg'=>'店铺已被禁用,请联系客服！','url'=>''];	
					}
					Cookie::set('shop_id',$shop_info['id']);
					Cookie::set('user_id',1);
					$this->shop->where('id',$shop_info['id'])->update(['update_at'=>date('Y-m-d H:i:s',time())]);
					return ['code'=>1,'msg'=>'登录成功！','url'=>'/mobile/users/index'];	
				}
				else{
					return ['code'=>0,'msg'=>'用户名或密码错误1','url'=>''];
				}
			}
			else
			{
				$users=explode('@',$data['username'],2);
				$username=$users[0];
				$shopid=$users[1];	
				$shop_info = $this->shop->getColumn(['id'=>$shopid],'*',1);
				if($shop_info){
					if($shop_info['status'] ==-2){
						return ['code'=>0,'msg'=>'店铺仍在审核中,请保持电话畅通！','url'=>''];	
					}
					if($shop_info['status'] ==-1){
						return ['code'=>0,'msg'=>'店铺已被禁用,请联系客服！','url'=>''];	
					}
				}
				$user_info = $this->admin_users->getColumn(['username'=>$username,'password'=>encrypt($data['password']),'status'=>0],'*',1);
				if($user_info){
					$result = $this->admin_shop->getColumn(['admin_id'=>$user_info['id'],
											'shop_id'=>$shopid,
											],'*',1);
					if($result){
						Cookie::set('shop_id',$shopid);
						Cookie::set('user_id',$user_info['id']);
						return ['code'=>1,'msg'=>'登录成功！','url'=>'/mobile/users/index'];	
					}
					else{
						return ['code'=>0,'msg'=>'标记错误','url'=>''];	
					}
				}
				else{
					return ['code'=>0,'msg'=>'用户名或密码错误2','url'=>''];	
				}
			}

		}
		else
			return view('users/login');
    }
	
	public function logout()
	{
		Cookie::set('shop_id',null);
		Cookie::set('user_id',null);
		header("location:".Url::build('mobile/Users/login'));
        exit;
	}
	
	public function userinfo()
	{
		$id = $this->user_id;
		if(request()->isPost()){
            $dt = input("param.");
            if($id >0){//修改
				if($id==1){
					//$data['username'] = trimall($dt['username']);
					if(!empty(trimall($dt['password']))){
						$data['password'] = encrypt(trimall($dt['password']));
					}
					$data['author'] = trimall($dt['realname']);
					$data['telephone'] = trimall($dt['telephone']);
					$rs = $this->shop->ShopHandle($data,$id);
				}
				else{
					$rs = $this->admin_users->handle($dt,$id);
				}	
            }
            if($rs['code'] ==1){
				return ['code'=>1,'msg'=>'修改成功','url'=>'/mobile/users/index'];	
			}
			else{
				return ['code'=>0,'msg'=>$rs['msg'],'url'=>''];
			}
        }
		if($id==1){
			$info = $this->shop->getColumn(['id'=>$id],'username,author,telephone',1);
			$info['realname']=$info['author'];
			unset($info['author']);
		}
		else{
			$info = $this->admin_users->getColumn(['id'=>$id],'username,realname,telephone',1);
		}
        return view('users/userinfo',[
            'info'=>$info,
			'id'=>$id,
        ]);
	}

    /*添加用户收货地址*/
    public function addAddress()
    {
        if($this->request->isPost()){
            $data = $this->request->param("");
            $rs = $this->userAddress->handle($data,$this->user_id,0);
            if($rs['code'] ==1 && ($this->request->param("source") == 'cart2')){//如果是从结算页面来，要回到结算页面去
//                header('Location:'.url('/mobile/Cart/aplayInfo', array('address_id' => $data['data'])));
                $this->success($rs['msg'],Url::build('/mobile/Cart/aplayInfo',['address_id'=>$data['data']]));
            }
            $rs['code'] ==1 ? $this->success($rs['msg'],Url::build('Users/addressList')):$this->error($rs['msg']);
        }
        $province = $this->region->where(['parent_id'=>0,'level'=>1])->cache(true)->select();
        return view("users/add_address",[
            'province'=>$province,
            'source'=>$this->request->param("source"),
        ]);
    }
    /*收货地址列表*/
    public function addressList()
    {
        $user_address = getUserAddress($this->user_id);
        $region_list = getRegionList();
        return view("users/address_list",[
            'user_address'=>$user_address,
            'region_list'=>$region_list,
            'source'=>$this->request->param("source")
        ]);
    }
    /*编辑收货地址*/
    public function editAddress()
    {
        $id = $this->request->param("id");
        $source = $this->request->param("source");
        $address = $this->userAddress->where(['id'=>$id,'users_id'=>$this->user_id])->find();
        if(!$address){
            $this->error('收货地址不存在');
        }
        if($this->request->isPost()){
            $data = $this->request->param("");
            $rs = $this->userAddress->handle($data,$this->user_id,$id,$address['is_default']);
            if($rs['code'] == 1 && ($source == 'cart2')){//如果是从结算页面来，要回到结算页面去
                $this->success($rs['msg'],Url::build('/mobile/Cart/aplayInfo',['address_id'=>$id]));
            }
            $rs['code'] ==1 ? $this->success($rs['msg'],Url::build('Users/addressList')):$this->error($rs['msg']);
        }
        //获取地区
        $list = getRegionList();
        $p = regionHandle($list,1,0);
        $c = regionHandle($list,2,$address['province_id']);
        $a = regionHandle($list,3,$address['city_id']);
        $t = [];
        if ($address['twon_id'] > 0) {
            $t = regionHandle($list,4,$address['area_id']);
        }
        return view("users/edit_address",[
            'source'=>$source,
            'province'=>$p,
            'city'=>$c,
            'area'=>$a,
            'twon'=>$t,
            'address'=>$address,
        ]);
    }
    /*设置为默认收货地址*/
    public function setDefault()
    {
        $data = $this->request->param("");
        $id =$data['id'];
        $this->userAddress->where(['users_id'=>$this->user_id])->update(['is_default'=>0]);
        $this->userAddress->where(['users_id'=>$this->user_id,'id'=>$id])->update(['is_default'=>1]);
        if(($this->request->param("source") == 'cart2')){//如果是从结算页面来，要回到结算页面去
            header('Location:' . url('/mobile/Cart/aplayInfo', array('address_id' =>$id)));
            exit;
        }
        $this->success('操作成功',Url::build('Users/addressList'));
    }
    /*删除收货地址*/
    public function delAddress()
    {
        $id = $this->request->param("id");
        return $this->userAddress->del($id,$this->user_id);
    }
    /*订单列表*/
    public function orderList()
    {
        $where = "users_id = ".$this->user_id;
        $type = $this->request->param("type")?strtoupper($this->request->param("type")):'';
        //搜索条件
       if($type){
            $where .= Config::get($type);
        }
        $per = $this->request->param('p')?:'1';
        $query = ['type'=>$type];
        $order_list = $this->order->getOrderList($where,$this->mpage,$query,$per);
        $this->assign('order_status', Config::get('ORDER_STATUS'));
        $this->assign('shipping_status', Config::get('SHIPPING_STATUS'));
        $this->assign('pay_status', Config::get('PAY_STATUS'));
        $this->assign('list', $order_list['data']);
        $this->assign('active', 'order_list');
        $this->assign('active_status', $type);
        $this->assign('type', $type);

        if(input('param.is_ajax')> 0){
            return $this->fetch('users/ajax_order_list');
        }else{
            return $this->fetch('users/order_list');
        }

    }
    /*订单详细*/
    public function orderInfo()
    {
        $id = $this->request->param("order_id");
        $order_info = Db::name('order')->where(['users_id'=>$this->user_id,'id'=>$id])->find();
        $order_info = setBtnStatus($order_info);
        if(!$order_info) $this->error('没有找到此订单相关信息');

        $region_list = getRegionList();
        $order_info['invoice_number'] = Db::name('ship_order')->where(['order_id'=>$id])->value('invoice_number');//物流单号

        $logic = new UserLogic();
        $data = $logic->getOrderGoods($id);
        $order_info['goods_list'] = $data['data']?:[];

        //获取订单操作记录
        $order_action = Db::name('order_action')->where(array('order_id' => $id))->select();

        $this->assign('order_status', Config::get('ORDER_STATUS'));
        $this->assign('shipping_status', Config::get('SHIPPING_STATUS'));
        $this->assign('pay_status', Config::get('PAY_STATUS'));

        return view('users/order_info',[
            'order_info'=>$order_info,
            'region_list'=>$region_list,
            'order_action'=>$order_action,
        ]);
    }
}