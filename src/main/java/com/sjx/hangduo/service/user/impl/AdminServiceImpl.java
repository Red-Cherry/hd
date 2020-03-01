package com.sjx.hangduo.service.user.impl;

import com.sjx.hangduo.dao.user.AdminMapper;
import com.sjx.hangduo.model.entity.Admin;
import com.sjx.hangduo.service.user.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.service.user.impl
 * @Description:
 * @date 2020 年 02 月 23 18:29 星期日
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    @Override
    public List<Admin> queryAllAdmin() {
        return adminMapper.selectAllAdmin();
    }

    @Override
    public boolean addAdmin(Admin admin) {
        Integer integer = adminMapper.insertAdmin(admin);
        if (integer > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean updateAdmin(Admin admin) {
        Integer integer = adminMapper.updateAdmin(admin);
        if (integer > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean removeAdmin(Integer id) {
        Integer integer = adminMapper.deleteAdmin(id);
        if (integer > 0) {
            return true;
        }
        return false;
    }
}
