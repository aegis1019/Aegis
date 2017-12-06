package com.jtxx.contact.service;

import com.jtxx.entity.Contact;
import com.jtxx.util.EUDataGridResult;

/**
 * Created by aegis on 2017/11/14.
 */
public interface ContactService {

    EUDataGridResult getContactListPageData(String roleId, int page, int rows, String name);

    int insert (Contact contact);

    int update(Contact contact);

    Contact selectById(String contactId);

    int delete(Contact contact);
}
