package com.jtxx.auth.project.controller;

import com.jtxx.auth.project.service.SysPrjService;
import com.jtxx.entity.SysPrj;
import com.jtxx.entity.SysUsr;
import com.jtxx.util.EUDataGridResult;
import com.jtxx.util.EUReq;
import com.jtxx.util.JTXXConf;
import com.jtxx.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by aegis on 2017/11/7.
 */
@Controller
@RequestMapping("/project")
public class SysPrjController {

    @Autowired
    private SysPrjService prjService;

    @GetMapping("/project-list")
    public String projectBasic(HttpSession session){
        return "/backend/project-mgr/project-list";
    }

    @RequestMapping("/project-list/get-all")
    @ResponseBody
    public EUDataGridResult getAllProject(HttpServletRequest request){

        Enumeration enu=request.getParameterNames();
        String paraName=(String)enu.nextElement();
        Req e = (Req)JsonUtils.fromJsonWithTrim(paraName,Req.class);
        EUDataGridResult eu = prjService.getProjectListPageData(e.start,e.limit,e.Code,e.Name);
        return eu;
    }

    @RequestMapping("/project-list/get-all-for-list")
    @ResponseBody
    public String getAllForList(HttpServletRequest request,HttpSession session){

        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr)JsonUtils.fromJson(userStr,SysUsr.class);
        ArrayList<SysPrj> prjs = prjService.selectByRole(loginUser);
        return JsonUtils.toJson(prjs);
    }


    @GetMapping("/project-new")
    public String projectNew(HttpSession session){
        return "/backend/project-mgr/project-new";
    }

    @PostMapping("/SaveForAdd")
    @ResponseBody
    public Map<String, Object> add(@RequestBody String project, HttpSession session) {
        Map<String, Object> map = new HashMap<>();

        //对象映射
        SysPrj prj = (SysPrj) JsonUtils.fromJsonWithTrim(project,SysPrj.class);
        if(prjService.insertPrj(prj) > 0){
            map.put("IsSucess",true);
            map.put("Message","新增成功");
        }else{
            map.put("IsSucess",false);
            map.put("Message","新增失败，请再次尝试或联系管理员");
        }
        return map;
    }

    @PostMapping("/project-delete")
    @ResponseBody
    public Map<String, Object> del(@RequestBody String project, HttpSession session) {

        Map<String, Object> map = new HashMap<>();
        SysPrj prj = (SysPrj) JsonUtils.fromJsonWithTrim(project,SysPrj.class);
        if (prjService.deletePrj(prj) > 0 ){
            map.put("IsSucess",true);
            map.put("Message","删除成功");
        }else{
            map.put("IsSucess",false);
            map.put("Message","删除失败，请再次尝试或联系管理员");
        }

        return map;
    }

    @GetMapping("/project-edit")
    public String projectEdit(HttpServletRequest request,HttpSession session){

        String projectId = request.getParameter("ProjectID");
        SysPrj prj = prjService.selectById(projectId);
        session.setAttribute("ProjectJson",JsonUtils.toJson(prj));
        return "/backend/project-mgr/project-edit";
    }

    @PostMapping("/SaveForEdit")
    @ResponseBody
    public Map<String, Object> edit(@RequestBody String project, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        SysPrj prj = (SysPrj) JsonUtils.fromJsonWithTrim(project,SysPrj.class);
        if (prjService.updatePrjById(prj) > 0 ){
            map.put("IsSucess",true);
            map.put("Message","更新成功");
        }else{
            map.put("IsSucess",false);
            map.put("Message","更新失败，请再次尝试或联系管理员");
        }
        return map;
    }

    @GetMapping("/project-detail")
    public String projectDetail(HttpServletRequest request,HttpSession session){

        String projectId = request.getParameter("ProjectID");
        SysPrj prj = prjService.selectById(projectId);
        session.setAttribute("ProjectJson",JsonUtils.toJson(prj));
        return "/backend/project-mgr/project-detail";
    }

    class Req{
        String Name;
        String Code;
        String bleGrid;
        Integer start;
        Integer limit;
    }
}
