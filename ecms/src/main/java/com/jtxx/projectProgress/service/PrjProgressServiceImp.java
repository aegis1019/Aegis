package com.jtxx.projectProgress.service;

import com.jtxx.entity.PrjProgress;
import com.jtxx.projectProgress.dao.PrjProgressDao;
import com.jtxx.util.EUDataGridResult;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.UUID;

/**
 * Created by aegis on 2017/11/22.
 */
@Service
@MapperScan("com.jtxx.projectProgress.dao")
public class PrjProgressServiceImp implements PrjProgressService {

    @Autowired
    private PrjProgressDao progressDao;

    @Override
    public EUDataGridResult getAllProgressByRole(String roleId, int page, int rows, String ProjectID, String StageProjectID) {

        EUDataGridResult eu = new EUDataGridResult();

        ArrayList<PrjProgress> progressList = progressDao.getAllProgressByRole(roleId,page,rows, ProjectID, StageProjectID);
        int count = progressDao.countAllProgressByRole(roleId,ProjectID, StageProjectID);
        eu.setTotalCount(count);
        eu.setRoot(progressList);
        return eu;
    }

    @Override
    public int insert(PrjProgress progress) {
        progress.setProjectProgressID(UUID.randomUUID().toString().replaceAll("-", ""));
        return progressDao.insert(progress);
    }

    @Override
    public int delete(PrjProgress progress) {
        return progressDao.delete(progress);
    }

    @Override
    public PrjProgress getById(String ProjectProgressID) {
        return progressDao.getById(ProjectProgressID);
    }

    @Override
    public int updateById(PrjProgress progress) {
        return progressDao.updateById(progress);
    }
}
