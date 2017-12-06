package com.jtxx.entity;

/**
 * Created by aegis on 2017/11/22.
 */
public class PrjProgress {

    private String ProjectProgressID;
    private String ProjectID;
    private String ProjectName;
    private String StageProjectID;
    private String StageProjectName;
    private String ChildStructure;
    private Integer PlanStart;
    private Integer PlanComplete;
    private Integer ActualStart;
    private Integer ActualComplete;
    private String Completion;
    private String Remark;
    private Integer CompleRate;

    public Integer getCompleRate() {
        return CompleRate;
    }

    public void setCompleRate(Integer compleRate) {
        CompleRate = compleRate;
    }

    public String getProjectProgressID() {
        return ProjectProgressID;
    }

    public void setProjectProgressID(String projectProgressID) {
        ProjectProgressID = projectProgressID;
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

    public String getStageProjectID() {
        return StageProjectID;
    }

    public void setStageProjectID(String stageProjectID) {
        StageProjectID = stageProjectID;
    }

    public String getStageProjectName() {
        return StageProjectName;
    }

    public void setStageProjectName(String stageProjectName) {
        StageProjectName = stageProjectName;
    }

    public String getChildStructure() {
        return ChildStructure;
    }

    public void setChildStructure(String childStructure) {
        ChildStructure = childStructure;
    }

    public Integer getPlanStart() {
        return PlanStart;
    }

    public void setPlanStart(Integer planStart) {
        PlanStart = planStart;
    }

    public Integer getPlanComplete() {
        return PlanComplete;
    }

    public void setPlanComplete(Integer planComplete) {
        PlanComplete = planComplete;
    }

    public Integer getActualStart() {
        return ActualStart;
    }

    public void setActualStart(Integer actualStart) {
        ActualStart = actualStart;
    }

    public Integer getActualComplete() {
        return ActualComplete;
    }

    public void setActualComplete(Integer actualComplete) {
        ActualComplete = actualComplete;
    }

    public String getCompletion() {
        return Completion;
    }

    public void setCompletion(String completion) {
        Completion = completion;
    }

    public String getRemark() {
        return Remark;
    }

    public void setRemark(String remark) {
        Remark = remark;
    }
}
