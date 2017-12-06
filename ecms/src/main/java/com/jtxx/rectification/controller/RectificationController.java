package com.jtxx.rectification.controller;

import com.jtxx.auth.project.service.SysPrjService;
import com.jtxx.entity.RectiAttachment;
import com.jtxx.entity.Rectification;
import com.jtxx.entity.SysUsr;
import com.jtxx.rectification.service.RectiAttachService;
import com.jtxx.rectification.service.RectificationService;
import com.jtxx.util.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Enumeration;
import java.util.Map;

/**
 * Created by aegis on 2017/12/4.
 */
@Controller
@RequestMapping("/rectification")
public class RectificationController {

    @Autowired
    private SysPrjService prjService;

    @Autowired
    private RectificationService rectiService;

    @Autowired
    private RectiAttachService attachService;

    private static final Logger logger = LoggerFactory.getLogger(RectificationController.class);

    //下发情况
    //============================================================================================================
    @GetMapping("/rectification-notice-page")
    public String rectificationNoticePage(HttpSession session){
        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        session.setAttribute("prjMap", prjService.getProjectMap(loginUser));
        return "/backend/rectification/rectification-notice";
    }

    @RequestMapping("/get-all-by-role")
    @ResponseBody
    public EUDataGridResult getAllContactByRole(HttpServletRequest request, HttpSession session){

        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        String roleId = loginUser.getRoleId();

        Enumeration enu=request.getParameterNames();
        String paraName=(String)enu.nextElement();
        Req e = (Req)JsonUtils.fromJsonWithTrim(paraName,Req.class);
        return  rectiService.getRectificationPageData(roleId,e.start,e.limit,e.RectificationNo);
    }

    @GetMapping("/add")
    public String add(){
        return "/backend/rectification/rectification-new";
    }

    @PostMapping("/SaveForAdd")
    @ResponseBody
    public Map<String, Object> add(@RequestBody String rectificationStr, HttpSession session) {

        Rectification rectification = (Rectification)JsonUtils.fromJsonWithTrim(rectificationStr,Rectification.class);
        Map<String, Object> map = UtilMsg.makeResultMsg(rectiService.insert(rectification) > 0);
        return map;
    }

    @PostMapping("/delete")
    @ResponseBody
    public Map<String, Object>delete(@RequestBody String rectificationStr, HttpSession session){
        Rectification rectification = (Rectification) JsonUtils.fromJsonWithTrim(rectificationStr,Rectification.class);
        Map<String, Object> map = UtilMsg.makeResultMsg(rectiService.deleteById(rectification) > 0);
        //附件暂不删除,备查
        return map;
    }

    @GetMapping("/detail")
    public String detail(HttpSession session, HttpServletRequest request){
        String RectificationID = request.getParameter("RectificationID");
        Rectification rec = new Rectification() ;
        rec.setRectificationID(RectificationID);
        rec = rectiService.selectById(rec);
        session.setAttribute("RectificationJson",JsonUtils.toJson(rec));
        return "/backend/rectification/rectification-detail";
    }

    @GetMapping("/edit")
    public String edit(HttpSession session, HttpServletRequest request){
        String RectificationID = request.getParameter("RectificationID");
        Rectification rec = new Rectification();
        rec.setRectificationID(RectificationID);
        rec = rectiService.selectById(rec);
        session.setAttribute("RectificationJson",JsonUtils.toJson(rec));
        return "/backend/rectification/rectification-edit";
    }

    @PostMapping("/SaveForEdit")
    @ResponseBody
    public Map<String, Object> update(@RequestBody String rectificationStr, HttpSession session) {
        Rectification rec = (Rectification) JsonUtils.fromJsonWithTrim(rectificationStr,Rectification.class);
        Map<String, Object> map = UtilMsg.makeResultMsg(rectiService.updateById(rec) > 0);
        return map;
    }

    //处理情况
    //============================================================================================================
    @GetMapping("/handle")
    public String handle(HttpSession session){
        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        session.setAttribute("prjMap", prjService.getProjectMap(loginUser));
        return "/backend/rectification/rectification-handle";
    }

    @GetMapping("/handle-edit")
    public String handleEdit(HttpSession session, HttpServletRequest request){
        String RectificationID = request.getParameter("RectificationID");
        Rectification rec = new Rectification();
        rec.setRectificationID(RectificationID);
        rec = rectiService.selectById(rec);
        session.setAttribute("RectificationJson",JsonUtils.toJson(rec));
        return "/backend/rectification/rectification-handle-edit";
    }

    @PostMapping("/SaveForHandleEdit")
    @ResponseBody
    public Map<String, Object> updateHandle(@RequestBody String rectificationStr, HttpSession session) {
        Rectification rec = (Rectification) JsonUtils.fromJsonWithTrim(rectificationStr,Rectification.class);
        Map<String, Object> map = UtilMsg.makeResultMsg(rectiService.updateHandleById(rec) > 0);
        return map;
    }

    @GetMapping("/handle-detail")
    public String handleDetail(HttpSession session, HttpServletRequest request){
        String RectificationID = request.getParameter("RectificationID");
        Rectification rec = new Rectification() ;
        rec.setRectificationID(RectificationID);
        rec = rectiService.selectById(rec);
        session.setAttribute("RectificationJson",JsonUtils.toJson(rec));
        return "/backend/rectification/rectification-handle-detail";
    }

    @GetMapping("/handle-attachment")
    public String handleAttachment(HttpServletRequest request,HttpSession session){

        String rectificationId = request.getParameter("id");
        String type = request.getParameter("type");
        String projectID = request.getParameter("ProjectID");

        request.setAttribute("id",rectificationId);
        request.setAttribute("type",type);
        request.setAttribute("projectID",projectID);


        return "/backend/rectification/rectification-handle-attachment";
    }



    //============================================================================================================
    //附件相关
    @GetMapping("/attachment")
    public String attachment(HttpServletRequest request,HttpSession session){

        String rectificationId = request.getParameter("id");
        String type = request.getParameter("type");
        String projectID = request.getParameter("projectID");
        request.setAttribute("id",rectificationId);
        request.setAttribute("type",type);
        request.setAttribute("projectID",projectID);

        return "/backend/rectification/attachment";
    }

    @RequestMapping("/upload")
    public String upload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpSession session) {

        String userStr = (String)session.getAttribute(JTXXConf.LOGIN_USER_INFO);
        SysUsr loginUser = (SysUsr) JsonUtils.fromJson(userStr,SysUsr.class);
        //整改通知单ID
        String id = request.getParameter("id");
        //固定为Rectification
        String type = request.getParameter("type");
        //项目ID
        String projectID = request.getParameter("projectID");

        //根目录/项目ID/Rectification/整改通知单ID
        String filePath = JTXXConf.UPLOAD_PATH_PREFIX + "//" + projectID + "//Rectification//" + id + "//";
        String fileName = file.getOriginalFilename();
        logger.info("上传的文件名为：" + fileName);
        logger.info("文件路径为：" + filePath);

        String suffixName = fileName.substring(fileName.lastIndexOf("."));

        File dest = new File(filePath + fileName);
        // 检测是否存在目录
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }
        try {
            file.transferTo(dest);
        } catch (IllegalStateException e ) {
            logger.error(e.toString());
        } catch ( IOException e) {
            logger.error( e.toString());
        }

        RectiAttachment attachment = new RectiAttachment();

        attachment.setFILETYPE(suffixName);
        attachment.setFILEPATH(filePath);
        attachment.setFILENAME(fileName);
        attachment.setINPUTTERID(loginUser.getUserId());
        attachment.setRecordID(id);
        attachService.insert(attachment);
        logger.info( "上传成功");

        request.setAttribute("id",id);
        request.setAttribute("type",type);
        request.setAttribute("projectID",projectID);

        return "/backend/rectification/attachment";
    }

    @PostMapping("/get-attachment")
    @ResponseBody
    public EUDataGridResult2 getAttachment(HttpServletRequest request, HttpSession session){

        String id = request.getParameter("id");
        EUDataGridResult2 result = attachService.getAttachmentById(id);
        return result;
    }

    @PostMapping("/delete-attachment")
    @ResponseBody
    public Map<String, Object> deleteAttachment(HttpSession session, HttpServletRequest request) {

        String attachmentId = request.getParameter("id");
        RectiAttachment attachment = attachService.selectById(attachmentId);
        File attachFile = new File(attachment.getFILEPATH() + attachment.getFILENAME());
        attachFile.delete();
        Map<String, Object> map = UtilMsg.makeResultMsg(attachService.deleteById(attachmentId)>0);
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

    class Req{
        private String RectificationNo;
        private String bleGrid;
        private Integer start;
        private Integer limit;
    }
}
