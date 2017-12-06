package com.jtxx.rectification.service;

import com.jtxx.entity.RectiAttachment;
import com.jtxx.util.EUDataGridResult2;

/**
 * Created by aegis on 2017/12/4.
 */
public interface RectiAttachService {

    int insert(RectiAttachment attachment);

    EUDataGridResult2 getAttachmentById(String attachmentId);

    RectiAttachment selectById(String attachmentId);

    int deleteById(String attachmentId);
}
