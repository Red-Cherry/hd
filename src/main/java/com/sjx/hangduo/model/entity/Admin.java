package com.sjx.hangduo.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

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
public class Admin {
    /**
    * 管理员主键
    */
    private Integer adminId;
    /**
    * 管理员姓名
    */
    private String adminName;
    /**
    * 管理员电话
    */
    private String adminPhone;
    /**
    * 管理员创建日期
    */
    private Date adminCreateTime;

    /**
    * 1正常    2删除
    */
    private Integer adminDeleteStatus;
    /**
    * 登录密码
    */
    private String adminPassword;
    /**
     * 1普通   2超级
     */
    private Integer adminType;
}