package com.sjx.hangduo.controller.client;

import com.sjx.hangduo.model.dto.Result;
import com.sjx.hangduo.model.vo.ClauseRegDirVo;
import com.sjx.hangduo.model.vo.RegTypeVO;
import com.sjx.hangduo.service.law.ClauseService;
import com.sjx.hangduo.service.law.RegulationsService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hangduo
 * @Package com.sjx.hangduo.controller.client
 * @Description:
 * @date 2020 年 02 月 19 21:16 星期三
 */
@RestController
public class WeChatLawController {

    @Resource
    private RegulationsService regulationsService;

    @Resource
    private ClauseService clauseService;

    @PostMapping("/getAllLaw")
    @ResponseBody
    public Result getAllLaw(){
        Result result = new Result();
        List<RegTypeVO> regTypeVOS = regulationsService.queryAllRegulations();
        if (regTypeVOS != null && regTypeVOS.size() > 0) {
            result.setCode(200);
            result.setMessage("查询成功");
            result.setData(regTypeVOS);
        } else {
            result.setCode(400);
            result.setMessage("查询失败");
            result.setData("");
        }
        return result;
    }

    @PostMapping("/getAllClause")
    @ResponseBody
    public Result getAllClause(){
        Result result = new Result();
        List<ClauseRegDirVo> clauses = clauseService.queryAllClause();
        if (clauses != null && clauses.size() > 0) {
            result.setCode(200);
            result.setMessage("查询成功");
            result.setData(clauses);
        } else {
            result.setCode(400);
            result.setMessage("查询失败");
            result.setData("");
        }
        return result;
    }
}