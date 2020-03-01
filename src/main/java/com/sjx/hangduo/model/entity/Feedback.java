package com.sjx.hangduo.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Feedback {

  /**
   * 主键id
   */
  private Integer feedbackId;
  /**
   * 内容
   */
  private String feedbackContent;
  /**
   * 用户id
   */
  private Integer userForeignKey;
  /**
   * 反馈时间
   */
  private Date feedbackCreateTime;
  /**
   * 删除状态
   */
  private Integer feedbackDeleteStatus;
}
