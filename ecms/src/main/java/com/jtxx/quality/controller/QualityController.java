package com.jtxx.quality.controller;

import com.jtxx.util.JTXXConf;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by aegis on 2017/11/9.
 */
@Controller
@RequestMapping("/quality")
public class QualityController {

    @PostMapping("/notice")
    @ResponseBody
    public String loadNotice(HttpSession session) {
        System.out.println("load-notice:" + session.getAttribute(JTXXConf.PROJECT_ID));
        return testStr().toString();
    }

    @PostMapping("/meeting-summary")
    @ResponseBody
    public String meetingSummary(HttpSession session) {
        System.out.println("meeting-summary:" + session.getAttribute(JTXXConf.PROJECT_ID));
        return testStr().toString();
    }

    @PostMapping("/construction-diary")
    @ResponseBody
    public String constructionDiary(HttpSession session) {
        System.out.println("construction-diary:" + session.getAttribute(JTXXConf.PROJECT_ID));
        return testStr().toString();
    }

    @PostMapping("/supervisor-diary")
    @ResponseBody
    public String supervisorDiary(HttpSession session) {
        System.out.println("supervisor-diary:" + session.getAttribute(JTXXConf.PROJECT_ID));
        return testStr().toString();
    }

    @GetMapping("/quality-file")
    public String qualityFile(){
        System.out.println("quality-file-page");
        return "/backend/quality/quality-file";
    }

    @GetMapping("/supervisor-diary-file")
    public String supervisorDiaryFile(){
        System.out.println("supervisor-diary-file-page");
        return "/backend/quality/supervisor-diary-file";
    }

    @GetMapping("/notice-file")
    public String noticeFile(){
        System.out.println("notice-file-page");
        return "/backend/quality/notice-file";
    }

    @GetMapping("/construction-diary-file")
    public String constructionDiaryFile(){
        System.out.println("construction-diary-file-page");
        return "/backend/quality/construction-diary-file";
    }

    @GetMapping("/meeting-summary-file")
    public String meetingSummaryFile(){
        System.out.println("meeting-summary-file-page");
        return "/backend/quality/meeting-summary-file";
    }

    private String testStr(){
        StringBuilder sb = new StringBuilder();
        sb.append("<table class='mytable' style='width:100%;height:100%;'>\n" +
                "  <td class='TitleSty'>周日</td>\n" +
                "  <td class='TitleSty'>周一</td>\n" +
                "  <td class='TitleSty'>周二</td>\n" +
                "  <td class='TitleSty'>周三</td>\n" +
                "  <td class='TitleSty'>周四</td>\n" +
                "  <td class='TitleSty'>周五</td>\n" +
                "  <td class='TitleSty1'>周六</td>\n" +
                "  </tr>\n" +
                "  <tr>\n" +
                "    <td class='mytd'></td>\n" +
                "    <td class='mytd'></td>\n" +
                "    <td class='mytd'></td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-01\",3)'>1</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-02\",3)'>2</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-03\",3)'>3</td>\n" +
                "    <td class='mytd1' onclick='UpLoad(\"2017-11-04\",3)'>4</td>\n" +
                "  </tr>\n" +
                "  <tr>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-05\",3)'>5</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-06\",3)'>6</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-07\",3)'>7</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-08\",3)'>8</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-09\",3)'>9</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-10\",3)'>10</td>\n" +
                "    <td class='mytd1' onclick='UpLoad(\"2017-11-11\",3)'>11</td>\n" +
                "  </tr>\n" +
                "  <tr>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-12\",3)'>12</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-13\",3)'>13</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-14\",3)'>14</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-15\",3)'>15</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-16\",3)'>16</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-17\",3)'>17</td>\n" +
                "    <td class='mytd1' onclick='UpLoad(\"2017-11-18\",3)'>18</td>\n" +
                "  </tr>\n" +
                "  <tr>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-19\",3)'>19</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-20\",3)'>20</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-21\",3)'>21</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-22\",3)'>22</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-23\",3)'>23</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-24\",3)'>24</td>\n" +
                "    <td class='mytd1' onclick='UpLoad(\"2017-11-25\",3)'>25</td>\n" +
                "  </tr>\n" +
                "  <tr>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-26\",3)'>26</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-27\",3)'>27</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-28\",3)'>28</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-29\",3)'>29</td>\n" +
                "    <td class='mytd' onclick='UpLoad(\"2017-11-30\",3)'>30</td>\n" +
                "    <td class='mytd'></td>\n" +
                "    <td class='mytd1'></td>\n" +
                "  </tr>\n" +
                "</table>");
        return  sb.toString();
    }
}
