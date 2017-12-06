package com.jtxx.util;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by aegis on 2017/11/27.
 */
public  class UtilMsg {

    public static Map<String, Object> makeResultMsg(boolean reslut){
        Map<String, Object> map = new HashMap<>();

        if(reslut){
            map.put("IsSucess",true);
            map.put("Message","成功");
        }else
        {
            map.put("IsSucess",false);
            map.put("Message","失败，请再次尝试或联系管理员");
        }
        return map;
    }

}
