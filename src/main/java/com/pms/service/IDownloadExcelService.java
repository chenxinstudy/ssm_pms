package com.pms.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IDownloadExcelService {
    void getSalaryExcel(HttpServletRequest request, HttpServletResponse response,String eAccount,Integer dId,String sTime) throws Exception;
}
