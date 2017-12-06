package com.jtxx.rectification.service;

import com.jtxx.entity.Rectification;
import com.jtxx.util.EUDataGridResult;

/**
 * Created by aegis on 2017/12/4.
 */
public interface RectificationService {

    EUDataGridResult getRectificationPageData(String roleId, int page, int rows, String RecNo);

    int insert(Rectification rec);

    int deleteById(Rectification rec);

    Rectification selectById(Rectification rec);

    int updateById(Rectification rec);

    int updateHandleById(Rectification rec);
}
