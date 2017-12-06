package com.jtxx.auth.module.dao;

import com.jtxx.entity.SysModBak;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/13.
 */
@Repository
public interface SysModBakDao {

    ArrayList<SysModBak> SelectModBakByRole (@Param("roleId") String roleId);
}
