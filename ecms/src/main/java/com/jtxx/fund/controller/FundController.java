package com.jtxx.fund.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by aegis on 2017/11/7.
 */
@Controller
@RequestMapping("/fund")
public class FundController {

    @PostMapping("/fund-outline")
    @ResponseBody
    public Map<String, Object> foundOutline() {
        Map<String, Object> map = new HashMap<>();

        map.put("IsSucess",true);
        map.put("RtnValue1","10%,20%,30%,40%,50%,50.51%");
        map.put("RtnValue2","[{\"name\": \"累计已支付\",\"data\": [88.3,176.6,264.9,353.2,441.5,446]}, {\"name\": \"合同总金额\",\"data\": [883,883,883,883,883,883]}]");

        return  map;
    }

    @PostMapping("/fund-total-data")
    @ResponseBody
    public Map<String, Object> feeTotalData() {
        Map<String, Object> map = new HashMap<>();

        map.put("IsSuccess",true);
        map.put("RtnValue1","土地费用,勘察费,设计费用,施工费用,监理费,基坑监测,桩基检测,其他");
        map.put("RtnValue2","[{\"name\": \"计划\",\"data\": [30,24,456,300,50,23,50,10]},{\"name\": \"实际\",\"data\": [10,18,303,100,10,3,30,1]}]");

        return  map;
    }


}
