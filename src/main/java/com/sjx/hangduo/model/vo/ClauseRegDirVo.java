package com.sjx.hangduo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.model.vo
 * @Description: 条款和法规
 * @date 2020 年 02 月 22 21:55 星期六
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClauseRegDirVo {
    /**
     * 条款主键
     */
    private Integer clauseId;
    /**
     * 条款所在目录的外键
     */
    private Integer directoryForeignKey;
    /**
     * 条款所在法规的外键
     */
    private Integer regForeignKey;
    /**
     * 条款的编号
     */
    private String clauseNo;
    /**
     * 条款编号别名
     */
    private String clauseNoAlias;
    /**
     * 条款版本号
     */
    private String clauseVersion;
    /**
     * 条款标题
     */
    private String clauseTitle;
    /**
     * 条款的内容
     */
    private String clauseContent;
    /**
     * 条款的关键词
     */
    private String clauseKeywords;
    /**
     * 法规名称
     */
    private String regulationsName;
    /**
     * 目录名称
     */
    private String directoryName;
}
