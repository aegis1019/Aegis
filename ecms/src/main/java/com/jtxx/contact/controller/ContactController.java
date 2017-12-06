package com.jtxx.contact.controller;

import com.jtxx.auth.project.service.SysPrjService;
import com.jtxx.contact.service.ContactService;
import com.jtxx.entity.Contact;
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
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by aegis on 2017/11/14.
 */
@Controller
@RequestMapping("/contact")
public class ContactController {

    @Autowired
    private ContactService contactService;

    @Autowired
    private SysPrjService prjService;

    @GetMapping("/contact-list")
    public String projectBasic(HttpSession session){
        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        session.setAttribute("ProjectMap",prjService.getProjectMap(loginUser));

        return "/backend/contact/contact-list";
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
        return contactService.getContactListPageData(roleId,e.start,e.limit,e.Name);
    }

    @GetMapping("/contact-new")
    public String contactNew(){
        return "/backend/contact/contact-new";
    }

    @RequestMapping("/SaveForAdd")
    @ResponseBody
    public Map<String, Object>add(@RequestBody String contactStr, HttpSession session) {

        Map<String, Object> map = new HashMap<>();
        Contact contact = (Contact)JsonUtils.fromJsonWithTrim(contactStr,Contact.class);
        if(contactService.insert(contact) > 0){
            map.put("IsSucess",true);
            map.put("Message","新增成功");
        }else{
            map.put("IsSucess",false);
            map.put("Message","新增失败，请再次尝试或联系管理员!");
        }
        return map;
    }

    @GetMapping("/contact-edit")
    public String contactEdit(HttpSession session,HttpServletRequest request){
        String contactId = request.getParameter("LinkManID");
        Contact contact = contactService.selectById(contactId);
        session.setAttribute("LinkManJson",JsonUtils.toJson(contact));
        return "/backend/contact/contact-edit";
    }

    @PostMapping("/SaveForEdit")
    @ResponseBody
    public Map<String, Object> saveForEdit(@RequestBody String contactStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        Contact contact = (Contact) JsonUtils.fromJsonWithTrim(contactStr,Contact.class);
        if(contactService.update(contact) > 0){
            map.put("IsSucess",true);
            map.put("Message","更新成功!");
        }else{
            map.put("IsSucess",false);
            map.put("Message","更新失败，请再次尝试或联系管理员");
        }
        return  map;
    }

    @PostMapping("/contact-del")
    @ResponseBody
    public Map<String, Object> contactDel(@RequestBody String contactStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();
        Contact contact = (Contact)JsonUtils.fromJsonWithTrim(contactStr,Contact.class);
        if(contactService.delete(contact) > 0){
            map.put("IsSucess",true);
            map.put("Message","删除成功");
        }else{
            map.put("IsSucess",false);
            map.put("Message","删除失败，请再次尝试或联系管理员!");
        }
        return  map;
    }

    @GetMapping("/contact-detail")
    public String contactDetail(HttpSession session,HttpServletRequest request){
        String contactId = request.getParameter("LinkManID");
        Contact contact = contactService.selectById(contactId);
        session.setAttribute("LinkManJson",JsonUtils.toJson(contact));
        return "/backend/contact/contact-detail";
    }



    class Req{
        String Name;
        String bleGrid;
        Integer start;
        Integer limit;
    }
}
