package com.sjx.hangduo.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Directory {

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
   * 表示当前目录到一级目录的距离 如果是一级目录那么距离就是0
   */
  private Integer distance;
  /**
   * 同级别目录的顺序，数字值越小越靠前
   */
  private Integer level;
  /**
   * 法规的外键
   */
  private Integer regulationsForeignKey;
  /**
   * 目录的显示状态: 如果法规的显示状态是2 那么当前法规对应的目录显示状态是2
   */
  private Integer distanceShowStatus;
}
