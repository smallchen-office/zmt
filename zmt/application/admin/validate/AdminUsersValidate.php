<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/1/1
 * Time: 14:24
 */
namespace app\admin\validate;
use think\Validate;

class AdminUsersValidate extends Validate{
protected $rule = [
    ['username','unique:zmt_admin_users','用户已存在'],
];
}