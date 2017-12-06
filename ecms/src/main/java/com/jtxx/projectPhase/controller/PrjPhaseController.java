package com.jtxx.projectPhase.controller;

import com.jtxx.auth.project.service.SysPrjService;
import com.jtxx.entity.PrjPhase;
import com.jtxx.entity.SysUsr;
import com.jtxx.projectPhase.service.PrjPhaseService;
import com.jtxx.util.EUDataGridResult;
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
 * Created by aegis on 2017/11/15.
 */
@Controller
@RequestMapping("/project-phase")
public class PrjPhaseController {

    @Autowired
    private PrjPhaseService phaseService;

    @Autowired
    private SysPrjService prjService;

    @GetMapping("/project-phase-page")
    public String projectPhase(HttpSession session){
        return "/backend/project-phase/project-phase";
    }

    @RequestMapping("/get-all-by-role")
    @ResponseBody
    public EUDataGridResult getAllPhaseByRole(HttpServletRequest request, HttpSession session){
        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        String roleId = loginUser.getRoleId();

        Enumeration enu=request.getParameterNames();
        String paraName=(String)enu.nextElement();
        Req e = (Req)JsonUtils.fromJsonWithTrim(paraName,Req.class);
        return phaseService.getAllPhaseByRole(roleId,e.start,e.limit,e.Name);
    }



    @GetMapping("/phase-new")
    public String phaseNew(HttpSession session){
        return "/backend/project-phase/phase-new";
    }

    @PostMapping("/SaveForAdd")
    @ResponseBody
    public Map<String, Object> add(@RequestBody String phaseStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();

        PrjPhase phase = (PrjPhase)JsonUtils.fromJsonWithTrim(phaseStr,PrjPhase.class);

        if(phaseService.insert(phase) > 0){
            map.put("IsSucess",true);
            map.put("Message","新增成功");
        }else{
            map.put("IsSucess",false);
            map.put("Message","新增失败，请再次尝试或联系管理员");
        }
        return map;
    }

    @PostMapping("/phase-delete")
    @ResponseBody
    public Map<String, Object> delete(@RequestBody String phaseStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        PrjPhase phase = (PrjPhase)JsonUtils.fromJsonWithTrim(phaseStr,PrjPhase.class);

        if(phaseService.delete(phase) > 0){
            map.put("IsSucess",true);
            map.put("Message","删除成功");
        }else{
            map.put("IsSucess",false);
            map.put("Message","删除失败，请再次尝试或联系管理员");
        }
        return map;
    }

    @GetMapping("/phase-edit")
    public String phaseEdit(HttpSession session,HttpServletRequest request){

        String phaseId = request.getParameter("StageProjectID");
        PrjPhase phase = phaseService.getById(phaseId);
        session.setAttribute("StageProjectJson",JsonUtils.toJson(phase));
        return "/backend/project-phase/phase-edit";
    }

    @PostMapping("/SaveForEdit")
    @ResponseBody
    public Map<String, Object> edit(@RequestBody String phaseStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        PrjPhase phase = (PrjPhase)JsonUtils.fromJsonWithTrim(phaseStr,PrjPhase.class);
        if(phaseService.update(phase) > 0){
            map.put("IsSucess",true);
            map.put("Message","更新成功");
        }else{
            map.put("IsSucess",false);
            map.put("Message","更新失败，请再次尝试或联系管理员");
        }

        return map;
    }

    @GetMapping("/phase-detail")
    public String phaseDetail(HttpSession session,HttpServletRequest request){

        String phaseId = request.getParameter("StageProjectID");
        PrjPhase phase = phaseService.getById(phaseId);
        session.setAttribute("StageProjectJson",JsonUtils.toJson(phase));
        return "/backend/project-phase/phase-detail";
    }

    @RequestMapping("/get-all-for-list")
    @ResponseBody
    public String getAllForList(HttpServletRequest request,HttpSession session){

        ArrayList<PrjPhase> phases = phaseService.selectAllPhase();
        return JsonUtils.toJson(phases);
    }

    class Req{
        String Name;
        String bleGrid;
        Integer start;
        Integer limit;
    }
}
