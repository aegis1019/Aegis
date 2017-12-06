package com.jtxx.fund.service;


import com.jtxx.entity.FeeType;

/**
 * Created by aegis on 2017/11/26.
 */

public interface FeeTypeService {

    String getFeeTypeTreeData(String parentId);

    int countByParID(String parentId);

    int insert(FeeType feeType);

    boolean deleteByID(FeeType feeType);

    FeeType selectByID(String FeeTypeID);

    int updateById(FeeType feeType);

    int modifyLeafStatus2(String feeTypeId);

    String getFeeTypeForTree(String ParId);
}
