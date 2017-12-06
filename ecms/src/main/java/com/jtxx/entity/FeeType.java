package com.jtxx.entity;

/**
 * Created by aegis on 2017/11/26.
 */
public class FeeType {

    private String ID;
    private String FeeTypeID;
    private String Name;
    private Integer Sort;
    private String Remark;
    private String ParentID;
    private String IsLeaf;

    public String getIsLeaf() {
        return IsLeaf;
    }

    public void setIsLeaf(String isLeaf) {
        IsLeaf = isLeaf;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getFeeTypeID() {
        return FeeTypeID;
    }

    public void setFeeTypeID(String feeTypeID) {
        FeeTypeID = feeTypeID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public Integer getSort() {
        return Sort;
    }

    public void setSort(Integer sort) {
        Sort = sort;
    }

    public String getRemark() {
        return Remark;
    }

    public void setRemark(String remark) {
        Remark = remark;
    }

    public String getParentID() {
        return ParentID;
    }

    public void setParentID(String parentID) {
        ParentID = parentID;
    }
}
