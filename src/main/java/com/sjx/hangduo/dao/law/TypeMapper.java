package com.sjx.hangduo.dao.law;

import com.sjx.hangduo.model.entity.Type;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hd
 * @Package com.sjx.hd.dao.law
 * @Description: 法规类型的sql操作接口
 * @date 2020 年 02 月 12 16:35 星期三
 */
@Mapper
public interface TypeMapper {
    List<Type> selectTypeByTopNum(@Param(value = "num") Integer num);
    Integer insertType(@Param(value = "type") Type type);
}