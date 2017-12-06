package com.jtxx.projectProgress.service;

import com.jtxx.entity.PrjProgress;
import com.jtxx.util.EUDataGridResult;

/**
 * Created by aegis on 2017/11/22.
 */
public interface PrjProgressService {

    EUDataGridResult getAllProgressByRole(String roleId, int page, int rows, String ProjectID, String StageProjectID);

    int insert(PrjProgress progress);

    int delete(PrjProgress progress);

    PrjProgress getById(String ProjectProgressID);

    int updateById(PrjProgress progress);
}
