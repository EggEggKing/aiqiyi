<?php
namespace app\index\controller;
use think\Controller;
use Util\data\Sysdb;

class Index extends Controller
{
	public function __construct(){
		parent::__construct();
		$this->db = new Sysdb;
	}

    public function index()
    {
        // 幻灯片
    	$slide_list = $this->db->table('slide')->where(array('type'=>0))->lists();
        // 导航标签
        $channel_list = $this->db->table('video_label')->where(array('flag'=>'channel'))->order('ord asc')->pages(8);
        // 今日焦点
        $today_hot_list = $this->db->table('video')->where(array('channel_id'=>2,'status'=>1))->pages(12);

        $this->assign('today_hot_list',$today_hot_list['lists']);
        $this->assign('channel_list',$channel_list['lists']);
    	$this->assign('data',$slide_list);
        return $this->fetch();
    }

    public function cate(){
        $data['label_channel'] = (int)input('get.label_channel');
        $data['label_charge'] = (int)input('get.label_charge');
        $data['label_area'] = (int)input('get.label_area');

        $channel_list = $this->db->table('video_label')->where(array('flag'=>'channel'))->cates('id');
        $charge_list = $this->db->table('video_label')->where(array('flag'=>'charge'))->cates('id');
        $area_list = $this->db->table('video_label')->where(array('flag'=>'area'))->cates('id');

        $data['pageSize'] = 1;
        $data['page'] = max(1,(int)input('get.page'));
        $where['status'] = 1;
        if($data['label_channel']){
            $where['channel_id'] = $data['label_channel'];
        }
        if($data['label_charge']){
            $where['charge_id'] = $data['label_charge'];
        }
        if($data['label_area']){
            $where['area_id'] = $data['label_area'];
        }

        $data['data'] = $this->db->table('video')->where($where)->pages($data['pageSize']);

        $this->assign('data',$data);
        $this->assign('channel_list',$channel_list);
        $this->assign('charge_list',$charge_list);
        $this->assign('area_list',$area_list);
        return $this->fetch();
    }

    public function video(){
        $id = (int)input('get.id');
        $video = $this->db->table('video')->where(array('id'=>$id))->item();
        $this->assign('video',$video);
        return $this->fetch();
    }
}
