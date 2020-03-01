package com.sjx.hangduo.dao.law;

import com.sjx.hangduo.model.entity.Clause;
import com.sjx.hangduo.model.vo.ClauseRegDirVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.dao.law
 * @Description:
 * @date 2020 年 02 月 20 21:09 星期四
 */
@Mapper
public interface ClauseMapper {
    Integer insertClause(Clause clause);
    List<ClauseRegDirVo> selectAllClause();
    Integer deleteClauseById(@Param(value = "id")Integer id);
    ClauseRegDirVo selectClauseById(@Param(value = "id")Integer id);
    Integer updateClause(@Param(value = "clause")Clause clause);
}
