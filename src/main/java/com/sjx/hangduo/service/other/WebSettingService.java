package com.sjx.hangduo.service.other;

import com.sjx.hangduo.model.entity.Email;
import com.sjx.hangduo.model.entity.Feedback;
import com.sjx.hangduo.model.entity.WebSetting;

import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.service.other
 * @Description:
 * @date 2020 年 02 月 23 14:56 星期日
 */
public interface WebSettingService {
    boolean modifyWeb(WebSetting webSetting);
    WebSetting queryWeb();
    boolean modifyAboutUs(String content);
    String queryAboutUsContent();
    boolean modifyService(String content);
    String queryServiceContent();
    boolean modifyApiKey(String content);
    String queryApiKeyContent();
    boolean modifyEmail(Email email);
    Email queryEmail();
    boolean removeFeedback(Integer id);
    List<Feedback> queryAllFeedback();
}
