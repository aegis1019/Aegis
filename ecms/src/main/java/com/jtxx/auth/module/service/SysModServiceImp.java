package com.jtxx.auth.module.service;

import com.jtxx.entity.SysMod;
import com.jtxx.auth.module.dao.SysModDao;
import com.jtxx.entity.SysPrj;
import com.jtxx.auth.project.dao.SysPrjDao;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

/**
 * Created by aegis on 2017/11/7.
 */
@Service
@MapperScan("com.jtxx.auth.module.dao")
public class SysModServiceImp implements SysModService {

    @Autowired
    private SysPrjDao projectDao;

    @Autowired
    private SysModDao moduleDao;

    @Override
    public String GetModuleMenuData(String roleId, String projectId) {

        SysPrj project = projectDao.selectById(projectId);
        ArrayList<SysMod> moduleList = moduleDao.SelectShowMenuByRoleAndProject(roleId,projectId);

        StringBuilder sb = new StringBuilder("[{");
        sb.append("text:'"+ project.getName() + "',icon:'', isRoot:'Y',children:");
        sb.append("[");
        sb.append("{id:'0',text:'返回',icon:'icon-Exit',handler:onItemClickLocation,popwinwidth:'',leaf:true,popwinheight:'',itemaddr:'/back-index'}");

        for(int i=0; i<moduleList.size(); i++){
            sb.append(",");
            sb.append("{id:'"+ moduleList.get(i).getModuleId() +"',text:'" + moduleList.get(i).getModuleName() + "',icon:'"+ moduleList.get(i).getIcon() +"',handler:onItemClickLocation,popwinwidth:'',leaf:true,popwinheight:'',itemaddr:'"+ moduleList.get(i).getItemUrl() +"'}");
        }

        sb.append("]");
        sb.append("}]");

        return  sb.toString();
    }
}
