package com.jtxx.scene.dao;

import com.jtxx.entity.Inspection;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by aegis on 2017/12/6.
 */
@Repository
public interface InspectionDao {

    int insert(@Param("inspection")Inspection inspection);
}
