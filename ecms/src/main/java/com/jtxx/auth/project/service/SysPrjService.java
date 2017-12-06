package com.jtxx.auth.project.service;

import com.jtxx.entity.SysPrj;
import com.jtxx.entity.SysUsr;
import com.jtxx.util.EUDataGridResult;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/6.
 */
public interface SysPrjService {

    String GetProjectMenuData(SysUsr user);

    EUDataGridResult getProjectListPageData(int page, int rows, String code, String projectName);

    int insertPrj(SysPrj prj);

    int deletePrj(SysPrj prj);

    int updatePrjById(SysPrj prj);

    SysPrj selectById(String projectID);

    ArrayList<SysPrj> selectByRole(SysUsr user);

    String getProjectMap(SysUsr usr);

    String getProjectMap2(SysUsr usr);
}
