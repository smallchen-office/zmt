<?php

return [

    //模板参数替换
    'view_replace_str' => array(
        '__CSS__' => '/static/admin/css',
        '__JS__'  => '/static/admin/js',
        '__IMG__' => '/static/admin/images',
    ),
    /*-------------------------------------------系统配置------------------------------*/
    //配置类型
    'system_type_list'=>[
        '1'=>['title'=>'字符','desc'=>'input[type=text]'],
        '2'=>['title'=>'数字','desc'=>'input[type=number]'],
        '3'=>['title'=>'文本','desc'=>'textarea框'],
        '4'=>['title'=>'枚举','desc'=>'key:value->写入item 配置值为默认值 下拉选择框,一行代表一项'],
        '5'=>['title'=>'数组','desc'=>'value,value1 多个以逗号分隔,'],
        ],
    //配置分组
    'system_config_group'=>[
        '1'=>['title'=>'基本配置','icon'=>'gear','desc'=>''],
        '2'=>['title'=>'内容配置','icon'=>'tasks','desc'=>''],
        '3'=>['title'=>'用户配置','icon'=>'user','desc'=>''],
        '4'=>['title'=>'系统配置','icon'=>'windows','desc'=>''],
    ],
    /*-------------------------------------------系统配置------------------------------*/

    /*-------------------------------------------代金券类型------------------------------*/
    'coupon_type'=>[
        '0'=>'面额模板',
        '1'=>'按用户发放',
        '2'=>'注册',
        '3'=>'邀请',
        '4'=>'线下发放',
    ],
    /*-------------------------------------------代金券类型------------------------------*/

    /*-------------------------------------------商品促销活动类型------------------------------*/
    'goods_prom_type'=>[
        '0'=>'直接打折',
        '1'=>'减价优惠',
        '2'=>'固定金额出售',
        '3'=>'买就赠优惠券',
        '4'=>'买N送N',
    ],
    /*-------------------------------------------商品促销活动类型------------------------------*/

    /*-------------------------------------------定义插件目录------------------------------*/
    'login_plugin_path'=>ROOT_PATH.DS.'public'.DS.'plugins'.DS.'login',
    'payment_plugin_path'=>ROOT_PATH.DS.'public'.DS.'plugins'.DS.'payment',
    'shipping_plugin_path'=>ROOT_PATH.DS.'public'.DS.'plugins'.DS.'shipping',
    'function_plugin_path'=>ROOT_PATH.DS.'public'.DS.'plugins'.DS.'function',
    /*-------------------------------------------定义插件目录------------------------------*/
];
