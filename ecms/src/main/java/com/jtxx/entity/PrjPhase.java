package com.jtxx.entity;

/**
 * Created by aegis on 2017/11/15.
 */
public class PrjPhase {
    private String StageProjectID;
    private String Name;
    private Integer Sort;
    private String Remark;
    private String createId;
    private Integer createDate;
    private String updateId;
    private Integer updateDate;

    public String getStageProjectID() {
        return StageProjectID;
    }

    public void setStageProjectID(String stageProjectID) {
        StageProjectID = stageProjectID;
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

    public String getCreateId() {
        return createId;
    }

    public void setCreateId(String createId) {
        this.createId = createId;
    }

    public Integer getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Integer createDate) {
        this.createDate = createDate;
    }

    public String getUpdateId() {
        return updateId;
    }

    public void setUpdateId(String updateId) {
        this.updateId = updateId;
    }

    public Integer getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Integer updateDate) {
        this.updateDate = updateDate;
    }
}
