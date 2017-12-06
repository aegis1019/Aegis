package com.jtxx.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by aegis on 2017/11/30.
 */
public class UtilFunction {

    public static String setDateStrForLog(){

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
        Date currentTime = new Date();
        String today = formatter.format(currentTime);
        String yestoday = formatter.format(new Date(currentTime.getTime() - 1 * 24 * 60 * 60 * 1000));
        String beforday = formatter.format(new Date(currentTime.getTime() - 2 * 24 * 60 * 60 * 1000));
        return "[{\"Code\":\""+ today +"\",\"DisplayName\":\""+ today +"\"},{\"Code\":\""+ yestoday +"\",\"DisplayName\":\""+ yestoday +"\"},{\"Code\":\""+ beforday +"\",\"DisplayName\":\""+ beforday +"\"}]";
    }

    public static String getSearchDate(){

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
        Date currentTime = new Date();
        String today = formatter.format(currentTime);
        String yestoday = formatter.format(new Date(currentTime.getTime() - 1 * 24 * 60 * 60 * 1000));
        String beforday = formatter.format(new Date(currentTime.getTime() - 2 * 24 * 60 * 60 * 1000));

        return "pl.record_date('"+ today +"','"+ yestoday +"','"+ beforday +"')";

    }
}
