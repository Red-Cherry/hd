package com.sjx.hangduo.dao.other;

import com.sjx.hangduo.model.entity.Email;
import com.sjx.hangduo.model.entity.Feedback;
import com.sjx.hangduo.model.entity.WebSetting;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.dao.other
 * @Description:
 * @date 2020 年 02 月 23 14:43 星期日
 */
@Mapper
public interface WebSettingMapper {
    Integer updateSetting(@Param(value = "web")WebSetting webSetting);
    WebSetting selectSetting();
    String selectAboutUs();
    Integer updateAboutUs(String content);
    String selectService();
    Integer updateService(String content);
    String selectApiKey();
    Integer updateApiKey(String content);
    Email selectEmail();
    Integer updateEmail(Email record);
    List<Feedback> selectAllFeedback();
    Integer deleteFeedbackById(@Param(value = "id")Integer id);
}
