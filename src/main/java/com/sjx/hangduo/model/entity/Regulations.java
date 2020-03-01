package com.sjx.hangduo.model.entity;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Project: hd
 * @Package com.sjx.hd.model.entity
 * @Description: ${todo}
 * @author 孙敬轩
 * @date 2020 年 02 月 11 21:23 星期二
 * @version V1.0 
 *
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Regulations {
    /**
    * 法规的主键
    */
    private Integer regulationsId;

    /**
    * 法规部号
    */
    private Integer regulationsPartNo;

    /**
    * 法规部号的别名
    */
    private String regulationsPartNoAlias;

    /**
    * 法规版本号
    */
    private String regulationsVersion;

    /**
    * 法规名称
    */
    private String regulationsName;

    /**
    * 客户端显示状态 1 显示   2不显示
    */
    private Integer regulationsShowStatus;

    /**
    * 法规所在七牛云的图标地址
    */
    private String regulationsIconPath;

    /**
    * 法规的pdf名称
    */
    private String regulationsPdfName;

    /**
    * 法规所在七牛云的地址
    */
    private String regulationsPdfPath;

    /**
    * 法规版本说明
    */
    private String regulationsVersionExplain;

    private Date regulationsCreateTime;

    private Date regulationsUpdateTime;

    /**
    * 分类的外键
    */
    private Integer typeId;
}