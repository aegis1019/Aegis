package com.jtxx.equipment.controller;

import com.jtxx.auth.project.service.SysPrjService;
import com.jtxx.entity.EquipSch;
import com.jtxx.entity.SysUsr;
import com.jtxx.equipment.service.EquipSchService;
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
 * Created by aegis on 2017/11/15.
 */
@Controller
@RequestMapping("/equipment")
public class EquipSchController {

    @Autowired
    private EquipSchService equipSchService;

    @Autowired
    private SysPrjService prjService;

    @GetMapping("/equip-schedule-page")
    public String projectPhase(HttpSession session){
        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        session.setAttribute("ProjectMap",prjService.getProjectMap(loginUser));

        return "/backend/equip/equip-schedule";
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

        return equipSchService.getAllEquipSchByRole(roleId,e.start,e.limit,e.EquipmentName);
    }

    @GetMapping("/equip-new")
    public String equipNew(HttpSession session){
        return "/backend/equip/equip-new";
    }

    @PostMapping("/SaveForAdd")
    @ResponseBody
    public Map<String, Object> add(@RequestBody String equipStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        EquipSch equip = (EquipSch) JsonUtils.fromJsonWithTrim(equipStr,EquipSch.class);

        if(equipSchService.insert(equip) > 0){
            map.put("IsSucess",true);
            map.put("Message","新增成功 ");
        }else{
            map.put("IsSucess",false);
            map.put("Message","新增失败，请再次尝试或联系管理员");
        }
        return map;
    }

    @PostMapping("/equip-del")
    @ResponseBody
    public Map<String, Object> delete(@RequestBody String equipStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        EquipSch equip = (EquipSch)JsonUtils.fromJsonWithTrim(equipStr,EquipSch.class);

        if(equipSchService.deleteById(equip) > 0){
            map.put("IsSucess",true);
            map.put("Message","删除成功 !");
        }else{
            map.put("IsSucess",false);
            map.put("Message","删除失败，请再次尝试或联系管理员");
        }
        return map;
    }

    @GetMapping("/equip-edit")
    public String equipEdit(HttpSession session,HttpServletRequest request){

        String equipId = request.getParameter("EquipmentID");
        EquipSch equipSch = equipSchService.selectById(equipId);
        session.setAttribute("EquipmentJson",JsonUtils.toJson(equipSch));
        return "/backend/equip/equip-edit";
    }

    @PostMapping("/SaveForEdit")
    @ResponseBody
    public Map<String, Object> saveForEdit(@RequestBody String staffStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        EquipSch equip = (EquipSch) JsonUtils.fromJsonWithTrim(staffStr,EquipSch.class);
        if(equipSchService.update(equip) > 0){
            map.put("IsSucess",true);
            map.put("Message","更新成功!");
        }else{
            map.put("IsSucess",false);
            map.put("Message","更新失败，请再次尝试或联系管理员 !");
        }
        return map;
    }

    @GetMapping("/equip-detail")
    public String progressDetail(HttpSession session,HttpServletRequest request){

        String equipmentID = request.getParameter("EquipmentID");
        EquipSch equipSch = equipSchService.selectById(equipmentID);
        session.setAttribute("EquipmentJson",JsonUtils.toJson(equipSch));
        return "/backend/equip/equip-detail";
    }

    class Req{
        private String EquipmentName;
        private String bleGrid;
        private Integer start;
        private Integer limit;
    }
}
