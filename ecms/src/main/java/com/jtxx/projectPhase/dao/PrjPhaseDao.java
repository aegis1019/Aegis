package com.jtxx.projectPhase.dao;

import com.jtxx.entity.PrjPhase;
import com.jtxx.entity.PrjProgress;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/15.
 */
@Repository
public interface PrjPhaseDao {

    ArrayList<PrjPhase> selectAllPhaseByRole(@Param("roleId") String roleId,@Param("page") int page,@Param("rows") int rows, @Param("name") String name);

    int countAllPhaseByRole(@Param("roleId") String roleId,@Param("name") String name);

    int insert(@Param("phase")PrjPhase phase);

    int delete(@Param("phase") PrjPhase phase);

    int update(@Param("phase") PrjPhase phase);

    PrjPhase selectById(@Param("phaseId")String phaseId);

    ArrayList<PrjPhase> selectAllPhase();
}
