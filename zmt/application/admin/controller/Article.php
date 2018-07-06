<?php
/**
 * Created by PhpKiller.
 * User: Across The Pacific
 * Date: 2017/3/16
 * Time: 20:22
 */
namespace app\admin\controller;
use app\common\model\Note;
use app\common\model\NoteCate;
use app\common\model\GoodsCate;
use app\common\model\Shop;
use think\Controller;

class Article extends Base{
    protected  $articleCategory;
    protected  $article;
    protected $uploadify;
    protected function _initialize()
    {
       parent::_initialize();
        $this->articleCategory = new NoteCate();
        $this->article = new Note();
		$this->shop = new Shop() ;
		$this->goods_cate = new GoodsCate();
        $this->uploadify = new Uploadify();
    }
    /*文章分类*/
    public function articleCategory()
    {
        $all_menu = $this->articleCategory->order(['sort'=>'asc'])->select();
        return view('article/article_category',[
            'lists'=>subTree(objToArray($all_menu))
        ]);
    }
    /*添加|修改文章分类*/
    public function categoryHandle()
    {
        $id = input('param.id');
        if(request()->isPost()){
            $dt = input("param.");
            if($id >0){//修改
                if($dt['pid'] >0){
                    //找出家谱树，上级不能是自己或自己的后代
                    $all_cat = $this->articleCategory->order(['sort'=>'asc'])->column('id,name,pid');
                    $family_tree_ids = findFamilyTree($all_cat,$dt['pid']);
                    if(in_array($id,$family_tree_ids)){//如果id在选中父id的家谱树中
                        $this->error('上级节点不能是自己或自己的后代');
                    }
                }
                $rs = $this->articleCategory->handle($dt,$id);
            }else{//添加
                unset($dt['id']);
                $rs = $this->articleCategory->handle($dt);
            }
            $rs['code'] ==1 ? $this->success('操作成功',url('Article/articleCategory')):$this->error($rs['msg']);
        }
        $info = $this->articleCategory->where('id',$id)->find();
        return view('article/_category',[
            'info'=>$info,
            'id'=>$id,
            'cate_list' =>$this->articleCategory->getSortList(),//所属文章分类
        ]);
    }
    /*删除节点*/
    public function delCategory()
    {
        return $this->articleCategory->del(input('param.ids'),1);
    }
	/*删除节点*/
    public function delAudit()
    {
        return $this->articleCategory->del(input('param.ids'),0);
    }
    /*文章列表*/
    public function articleList()
    {
        return view('article/article_list',['cate_list'=>$this->articleCategory->getSortList()]);

    }
    /*文章列表*/
    public function ajaxArticleList()
    {
        $keywords = input('param.keywords');
        $cate_id = input('param.cate_id');
        $where='(status = 1)';
        if($cate_id){
            $where .= " and (`cate_id` = $cate_id)";
        }
        if($keywords){
            $where .= " and ( (title like '%$keywords%'))";
        }
        list($list,$page) = $this->article->getPageList($where,$this->page,'*',['sort'=>'asc','create_at'=>'desc']);
        $ajax_page=preg_replace("(<a[^>]*page[=|/](\d+).+?>(.+?)<\/a>)","<a data-p=$1 href='javascript:void($1);'>$2</a>",$page);
        return view('article/ajax_article', [
            'lists'=>$list,
            'page'=>$ajax_page,
            'cate_list'=>$this->articleCategory->column('id,name')
        ]);
    }
    /*添加、修改文章*/
    public function articleHandle()
    {
        $id = input('param.id');
        if(request()->isPost()){
            $dt = input("param.");
			$dt['note'] = imgHandle($_POST['content'],'article');
            if(!trimall($dt['add_at'])){
                $dt['add_at'] = date('Y-m-d H:i:s',time());
            }
            if($id >0){//修改
                $rs = $this->article->handle($dt,$id);
            }else{
				$rs = $this->article->handle($dt);
			}
            $rs['code'] ==1 ? $this->success('操作成功',url('Article/articleList')):$this->error($rs['msg']);
        }
        $info = $this->article->where('id',$id)->find();
        return view('article/_article',[
            'info'=>$info,
            'id'=>$id,
            'cate_list' =>$this->articleCategory->getSortList(),//所属文章分类
			'auth_list' =>$this->goods_cate->goodsCateList(),
			'shop_list'=>$this->shop->column('id,name'),
        ]);
    }
    /*删除节点*/
    public function delArticle()
    {
        return $this->article->del(input('param.ids'));
    }

	public function audit()
    {
        return view('article/audit_list',['cate_list'=>$this->articleCategory->getSortList()]);

    }
    /*文章列表*/
    public function ajaxAuditList()
    {
        $keywords = input('param.keywords');
        $cate_id = input('param.cate_id');
        $where='(status = -2)';
        if($cate_id){
            $where .= " and (`cate_id` = $cate_id)";
        }
        if($keywords){
            $where .= " and ( (title like '%$keywords%'))";
        }
        list($list,$page) = $this->article->getPageList($where,$this->page,'*',['sort'=>'asc','create_at'=>'desc']);
        $ajax_page=preg_replace("(<a[^>]*page[=|/](\d+).+?>(.+?)<\/a>)","<a data-p=$1 href='javascript:void($1);'>$2</a>",$page);
        return view('article/ajax_audit', [
            'lists'=>$list,
            'page'=>$ajax_page,
            'cate_list'=>$this->articleCategory->column('id,name')
        ]);
    }
}