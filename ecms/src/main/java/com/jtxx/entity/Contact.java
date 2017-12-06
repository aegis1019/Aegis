package com.jtxx.entity;

/**
 * Created by aegis on 2017/11/14.
 */
public class Contact {

    private String LinkManID;
    private String ProjectID;
    private String ProjectName;
    private String Position;
    private String Rank;
    private String Tel;
    private String Name;
    private String Email;
    private String Remark;

    private String createId;
    private Integer createDate;
    private String updateId;
    private Integer updateDate;

    public String getLinkManID() {
        return LinkManID;
    }

    public void setLinkManID(String linkManID) {
        LinkManID = linkManID;
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

    public String getPosition() {
        return Position;
    }

    public void setPosition(String position) {
        Position = position;
    }

    public String getRank() {
        return Rank;
    }

    public void setRank(String rank) {
        Rank = rank;
    }

    public String getTel() {
        return Tel;
    }

    public void setTel(String tel) {
        Tel = tel;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
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
