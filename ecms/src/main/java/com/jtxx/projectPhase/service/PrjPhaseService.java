package com.jtxx.projectPhase.service;

import com.jtxx.entity.PrjPhase;
import com.jtxx.util.EUDataGridResult;

import java.util.ArrayList;


/**
 * Created by aegis on 2017/11/15.
 */
public interface PrjPhaseService {

    EUDataGridResult getAllPhaseByRole(String roleId, int page, int rows, String name);

    int insert(PrjPhase phase);

    int delete(PrjPhase phase);

    int update(PrjPhase phase);

    PrjPhase getById(String phaseId);

    ArrayList<PrjPhase> selectAllPhase();
}
