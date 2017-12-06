package com.jtxx.contact.service;

import com.jtxx.contact.dao.ContactDao;
import com.jtxx.entity.Contact;
import com.jtxx.util.EUDataGridResult;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.UUID;

/**
 * Created by aegis on 2017/11/14.
 */
@Service
@MapperScan("com.jtxx.contact.dao")
public class ContactServiceImp implements ContactService {

    @Autowired
    private ContactDao contactDao;

    @Override
    public EUDataGridResult getContactListPageData(String roleId, int page, int rows, String name) {

        EUDataGridResult eu = new EUDataGridResult();
        ArrayList<Contact> contactList = contactDao.selectAllContactByRole(roleId,page,rows,name);
        int count = contactDao.countAllContactByRole(roleId,name);
        eu.setTotalCount(count);
        eu.setRoot(contactList);
        return eu;
    }

    @Override
    public int insert(Contact contact) {
        contact.setLinkManID(UUID.randomUUID().toString().replaceAll("-", ""));
        return contactDao.insert(contact);
    }

    @Override
    public int update(Contact contact) {
        return contactDao.update(contact);
    }

    @Override
    public Contact selectById(String contactId) {
        return contactDao.selectById(contactId);
    }

    @Override
    public int delete(Contact contact) {
        return contactDao.deleteById(contact);
    }
}
