package com.jtxx.util;

import com.google.gson.Gson;
import com.google.gson.JsonNull;
import java.lang.reflect.Type;
/**
 * Created by aegis on 2017/11/6.
 */
public class JsonUtils {
    private static Gson gson = new Gson();

    private JsonUtils() {
    }

    public static String toJson(Object src) {
        if (src == null) {
            return gson.toJson(JsonNull.INSTANCE);
        }
        return gson.toJson(src);
    }

    public static <T> Object fromJson(String json, Class<T> classOfT) {
        return gson.fromJson(json, (Type) classOfT);

    }

    public static Object fromJson(String json, Type typeOfT) {
        return gson.fromJson(json, typeOfT);
    }

    public static Object fromJsonWithTrim(String json, Type typeOfT) {

        json =  json.substring(1,json.length()-1);
        String [] jsonArray = json.split(",");
        json = "{";
        for(int i = 0; i< jsonArray.length; i++){
            if (jsonArray[i].indexOf("\"\"") == -1){
                json = json + jsonArray[i] + ",";
            }
        }
        json = (json + "}").replace(",}","}");
        return gson.fromJson(json, typeOfT);
    }

}

