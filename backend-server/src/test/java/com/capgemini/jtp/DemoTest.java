package com.capgemini.jtp;

import java.io.UnsupportedEncodingException;

/**
 * @Description:
 * @author: MmmLll_Shen
 * @date: 17:49 2019/10/10
 */
public class DemoTest {
    public static void main(String[] args) {
        String a = java.net.URLEncoder.encode("中文");
            System.out.println(a);
    }
}
