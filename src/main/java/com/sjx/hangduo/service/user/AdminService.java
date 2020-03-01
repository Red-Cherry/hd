package com.sjx.hangduo.service.user;

import com.sjx.hangduo.model.entity.Admin;

import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.service.user
 * @Description:
 * @date 2020 年 02 月 23 18:28 星期日
 */
public interface AdminService {
    List<Admin> queryAllAdmin();
    boolean addAdmin(Admin admin);
    boolean updateAdmin(Admin admin);
    boolean removeAdmin(Integer id);
}
