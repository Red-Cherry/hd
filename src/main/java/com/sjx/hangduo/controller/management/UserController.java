package com.sjx.hangduo.controller.management;

import com.alibaba.fastjson.JSON;
import com.sjx.hangduo.model.entity.Admin;
import com.sjx.hangduo.model.entity.User;
import com.sjx.hangduo.service.user.AdminService;
import com.sjx.hangduo.service.user.UserService;
import com.sjx.hangduo.util.exception.HDKSException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.controller.management
 * @Description: 用户
 * @date 2020 年 02 月 22 19:32 星期六
 */
@Controller
public class UserController {

    private static Logger logger = LoggerFactory.getLogger(UserController.class);

    @Resource
    private UserService userService;

    @Resource
    private AdminService adminService;

    @RequestMapping(value = "/adminLogin")
    public String login(@RequestParam(value = "phone")String phone,
                        @RequestParam(value = "password")String password,
                        RedirectAttributes redirect,
                        Model model){
        User user = userService.queryUserByPhoneAndPassword(phone, password);
        if (user != null) {
            logger.info("管理员" + user.getUserName() + "登陆");
            redirect.addFlashAttribute("loginInfo", "登陆成功");
            return "redirect:toLaw";
        } else {
            model.addAttribute("loginInfo", "账号密码错误");
            return "login";
        }
    }

    @RequestMapping(value = "/logout")
    public String logout() {
        return "index";
    }

    @RequestMapping(value = "/addAdmin")
    public  String addAdmin(Admin admin, RedirectAttributes redirect) {
        boolean b = adminService.addAdmin(admin);
        if (b) {
            logger.info("添加管理员" + admin.getAdminName() + "成功");
            redirect.addFlashAttribute("addCode", 200);
        } else {
            logger.error("添加管理员" + admin.getAdminName() + "失败");
            throw new HDKSException("400", "添加管理员" + admin.getAdminName() + "失败");
        }
        return "redirect:toAdmin";
    }

    @RequestMapping(value = "/updateAdmin")
    public  String updateAdmin(Admin admin, RedirectAttributes redirect) {
        boolean b = adminService.updateAdmin(admin);
        if (b) {
            logger.info("修改了管理员" + admin.getAdminName() + "的信息");
            redirect.addFlashAttribute("updateCode", 200);
        } else {
            logger.error("修改管理员" + admin.getAdminName() + "的信息失败");
            throw new HDKSException("400", "修改管理员" + admin.getAdminName() + "的信息失败");
        }
        return "redirect:toAdmin";
    }

    @RequestMapping(value = "/dleAdmin")
    @ResponseBody
    public String dleAdmin(@RequestParam(value = "id")Integer id) {
        if(adminService.removeAdmin(id)) {
            logger.info("删除了id为" + id + "的管理员");
        }
        return JSON.toJSONString(adminService.removeAdmin(id));
    }
}
