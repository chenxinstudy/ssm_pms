package com.pms.service.impl;

import com.pms.dao.SalaryMapper;
import com.pms.exception.CustomException;
import com.pms.po.Salary;
import com.pms.service.IDownloadExcelService;
import com.pms.utils.JXLUtils;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: ssm
 * @Author：cx
 * @Description：
 * @Date：16:26 2022/3/9
 * @Version: 1.0
 */
@Service
public class DownloadExcelServiceImpl implements IDownloadExcelService{
    @Autowired
    private SalaryMapper salaryMapper;
    @Override
    public void getSalaryExcel(HttpServletRequest request, HttpServletResponse response,String eAccount,Integer dId,String sTime)  throws Exception{
        String excelName = "工资表.xls";
        WritableWorkbook writableWorkbook = null;
        Map map = new HashMap<String,Object>();
        map.put("eAccount",eAccount);
        map.put("dId",dId);
        map.put("sTime",sTime);
        List<Salary> salaries = salaryMapper.selectByEaccountDIdDate(map);
        try {
            response.setHeader("Content-Disposition", "attachment;filename=" + new String(excelName.getBytes("gbk"),"ISO-8859-1"));
            writableWorkbook = JXLUtils.createSalaryExcel(response.getOutputStream(),salaries);
            writableWorkbook.write();
            writableWorkbook.close();
        } catch (IOException | WriteException e) {
            e.printStackTrace();
            throw new CustomException("下载失败");
        }
    }


}
