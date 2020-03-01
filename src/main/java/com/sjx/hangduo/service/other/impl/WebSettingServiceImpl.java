package com.sjx.hangduo.service.other.impl;

import com.sjx.hangduo.dao.other.WebSettingMapper;
import com.sjx.hangduo.model.entity.Email;
import com.sjx.hangduo.model.entity.Feedback;
import com.sjx.hangduo.model.entity.WebSetting;
import com.sjx.hangduo.service.other.WebSettingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.service.other.impl
 * @Description:
 * @date 2020 年 02 月 23 15:00 星期日
 */
@Service
public class WebSettingServiceImpl implements WebSettingService {

    @Resource
    private WebSettingMapper webSettingMapper;

    @Override
    public boolean modifyWeb(WebSetting webSetting) {
        Integer integer = webSettingMapper.updateSetting(webSetting);
        if(integer > 0) {
            return true;
        }
        return false;
    }
    @Override
    public WebSetting queryWeb() {
        return webSettingMapper.selectSetting();
    }



    @Override
    public boolean modifyAboutUs(String content) {
        Integer integer = webSettingMapper.updateAboutUs(content);
        if (integer > 0) {
            return true;
        }
        return false;
    }
    @Override
    public String queryAboutUsContent() {
        return webSettingMapper.selectAboutUs();
    }



    @Override
    public boolean modifyService(String content) {
        Integer integer = webSettingMapper.updateService(content);
        if (integer > 0) {
            return true;
        }
        return false;
    }
    @Override
    public String queryServiceContent() {
        return webSettingMapper.selectService();
    }


    @Override
    public boolean modifyApiKey(String content) {
        Integer integer = webSettingMapper.updateApiKey(content);
        if (integer > 0) {
            return true;
        }
        return false;
    }
    @Override
    public String queryApiKeyContent() {
        return webSettingMapper.selectApiKey();
    }

    @Override
    public boolean modifyEmail(Email email) {
        Integer integer = webSettingMapper.updateEmail(email);
        if (integer > 0) {
            return true;
        }
        return false;
    }

    @Override
    public Email queryEmail() {
        return webSettingMapper.selectEmail();
    }

    @Override
    public boolean removeFeedback(Integer id) {
        Integer integer = webSettingMapper.deleteFeedbackById(id);
        if (integer > 0) {
            return true;
        }
        return false;
    }

    @Override
    public List<Feedback> queryAllFeedback() {
        return webSettingMapper.selectAllFeedback();
    }
}
