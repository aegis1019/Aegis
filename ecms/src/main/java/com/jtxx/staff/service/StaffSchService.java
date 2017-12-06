package com.jtxx.staff.service;

import com.jtxx.entity.StaffSch;
import com.jtxx.util.EUDataGridResult;
import org.apache.ibatis.annotations.Param;

/**
 * Created by aegis on 2017/11/15.
 */
public interface StaffSchService {

    EUDataGridResult getStaffSchPageData(String roleId, int page, int rows, String departName);

    int insert(StaffSch staff);

    int deleteById(StaffSch staff);

    StaffSch selectById(String staffId);

    int update(StaffSch staff);
}
