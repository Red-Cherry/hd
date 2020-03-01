package com.sjx.hangduo.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Project: hangduo
 * @Package com.sjx.hangduo.model.entity
 * @Description: ${todo}
 * @author 孙敬轩
 * @date 2020 年 02 月 23 17:28 星期日
 * @version V1.0 
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Email {
    /**
    * 邮箱SMTP设置表主键
    */
    private Integer SMTPId;

    /**
    * 邮箱
    */
    private String SMTPEmail;

    /**
    * 服务器
    */
    private String SMTPServer;

    /**
     * 用户名
     */
    private String SMTPUsername;

    /**
     * 密码
     */
    private String SMTPPassword;

    /**
    * 发送次数
    */
    private Integer number;

    /**
    * 登录类型
    */
    private String loginType;
}