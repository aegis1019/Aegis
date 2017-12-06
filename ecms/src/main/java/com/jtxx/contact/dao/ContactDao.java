package com.jtxx.contact.dao;

import com.jtxx.entity.Contact;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/14.
 */
@Repository
public interface ContactDao {

    ArrayList<Contact> selectAllContactByRole(@Param("roleId") String roleId,@Param("page") int page,@Param("rows") int rows, @Param("name") String name);

    int countAllContactByRole(@Param("roleId") String roleId, @Param("name") String name);

    int insert(@Param("contact") Contact contact);

    int update(@Param("contact") Contact contact);

    Contact selectById(@Param("contactId") String contactId);

    int deleteById(@Param("contact") Contact contact);
}
