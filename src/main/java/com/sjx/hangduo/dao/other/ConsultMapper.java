package com.sjx.hangduo.dao.other;

import com.sjx.hangduo.model.vo.ConsultUserVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.service.other
 * @Description:咨询
 * @date 2020 年 02 月 16 22:07 星期日
 */
@Mapper
public interface ConsultMapper {
    List<ConsultUserVO> selectAllConsult();
    Integer deleteConsultById(@Param(value = "id")Integer id);
}
