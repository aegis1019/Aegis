package com.jtxx.staff.service;

import com.jtxx.entity.StaffSch;
import com.jtxx.staff.dao.StaffSchDao;
import com.jtxx.util.EUDataGridResult;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.UUID;

/**
 * Created by aegis on 2017/11/15.
 */
@Service
@MapperScan("com.jtxx.staff.dao")
public class StaffSchServiceImp implements StaffSchService {

    @Autowired
    private StaffSchDao staffSchDao;

    @Override
    public EUDataGridResult getStaffSchPageData(String roleId, int page, int rows, String departName) {

        EUDataGridResult eu = new EUDataGridResult();

        ArrayList<StaffSch> staffSches = staffSchDao.selectAllSchByRole(roleId,page,rows,departName);
        int count = staffSchDao.countAllSchByRole(roleId,departName);
        eu.setTotalCount(count);
        eu.setRoot(staffSches);
        return eu;
    }

    @Override
    public int insert(StaffSch staff) {
        staff.setDepartID(UUID.randomUUID().toString().replaceAll("-", ""));
        return staffSchDao.insert(staff);
    }

    @Override
    public int deleteById(StaffSch staff) {
        return staffSchDao.deleteById(staff);
    }

    @Override
    public StaffSch selectById(String staffId) {
        return staffSchDao.selectById(staffId);
    }

    @Override
    public int update(StaffSch staff) {
        return staffSchDao.update(staff);
    }
}
