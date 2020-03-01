package com.sjx.hangduo.service.user.impl;

import com.sjx.hangduo.dao.user.UserMapper;
import com.sjx.hangduo.model.entity.User;
import com.sjx.hangduo.service.user.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.service.user.impl
 * @Description:
 * @date 2020 年 02 月 16 21:43 星期日
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public User queryUserByPhoneAndPassword(String phone, String password) {
        return userMapper.selectUserByPhoneAndPassword(phone, password);
    }

    @Override
    public List<User> queryAllUser() {
        return userMapper.selectAllUser();
    }
}
