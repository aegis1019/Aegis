package com.jtxx.entity;

/**
 * Created by aegis on 2017/11/15.
 */
public class EquipSch {

    private String EquipmentID;
    private String ProjectID;
    private String EquipmentName;
    private Integer EquipmentNumber;
    private Integer ActualNumber;
    private Integer CurrentTime;
    private String Remark;

    public String getEquipmentID() {
        return EquipmentID;
    }

    public void setEquipmentID(String equipmentID) {
        EquipmentID = equipmentID;
    }

    public String getProjectID() {
        return ProjectID;
    }

    public void setProjectID(String projectID) {
        ProjectID = projectID;
    }

    public String getEquipmentName() {
        return EquipmentName;
    }

    public void setEquipmentName(String equipmentName) {
        EquipmentName = equipmentName;
    }

    public Integer getEquipmentNumber() {
        return EquipmentNumber;
    }

    public void setEquipmentNumber(Integer equipmentNumber) {
        EquipmentNumber = equipmentNumber;
    }

    public Integer getActualNumber() {
        return ActualNumber;
    }

    public void setActualNumber(Integer actualNumber) {
        ActualNumber = actualNumber;
    }

    public Integer getCurrentTime() {
        return CurrentTime;
    }

    public void setCurrentTime(Integer currentTime) {
        CurrentTime = currentTime;
    }

    public String getRemark() {
        return Remark;
    }

    public void setRemark(String remark) {
        Remark = remark;
    }
}
