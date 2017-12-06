package com.jtxx.equipment.service;

import com.jtxx.entity.EquipSch;
import com.jtxx.util.EUDataGridResult;

/**
 * Created by aegis on 2017/11/15.
 */
public interface EquipSchService {

    EUDataGridResult getAllEquipSchByRole(String roleId, int page, int rows,String EquipmentName);

    int insert(EquipSch equip);

    int deleteById(EquipSch equip);

    EquipSch selectById(String equipmentID);

    int update(EquipSch equip);
}
