package com.sjx.hangduo.service.user;

import com.sjx.hangduo.model.entity.User;

import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.service.user
 * @Description:
 * @date 2020 年 02 月 16 21:36 星期日
 */
public interface UserService {
    User queryUserByPhoneAndPassword(String phone, String password);
    List<User> queryAllUser();
}
