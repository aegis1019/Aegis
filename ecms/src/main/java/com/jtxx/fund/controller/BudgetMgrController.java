package com.jtxx.fund.controller;

import com.jtxx.auth.project.service.SysPrjService;
import com.jtxx.entity.BudgetMgr;
import com.jtxx.entity.SysUsr;
import com.jtxx.fund.service.BudgetMgrService;
import com.jtxx.util.EUDataGridResult;
import com.jtxx.util.JTXXConf;
import com.jtxx.util.JsonUtils;
import com.jtxx.util.UtilMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Map;

/**
 * Created by aegis on 2017/11/28.
 */
@Controller
@RequestMapping("/budget-mgr")
public class BudgetMgrController {

    @Autowired
    private SysPrjService prjService;

    @Autowired
    private BudgetMgrService budgetMgrService;

    @GetMapping("/budget-list")
    public String budgetMgr(HttpSession session){

        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        String prjMap = prjService.getProjectMap2(loginUser);
        session.setAttribute("prjMap",prjMap);
        return "/backend/budget/budget-list";
    }

    @RequestMapping("/get-all")
    @ResponseBody
    public EUDataGridResult getAll(HttpServletRequest request,HttpSession session){

        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr)JsonUtils.fromJson(userStr,SysUsr.class);

        Enumeration enu=request.getParameterNames();
        String paraName=(String)enu.nextElement();

        Req e = (Req)JsonUtils.fromJsonWithTrim(paraName,Req.class);
        EUDataGridResult eu = budgetMgrService.getbudgetListPageData(e.start,e.limit,e.ProjectID,e.FeeType,loginUser.getRoleId());
        return eu;
    }

    @GetMapping("/budget-new")
    public String budgetNew(){

        return "/backend/budget/budget-new";
    }

    @PostMapping("/SaveForAdd")
    @ResponseBody
    public Map<String, Object> add(@RequestBody String budgetStr, HttpSession session) {

        BudgetMgr budget = (BudgetMgr) JsonUtils.fromJsonWithTrim(budgetStr,BudgetMgr.class);
        Map<String, Object> map = UtilMsg.makeResultMsg(budgetMgrService.insert(budget) > 0);
        return map;
    }

    @GetMapping("/budget-edit")
    public String budgetEdit(HttpSession session, HttpServletRequest request){
        String designAlterationID = request.getParameter("DesignAlterationID");
        BudgetMgr budget = new BudgetMgr();
        budget.setDesignAlterationID(designAlterationID);
        budget = budgetMgrService.selectById(budget);
        session.setAttribute("BudgetJson",JsonUtils.toJson(budget));
        return "/backend/budget/budget-edit";
    }

    @PostMapping("/SaveForEdit")
    @ResponseBody
    public Map<String, Object> update(@RequestBody String budgetStr, HttpSession session) {
        BudgetMgr budget = (BudgetMgr) JsonUtils.fromJsonWithTrim(budgetStr,BudgetMgr.class);
        Map<String, Object> map = UtilMsg.makeResultMsg(budgetMgrService.updateById(budget) > 0);
        return map;
    }

    @PostMapping("/budget-delete")
    @ResponseBody
    public Map<String, Object>delete(@RequestBody String budgetStr, HttpSession session){
        BudgetMgr budget = (BudgetMgr) JsonUtils.fromJsonWithTrim(budgetStr,BudgetMgr.class);
        Map<String, Object> map = UtilMsg.makeResultMsg(budgetMgrService.deleteById(budget) > 0);
        return map;
    }

    @GetMapping("/budget-detail")
    public String feeTypeDetail(HttpSession session, HttpServletRequest request){
        String budgetId = (String)request.getParameter("DesignAlterationID");
        BudgetMgr budget = new BudgetMgr();
        budget.setDesignAlterationID(budgetId);
        budget = budgetMgrService.selectById(budget);
        session.setAttribute("BudgetJson",JsonUtils.toJson(budget));
        return "/backend/budget/budget-detail";
    }

    class Req{
        String ProjectID;
        String FeeType;
        String bleGrid;
        Integer start;
        Integer limit;
    }

}
