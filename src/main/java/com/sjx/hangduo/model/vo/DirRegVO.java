package com.sjx.hangduo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.model.vo
 * @Description: 法规和目录的VO类
 * @date 2020 年 02 月 16 00:24 星期日
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DirRegVO {
    /**
     * 目录的主键
     */
    private Integer directoryId;
    /**
     * 目录名称
     */
    private String directoryName;
    /**
     * 父级目录的id
     */
    private Integer parentId;
    /**
     * 同级别目录的顺序，数字值越小越靠前
     */
    private Integer level;
    /**
     * 法规的外键
     */
    private Integer regulationsForeignKey;
    /**
     * 法规的主键
     */
    private Integer regulationsId;
    /**
     * 法规名称
     */
    private String regulationsName;
}
