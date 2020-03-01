package com.sjx.hangduo.model.entity;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Project: hangduo
 * @Package com.sjx.hangduo.model.entity
 * @Description: ${todo}
 * @author 孙敬轩
 * @date 2020 年 02 月 16 21:28 星期日
 * @version V1.0 
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    /**
    * 用户主键
    */
    private Integer userId;

    /**
    * 用户姓名
    */
    private String userName;

    /**
    * 用户电话
    */
    private String userPhone;

    /**
    * 性别  1男  2女
    */
    private Integer userSex;

    /**
    * 会员类型1免费   2付费
    */
    private Integer userType;

    /**
    * 用户创建日期
    */
    private Date userCreateTime;

    /**
    * 1正常    2删除
    */
    private Integer userDeleteStatus;

    /**
    * 用户最后修改信息的时间
    */
    private Date userUpdateTime;

    /**
    * 登录密码
    */
    private String userPassword;
}