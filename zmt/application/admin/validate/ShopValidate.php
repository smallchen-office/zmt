<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/1/1
 * Time: 14:24
 */
namespace app\admin\validate;
use think\Validate;

class ShopValidate extends Validate{
protected $rule = [
	['name','unique:shop','用户已存在'],
    ['username','unique:shop','用户已存在'],
];
}