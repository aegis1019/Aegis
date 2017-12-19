package com.jtxx.entity;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/12/6.
 */
public class Scene {
    private String SiteID;
    private String ProjectID;
    private String OwnerName;
    private String OwnerPhone;
    private String OwnerCompany;
    private String ConName;
    private String ConPhone;
    private String ConCompany;
    private String SupName;
    private String SupPhone;
    private String SupCompany;
    private String ToDayDynamic;
    private String ConDynamic;
    private String SupDynamic;
    private Integer CurrentTime;
    private String Remark;
    private String InputterID;
    private String InputterOfOrgID;
    private String InputterName;
    private Integer InputDate;
    private String ModifierID;
    private String ModifierOfOrgID;
    private String ModifierName;
    private Integer ModifyDate;

    private ArrayList<Inspection> Sup;
    private ArrayList<Inspection> Owner;

    public ArrayList<Inspection> getSup() {
        return Sup;
    }

    public void setSup(ArrayList<Inspection> sup) {
        Sup = sup;
    }

    public ArrayList<Inspection> getOwner() {
        return Owner;
    }

    public void setOwner(ArrayList<Inspection> owner) {
        Owner = owner;
    }

    public String getSiteID() {
        return SiteID;
    }

    public void setSiteID(String siteID) {
        SiteID = siteID;
    }

    public String getProjectID() {
        return ProjectID;
    }

    public void setProjectID(String projectID) {
        ProjectID = projectID;
    }

    public String getOwnerName() {
        return OwnerName;
    }

    public void setOwnerName(String ownerName) {
        OwnerName = ownerName;
    }

    public String getOwnerPhone() {
        return OwnerPhone;
    }

    public void setOwnerPhone(String ownerPhone) {
        OwnerPhone = ownerPhone;
    }

    public String getOwnerCompany() {
        return OwnerCompany;
    }

    public void setOwnerCompany(String ownerCompany) {
        OwnerCompany = ownerCompany;
    }

    public String getConName() {
        return ConName;
    }

    public void setConName(String conName) {
        ConName = conName;
    }

    public String getConPhone() {
        return ConPhone;
    }

    public void setConPhone(String conPhone) {
        ConPhone = conPhone;
    }

    public String getConCompany() {
        return ConCompany;
    }

    public void setConCompany(String conCompany) {
        ConCompany = conCompany;
    }

    public String getSupName() {
        return SupName;
    }

    public void setSupName(String supName) {
        SupName = supName;
    }

    public String getSupPhone() {
        return SupPhone;
    }

    public void setSupPhone(String supPhone) {
        SupPhone = supPhone;
    }

    public String getSupCompany() {
        return SupCompany;
    }

    public void setSupCompany(String supCompany) {
        SupCompany = supCompany;
    }

    public String getToDayDynamic() {
        return ToDayDynamic;
    }

    public void setToDayDynamic(String toDayDynamic) {
        ToDayDynamic = toDayDynamic;
    }

    public String getConDynamic() {
        return ConDynamic;
    }

    public void setConDynamic(String conDynamic) {
        ConDynamic = conDynamic;
    }

    public String getSupDynamic() {
        return SupDynamic;
    }

    public void setSupDynamic(String supDynamic) {
        SupDynamic = supDynamic;
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

    public String getInputterID() {
        return InputterID;
    }

    public void setInputterID(String inputterID) {
        InputterID = inputterID;
    }

    public String getInputterOfOrgID() {
        return InputterOfOrgID;
    }

    public void setInputterOfOrgID(String inputterOfOrgID) {
        InputterOfOrgID = inputterOfOrgID;
    }

    public String getInputterName() {
        return InputterName;
    }

    public void setInputterName(String inputterName) {
        InputterName = inputterName;
    }

    public Integer getInputDate() {
        return InputDate;
    }

    public void setInputDate(Integer inputDate) {
        InputDate = inputDate;
    }

    public String getModifierID() {
        return ModifierID;
    }

    public void setModifierID(String modifierID) {
        ModifierID = modifierID;
    }

    public String getModifierOfOrgID() {
        return ModifierOfOrgID;
    }

    public void setModifierOfOrgID(String modifierOfOrgID) {
        ModifierOfOrgID = modifierOfOrgID;
    }

    public String getModifierName() {
        return ModifierName;
    }

    public void setModifierName(String modifierName) {
        ModifierName = modifierName;
    }

    public Integer getModifyDate() {
        return ModifyDate;
    }

    public void setModifyDate(Integer modifyDate) {
        ModifyDate = modifyDate;
    }
}
