package com.jtxx.rectification.dao;

import com.jtxx.entity.RectiAttachment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/12/4.
 */
@Repository
public interface RectiAttachDao {

    int insert(@Param("attachment")RectiAttachment attachment);

    ArrayList<RectiAttachment> selectByRectiId(@Param("attachmentId") String attachmentId);

    int countByRectiId(@Param("attachmentId") String attachmentId);

    RectiAttachment selectById(@Param("attachmentId") String attachmentId);

    int deleteById(@Param("attachmentId") String attachmentId);
}
