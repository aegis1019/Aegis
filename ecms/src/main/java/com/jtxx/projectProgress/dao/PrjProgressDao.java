package com.jtxx.projectProgress.dao;

import com.jtxx.entity.PrjProgress;
import com.jtxx.entity.SysUsr;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/22.
 */
@Repository
public interface PrjProgressDao {

    ArrayList<PrjProgress> getAllProgressByRole(@Param("roleId")String roleId, @Param("page")int page, @Param("rows")int rows, @Param("ProjectID") String ProjectID, @Param("StageProjectID") String StageProjectID);

    int countAllProgressByRole(@Param("roleId")String roleId, @Param("ProjectID") String ProjectID, @Param("StageProjectID") String StageProjectID);

    int insert(@Param("progress") PrjProgress progress);

    int delete(@Param("progress") PrjProgress progress);

    PrjProgress getById(@Param("ProjectProgressID")String ProjectProgressID);

    int updateById(@Param("progress") PrjProgress progress);
}
