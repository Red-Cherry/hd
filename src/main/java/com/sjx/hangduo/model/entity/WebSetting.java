package com.sjx.hangduo.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WebSetting {

  /**
   * 主键
   */
  private Integer webId;
  /**
   * 网站状态1、正常 2、关闭
   */
  private Integer webStatus;
  /**
   * 网站标题
   */
  private String webTitle;
  /**
   * 网站域名
   */
  private String webDomainName;
  /**
   * 网站logo地址
   */
  private String webLogoPath;
  /**
   * 公司邮箱
   */
  private String webEmail;
  /**
   * 站点语言 1、简体中文 2、英文
   */
  private Integer language;
}
