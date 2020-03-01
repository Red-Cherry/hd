package com.sjx.hangduo.controller.management;

import com.sjx.hangduo.model.entity.Type;
import com.sjx.hangduo.model.vo.TypeVO;
import com.sjx.hangduo.service.law.RegulationsService;
import com.sjx.hangduo.util.exception.HDKSException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hd
 * @Package com.sjx.hd.controller.management
 * @Description: 法规类型的前端控制器
 * @date 2020 年 02 月 12 18:53 星期三
 */
@Controller
public class TypeController {

    private static Logger logger = LoggerFactory.getLogger(TypeController.class);

    @Resource
    private RegulationsService regulationsService;

    @RequestMapping("/toType")
    public String toType(Model model){
        logger.info("访问了法规类型页面");
        List<TypeVO> typeVOList = regulationsService.queryTypeByTopNum();
        if (typeVOList != null && typeVOList.size() >0) {
            model.addAttribute("typeInfo", typeVOList);
        }
        return "type";
    }

    @RequestMapping("/addType")
    @ResponseBody
    public String addType(Type type){
        boolean b = regulationsService.addType(type);
        if (b) {
            logger.info("添加" + type.getTypeName() + "成功");
            return "200";
        } else {
            logger.error("添加" + type.getTypeName() + "失败");
            throw new HDKSException("400", "添加" + type.getTypeName() + "失败");
        }
    }
}