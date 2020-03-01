package com.sjx.hangduo.service.other;

import com.sjx.hangduo.model.vo.ConsultUserVO;

import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.service.other
 * @Description:
 * @date 2020 年 02 月 16 22:28 星期日
 */
public interface ConsultService {
    List<ConsultUserVO> queryAllConsult();
    boolean removeConsult(Integer id);
}
