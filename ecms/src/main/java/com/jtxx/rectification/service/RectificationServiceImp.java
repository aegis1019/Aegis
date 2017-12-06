package com.jtxx.rectification.service;

import com.jtxx.entity.Rectification;
import com.jtxx.rectification.dao.RectificationDao;
import com.jtxx.util.EUDataGridResult;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.UUID;

/**
 * Created by aegis on 2017/12/4.
 */
@Service
@MapperScan("com.jtxx.rectification.dao")
public class RectificationServiceImp implements RectificationService {

    @Autowired
    private RectificationDao rectiDao;

    @Override
    public EUDataGridResult getRectificationPageData(String roleId, int page, int rows, String RecNo) {
        EUDataGridResult eu = new EUDataGridResult();

        ArrayList<Rectification> rectifications = rectiDao.selectByRoleId(roleId,page,rows,RecNo);
        int count = rectiDao.countByRoleId(roleId,RecNo);
        eu.setTotalCount(count);
        eu.setRoot(rectifications);
        return eu;
    }

    @Override
    public int insert(Rectification rec) {
        rec.setRectificationID(UUID.randomUUID().toString().replaceAll("-", ""));
        return rectiDao.insert(rec);
    }

    @Override
    public int deleteById(Rectification rec) {
        return rectiDao.deleteById(rec);
    }

    @Override
    public Rectification selectById(Rectification rec) {
        return rectiDao.selectById(rec);
    }

    @Override
    public int updateById(Rectification rec) {
        return rectiDao.updateById(rec);
    }

    @Override
    public int updateHandleById(Rectification rec) {
        return rectiDao.updateHandleById(rec);
    }
}
