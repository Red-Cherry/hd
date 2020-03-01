package com.sjx.hangduo.controller.management;

import com.alibaba.fastjson.JSON;
import com.sjx.hangduo.service.other.ConsultService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.controller.management
 * @Description:
 * @date 2020 年 02 月 23 00:32 星期日
 */
@Controller
public class ConsultController {

    private static Logger logger = LoggerFactory.getLogger(ConsultController.class);

    @Resource
    private ConsultService consultService;

    @RequestMapping(value = "/removeConsult")
    @ResponseBody
    public String removeConsult(@RequestParam(value = "id")Integer id,
                                Model model){
        boolean b = consultService.removeConsult(id);
        if (b) {
            logger.info("删除了id为" + id + "的咨询");
        }
        return JSON.toJSONString(b);
    }
}
