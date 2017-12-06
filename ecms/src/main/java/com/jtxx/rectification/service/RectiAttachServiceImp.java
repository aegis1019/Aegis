package com.jtxx.rectification.service;

import com.jtxx.entity.RectiAttachment;
import com.jtxx.rectification.dao.RectiAttachDao;
import com.jtxx.util.EUDataGridResult2;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.UUID;

/**
 * Created by aegis on 2017/12/4.
 */
@Service
@MapperScan("com.jtxx.rectification.dao")
public class RectiAttachServiceImp implements RectiAttachService {

    @Autowired
    private RectiAttachDao attachDao;

    @Override
    public int insert(RectiAttachment attachment) {
        attachment.setATTACHMENTID(UUID.randomUUID().toString().replaceAll("-", ""));
        return attachDao.insert(attachment);
    }

    @Override
    public EUDataGridResult2 getAttachmentById(String attachmentId) {

        EUDataGridResult2 eu2 = new EUDataGridResult2();
        ArrayList<RectiAttachment> attachments = attachDao.selectByRectiId(attachmentId);
        int count = attachDao.countByRectiId(attachmentId);
        eu2.setROWS(attachments);
        eu2.setTOTAL(count);
        return eu2;
    }

    @Override
    public RectiAttachment selectById(String attachmentId) {
        return attachDao.selectById(attachmentId);
    }

    @Override
    public int deleteById(String attachmentId) {
        return attachDao.deleteById(attachmentId);
    }
}
