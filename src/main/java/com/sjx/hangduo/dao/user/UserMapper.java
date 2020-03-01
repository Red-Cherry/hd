package com.sjx.hangduo.dao.user;

import com.sjx.hangduo.model.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Project: hangduo
 * @Package com.sjx.hangduo.dao.user
 * @Description: ${todo}
 * @author 孙敬轩
 * @date 2020 年 02 月 16 21:28 星期日
 * @version V1.0 
 *
 */
@Mapper
public interface UserMapper {
    User selectUserByPhoneAndPassword(@Param(value = "phone")String phone, @Param(value = "password")String password);
    List<User> selectAllUser();

}