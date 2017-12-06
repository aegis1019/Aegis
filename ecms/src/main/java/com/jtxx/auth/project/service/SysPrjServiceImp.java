package com.jtxx.auth.project.service;

import com.jtxx.entity.SysPrj;
import com.jtxx.auth.project.dao.SysPrjDao;
import com.jtxx.entity.SysUsr;
import com.jtxx.util.EUDataGridResult;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.UUID;

/**
 * Created by aegis on 2017/11/6.
 */
@Service
@MapperScan("com.jtxx.auth.project.dao")
public class SysPrjServiceImp implements SysPrjService {

    @Autowired
    private SysPrjDao projectDao;

    @Override
    public String GetProjectMenuData(SysUsr user) {
        ArrayList<SysPrj> projectList = projectDao.selectByRole(user);
        StringBuilder sb = new StringBuilder("[{text:'项目管理',icon:'', isRoot:'Y',children:");
        sb.append("[");
        for(int i=0; i<projectList.size();i++){
            sb.append("{id:'" + projectList.get(i).getCode() + "',text:'" + projectList.get(i).getName() + "',icon:'',handler:'onItemClickLocation',popwinwidth:'',leaf:true,popwinheight:'',itemaddr:'/index?project="+ projectList.get(i).getCode() + "'}");
            if(i!=projectList.size()-1){
                sb.append(",");
            }
        }
        sb.append("]");
        sb.append("}]");
        return sb.toString();
    }

    @Override
    public EUDataGridResult getProjectListPageData(int page, int rows, String code, String projectName){

        EUDataGridResult EUDGResult = new EUDataGridResult();
        ArrayList<SysPrj> prjList = projectDao.selectAllProject(page,rows,code,projectName);
        int count = projectDao.countAllProject(code,projectName);

        EUDGResult.setTotalCount(count);
        EUDGResult.setRoot(prjList);
        return  EUDGResult;
    }

    @Override
    public int insertPrj(SysPrj prj) {
        prj.setProjectID(UUID.randomUUID().toString().replaceAll("-", ""));
        return projectDao.insertPrj(prj);
    }

    @Override
    public int deletePrj(SysPrj prj) {
        return projectDao.deletePrjById(prj);
    }

    @Override
    public int updatePrjById(SysPrj prj) {
        return projectDao.updatePrjById(prj);
    }

    @Override
    public SysPrj selectById(String projectID) {
        return projectDao.selectById(projectID);
    }

    @Override
    public ArrayList<SysPrj> selectByRole(SysUsr user) {
        return projectDao.selectByRole(user);
    }

    @Override
    public String getProjectMap(SysUsr usr) {

        ArrayList<SysPrj> prjs = projectDao.selectByRole(usr);
        StringBuilder sb = new StringBuilder("{");

        for (int i=0;i<prjs.size();i++){
            sb.append("\"" + prjs.get(i).getProjectID() + "\":");
            sb.append("\"" + prjs.get(i).getName() + "\"");
            if (i != prjs.size()-1){
                sb.append(",");
            }
        }

        sb.append("}");
        return sb.toString();
    }

    public String getProjectMap2(SysUsr usr) {

        ArrayList<SysPrj> prjs = projectDao.selectByRole(usr);
        StringBuilder sb = new StringBuilder();

        for (int i=0;i<prjs.size();i++){
            sb.append("{");
            sb.append("\"Code\":\""+ prjs.get(i).getProjectID() +"\",\"DisplayName\":\"" + prjs.get(i).getName() +"\"");
            sb.append("}");
            if (i != prjs.size()-1){
                sb.append(",");
            }
        }
        return sb.toString();
    }
}
