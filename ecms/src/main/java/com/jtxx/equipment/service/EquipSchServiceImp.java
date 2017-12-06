package com.jtxx.equipment.service;

import com.jtxx.entity.EquipSch;
import com.jtxx.equipment.dao.EquipSchDao;
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
@MapperScan("com.jtxx.equipment.dao")
public class EquipSchServiceImp implements EquipSchService {

    @Autowired
    private EquipSchDao equipSchDao;

    @Override
    public EUDataGridResult getAllEquipSchByRole(String roleId, int page, int rows,String EquipmentName) {

        EUDataGridResult eu = new EUDataGridResult();

        ArrayList<EquipSch> equipSches = equipSchDao.selectAllSchByRole(roleId, page, rows, EquipmentName);
        int count = equipSchDao.countAllSchByRole(roleId, EquipmentName);
        eu.setTotalCount(count);
        eu.setRoot(equipSches);

        return eu;
    }

    @Override
    public int insert(EquipSch equip) {
        equip.setEquipmentID(UUID.randomUUID().toString().replaceAll("-", ""));
        return equipSchDao.insert(equip);
    }

    @Override
    public int deleteById(EquipSch equip) {
        return equipSchDao.deleteById(equip);
    }

    @Override
    public EquipSch selectById(String equipmentID) {
        return equipSchDao.selectById(equipmentID);
    }

    @Override
    public int update(EquipSch equip) {
        return equipSchDao.update(equip);
    }
}
