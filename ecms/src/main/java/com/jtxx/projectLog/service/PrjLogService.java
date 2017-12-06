package com.jtxx.projectLog.service;

import com.jtxx.entity.PrjLog;
import com.jtxx.util.EUDataGridResult;
import com.jtxx.util.EUDataGridResult2;

/**
 * Created by aegis on 2017/11/30.
 */
public interface PrjLogService {

    EUDataGridResult2 getRecent3SupLogByRole(String roleId, String status, String strSearch);

    int insert(PrjLog prjlog);

    int deleteById(String logId);

    PrjLog selectById(String logId);
}
