package com.jtxx.fund.service;

import com.jtxx.entity.FeeType;
import com.jtxx.fund.dao.FeeTypeDao;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.UUID;

/**
 * Created by aegis on 2017/11/26.
 */
@Service
@MapperScan("com.jtxx.fund.dao")
public class FeeTypeServiceImp implements FeeTypeService {

    @Autowired
    private FeeTypeDao feeTypeDao;

    @Override
    public String getFeeTypeTreeData(String parentId) {

        ArrayList<FeeType> feeTypes = feeTypeDao.selectByParID(parentId);
        StringBuilder sb = new StringBuilder("[");
        if(parentId.equals("0")) {
            sb.append("{\"id\":\"0\",\"Name\":\"资金费用类别\",\"FeeTypeID\":\"0\",\"Sort\":\"\",\"Remark\":\"\",\"state\":\"open\",\"children\":[");
        }
        for(int i=0; i<feeTypes.size(); i++){
            sb.append("{\"id\":\"" + feeTypes.get(i).getID() + "\",");
            sb.append("\"FeeTypeID\":\"" + feeTypes.get(i).getID() + "\",");
            sb.append("\"Name\":\"" + feeTypes.get(i).getName() + "\",");
            sb.append("\"Sort\":\"" + feeTypes.get(i).getSort() + "\",");
            if(feeTypes.get(i).getRemark() == null){
                sb.append("\"Remark\":\"\",");
            }else{
                sb.append("\"Remark\":\"" + feeTypes.get(i).getRemark() + "\",");
            }
            sb.append("\"parentId\":\"" + feeTypes.get(i).getParentID() + "\",");
            if(feeTypes.get(i).getIsLeaf().equals("Y")){
                sb.append("\"state\":\"open\"}");
            }else{
                sb.append("\"state\":\"closed\"}");
            }
            if(i != feeTypes.size() -1 ){
                sb.append(",");
            }
        }
        if(parentId.equals("0")) {
            sb.append("]}");
        }
        sb.append("]");
        return sb.toString();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT,timeout=36000,rollbackFor=Exception.class)
    public int insert(FeeType feeType) {

        feeType.setFeeTypeID(UUID.randomUUID().toString().replaceAll("-", ""));
        feeType.setID(feeType.getFeeTypeID());
        feeType.setIsLeaf("Y");
        int isChlid = feeTypeDao.isChild(feeType.getParentID());
        //1. 父节点本身就是分支节点, 直接插入
        if(isChlid == 0 ){
            return feeTypeDao.insert(feeType);
        }else{
        //2. 父节点原来是叶子节点, 需要修改父节点为分支节点
            if(feeTypeDao.modifyLeafStatus(feeType.getParentID())>0){
                return feeTypeDao.insert(feeType);
            }
        }
        return 0;
    }

    @Override
    public int countByParID(String parentId) {
        return feeTypeDao.countByParID(parentId);
    }

    @Override
    public boolean deleteByID(FeeType feeType) {

        //删除节点
        if(feeTypeDao.deleteByID(feeType) > 0){
        //删除后再检查父节点是否有子节点，无子节点则把该节点设置为叶子节点
            if(feeTypeDao.countByParID(feeType.getParentID()) == 0){
                feeTypeDao.modifyLeafStatus2(feeType.getParentID());
            }
            return true;
        }
        return false;
    }

    @Override
    public FeeType selectByID(String feeTypeId) {
        return feeTypeDao.selectByID(feeTypeId);
    }

    @Override
    public int updateById(FeeType feeType) {
        return feeTypeDao.updateById(feeType);
    }

    @Override
    public int modifyLeafStatus2(String feeTypeId) {
        return feeTypeDao.modifyLeafStatus2(feeTypeId);
    }

    @Override
    public String getFeeTypeForTree(String ParId) {

        ArrayList<FeeType> feeTypes = feeTypeDao.getFeeTypeForTree(ParId);

        StringBuilder sb = new StringBuilder("[{\"text\":\"\",\"id\":\"\",\"children\":[");
        for(FeeType feeItem : feeTypes){
            if(feeItem.getParentID().equals("0")){
                sb.append(getFeeStr(feeItem,feeTypes).toString());
            }
        }
        sb.append("]}]");
        return sb.toString().replaceAll("},]","}]");
    }

    private String getFeeStr(FeeType feeItem,ArrayList<FeeType> feeTypes){

        StringBuilder sb1 = new StringBuilder();


        sb1.append("{\"text\":\"" + feeItem.getName() + "\",\"id\":\"" + feeItem.getFeeTypeID() + "\",\"children\":[" );
        for(FeeType feeChild : feeTypes){
            if(feeChild.getParentID()!=null && feeChild.getParentID().equals(feeItem.getFeeTypeID())){
                sb1.append(getFeeStr(feeChild,feeTypes));
            }
        }
        sb1.append("]},");
        return sb1.toString();
    }
}
