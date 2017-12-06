package com.jtxx.fund.dao;

import com.jtxx.entity.FeeType;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/26.
 */
@Repository
public interface FeeTypeDao {

    ArrayList<FeeType> selectByParID(@Param("ParId") String parentId);

    int countByParID(@Param("ParId") String parentId);

    int insert(@Param("feetype") FeeType feeType);

    int isChild(@Param("feeTypeId")String feeTypeId);

    int modifyLeafStatus(@Param("feeTypeId")String feeTypeId);

    int modifyLeafStatus2(@Param("feeTypeId")String feeTypeId);

    int deleteByID(@Param("feetype") FeeType feeType);

    FeeType selectByID(@Param("FeeTypeID") String FeeTypeID);

    int updateById(@Param("feetype") FeeType feeType);

    ArrayList<FeeType> getFeeTypeForTree(@Param("ParId")String ParId);
}
