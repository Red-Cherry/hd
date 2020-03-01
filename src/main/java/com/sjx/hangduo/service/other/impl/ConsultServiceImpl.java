package com.sjx.hangduo.service.other.impl;

import com.sjx.hangduo.dao.other.ConsultMapper;
import com.sjx.hangduo.model.vo.ConsultUserVO;
import com.sjx.hangduo.service.other.ConsultService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.service.other.impl
 * @Description:
 * @date 2020 年 02 月 16 22:29 星期日
 */
@Service
public class ConsultServiceImpl implements ConsultService {

    @Resource
    private ConsultMapper consultMapper;

    @Override
    public List<ConsultUserVO> queryAllConsult() {
        return consultMapper.selectAllConsult();
    }

    @Override
    public boolean removeConsult(Integer id) {
        Integer integer = consultMapper.deleteConsultById(id);
        if (integer > 0){
            return true;
        }
        return false;
    }
}
