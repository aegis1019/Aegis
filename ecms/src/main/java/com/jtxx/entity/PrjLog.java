package com.jtxx.entity;

/**
 * Created by aegis on 2017/11/30.
 */
public class PrjLog {
    private String ATTACHMENTID;
    private String FILEPATH;
    private String Type;
    private String RecordID;
    private String status;
    private String FILENAME;
    private String FILETYPE;
    private String INPUTTERID;
    private String INPUTTERNAME;
    private Integer INPUTDATE;
    private String MODIFIERID;
    private String MODIFIERNAME;
    private Integer MODIFIERDATE;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getATTACHMENTID() {
        return ATTACHMENTID;
    }

    public void setATTACHMENTID(String ATTACHMENTID) {
        this.ATTACHMENTID = ATTACHMENTID;
    }

    public String getFILEPATH() {
        return FILEPATH;
    }

    public void setFILEPATH(String FILEPATH) {
        this.FILEPATH = FILEPATH;
    }

    public String getType() {
        return Type;
    }

    public void setType(String type) {
        Type = type;
    }

    public String getRecordID() {
        return RecordID;
    }

    public void setRecordID(String recordID) {
        RecordID = recordID;
    }

    public String getFILENAME() {
        return FILENAME;
    }

    public void setFILENAME(String FILENAME) {
        this.FILENAME = FILENAME;
    }

    public String getFILETYPE() {
        return FILETYPE;
    }

    public void setFILETYPE(String FILETYPE) {
        this.FILETYPE = FILETYPE;
    }

    public String getINPUTTERID() {
        return INPUTTERID;
    }

    public void setINPUTTERID(String INPUTTERID) {
        this.INPUTTERID = INPUTTERID;
    }

    public String getINPUTTERNAME() {
        return INPUTTERNAME;
    }

    public void setINPUTTERNAME(String INPUTTERNAME) {
        this.INPUTTERNAME = INPUTTERNAME;
    }

    public Integer getINPUTDATE() {
        return INPUTDATE;
    }

    public void setINPUTDATE(Integer INPUTDATE) {
        this.INPUTDATE = INPUTDATE;
    }

    public String getMODIFIERID() {
        return MODIFIERID;
    }

    public void setMODIFIERID(String MODIFIERID) {
        this.MODIFIERID = MODIFIERID;
    }

    public String getMODIFIERNAME() {
        return MODIFIERNAME;
    }

    public void setMODIFIERNAME(String MODIFIERNAME) {
        this.MODIFIERNAME = MODIFIERNAME;
    }

    public Integer getMODIFIERDATE() {
        return MODIFIERDATE;
    }

    public void setMODIFIERDATE(Integer MODIFIERDATE) {
        this.MODIFIERDATE = MODIFIERDATE;
    }
}
