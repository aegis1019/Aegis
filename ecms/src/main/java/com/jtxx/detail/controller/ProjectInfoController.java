package com.jtxx.detail.controller;

import com.jtxx.auth.module.service.SysModService;
import com.jtxx.util.JTXXConf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by aegis on 2017/11/7.
 */
@Controller
@RequestMapping("/project-info")
public class ProjectInfoController {

    @Autowired
    private SysModService sysModuleService;

    @GetMapping("/project-main-page")
    public String projectMainPage(HttpServletRequest request, HttpSession session) {

        String projectId = request.getParameter("project");
        String roleId = (String)session.getAttribute(JTXXConf.SESSION_ROLEID);
        String menuData = sysModuleService.GetModuleMenuData(roleId,projectId);

        session.setAttribute(JTXXConf.PROJECT_ID, projectId);
        session.setAttribute(JTXXConf.MODULE_DATA, menuData);
        session.setAttribute(JTXXConf.PAGE_TYPE,JTXXConf.PAGE_TYPE1);
        session.setAttribute(JTXXConf.PROJECT_INFO,JTXXConf.PROJECT_INFO1);

        return "/index";
    }

    @GetMapping("/project-basic")
    public String projectBasic(HttpSession session){

        String projectId = (String)session.getAttribute(JTXXConf.PROJECT_ID);
        return "/project/project-basic";
    }

    @GetMapping("/project-outline")
    public String projectOutline(HttpSession session){

        System.out.println("project-outline");

        printTest(session);
        return "/project/project-outline";
    }

    @GetMapping("/project-live")
    public String projectLive(HttpSession session){

        System.out.println("project-live");
        printTest(session);
        return "/project/project-live";
    }

    @GetMapping("/project-process")
    public String projectProcess(HttpSession session){

        System.out.println("project-process");
        printTest(session);
        return "/project/project-process";
    }

    @GetMapping("/project-quality")
    public String projectSafe(HttpSession session){

        System.out.println("project-quality");
        printTest(session);
        return "/project/project-quality";
    }

    @GetMapping("/fund-manager")
    public String fundManager(HttpSession session){

        System.out.println("fund-manager");
        printTest(session);
        return "/project/project-fund";
    }

    public void printTest(HttpSession session){
        String projectId = (String)session.getAttribute(JTXXConf.PROJECT_ID);
        String roleId = (String)session.getAttribute(JTXXConf.SESSION_ROLEID);
        String loginUser = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);

        System.out.println("projectId:" + projectId);
        System.out.println("roleId:" + roleId);
        System.out.println("loginUser:" + loginUser);
    }

}
