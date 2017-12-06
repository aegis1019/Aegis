package com.jtxx.projectLog.controller;

import com.jtxx.auth.project.service.SysPrjService;
import com.jtxx.entity.PrjLog;
import com.jtxx.entity.SysUsr;
import com.jtxx.projectLog.service.PrjLogService;
import com.jtxx.util.*;
import com.sun.deploy.net.HttpResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Enumeration;
import java.util.Map;

/**
 * Created by aegis on 2017/12/1.
 */
@Controller
@RequestMapping("/project-log")
public class PrjLogController {

    @Autowired
    private SysPrjService prjService;

    @Autowired
    private PrjLogService logService;

    private static final Logger logger = LoggerFactory.getLogger(PrjLogController.class);

    @GetMapping("/suplog-page")
    public String suplogPage(HttpSession session){

        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        session.setAttribute("lsM_ComboData", UtilFunction.setDateStrForLog());
        session.setAttribute("prjMap", prjService.getProjectMap(loginUser));
        session.setAttribute("strSearch", UtilFunction.getSearchDate() );
        return "/backend/suplog/sup-log";
    }

    @GetMapping("/constrlog-page")
    public String constrlogPage(HttpSession session){
        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        session.setAttribute("lsM_ComboData", UtilFunction.setDateStrForLog());
        session.setAttribute("prjMap", prjService.getProjectMap( loginUser));
        session.setAttribute("strSearch", UtilFunction.getSearchDate());
        return "/backend/constrlog/constr-log";
    }

    @GetMapping("/minutes-page")
    public String minutesPage(HttpSession session){
        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class );
        session.setAttribute("lsM_ComboData", UtilFunction.setDateStrForLog() );
        session.setAttribute("prjMap", prjService.getProjectMap(loginUser));
        session.setAttribute("strSearch",  UtilFunction.getSearchDate());
        return "/backend/minutes/minutes";
    }

    @PostMapping("/log-list")
    @ResponseBody
    EUDataGridResult2 getSupLogByRole(HttpServletRequest request, HttpSession session){
        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        String roleId = loginUser.getRoleId();
        String status = request.getParameter("status");
        String strSearch = request.getParameter("strSearch");

        EUDataGridResult2 result = logService.getRecent3SupLogByRole(roleId,status,strSearch);
        return result;
    }

    @RequestMapping("/log-upload")
    public String upload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpSession session) {

        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        String projectID = request.getParameter("type");
        String dateStr = request.getParameter("id");
        String logType = request.getParameter("viewName");
        String status = request.getParameter("status");

        //根目录/项目ID/Log/监理/日期/
        String filePath = JTXXConf.UPLOAD_PATH_PREFIX + "//" + projectID + "//Log//" + logType + "//" + dateStr + "//";
        String fileName = file.getOriginalFilename();
        logger.info("上传的文件名为：" + fileName);

        String suffixName = fileName.substring(fileName.lastIndexOf("."));

        File dest = new File(filePath + fileName);
        // 检测是否存在目录
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);
        } catch (IllegalStateException e) {
            logger.error(e.toString());
            e.printStackTrace();
        } catch (IOException e) {
            logger.error(e.toString());
            e.printStackTrace();
        }

        PrjLog prjLog = new PrjLog();
        prjLog.setType(projectID);
        prjLog.setRecordID(dateStr);
        prjLog.setFILETYPE(suffixName);
        prjLog.setFILENAME(fileName);
        prjLog.setFILEPATH(filePath);
        prjLog.setINPUTTERID(loginUser.getUserId());
        prjLog.setStatus(status);

        logService.insert(prjLog);

        switch (status){
            case "1":
                return "/backend/constrlog/constr-log";
            case "2":
                return "/backend/suplog/sup-log";
            case "4":
                return "/backend/minutes/minutes";
        }
        return null;
    }

    @PostMapping("/log-del")
    @ResponseBody
    public Map<String, Object> suplogDelete(HttpSession session, HttpServletRequest request) {

        String logType = request.getParameter("status");
        String projectId = request.getParameter("type");
        String attachmentId = request.getParameter("id");

        PrjLog prjLog = logService.selectById(attachmentId);
        File supLogFile = new File(prjLog.getFILEPATH() + prjLog.getFILENAME());
        supLogFile.delete();

        Map<String, Object> map = UtilMsg.makeResultMsg(logService.deleteById(attachmentId)>0);
        return map;
    }

    @RequestMapping(value = "/download", method = RequestMethod.GET)
    public void testDownload(HttpServletRequest request, HttpServletResponse response) {
        String fileName = request.getParameter("name");
        String path = request.getParameter("path");

        try{
            response.setHeader("content-type", "application/octet-stream");
            response.setContentType("application/octet-stream;charset=UTF-8");
            response.setHeader("Content-Disposition", "attachment;filename=\"" + new String(fileName.getBytes("gbk"),"iso-8859-1") + "\"");
        }catch (Exception e){
            logger.error(e.toString());
        }

        byte[] buff = new byte[1024];
        BufferedInputStream bis = null;
        OutputStream os = null;
        try {
            os = response.getOutputStream();
            bis = new BufferedInputStream(new FileInputStream(new File(path + fileName)));
            int i = bis.read(buff);
            while (i != -1) {
                os.write(buff, 0, buff.length);
                os.flush();
                i = bis.read(buff);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (bis != null) {
                try {
                    bis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        logger.info("success");
    }


}
