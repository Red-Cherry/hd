package com.sjx.hangduo.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hd
 * @Package com.sjx.hd.model.entity
 * @Description: 法规类型
 * @date 2020 年 02 月 11 16:56 星期二
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Type {

  /**
   * 类型id
   */
  private Integer id;
  /**
   * 类型级别
   */
  private Integer typeNum;
  /**
   * 类型名称
   */
  private String typeName;
  /**
   * 上级
   */
  private Integer topId;
}
