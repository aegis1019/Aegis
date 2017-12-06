package com.jtxx.rectification.dao;

import com.jtxx.entity.Rectification;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/12/4.
 */
@Repository
public interface RectificationDao {

    ArrayList<Rectification> selectByRoleId(@Param("roleId") String roleId , @Param("page") int page, @Param("rows") int rows, @Param("RectificationNo")String RectificationNo);

    int countByRoleId(@Param("roleId") String roleId, @Param("RectificationNo")String RectificationNo);

    int insert(@Param("rec") Rectification rec);

    int deleteById(@Param("rec") Rectification rec);

    Rectification selectById(@Param("rec") Rectification rec);

    int updateById(@Param("rec") Rectification rec);

    int updateHandleById(@Param("rec") Rectification rec);
}
