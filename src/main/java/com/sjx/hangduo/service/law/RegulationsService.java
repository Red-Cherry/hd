package com.sjx.hangduo.service.law;


import com.sjx.hangduo.model.entity.Regulations;
import com.sjx.hangduo.model.entity.Type;
import com.sjx.hangduo.model.vo.RegTypeVO;
import com.sjx.hangduo.model.vo.TypeVO;

import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hd
 * @Package com.sjx.hd.service.law
 * @Description: 法规管理的service接口
 * @date 2020 年 02 月 11 21:30 星期二
 */
public interface RegulationsService {
    List<RegTypeVO> queryAllRegulations();
    List<TypeVO> queryTypeByTopNum();
    List<Type> queryTypeByTopNum(Integer id);
    boolean addType(Type type);
    boolean addRegulations(Regulations regulations);
}
