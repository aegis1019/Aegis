package com.jtxx.equipment.dao;

import com.jtxx.entity.EquipSch;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/15.
 */
@Repository
public interface EquipSchDao {

    ArrayList<EquipSch> selectAllSchByRole(@Param("roleId") String roleId,@Param("page") int page,@Param("rows") int rows, @Param("EquipmentName")String EquipmentName);

    int countAllSchByRole (@Param("roleId") String roleId, @Param("EquipmentName")String EquipmentName);

    int insert(@Param("equip") EquipSch equip);

    int deleteById(@Param("equip") EquipSch equip);

    EquipSch selectById(@Param("equipmentID") String equipmentID);

    int update(@Param("equip") EquipSch equip);
}
