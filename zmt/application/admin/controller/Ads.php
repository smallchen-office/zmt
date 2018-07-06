<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/21
 * Time: 21:56
 */
namespace app\admin\controller;
use app\common\model\Ad;
use app\common\model\AdPosition;

class Ads extends Base{
    protected $ad;
    protected $ad_position;
    protected $position_list;
    protected $uplodify;
    protected function _initialize()
    {
       parent::_initialize();
        $this->ad = new Ad();
        $this->ad_position = new AdPosition();
        $this->position_list =$this->ad_position->field('id,title')->select();
        $this->uplodify = new Uploadify();
    }
    /*广告位列表*/
    public function positionList()
    {
        return view('ad/position_list');
    }
    /*广告位列表*/
    public function ajaxPositionList()
    {
        $keywords =$this->request->param('keywords');
        $status =$this->request->param('status');
        $where=1;
        if($status){
            $where .= " and (status=$status)";
        }
        if($keywords){
            $where .= " and (title like '%$keywords%')";
        }
        list($list,$page) = $this->ad_position->getPageList($where,$this->page,'*',['id'=>'desc']);
        $ajax_page=preg_replace("(<a[^>]*page[=|/](\d+).+?>(.+?)<\/a>)","<a data-p=$1 href='javascript:void($1);'>$2</a>",$page);
        return view('ad/ajax_position_list', [
            'lists'=>$list,
            'page'=>$ajax_page,
        ]);
    }
    /*添加、修改广告位*/
    public function positionHandle()
    {
        $id = input('param.id');
        if(request()->isPost()){
            $dt = input("param.");
            if($id >0){//修改
                $rs = $this->ad_position->handle($dt,$id);
            }else{//添加
                unset($dt['id']);
                $rs = $this->ad_position->handle($dt);
            }
            $rs['code'] ==1 ? $this->success('操作成功',url('Ads/positionList')):$this->error($rs['msg']);
        }
        $info = $this->ad_position->where('id',$id)->find();
        return view('ad/_position',[
            'info'=>$info,
            'id'=>$id,
        ]);
    }
    /*删除节点*/
    public function delPosition()
    {
        return $this->adPosition->del(input('param.ids'));
    }
    /*广告列表*/
    public function adList()
    {
        return view('ad/ad_list',['p_list'=>$this->position_list]);
    }
    /*广告位列表*/
    public function ajaxAdList()
    {
        $keywords =$this->request->param('keywords');
        $pid =$this->request->param('pid');
        $status =$this->request->param('status');
        $where=1;
        if($pid){
            $where .= " AND (pid=$pid)";
        }
        if($status ==1){//正常显示的
            $where .= " AND ( (status=1) AND (start_at >= now()) AND (end_at >= now()) )";
        }elseif($status == 2){//不显示的
            $where .= " AND ( (status=0) OR (start_at < now()) OR (end_at < now()) )";
        }
        if($keywords){
            $where .= " AND (title like '%$keywords%')";
        }
        list($list,$page) = $this->ad->getPageList($where,$this->page,'*',['sort'=>'asc','create_at'=>'desc']);
        $ajax_page=preg_replace("(<a[^>]*page[=|/](\d+).+?>(.+?)<\/a>)","<a data-p=$1 href='javascript:void($1);'>$2</a>",$page);
        return view('ad/ajax_ad_list', [
            'lists'=>$list,
            'page'=>$ajax_page,
            'p_list'=>$this->position_list
        ]);
    }
    /*添加、修改广告*/
    public function adHandle()
    {
        $id = input('param.id');
        if(request()->isPost()){
            $dt = input("param.");
            if($dt['start_at'] > $dt['end_at']){
                $this->error('结束时间不能小于开始时间');
            }
            if($id >0){//修改
                $rs = $this->ad->handle($dt,$id);
            }else{//添加
                unset($dt['id']);
                $rs = $this->ad->handle($dt);
            }
            $rs['code'] ==1 ? $this->success('操作成功',url('Ads/adList')):$this->error($rs['msg']);
        }
        $info = $this->ad->where('id',$id)->find();
        return view('ad/_ad',[
            'info'=>$info,
            'id'=>$id,
            'p_list'=>$this->position_list
        ]);
    }
    /*删除节点*/
    public function delAd()
    {
        return $this->ad->del(input('param.ids'));
    }
}