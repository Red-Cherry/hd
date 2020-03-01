package com.sjx.hangduo.controller.management;

import com.alibaba.fastjson.JSON;
import com.sjx.hangduo.model.entity.Clause;
import com.sjx.hangduo.model.entity.Directory;
import com.sjx.hangduo.service.law.ClauseService;
import com.sjx.hangduo.service.law.DirectoryService;
import com.sjx.hangduo.util.exception.HDKSException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.controller.management
 * @Description: 条款前端控制器
 * @date 2020 年 02 月 20 20:23 星期四
 */
@Controller
public class ClauseController {

    private static Logger logger = LoggerFactory.getLogger(ClauseController.class);

    @Resource
    private DirectoryService directoryService;

    @Resource
    private ClauseService clauseService;

    @RequestMapping(value = "/getRegDir")
    @ResponseBody
    public String getDir(@RequestParam(value = "regId") Integer regId) {
        List<Directory> directories = directoryService.queryDirByRegId(regId);
        return JSON.toJSONString(directories);
    }

    @RequestMapping(value = "/addClause")
    public String addClause(Clause clause, RedirectAttributes redirect){
        boolean b = clauseService.addClause(clause);
        if(clause.getClauseId() == null) {
            if (b) {
                logger.info(clause.getClauseTitle() + "新增条款成功");
                redirect.addFlashAttribute("addCode", "200");
            } else {
                logger.error("新增条款失败");
                throw new HDKSException("400", "新增失败");
            }
        } else {
            logger.info("通过法规页面跳转到添加页面进行修改条款：" + clause.getClauseTitle());
            if (b) {
                logger.info(clause.getClauseId() + "修改成功");
                redirect.addFlashAttribute("addCode", "2000");
            } else {
                logger.error("修改条款失败");
                throw new HDKSException("400", "修改失败");
            }
        }
        return "redirect:/toAddClause";
    }

    @RequestMapping(value = "/removeClause")
    @ResponseBody
    public String removeClause(@RequestParam(value = "id")Integer id) {
        boolean b = clauseService.removeClause(id);
        if (b) {
            logger.info("删除了id为" + id + "的条款");
        }
        return JSON.toJSONString(b);
    }
}
