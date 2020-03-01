package com.sjx.hangduo.controller.management;

import com.alibaba.fastjson.JSON;
import com.sjx.hangduo.model.entity.Directory;
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
 * @Description: 目录操作的前端控制器
 * @date 2020 年 02 月 15 20:11 星期六
 */
@Controller
public class DirectoryController {

    private static Logger logger = LoggerFactory.getLogger(DirectoryController.class);

    @Resource
    private DirectoryService directoryService;


    @RequestMapping("/getDir")
    @ResponseBody
    public String getDir(@RequestParam(value = "parentId", defaultValue = "0")Integer parentId,
                              @RequestParam(value = "lawId") Integer lawId) {
        logger.info("查看了id为" + lawId + "的法规的父级目录为id为" + parentId + "的目录");
        List<Directory> directories = directoryService.queryDirectoryByParentId(parentId, lawId);
        return JSON.toJSONString(directories);
    }

    @RequestMapping(value = "/removeDir")
    @ResponseBody
    public String removeDir(@RequestParam(value = "id")Integer id) {
        boolean b = directoryService.removeDirById(id);
        if (b) {
            logger.info("删除了id为" + id + "的目录及其子目录");
        }
        return JSON.toJSONString(b);
    }

    @RequestMapping(value = "/addDIr")
    public String addDIr(Directory directory, RedirectAttributes redirect) {
        boolean b = directoryService.addDir(directory);
        if (directory.getDirectoryId() == null) {
            if (b){
                logger.info(directory.getDirectoryName() + "新增目录成功");
                redirect.addFlashAttribute("info", "添加成功");
            } else {
                logger.error("新增目录失败");
                throw new HDKSException("400", "新增失败");
            }
        } else {
            logger.info("通过点击目录详情跳转到添加页面进行修改目录" + directory.getDirectoryName());
            if (b){
                logger.info(directory.getDirectoryName() + "修改成功");
                redirect.addFlashAttribute("info", "修改成功");
            } else {
                logger.error("修改目录失败");
                throw new HDKSException("400", "修改失败");
            }
        }
        return "redirect:/toAddDir";
    }

    @RequestMapping(value = "/getDIrByRegId")
    @ResponseBody
    public String getDIrByRegId(@RequestParam(value = "regId")Integer regId) {
        List<Directory> directories = directoryService.queryDirByRegId(regId);
        if (directories != null && directories.size() > 0){
            return JSON.toJSONString(directories);
        } else {
            return JSON.toJSONString("201");
        }
    }
}
