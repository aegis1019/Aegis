package com.jtxx.projectPhase.service;

import com.jtxx.entity.PrjPhase;
import com.jtxx.projectPhase.dao.PrjPhaseDao;
import com.jtxx.util.EUDataGridResult;
import com.jtxx.util.JsonUtils;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.UUID;

/**
 * Created by aegis on 2017/11/15.
 */
@Service
@MapperScan("com.jtxx.projectPhase.dao")
public class PrjPhaseServiceImp implements PrjPhaseService {

    @Autowired
    private PrjPhaseDao phaseDao;

    @Override
    public EUDataGridResult getAllPhaseByRole(String roleId, int page, int rows, String name) {

        EUDataGridResult eu = new EUDataGridResult();

        ArrayList<PrjPhase> phaseList = phaseDao.selectAllPhaseByRole(roleId, page, rows, name);
        int count = phaseDao.countAllPhaseByRole(roleId, name);
        eu.setTotalCount(count);
        eu.setRoot(phaseList);
        return eu;
    }

    @Override
    public int insert(PrjPhase phase) {
        phase.setStageProjectID(UUID.randomUUID().toString().replaceAll("-", ""));
        return phaseDao.insert(phase);
    }

    @Override
    public int delete(PrjPhase phase) {
        return phaseDao.delete(phase);
    }

    @Override
    public int update(PrjPhase phase) {
        return phaseDao.update(phase);
    }

    @Override
    public PrjPhase getById(String phaseId) {
        return phaseDao.selectById(phaseId);
    }

    @Override
    public ArrayList<PrjPhase> selectAllPhase() {
        return phaseDao.selectAllPhase();
    }
}
