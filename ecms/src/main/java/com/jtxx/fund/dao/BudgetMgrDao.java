package com.jtxx.fund.dao;

import com.jtxx.entity.BudgetMgr;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/28.
 */
@Repository
public interface BudgetMgrDao {

    ArrayList<BudgetMgr> selectAllBudgetByRole(@Param("page") int page, @Param("rows") int rows,
                                               @Param("projectId") String projectId, @Param("feeType") String feeType,
                                               @Param("roleId") String roleId);

    int countAllBudgetByRole(@Param("projectId") String projectId, @Param("feeType") String feeType,
                             @Param("roleId") String roleId);

    int insert(@Param("budget")BudgetMgr budget);

    BudgetMgr selectById(@Param("budget")BudgetMgr budget);

    int updateById(@Param("budget")BudgetMgr budget);

    int deleteById(@Param("budget")BudgetMgr budget);
}
