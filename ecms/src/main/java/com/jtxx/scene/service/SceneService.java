package com.jtxx.scene.service;

import com.jtxx.entity.Scene;
import com.jtxx.util.EUDataGridResult;
import org.apache.ibatis.annotations.Param;

/**
 * Created by aegis on 2017/12/6.
 */
public interface SceneService {

    EUDataGridResult getScenePageData(String roleId , int page, int rows, String OwnerName);

    int saveScene(Scene scene);
}
