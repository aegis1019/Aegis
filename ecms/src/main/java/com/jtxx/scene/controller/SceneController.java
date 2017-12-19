package com.jtxx.scene.controller;

import com.alibaba.fastjson.JSON;
import com.jtxx.auth.project.service.SysPrjService;
import com.jtxx.entity.Inspection;
import com.jtxx.entity.Scene;
import com.jtxx.entity.SysPrj;
import com.jtxx.entity.SysUsr;
import com.jtxx.scene.dao.SceneDao;
import com.jtxx.scene.service.SceneService;
import com.jtxx.util.EUDataGridResult;
import com.jtxx.util.JTXXConf;
import com.jtxx.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by aegis on 2017/12/6.
 */
@Controller
@RequestMapping("/scene")
public class SceneController {

    @Autowired
    private SysPrjService prjService;

    @Autowired
    private SceneService sceneService;

    @GetMapping("/scene-main-page")
    public String MainPage(HttpSession session){
        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        session.setAttribute("prjMap", prjService.getProjectMap(loginUser));
        return "/backend/scene/scene-list";
    }

    @PostMapping("/site/SearchForPage")
    @ResponseBody
    EUDataGridResult SearchForPage(HttpServletRequest request, HttpSession session){
        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        String roleId = loginUser.getRoleId();

        Enumeration enu=request.getParameterNames();
        String paraName=(String)enu.nextElement();
        Req e = (Req)JsonUtils.fromJsonWithTrim(paraName,Req.class);

        EUDataGridResult eu = sceneService.getScenePageData(roleId,e.start,e.limit,e.OwnerName);
        return eu;
    }

    @GetMapping("/site/add")
    public String add(HttpServletRequest request, HttpSession session){
        return "/backend/scene/scene-new";
    }

    @PostMapping("/site/SaveForAdd")
    @ResponseBody
    public Map<String, Object> SaveForAdd(@RequestBody String sceneStr,HttpSession session, HttpServletRequest request) {

        Scene scene = JSON.parseObject(sceneStr,Scene.class);

        //写入现场表
        sceneService.saveScene(scene);

        //处理附件

        return null;
    }

    @PostMapping("/site/GetAttachID")
    @ResponseBody
    public Map<String,Object> GetAttachID(){
        Map<String, Object> map = new HashMap<>();
        map.put("IsSucess",true);
        map.put("ReturnPKID", UUID.randomUUID().toString().replaceAll("-", ""));
        return map;
    }



    class Req{
        private String OwnerName;
        private String bleGrid;
        private Integer start;
        private Integer limit;
    }

}
