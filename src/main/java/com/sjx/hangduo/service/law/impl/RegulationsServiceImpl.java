package com.sjx.hangduo.service.law.impl;

import com.sjx.hangduo.dao.law.RegulationsMapper;
import com.sjx.hangduo.dao.law.TypeMapper;
import com.sjx.hangduo.model.entity.Regulations;
import com.sjx.hangduo.model.entity.Type;
import com.sjx.hangduo.model.vo.RegTypeVO;
import com.sjx.hangduo.model.vo.TypeVO;
import com.sjx.hangduo.service.law.RegulationsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hd
 * @Package com.sjx.hd.service.law.impl
 * @Description: 法规管理的service接口实现类
 * @date 2020 年 02 月 11 21:31 星期二
 */
@Service
public class RegulationsServiceImpl implements RegulationsService {

    @Resource
    private RegulationsMapper regulationsMapper;

    @Resource
    private TypeMapper typeMapper;

    @Override
    public List<RegTypeVO> queryAllRegulations() {
        return regulationsMapper.selectAllRegulations();
    }

    @Override
    public List<TypeVO> queryTypeByTopNum() {
        List<Type> types = typeMapper.selectTypeByTopNum(0);
        List<TypeVO> typeVOList = new ArrayList<TypeVO>();
        for (Type type : types) {
            List<Type> types1 = typeMapper.selectTypeByTopNum(type.getId());
            String name = "";
            if (types1 != null && types1.size() > 0) {
                for (Type type1 : types1) {
                    name += type1.getTypeName() + " ";
                }
            } else {
                name = "暂无下级";
            }
            typeVOList.add(new TypeVO( type.getId(), type.getTypeName(), name));
        }
        return typeVOList;
    }
    @Override
    public List<Type> queryTypeByTopNum(Integer id) {
        return typeMapper.selectTypeByTopNum(id);
    }

    @Override
    public boolean addType(Type type) {
        Integer integer = typeMapper.insertType(type);
        if (integer > 0 ) {
            return true;
        }
        return false;
    }

    @Override
    public boolean addRegulations(Regulations regulations) {
        Integer integer = regulationsMapper.insertRegulations(regulations);
        if (integer > 0) {
            return true;
        }
        return false;
    }
}
