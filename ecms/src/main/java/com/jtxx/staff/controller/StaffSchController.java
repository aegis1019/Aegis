package com.jtxx.staff.controller;

import com.jtxx.auth.project.service.SysPrjService;
import com.jtxx.entity.Contact;
import com.jtxx.entity.StaffSch;
import com.jtxx.entity.SysUsr;
import com.jtxx.staff.service.StaffSchService;
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
@RequestMapping("/staff")
public class StaffSchController {

    @Autowired
    private StaffSchService staffSchService;

    @Autowired
    private SysPrjService prjService;

    @GetMapping("/staff-schedule-page")
    public String staffSchPage(HttpSession session){
        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        session.setAttribute("ProjectMap",prjService.getProjectMap(loginUser));

        return "/backend/staff/staff-schedule";
    }

    @RequestMapping("/get-all-by-role")
    @ResponseBody
    public EUDataGridResult getAllContactByRole(HttpServletRequest request, HttpSession session){

        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        String roleId = loginUser.getRoleId();

        Enumeration enu=request.getParameterNames();
        String paraName=(String)enu.nextElement();
        Req e = (Req)JsonUtils.fromJsonWithTrim(paraName,Req.class);

        return  staffSchService.getStaffSchPageData(roleId,e.start,e.limit,e.DepartName);
    }

    @GetMapping("/staff-new")
    public String staffNew(HttpSession session){
        return "/backend/staff/staff-new";
    }

    @PostMapping("/SaveForAdd")
    @ResponseBody
    public Map<String, Object> add(@RequestBody String staffStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        StaffSch staff = (StaffSch) JsonUtils.fromJsonWithTrim(staffStr,StaffSch.class);

        if(staffSchService.insert(staff) > 0){
            map.put("IsSucess",true);
            map.put("Message","新增成功!");
        }else{
            map.put("IsSucess",false);
            map.put("Message","新增失败，请再次尝试或联系管理员!");
        }
        return map;
    }

    @PostMapping("/staff-del")
    @ResponseBody
    public Map<String, Object> delete(@RequestBody String staffStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        StaffSch staff = (StaffSch)JsonUtils.fromJsonWithTrim(staffStr,StaffSch.class);

        if(staffSchService.deleteById(staff) > 0){
            map.put("IsSucess",true);
            map.put("Message","删除成功!");
        }else{
            map.put("IsSucess",false);
            map.put("Message","删除失败，请再次尝试或联系管理员");
        }
        return map;
    }

    @GetMapping("/staff-edit")
    public String staffEdit(HttpSession session,HttpServletRequest request){

        String staffId = request.getParameter("DepartID");
        StaffSch staff = staffSchService.selectById(staffId);
        session.setAttribute("DepartJson",JsonUtils.toJson(staff));
        return "/backend/staff/staff-edit";
    }

    @PostMapping("/SaveForEdit")
    @ResponseBody
    public Map<String, Object> saveForEdit(@RequestBody String staffStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        StaffSch staff = (StaffSch) JsonUtils.fromJsonWithTrim(staffStr,StaffSch.class);
        if(staffSchService.update(staff) > 0){
            map.put("IsSucess",true);
            map.put("Message","更新成功!");
        }else{
            map.put("IsSucess",false);
            map.put("Message","更新失败，请再次尝试或联系管理员!");
        }
        return map;
    }


    @GetMapping("/staff-detail")
    public String progressDetail(HttpSession session,HttpServletRequest request){

        String departId = request.getParameter("DepartID");
        StaffSch staff = staffSchService.selectById(departId);
        session.setAttribute("DepartJson",JsonUtils.toJson(staff));
        return "/backend/staff/staff-detail";
    }

    class Req{

        private String DepartName;
        private String bleGrid;
        private Integer start;
        private Integer limit;
    }
}
