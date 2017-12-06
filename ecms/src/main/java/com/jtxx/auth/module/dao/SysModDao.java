package com.jtxx.auth.module.dao;

import com.jtxx.entity.SysMod;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/7.
 */
@Repository
public interface SysModDao {

    ArrayList<SysMod> SelectShowMenuByRoleAndProject(@Param("roleId") String roleId, @Param("projectId") String projectId);
}
