package com.jtxx.entity;

/**
 * Created by aegis on 2017/11/28.
 */
public class BudgetMgr {

    private String DesignAlterationID;
    private String ProjectID;
    private String ProjectName;
    private String FeeType;
    private String FeeName;
    private double Estimate;
    private double Budget;
    private String Remark;

    public String getFeeName() {
        return FeeName;
    }

    public void setFeeName(String feeName) {
        FeeName = feeName;
    }

    public String getDesignAlterationID() {
        return DesignAlterationID;
    }

    public void setDesignAlterationID(String designAlterationID) {
        DesignAlterationID = designAlterationID;
    }

    public String getProjectID() {
        return ProjectID;
    }

    public void setProjectID(String projectID) {
        ProjectID = projectID;
    }

    public String getProjectName() {
        return ProjectName;
    }

    public void setProjectName(String projectName) {
        ProjectName = projectName;
    }

    public String getFeeType() {
        return FeeType;
    }

    public void setFeeType(String feeType) {
        FeeType = feeType;
    }

    public double getEstimate() {
        return Estimate;
    }

    public void setEstimate(double estimate) {
        Estimate = estimate;
    }

    public double getBudget() {
        return Budget;
    }

    public void setBudget(double budget) {
        Budget = budget;
    }

    public String getRemark() {
        return Remark;
    }

    public void setRemark(String remark) {
        Remark = remark;
    }
}
