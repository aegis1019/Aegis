package com.jtxx.auth.user.service;

import com.jtxx.entity.SysUsr;

/**
 * Created by aegis on 2017/11/6.
 */
public interface SysUsrService {

    SysUsr checkUserLogin(SysUsr user);
}
