package com.sjx.hangduo.dao.law;

import com.sjx.hangduo.model.entity.Regulations;
import com.sjx.hangduo.model.vo.RegTypeVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hd
 * @Package com.sjx.hd.dao.law
 * @Description: 法规sql操作的mapper接口
 * @date 2020 年 02 月 11 22:00 星期二
 */
@Mapper
public interface RegulationsMapper {
    List<RegTypeVO> selectAllRegulations();
    Integer insertRegulations(@Param(value = "reg") Regulations regulations);
}