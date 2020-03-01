package com.sjx.hangduo.util.applicationconfig;

import com.sjx.hangduo.dao.other.WebSettingMapper;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo
 * @Description:
 * @date 2020 年 02 月 24 20:43 星期一
 */
@Component
public class ApplicationParam implements ServletContextAware {

    public static String apoKey = "123456";

    @Resource
    private WebSettingMapper webSettingMapper;


    @Override
    public void setServletContext(ServletContext servletContext) {
        String webTitle = webSettingMapper.selectSetting().getWebTitle();
        servletContext.setAttribute("title", webTitle);
    }
}
