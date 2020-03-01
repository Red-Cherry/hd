package com.sjx.hangduo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.model.vo
 * @Description:
 * @date 2020 年 02 月 16 22:20 星期日
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ConsultUserVO {

    /**
     * id主键
     */
    private Integer consultId;
    /**
     * 用户名
     */
    private String userName;

    /**
     * 用户联系方式
     */
    private String userPhone;

    /**
     * 咨询内容
     */
    private String consultContent;

    /**
     * 咨询时间
     */
    private Date consultCreateTime;
}
