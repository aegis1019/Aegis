package com.jtxx.auth.user.service;

import com.jtxx.entity.SysUsr;
import com.jtxx.auth.user.dao.SysUsrDao;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by aegis on 2017/11/6.
 */
@Service
@MapperScan("com.jtxx.auth.user.dao")
public class SysUsrServiceImp implements SysUsrService {

    @Autowired
    private SysUsrDao userDao;

    @Override
    public SysUsr checkUserLogin(SysUsr user) {
        return userDao.selectByUser(user);
    }
}
