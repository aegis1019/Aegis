package com.jtxx.projectLog.service;

import com.jtxx.entity.PrjLog;
import com.jtxx.projectLog.dao.PrjLogDao;
import com.jtxx.util.EUDataGridResult2;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.UUID;

/**
 * Created by aegis on 2017/12/1.
 */
@Service
@MapperScan("com.jtxx.projectLog.dao")
public class PrjLogServiceImp implements PrjLogService {

    @Autowired
    private PrjLogDao logDao;

    @Override
    public EUDataGridResult2 getRecent3SupLogByRole(String roleId, String status, String strSearch) {

        ArrayList<PrjLog>  SupLogs = logDao.selectRecent3LogByRole(roleId,status, strSearch);
        int count = logDao.countRecent3LogByRole(roleId,status, strSearch);
        EUDataGridResult2 dgResult = new EUDataGridResult2();
        dgResult.setROWS(SupLogs);
        dgResult.setTOTAL(count);
        return dgResult;
    }

    @Override
    public int insert(PrjLog prjlog) {
        prjlog.setATTACHMENTID(UUID.randomUUID().toString().replaceAll("-", ""));
        return logDao.insert(prjlog);
    }

    @Override
    public int deleteById(String logId) {
        return logDao.deleteById(logId);
    }

    @Override
    public PrjLog selectById(String logId) {
        return logDao.selectById(logId);
    }
}
