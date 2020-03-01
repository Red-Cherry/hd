package com.sjx.hangduo.service.law.impl;

import com.sjx.hangduo.dao.law.ClauseMapper;
import com.sjx.hangduo.model.entity.Clause;
import com.sjx.hangduo.model.vo.ClauseRegDirVo;
import com.sjx.hangduo.service.law.ClauseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.service.law.impl
 * @Description:
 * @date 2020 年 02 月 20 21:25 星期四
 */
@Service
public class ClauseServiceImpl implements ClauseService {

    @Resource
    private ClauseMapper clauseMapper;

    @Override
    public boolean addClause(Clause clause) {
        if (clause.getClauseId() == null) {
            Integer integer = clauseMapper.insertClause(clause);
            if (integer > 0) {
                return true;
            }
        } else {
            Integer integer = clauseMapper.updateClause(clause);
            if (integer > 0) {
                return true;
            }
        }
        return false;
    }

    @Override
    public List<ClauseRegDirVo> queryAllClause() {
        return clauseMapper.selectAllClause();
    }

    @Override
    public boolean removeClause(Integer id) {
        Integer integer = clauseMapper.deleteClauseById(id);
        if (integer > 0) {
            return true;
        }
        return false;
    }

    @Override
    public ClauseRegDirVo queryClauseById(Integer id) {
        return clauseMapper.selectClauseById(id);
    }
}
