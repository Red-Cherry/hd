package com.sjx.hangduo.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Consult {

  /**
   * id主键
   */
  private Integer consultId;
  /**
   * 用户id（User表外键）
   */
  private Integer userForeignKey;
  /**
   * 条款id（条款外键）
   */
  private Integer clauseForeignKey;
  /**
   * 咨询内容
   */
  private String consultContent;
  /**
   * 是否删除1、正常 2、删除
   */
  private Integer consultDeleteStatus;
  /**
   * 咨询时间
   */
  private Date consultCreateTime;
}
