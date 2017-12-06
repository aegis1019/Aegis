package com.jtxx.entity;

/**
 * Created by aegis on 2017/12/4.
 */
public class RectiAttachment {

    private String ATTACHMENTID; //附件ID
    private String FILENAME;
    private String INPUTTERID;
    private String INPUTTERNAME;
    private Integer INPUTDATE;
    private String RecordID;  //整改通知单ID
    private String FILETYPE;
    private String FILEPATH;

    public String getINPUTTERID() {
        return INPUTTERID;
    }

    public void setINPUTTERID(String INPUTTERID) {
        this.INPUTTERID = INPUTTERID;
    }

    public String getATTACHMENTID() {
        return ATTACHMENTID;
    }

    public void setATTACHMENTID(String ATTACHMENTID) {
        this.ATTACHMENTID = ATTACHMENTID;
    }

    public String getFILENAME() {
        return FILENAME;
    }

    public void setFILENAME(String FILENAME) {
        this.FILENAME = FILENAME;
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

    public String getRecordID() {
        return RecordID;
    }

    public void setRecordID(String recordID) {
        RecordID = recordID;
    }

    public String getFILETYPE() {
        return FILETYPE;
    }

    public void setFILETYPE(String FILETYPE) {
        this.FILETYPE = FILETYPE;
    }

    public String getFILEPATH() {
        return FILEPATH;
    }

    public void setFILEPATH(String FILEPATH) {
        this.FILEPATH = FILEPATH;
    }
}
