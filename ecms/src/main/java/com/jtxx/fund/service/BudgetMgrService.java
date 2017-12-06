package com.jtxx.fund.service;

import com.jtxx.entity.BudgetMgr;
import com.jtxx.util.EUDataGridResult;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/28.
 */
public interface BudgetMgrService {

    EUDataGridResult getbudgetListPageData(int page, int rows, String projectId, String feeType, String roleId);

    int insert(BudgetMgr budgetMgr);

    BudgetMgr selectById(BudgetMgr budget);

    int updateById(BudgetMgr budget);

    int deleteById(BudgetMgr budget);

}
