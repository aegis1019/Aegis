package com.jtxx.projectProgress.controller;

import com.jtxx.entity.PrjProgress;
import com.jtxx.entity.SysUsr;
import com.jtxx.projectProgress.service.PrjProgressService;
import com.jtxx.util.EUDataGridResult;
import com.jtxx.util.EUReq;
import com.jtxx.util.JTXXConf;
import com.jtxx.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by aegis on 2017/11/22.
 */
@Controller
@RequestMapping("/project-progress")
public class PrjProgressController {

    @Autowired
    private PrjProgressService progressService;

    @GetMapping("/project-progress-page")
    public String projectProgress(HttpSession session){
        return "/backend/progress/progress-mgr";
    }

    @PostMapping("/SearchForPage")
    @ResponseBody
    EUDataGridResult searchForPage(HttpServletRequest request, HttpSession session){

        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        String roleId = loginUser.getRoleId();

        Enumeration enu=request.getParameterNames();
        String paraName=(String)enu.nextElement();
        Req e = (Req)JsonUtils.fromJsonWithTrim(paraName,Req.class);
        return progressService.getAllProgressByRole(roleId,e.start,e.limit,e.ProjectID,e.StageProjectID);
    }

    @GetMapping("/progress-new")
    public String progressNew(HttpSession session){
        return "/backend/progress/progress-new";
    }

    @PostMapping("/SaveForAdd")
    @ResponseBody
    public Map<String, Object> add(@RequestBody String progressStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        PrjProgress progress = (PrjProgress) JsonUtils.fromJsonWithTrim(progressStr,PrjProgress.class);

        if(progressService.insert(progress) > 0){
            map.put("IsSucess",true);
            map.put("Message","新增成功!");
        }else{
            map.put("IsSucess",false);
            map.put("Message","新增失败，请再次尝试或联系管理员");
        }
        return map;
    }

    @PostMapping("/progress-delete")
    @ResponseBody
    public Map<String, Object> delete(@RequestBody String progressStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        PrjProgress progress = (PrjProgress)JsonUtils.fromJsonWithTrim(progressStr,PrjProgress.class);

        if(progressService.delete(progress) > 0){
            map.put("IsSucess",true);
            map.put("Message","删除成功!");
        }else{
            map.put("IsSucess",false);
            map.put("Message","删除失败，请再次尝试或联系管理员");
        }
        return map;
    }

    @GetMapping("/progress-edit")
    public String progressEdit(HttpSession session,HttpServletRequest request){

        String progressId = request.getParameter("ProjectProgressID");
        PrjProgress progress = progressService.getById(progressId);
        session.setAttribute("ProjectProgressJson",JsonUtils.toJson(progress));
        return "/backend/progress/progress-edit";
    }

    @PostMapping("/SaveForEdit")
    @ResponseBody
    public Map<String, Object> saveForEdit(@RequestBody String progressStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        PrjProgress progress = (PrjProgress) JsonUtils.fromJsonWithTrim(progressStr,PrjProgress.class);
        if(progressService.updateById(progress) > 0){
            map.put("IsSucess",true);
            map.put("Message","更新成功!");
        }else{
            map.put("IsSucess",false);
            map.put("Message","更新失败，请再次尝试或联系管理员");
        }
        return map;
    }

    @GetMapping("/progress-detail")
    public String progressDetail(HttpSession session,HttpServletRequest request){

        String progressId = request.getParameter("ProjectProgressID");
        PrjProgress progress = progressService.getById(progressId);
        session.setAttribute("ProjectProgressJson",JsonUtils.toJson(progress));
        return "/backend/progress/progress-detail";
    }

    class Req{
        String ProjectID;
        String StageProjectID;
        String bleGrid;
        Integer start;
        Integer limit;
    }

}
