package com.sjx.hangduo.controller.management;

import com.alibaba.fastjson.JSON;
import com.sjx.hangduo.util.applicationconfig.ApplicationParam;
import com.sjx.hangduo.model.entity.Email;
import com.sjx.hangduo.model.entity.WebSetting;
import com.sjx.hangduo.service.other.WebSettingService;
import com.sjx.hangduo.util.exception.HDKSException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.controller.management
 * @Description:
 * @date 2020 年 02 月 23 15:09 星期日
 */
@Controller
public class SettingsController {

    private static Logger logger = LoggerFactory.getLogger(SettingsController.class);

    @Resource
    private WebSettingService webSettingService;

    @Resource
    private ServletContext servletContext;

    @RequestMapping(value = "/updateWeb")
    public String updateWeb(WebSetting webSetting, RedirectAttributes redirect) {
        if (webSettingService.modifyWeb(webSetting)) {
            logger.info("修改网站设置成功成功");
            redirect.addFlashAttribute("info", "修改成功");
            servletContext.setAttribute("title", webSetting.getWebTitle());
        } else {
            redirect.addFlashAttribute("info", "修改失败");
            logger.info("修改网站设置成功失败");
            throw new HDKSException("400", "修改网站设置成功失败");
        }
        return "redirect:toWebSet";
    }

    @RequestMapping(value = "/updateAboutUsContent")
    public String updateAboutUsContent(@RequestParam(value = "content") String content, RedirectAttributes redirect) {
        boolean b = webSettingService.modifyAboutUs(content);
        if (b) {
            logger.info("修改公司介绍成功");
            redirect.addFlashAttribute("info", "修改成功");
        } else {
            logger.error("修改公司介绍失败");
            throw new HDKSException("400", "修改公司介绍失败");
        }
        return "redirect:toAboutUs";
    }

    @RequestMapping(value = "/updateServiceContent")
    public String updateServiceContent(@RequestParam(value = "content") String content, RedirectAttributes redirect) {
        boolean b = webSettingService.modifyService(content);
        if (b) {
            logger.info("修改服务协议成功");
            redirect.addFlashAttribute("info", "修改成功");
        } else {
            logger.error("修改服务协议失败");
            throw new HDKSException("400", "修改服务协议失败");
        }
        return "redirect:toService";
    }

    @RequestMapping(value = "/updateApiKeyContent")
    public String updateApiKeyContent(@RequestParam(value = "content") String content, RedirectAttributes redirect) {
        ApplicationParam.apoKey = content;
        redirect.addFlashAttribute("info", "修改成功");
        logger.info("修改平台ApiKey成功");
        return "redirect:toSms";
    }

    @RequestMapping(value = "/updateEmail")
    public String updateEmail(Email email, RedirectAttributes redirect) {
        boolean b = webSettingService.modifyEmail(email);
        if (b) {
            logger.info("修改邮件SMTP成功");
            redirect.addFlashAttribute("info", "修改成功");
        } else {
            logger.error("修改邮件SMTP失败");
            throw new HDKSException("修改邮件SMTP失败");
        }
        return "redirect:toEmail";
    }

    @RequestMapping(value = "/dleFeedBack")
    @ResponseBody
    public String dleAdmin(@RequestParam(value = "id")Integer id) {
        if (webSettingService.removeFeedback(id)) {
            logger.info("删除了id为" + id + "的意见反馈");
        }
        return JSON.toJSONString(webSettingService.removeFeedback(id));
    }
}
