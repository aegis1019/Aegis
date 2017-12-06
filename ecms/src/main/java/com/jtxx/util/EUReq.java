package com.jtxx.util;

/**
 * Created by aegis on 2017/11/14.
 */
public class EUReq {
    String Name;
    String Code;
    String bleGrid;
    String start;
    String limit;

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getCode() {
        return Code;
    }

    public void setCode(String code) {
        Code = code;
    }

    public String getBleGrid() {
        return bleGrid;
    }

    public void setBleGrid(String bleGrid) {
        this.bleGrid = bleGrid;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getLimit() {
        return limit;
    }

    public void setLimit(String limit) {
        this.limit = limit;
    }
}
