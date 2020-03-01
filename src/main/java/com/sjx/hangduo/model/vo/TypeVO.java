package com.sjx.hangduo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hd
 * @Package com.sjx.hd.model.vo
 * @Description: 一级类型二级类型VO类
 * @date 2020 年 02 月 12 17:43 星期三
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TypeVO {
    /**
     * 类别id
     */
    private Integer id;
    /**
     * 一级类别名称
     */
    private String top1Name;
    /**
     * 二级类别名称
     */
    private String top2Name;
}
