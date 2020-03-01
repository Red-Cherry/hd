package com.sjx.hangduo.controller.client;

import com.sjx.hangduo.model.dto.Result;
import com.sjx.hangduo.model.entity.User;
import com.sjx.hangduo.service.user.UserService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.controller.client
 * @Description:
 * @date 2020 年 02 月 19 21:49 星期三
 */
@RestController
public class WeChatUserController {

    @Resource
    private UserService userService;

    @RequestMapping(value = "/login")
    @ResponseBody
    public Result   login(@RequestParam(value = "phone")String phone,
                        @RequestParam(value = "password")String password){
        Result result = new Result();
        User user = userService.queryUserByPhoneAndPassword(phone, password);
        if (user != null) {
            result.setCode(200);
            result.setData(user);
            result.setMessage("登陆成功");
        } else {
            result.setCode(400);
            result.setData("");
            result.setMessage("登陆失败");
        }
        return result;
    }
}
