package com.jtxx.entity;

/**
 * Created by aegis on 2017/12/4.
 */
public class Rectification {

    private String RectificationID;
    private String ProjectID;
    private String RectificationNo;
    private String Summary;
    private Integer InputDate;
    private String Situation;
    private Integer FeedbackTime;
    private String Remark;

    public String getRectificationID() {
        return RectificationID;
    }

    public void setRectificationID(String rectificationID) {
        RectificationID = rectificationID;
    }

    public String getProjectID() {
        return ProjectID;
    }

    public void setProjectID(String projectID) {
        ProjectID = projectID;
    }

    public String getRectificationNo() {
        return RectificationNo;
    }

    public void setRectificationNo(String rectificationNo) {
        RectificationNo = rectificationNo;
    }

    public String getSummary() {
        return Summary;
    }

    public void setSummary(String summary) {
        Summary = summary;
    }

    public Integer getInputDate() {
        return InputDate;
    }

    public void setInputDate(Integer inputDate) {
        InputDate = inputDate;
    }

    public String getSituation() {
        return Situation;
    }

    public void setSituation(String Situation) {
        this.Situation = Situation;
    }

    public Integer getFeedbackTime() {
        return FeedbackTime;
    }

    public void setFeedbackTime(Integer feedbackTime) {
        FeedbackTime = feedbackTime;
    }

    public String getRemark() {
        return Remark;
    }

    public void setRemark(String remark) {
        Remark = remark;
    }
}
