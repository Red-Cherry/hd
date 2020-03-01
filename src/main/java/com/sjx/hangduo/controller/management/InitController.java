package com.sjx.hangduo.controller.management;

import com.sjx.hangduo.model.entity.*;
import com.sjx.hangduo.model.vo.ClauseRegDirVo;
import com.sjx.hangduo.model.vo.ConsultUserVO;
import com.sjx.hangduo.model.vo.DirRegVO;
import com.sjx.hangduo.model.vo.RegTypeVO;
import com.sjx.hangduo.service.law.ClauseService;
import com.sjx.hangduo.service.law.DirectoryService;
import com.sjx.hangduo.service.law.RegulationsService;
import com.sjx.hangduo.service.other.ConsultService;
import com.sjx.hangduo.service.other.WebSettingService;
import com.sjx.hangduo.service.user.AdminService;
import com.sjx.hangduo.service.user.UserService;
import com.sjx.hangduo.util.agent.UserAgentUtils;
import com.sjx.hangduo.util.exception.HDKSException;
import cz.mallat.uasparser.UserAgentInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * @author 孙敬轩
 * @version V1.0
 * @Project: hd
 * @Package com.sjx.hd.controller.management
 * @Description: 初始化跳转页面
 * @date 2020 年 02 月 12 21:35 星期三
 */
@Controller
public class InitController {

    private static Logger logger = LoggerFactory.getLogger(InitController.class);

    @Resource
    private RegulationsService regulationsService;

    @Resource
    private DirectoryService directoryService;

    @Resource
    private UserService userService;

    @Resource
    private ConsultService consultService;

    @Resource
    private ClauseService clauseService;

    @Resource
    private WebSettingService webSettingService;

    @Resource
    private AdminService adminService;

    @RequestMapping(value = "/toLogin")
    public String toLogin() {
        return "login";
    }

    @RequestMapping(value = "/toLaw")
    public String toLaw(@ModelAttribute(value = "loginInfo") String loginInfo, Model model, HttpServletRequest request) {
        try {
            String ua = request.getHeader("User-Agent");
            UserAgentInfo agentInfo = UserAgentUtils.uaSparser.parse(ua);
            logger.info("访问法规列表页面，访问设备信息\n" + agentInfo);
            List<RegTypeVO> regulations = regulationsService.queryAllRegulations();
            if (regulations != null && regulations.size() > 0) {
                model.addAttribute("regulations", regulations);
                model.addAttribute("loginInfo", loginInfo);
            } else {
                model.addAttribute("info", "没有数据");
                logger.info("访问了法规页面没查询到数据", agentInfo);
                throw new HDKSException("201", "未查询到相应数据");
            }
            return "law";
        } catch (IOException e) {
            model.addAttribute("info", "没有数据");
            logger.error("未解析到agentInfo");
            throw new HDKSException("300", "未解析到相应数据");
        }
    }


    @RequestMapping("/toAddLaw")
    public String toAddReg(@RequestParam(value = "id", required = false, defaultValue = "0") Integer id,
                           Model model) {
        logger.info("访问了新增法规页面");
        List<Type> types = regulationsService.queryTypeByTopNum(id);
        if (types != null && types.size() > 0) {
            model.addAttribute("types", types);
        } else {
            logger.error("没有查询到初始数据:分类信息");
            throw new HDKSException("201", "没有查询到初始数据:分类信息");
        }
        return "addLaw";
    }

    @RequestMapping("/toDirectory")
    public String toDirectory(Model model) {
        logger.info("访问了新增目录页面");
        List<RegTypeVO> regulations = regulationsService.queryAllRegulations();
        if (regulations != null && regulations.size() > 0) {
            model.addAttribute("regulations", regulations);
        } else {
            logger.error("没有查询到初始数据:法规信息");
            throw new HDKSException("201", "没有查询到初始数据:法规信息");
        }
        return "directory";
    }

    @RequestMapping(value = "/toAddDir")
    public String toAddDir(@RequestParam(value = "id", required = false) Integer id,
                           @RequestParam(value = "regId", required = false) Integer regId,
                           @ModelAttribute(value = "info") String info, Model model) {
        model.addAttribute("info", info);
        if (id != null) {
            logger.info("通过目录的编辑访问了新增目录页面");
            DirRegVO directory = directoryService.queryDirById(id);
            if (directory != null) {
                model.addAttribute("dir", directory);
            } else {
                model.addAttribute("dirErr", "没有数据");
            }
        }
        logger.info("访问了新增目录页面");
        List<RegTypeVO> regulations = regulationsService.queryAllRegulations();
        if (regulations != null && regulations.size() > 0) {
            model.addAttribute("regulations", regulations);
        } else {
            model.addAttribute("regErr", "没有数据");
        }
        if (regId != null) {
            List<Directory> directories = directoryService.queryDirByRegId(regId);
            if (directories != null && directories.size() > 0) {
                model.addAttribute("dirs", directories);
            } else {
                model.addAttribute("dirsErr", "该法规还没有目录");
            }
        }
        return "addDir";
    }

    @RequestMapping(value = "/toUser")
    public String toUser(Model model) {
        logger.info("访问了用户列表页面");
        List<User> users = userService.queryAllUser();
        if (users != null && users.size() > 0) {
            model.addAttribute("users", users);
        } else {
            model.addAttribute("usersErr", "暂时没有数据");
        }
        return "user";
    }

    @RequestMapping(value = "/toConsult")
    public String toConsult(Model model) {
        logger.info("访问了咨询列表");
        List<ConsultUserVO> consults = consultService.queryAllConsult();
        if (consults != null && consults.size() > 0) {
            model.addAttribute("consults", consults);
        } else {
            model.addAttribute("consultsInfo", "没有咨询");
        }
        return "consult";
    }

    @RequestMapping(value = "/toClause")
    public String getAllClause(Model model) {
        logger.info("访问了条款列表页面");
        List<ClauseRegDirVo> clauses = clauseService.queryAllClause();
        if (clauses != null && clauses.size() > 0) {
            model.addAttribute("clauses", clauses);
        } else {
            model.addAttribute("clausesErr", "没有数据");
        }
        return "clause";
    }

    @RequestMapping(value = "/toAddClause")
    public String toAdd(@ModelAttribute(value = "addCode") String addCode,
                        @RequestParam(value = "id", required = false) Integer id,
                        Model model) {
        if (id != null) {
            logger.info("通过条款页面访问了新增条款页面");
            ClauseRegDirVo clause = clauseService.queryClauseById(id);
            if (clause != null) {
                model.addAttribute("clause", clause);
            }
        }
        logger.info("访问了新增条款页面");
        List<RegTypeVO> regTypeVOS = regulationsService.queryAllRegulations();
        model.addAttribute("addCode", addCode);
        if (regTypeVOS != null && regTypeVOS.size() > 0) {
            model.addAttribute("regs", regTypeVOS);
        } else {
            model.addAttribute("regInfo", "没有数据");
        }
        return "addClause";
    }

    @RequestMapping(value = "/toWebSet")
    public String toWebSet(@ModelAttribute(value = "info") String info, Model model) {
        logger.info("访问了网站设置页面");
        WebSetting webSetting = webSettingService.queryWeb();
        if (webSetting != null) {
            model.addAttribute("web", webSetting);
            System.out.println(info);
            if (info != null) {
                model.addAttribute("info", info);
            }
        } else {
            model.addAttribute("webErr", "暂无信息");
        }
        return "webSetting";
    }

    @RequestMapping(value = "/toAboutUs")
    public String toAboutUs(@ModelAttribute(value = "info") String info,
                            Model model) {
        logger.info("访问了公司介绍页面");
        if (info != null && info != "") {
            model.addAttribute("info", info);
        }
        model.addAttribute("content", webSettingService.queryAboutUsContent());
        return "aboutUs";
    }

    @RequestMapping(value = "/toService")
    public String toService(@ModelAttribute(value = "info") String info,
                            Model model) {
        logger.info("访问了服务协议页面");
        if (info != null && info != "") {
            model.addAttribute("info", info);
        }
        model.addAttribute("content", webSettingService.queryServiceContent());
        return "service";
    }


    @RequestMapping(value = "/toSms")
    public String toSms(@ModelAttribute(value = "info") String info,
                        Model model) {
        logger.info("访问了短信设置页面");
        if (info != null && info != "") {
            model.addAttribute("info", info);
        }
        model.addAttribute("content", webSettingService.queryApiKeyContent());
        return "sms";
    }

    @RequestMapping(value = "/toEmail")
    public String toEmail(@ModelAttribute(value = "info") String info,
                          Model model) {
        logger.info("访问了邮件SMTP设置页面");
        if (info != null && info != "") {
            model.addAttribute("info", info);
        }
        model.addAttribute("email", webSettingService.queryEmail());
        return "email";
    }

    @RequestMapping(value = "/toAdmin")
    public String toAdmin(@ModelAttribute(value = "addCode")String addCode,
                          @ModelAttribute(value = "updateCode")String updateCode,
                          Model model) {
        logger.info("访问了管理员列表");
        model.addAttribute("addInfo", addCode);
        model.addAttribute("updateCode", updateCode);
        List<Admin> admins = adminService.queryAllAdmin();
        if (admins != null && admins.size() > 0) {
            model.addAttribute("admins", admins);
        } else {
            model.addAttribute("info", "没有数据");
        }
        return "admin";
    }

    @RequestMapping(value = "/toFeedBack")
    public String toFeedBack(Model model) {
        logger.info("访问了意见反馈列表页面");
        List<Feedback> feedbacks = webSettingService.queryAllFeedback();
        if (feedbacks != null && feedbacks.size() > 0) {
            model.addAttribute("feedbacks", feedbacks);
        } else {
            model.addAttribute("info", "没有数据");
        }
        return "feedback";
    }
}
