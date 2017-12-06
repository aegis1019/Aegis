package com.jtxx.projectLog.dao;

import com.jtxx.entity.PrjLog;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/30.
 */
@Repository
public interface PrjLogDao {

    ArrayList<PrjLog> selectRecent3LogByRole (@Param("roleId")String roleId,@Param("status")String status,@Param("strSearch") String strSearch);

    int insert(@Param("prjlog") PrjLog prjlog);

    int countRecent3LogByRole(@Param("roleId")String roleId,@Param("status")String status,@Param("strSearch") String strSearch);

    int deleteById(@Param("logId") String logId);

    PrjLog selectById(@Param("logId") String logId);
}
