package com.jtxx.auth.user.dao;

/**
 * Created by aegis on 2017/11/6.
 */

import com.jtxx.entity.SysUsr;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SysUsrDao {
    SysUsr selectByUser(@Param("user") SysUsr user);
}
