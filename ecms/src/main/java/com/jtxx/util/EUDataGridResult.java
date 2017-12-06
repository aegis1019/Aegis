package com.jtxx.util;

import java.util.List;

/**
 * Created by aegis on 2017/11/14.
 */
public class EUDataGridResult {
    private long totalCount;
    private List<?> root;

    public long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }

    public List<?> getRoot() {
        return root;
    }

    public void setRoot(List<?> root) {
        this.root = root;
    }
}
