package com.jtxx;

import com.jtxx.auth.module.service.SysModBakService;
import com.jtxx.auth.module.service.SysModService;
import com.jtxx.auth.project.service.SysPrjService;
import com.jtxx.entity.SysUsr;
import com.jtxx.auth.user.service.SysUsrService;
import com.jtxx.util.JTXXConf;
import com.jtxx.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by aegis on 2017/11/5.
 */
@Controller
public class LoginController {

    @Autowired
    private SysUsrService userService;

    @Autowired
    private SysPrjService projectService;

    @Autowired
    private SysModService sysModuleService;

    @Autowired
    private SysModBakService sysModBakService;

    @GetMapping("/")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login-post")
    @ResponseBody
    public Map<String, Object> login(@RequestBody SysUsr user, HttpSession session) {

        Map<String, Object> map = new HashMap<>();

        SysUsr loginUser = userService.checkUserLogin(user);

        if( loginUser == null ){
            map.put("isSuccess", false);
            map.put("message", "用户名或密码错误");
            return map;
        }
        //后台用户
        if(loginUser.getUserType().equals("1")){
            map.put("redirectUrl","/index");
        }
        //前台用户
        if(loginUser.getUserType().equals("0")){
            map.put("redirectUrl","/index");
        }
        map.put("isSuccess", true);
        map.put("message", "登录成功");

        session.setAttribute(JTXXConf.LOGIN_USER_INFO, JsonUtils.toJson(loginUser));
        return map;
    }

    @GetMapping("/index")
    public String indexPage(HttpServletRequest request, HttpSession session) {

        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr)JsonUtils.fromJson(userStr,SysUsr.class);

        String projectId = request.getParameter("project");

        if (projectId == null){
            //系统展示首页
            if(loginUser.getUserType().equals("0")){
                String prjectMenu = projectService.GetProjectMenuData(loginUser);
                session.setAttribute(JTXXConf.MODULE_DATA,prjectMenu);
                session.setAttribute(JTXXConf.PAGE_TYPE,JTXXConf.PAGE_TYPE2);
                session.setAttribute(JTXXConf.PROJECT_INFO,JTXXConf.PROJECT_INFO0);
            }else{
                //系统后台首页
                String dataEntryMenu = sysModBakService.getModBakByRole(loginUser.getRoleId());
                session.setAttribute(JTXXConf.MODULE_DATA,dataEntryMenu);
                session.setAttribute(JTXXConf.PAGE_TYPE,JTXXConf.PAGE_TYPE1);
                session.setAttribute(JTXXConf.PROJECT_INFO,JTXXConf.PROJECT_INFO0);
            }

        }else {
            //系统项目首页
            session.setAttribute(JTXXConf.PROJECT_ID, projectId);
            String roleId = loginUser.getRoleId();

            String menuData = sysModuleService.GetModuleMenuData(roleId,projectId);
            session.setAttribute(JTXXConf.MODULE_DATA, menuData);
            session.setAttribute(JTXXConf.PAGE_TYPE,JTXXConf.PAGE_TYPE1);
            session.setAttribute(JTXXConf.PROJECT_INFO,JTXXConf.PROJECT_INFO1);
        }
        return "index";
    }

    @GetMapping("/first-page")
    public String firstPage() {
        return "first-page";
    }

    @GetMapping("/back-index")
    public String backIndex(HttpSession session) {

        session.removeAttribute(JTXXConf.PROJECT_ID);
        session.removeAttribute(JTXXConf.PAGE_TYPE);
        session.removeAttribute(JTXXConf.PROJECT_INFO);

        return "back2index";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 移除session
        session.removeAttribute(JTXXConf.LOGIN_USER_INFO);
        session.removeAttribute(JTXXConf.PAGE_TYPE);
        session.removeAttribute(JTXXConf.PROJECT_INFO);
        session.removeAttribute(JTXXConf.MODULE_DATA);
        return "redirect:/";
    }

}
