package com.jtxx.entity;

/**
 * Created by aegis on 2017/11/15.
 */
public class StaffSch {

    private String DepartID;
    private String  ProjectID;
    private String DepartName;
    private Integer DepartNumber;
    private Integer ActualNumber;
    private Integer CurrentTime;
    private String Remark;

    public String getDepartID() {
        return DepartID;
    }

    public void setDepartID(String departID) {
        DepartID = departID;
    }

    public String getProjectID() {
        return ProjectID;
    }

    public void setProjectID(String projectID) {
        ProjectID = projectID;
    }

    public String getDepartName() {
        return DepartName;
    }

    public void setDepartName(String departName) {
        DepartName = departName;
    }

    public Integer getDepartNumber() {
        return DepartNumber;
    }

    public void setDepartNumber(Integer departNumber) {
        DepartNumber = departNumber;
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
