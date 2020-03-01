package com.sjx.hangduo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hd
 * @Package com.sjx.hd.model.vo
 * @Description: 法规和类型的vo类
 * @date 2020 年 02 月 12 15:52 星期三
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegTypeVO {

    /**
     * 法规id
     */
    private Integer regulationsId;
    /**
     * 法规部号
     */
    private Integer regulationsPartNo;
    /**
     * 法规部号别名
     */
    private String regulationsPartNoAlias;
    /**
     * 法规版本
     */
    private String regulationsVersion;
    /**
     * 法规名称
     */
    private String regulationsName;
    /**
     * 显示与否   1、显示  2、不显示
     */
    private Integer regulationsShowStatus;
    /**
     * 类型名称
     */
    private String typeName;
}
