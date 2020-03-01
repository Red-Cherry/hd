package com.sjx.hangduo.controller.management;

import com.alibaba.fastjson.JSON;
import com.sjx.hangduo.model.entity.Regulations;
import com.sjx.hangduo.model.entity.Type;
import com.sjx.hangduo.service.law.RegulationsService;
import com.sjx.hangduo.util.exception.HDKSException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hd
 * @Package com.sjx.hd.controller.management
 * @Description: 管理后台前端控制器
 * @date 2020 年 02 月 11 16:56 星期二
 */
@Controller
public class RegulationsController {

    private static Logger logger = LoggerFactory.getLogger(RegulationsController.class);

    @Resource
    private RegulationsService regulationsService;

    @RequestMapping("/getTopTwo")
    @ResponseBody
    public String getTopTwo(@RequestParam(value = "id", required = false, defaultValue = "0") Integer id) {
        List<Type> types = regulationsService.queryTypeByTopNum(id);
        return JSON.toJSONString(types);
    }

    @RequestMapping("/addRegulations")
    public String addRegulations(Regulations regulations, Model model) {
        boolean b = regulationsService.addRegulations(regulations);
        if (b) {
            logger.info("添加" + regulations.getRegulationsName() + "法规成功");
            model.addAttribute("addInfo", "添加成功");
        } else {
            logger.info("添加" + regulations.getRegulationsName() + "法规失败");
            throw new HDKSException("400", "添加" + regulations.getRegulationsName() + "法规失败");
        }
        return "redirect:/toLaw";
    }
}