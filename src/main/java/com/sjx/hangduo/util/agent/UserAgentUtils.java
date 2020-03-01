package com.sjx.hangduo.util.agent;

import cz.mallat.uasparser.OnlineUpdater;
import cz.mallat.uasparser.UASparser;
import cz.mallat.uasparser.UserAgentInfo;

import java.io.IOException;

public class UserAgentUtils {

    public static UASparser uaSparser=null;

    static {
        try {
            uaSparser=new UASparser(OnlineUpdater.getVendoredInputStream());
        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
