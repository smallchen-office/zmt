<?php
/**
 * 处理富文本编辑内图片
 *@param $str  图片的项目地址
 *@param $mulu  要移动到的目录
 */
 function imgHandle($str,$mulu='images')
{
    preg_match_all('/<img.*?src="(.*?)".*?>/is',$str,$match1);
    $dir = $match1[1];
     $root = ROOT_PATH . 'public';//public目录
     $path = '/uploads/'.$mulu.'/'.date('ym',time()).'/';//移动到新目录
    $root = str_replace('\\','/',$root);
    if($dir){
        foreach($dir as $k=>$v){
            if(!file_exists($root.$v)) continue;
            $npath = $root.$path.basename($v);//新路径
            if(!is_dir($root.$path)) mkdir($root.$path,0700,true);
            rename($root.$v,$npath);//文件移动
            $str = str_replace($v,$path.basename($v),$str);
        }
    }
    return $str;
}
/**
 * 求两个已知经纬度之间的距离,单位为米
 * 
* @param  Decimal $longitude1 起点经度
 * @param  Decimal $latitude1  起点纬度
 * @param  Decimal $longitude2 终点经度 
 * @param  Decimal $latitude2  终点纬度
 * @param  Int     $unit       单位 1:米 2:公里
 * @param  Int     $decimal    精度 保留小数位数
 */
function getdistance($longitude1, $latitude1, $longitude2, $latitude2, $unit=2, $decimal=2) {
    $EARTH_RADIUS = 6370.996; // 地球半径系数
    $PI = 3.1415926;

    $radLat1 = $latitude1 * $PI / 180.0;
    $radLat2 = $latitude2 * $PI / 180.0;

    $radLng1 = $longitude1 * $PI / 180.0;
    $radLng2 = $longitude2 * $PI /180.0;

    $a = $radLat1 - $radLat2;
    $b = $radLng1 - $radLng2;

    $distance = 2 * asin(sqrt(pow(sin($a/2),2) + cos($radLat1) * cos($radLat2) * pow(sin($b/2),2)));
    $distance = $distance * $EARTH_RADIUS * 1000;

    if($unit==2){
        $distance = $distance / 1000;
    }
    return round($distance, $decimal).'km';
}