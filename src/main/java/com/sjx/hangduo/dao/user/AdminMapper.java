package com.sjx.hangduo.dao.user;

import com.sjx.hangduo.model.entity.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.dao.user
 * @Description:
 * @date 2020 年 02 月 23 18:16 星期日
 */
@Mapper
public interface AdminMapper {
    List<Admin> selectAllAdmin();
    Integer insertAdmin(@Param(value = "admin")Admin admin);
    Integer updateAdmin(@Param(value = "admin")Admin admin);
    Integer deleteAdmin(@Param(value = "id")Integer id);
}
