package com.jtxx.fund.service;

import com.jtxx.entity.BudgetMgr;
import com.jtxx.fund.dao.BudgetMgrDao;
import com.jtxx.util.EUDataGridResult;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.UUID;

/**
 * Created by aegis on 2017/11/28.
 */
@Service
@MapperScan("com.jtxx.fund.dao")
public class BudgetMgrServiceImp implements BudgetMgrService {

    @Autowired
    private BudgetMgrDao budgetMgrDao;

    @Override
    public EUDataGridResult getbudgetListPageData(int page, int rows, String projectId, String feeType, String roleId) {

        EUDataGridResult EUDGResult = new EUDataGridResult();
        ArrayList<BudgetMgr> budgetList = budgetMgrDao.selectAllBudgetByRole(page,rows,projectId,feeType,roleId);
        int count = budgetMgrDao.countAllBudgetByRole(projectId,feeType,roleId);
        EUDGResult.setTotalCount(count);
        EUDGResult.setRoot(budgetList);

        return  EUDGResult;
    }

    @Override
    public int insert(BudgetMgr budgetMgr) {
        budgetMgr.setDesignAlterationID(UUID.randomUUID().toString().replaceAll("-", ""));
        return budgetMgrDao.insert(budgetMgr);
    }

    @Override
    public BudgetMgr selectById(BudgetMgr budget) {
        return budgetMgrDao.selectById(budget);
    }

    @Override
    public int updateById(BudgetMgr budget) {
        return budgetMgrDao.updateById(budget);
    }

    @Override
    public int deleteById(BudgetMgr budget) {
        return budgetMgrDao.deleteById(budget);
    }
}
