package com.pms.utils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author PageUtils
 */
@Controller
public class PageUtils {
    @RequestMapping("/toPage.do")
    public String toPage(String url) {
        return url;
    }
}
