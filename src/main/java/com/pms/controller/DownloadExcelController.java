package com.pms.controller;

import com.pms.service.IDownloadExcelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @program: ssm
 * @Author：cx
 * @Description：下载excel表格
 * @Date：16:20 2022/3/9
 * @Version: 1.0
 */
@Controller
public class DownloadExcelController {
    @Autowired
    private IDownloadExcelService downloadExcelService;

    @RequestMapping(value = "downloadExcel.do")
    public void downloadExcel(HttpServletRequest request, HttpServletResponse response,String eAccount,Integer dId,String sTime)  throws Exception{
        downloadExcelService.getSalaryExcel(request,response,eAccount,dId,sTime) ;
    }
}
