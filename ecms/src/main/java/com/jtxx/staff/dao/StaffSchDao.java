package com.jtxx.staff.dao;

import com.jtxx.entity.StaffSch;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/15.
 */
@Repository
public interface StaffSchDao {

    ArrayList<StaffSch> selectAllSchByRole(@Param("roleId") String roleId , @Param("page") int page, @Param("rows") int rows,@Param("DepartName")String DepartName);

    int countAllSchByRole(@Param("roleId") String roleId, @Param("DepartName")String DepartName);

    int insert(@Param("staff")StaffSch staff);

    int deleteById(@Param("staff")StaffSch staff);

    StaffSch selectById(@Param("departId") String departId);

    int update(@Param("staff")StaffSch staff);

}
