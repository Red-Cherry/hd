package com.sjx.hangduo.service.law;

import com.sjx.hangduo.model.entity.Clause;
import com.sjx.hangduo.model.vo.ClauseRegDirVo;

import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.service.law
 * @Description:
 * @date 2020 年 02 月 20 21:25 星期四
 */
public interface ClauseService {
    boolean addClause(Clause clause);
    List<ClauseRegDirVo> queryAllClause();
    boolean removeClause(Integer id);
    ClauseRegDirVo queryClauseById(Integer id);
}
