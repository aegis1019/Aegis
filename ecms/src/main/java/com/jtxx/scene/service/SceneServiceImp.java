package com.jtxx.scene.service;

import com.jtxx.entity.Inspection;
import com.jtxx.entity.Scene;
import com.jtxx.scene.dao.InspectionDao;
import com.jtxx.scene.dao.SceneDao;
import com.jtxx.util.EUDataGridResult;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.UUID;

/**
 * Created by aegis on 2017/12/6.
 */
@Service
@MapperScan("com.jtxx.scene.dao")
public class SceneServiceImp implements SceneService {

    @Autowired
    private SceneDao sceneDao;

    @Autowired
    private InspectionDao inspecDao;

    @Override
    public EUDataGridResult getScenePageData(String roleId, int page, int rows, String OwnerName) {
        EUDataGridResult eu = new EUDataGridResult();
        eu.setRoot(sceneDao.selectByRole(roleId,page,rows,OwnerName));
        eu.setTotalCount(sceneDao.countByRole(roleId,OwnerName));
        return eu;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT,timeout=36000,rollbackFor=Exception.class)
    public int saveScene(Scene scene) {
        String siteId = UUID.randomUUID().toString().replaceAll("-", "");
        scene.setSiteID(siteId);
        //写入巡检表
        ArrayList<Inspection> sup = scene.getSup();
        ArrayList<Inspection> owner = scene.getOwner();
        if (sup != null){
            for (Inspection supi:sup) {
                supi.setSiteID(siteId);
                inspecDao.insert(supi);
            }
        }
        if(owner!=null){
            for (Inspection owneri:owner) {
                owneri.setSiteID(siteId);
                inspecDao.insert(owneri);
            }
        }
        sceneDao.insert(scene);

        return 0;
    }
}
