package com.jtxx.scene.dao;

import com.jtxx.entity.Scene;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/12/6.
 */
@Repository
public interface SceneDao {

    ArrayList<Scene> selectByRole (@Param("roleId") String roleId , @Param("page") int page, @Param("rows") int rows, @Param("OwnerName")String OwnerName);

    int countByRole(@Param("roleId") String roleId ,@Param("OwnerName")String OwnerName);

    int insert(@Param("scene")Scene scene);
}
