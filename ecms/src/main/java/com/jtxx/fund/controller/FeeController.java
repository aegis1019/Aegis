package com.jtxx.fund.controller;

import com.jtxx.entity.FeeType;
import com.jtxx.fund.dao.FeeTypeDao;
import com.jtxx.fund.service.FeeTypeService;
import com.jtxx.util.JsonUtils;
import com.jtxx.util.UtilMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by aegis on 2017/11/26.
 */
@Controller
@RequestMapping("/fee")
public class FeeController {

    @Autowired
    private FeeTypeService feeTypeService;

    @GetMapping("/fee-type")
    public String fundType(HttpSession session, HttpServletRequest request){

        return "/backend/fee-type/fee-type-list";
    }

    @PostMapping("/GetAllTreeData")
    @ResponseBody
    public String getAllTreeData(HttpServletRequest request, HttpSession session){

        String parentId = request.getParameter("id");
        if (parentId == null){
            parentId = request.getParameter("ParID");
        }
        return feeTypeService.getFeeTypeTreeData(parentId);
    }

    @GetMapping("/fee-type-new")
    public String feeTypeNew(HttpSession session, HttpServletRequest request){
        String ParentID = (String)request.getParameter("ParentID");
        session.setAttribute("ParentID",ParentID);
        return "/backend/fee-type/fee-type-new";
    }

    @PostMapping("/SaveForAdd")
    @ResponseBody
    public Map<String, Object> add(@RequestBody String feeTypeStr, HttpSession session) {

        FeeType feeType = (FeeType) JsonUtils.fromJsonWithTrim(feeTypeStr,FeeType.class);
        Map<String, Object> map = UtilMsg.makeResultMsg(feeTypeService.insert(feeType) > 0);
        return map;
    }

    @PostMapping("/delete")
    @ResponseBody
    public Map<String, Object> delete(@RequestBody String feeTypeStr, HttpSession session) {
        Map<String, Object> map = new HashMap<>();

        FeeType feeType = (FeeType) JsonUtils.fromJsonWithTrim(feeTypeStr,FeeType.class);

        if(feeType.getFeeTypeID().equals("1") || feeType.getFeeTypeID().equals("0")){
            map.put("IsSucess", false);
            map.put("Message", "该节点不能删除");
            return map;
        }

        feeType = feeTypeService.selectByID(feeType.getFeeTypeID());
        //删除前检查是否有子节点
        if (feeTypeService.countByParID(feeType.getFeeTypeID()) > 0){
            map.put("IsSucess", false);
            map.put("Message", "请删除所有子节点后再尝试删除该节点");
        }else {
            map = UtilMsg.makeResultMsg(feeTypeService.deleteByID(feeType));
        }
        return map;
    }

    @GetMapping("/fee-type-detail")
    public String feeTypeDetail(HttpSession session, HttpServletRequest request){
        String feeTypeID = (String)request.getParameter("FeeTypeID");
        FeeType feeType = feeTypeService.selectByID(feeTypeID);
        session.setAttribute("FeeTypeJson",JsonUtils.toJson(feeType));
        return "/backend/fee-type/fee-type-detail";
    }

    @GetMapping("/fee-type-edit")
    public String feeTypeEdit(HttpSession session, HttpServletRequest request){
        String feeTypeID = (String)request.getParameter("FeeTypeID");
        String ParentID = (String)request.getParameter("ParentID");

        session.setAttribute("FeeTypeID",feeTypeID);
        session.setAttribute("ParentID",ParentID);
        FeeType feeType = feeTypeService.selectByID(feeTypeID);
        session.setAttribute("FeeTypeJson",JsonUtils.toJson(feeType));
        return "/backend/fee-type/fee-type-edit";
    }

    @PostMapping("/SaveForEdit")
    @ResponseBody
    public Map<String, Object> update(@RequestBody String feeTypeStr, HttpSession session) {
        FeeType feeType = (FeeType) JsonUtils.fromJsonWithTrim(feeTypeStr,FeeType.class);
        Map<String, Object> map = UtilMsg.makeResultMsg(feeTypeService.updateById(feeType) > 0);
        return map;
    }

    @RequestMapping("/get-all-for-list")
    @ResponseBody
    public String getAllForList(HttpServletRequest request,HttpSession session){
        return feeTypeService.getFeeTypeForTree("0");
    }
}
