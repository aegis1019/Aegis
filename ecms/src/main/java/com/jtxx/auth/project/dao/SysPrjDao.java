package com.jtxx.auth.project.dao;

import com.jtxx.entity.SysPrj;
import com.jtxx.entity.SysUsr;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/6.
 */
@Repository
public interface SysPrjDao {
    ArrayList<SysPrj> selectByRole(@Param("user") SysUsr user);

    SysPrj selectById(@Param("projectId") String projectId);

    ArrayList<SysPrj> selectAllProject(@Param("page") int page, @Param("rows") int rows, @Param("code") String code, @Param("projectName") String projectName);

    int countAllProject(@Param("code") String code, @Param("projectName") String projectName);

    int insertPrj(@Param("prj") SysPrj prj);

    int deletePrjById(@Param("prj") SysPrj prj);

    int updatePrjById(@Param("prj") SysPrj prj);

}
