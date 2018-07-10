<?php
namespace app\mobile\controller;

use think\Config;
use think\Cookie;
use think\Db;

class Index extends Base
{
	protected function _initialize()
    {
        parent::_initialize();

		$this->user_id = Cookie::get('user_id');
		$this->area_id = Cookie::get('area_id');
		$this->area_name = Cookie::get('area_name');
    }
    /*首页*/
    public function index()
    {
        return view('index/index',[
				'area_id'=>$this->area_id,
				'area_name'=>$this->area_name,
			]);
    }
	public function changeAdd(){
		Cookie::set('area_id',input('param.area_id'));
		Cookie::set('area_name',input('param.area_name'));
	}
}
