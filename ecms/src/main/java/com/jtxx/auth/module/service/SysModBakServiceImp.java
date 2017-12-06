package com.jtxx.auth.module.service;

import com.jtxx.auth.module.dao.SysModBakDao;
import com.jtxx.entity.SysModBak;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/13.
 */
@Service
@MapperScan("com.jtxx.auth.module.dao")
public class SysModBakServiceImp implements SysModBakService {

    @Autowired
    private SysModBakDao moduleBackendDao;

    @Override
    public String getModBakByRole(String roleId) {

        ArrayList<SysModBak> modBakList = moduleBackendDao.SelectModBakByRole(roleId);

        StringBuilder moduleBuilder = new StringBuilder();
        moduleBuilder.append("[");
        for (SysModBak moduleItem : modBakList) {
            if(moduleItem.getParentId().equals("0")){
                moduleBuilder.append(getModuleJsonStr(moduleItem,modBakList));
            }
        }
        moduleBuilder.append("]");
        return moduleBuilder.toString().replaceAll("],}","]}").replaceAll("},]","}]");

    }

    private StringBuilder getModuleJsonStr(SysModBak moduleItem, ArrayList<SysModBak> moduleList){

        StringBuilder menuBuilder = new StringBuilder();
        if(moduleItem.getIsRoot() != null && moduleItem.getIsRoot().equals("Y") && moduleItem.getIsLeaf() == null){
            menuBuilder.append("{text:'"+moduleItem.getModuleName()+"',icon:'"+moduleItem.getIcon()+"', isRoot:'Y',children:[");
            for (SysModBak childMenu : moduleList){
                if(childMenu.getParentId().equals(moduleItem.getModuleId())){
                    menuBuilder.append(getModuleJsonStr(childMenu,moduleList));
                }
            }
            menuBuilder.append("]");
            menuBuilder.append("},");
        }else if(moduleItem.getIsRoot() != null && moduleItem.getIsLeaf() != null && moduleItem.getIsRoot().equals("Y") && moduleItem.getIsLeaf().equals("N")){
            menuBuilder.append("{id:'"+moduleItem.getModuleId()+
                    "',text:'"+moduleItem.getModuleName()+
                    "',icon:'"+moduleItem.getIcon()+
                    "',handler:onItemClickLocation,popwinwidth:'',leaf:false,popwinheight:'',itemaddr:'',isRoot:'Y',children:[");
            for (SysModBak childMenu : moduleList) {
                if (childMenu.getParentId().equals(moduleItem.getModuleId())) {
                    menuBuilder.append(getModuleJsonStr(childMenu, moduleList));
                }
            }
            menuBuilder.append("],");
            menuBuilder.append("},");
        }else if(moduleItem.getIsRoot()==null && moduleItem.getIsLeaf()!=null && moduleItem.getIsLeaf().equals("Y")){
            menuBuilder.append("{id:'"+moduleItem.getModuleId()+
                    "',text:'" + moduleItem.getModuleName()+
                    "',icon:'" +moduleItem.getIcon()+
                    "',handler:onItemClickLocation,popwinwidth:'',leaf:true,popwinheight:'',itemaddr:'"+ moduleItem.getItemUrl()+
                    "'},");
        }
        return menuBuilder;
    }

}
