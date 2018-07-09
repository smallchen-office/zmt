<?php
namespace app\mobile\controller;
use app\common\model\Note;
use app\common\model\NoteCate;
use think\Config;
use think\Cookie;
use think\Db;

class Notes extends Base
{
	protected function _initialize(){
        parent::_initialize();
        $this->note = new Note();
		$this->note_cate = new NoteCate();
        $this->mpage = Config::get('mobile_page')?:5;
    }
	
    /*首页*/
    public function index()
    {
        return view('index/index');
    }
	public function noteinfo(){
		$info = $this->note->getNoteInfo(input('param.id'));
		return view('note/info',[
				'info'=>$info,
			]);
	}
}
