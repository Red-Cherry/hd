package com.sjx.hangduo.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: newdraft
 * @Package com.immigration.newdraft.entity
 * @Description: 承载请求后的响应信息
 * @date 2020 年 02 月 02 00:22 星期日
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Result {
    /**
     * 状态码
     */
    private Integer code;
    /**
     * 消息
     */
    private String message;
    /**
     * 数据
     */
    private Object data;
}