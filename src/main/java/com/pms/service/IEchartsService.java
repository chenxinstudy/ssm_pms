package com.pms.service;

import com.pms.vo.EchDepartmentSalary;
import com.pms.vo.EchEmployeeNums;
import com.pms.vo.EchMonthSalary;
import com.pms.vo.EchSalaryPercent;

import java.util.List;
import java.util.Map;

/**
 * @author 酷酷的鑫
 */
public interface IEchartsService {

    /**
     * 获得员工数量
     * @return
     */
    Map<String,List<EchEmployeeNums>> getEmployeeNums();

    /**
     * 获取部门工资
     * @param date
     * @return
     */
    Map<String,List<EchDepartmentSalary>> getDepartmentSalary(String date);

    /**
     * 获取薪资百分数
     * @param date
     * @param state
     * @return
     */
    Map<String,List<EchSalaryPercent>> getSalaryPercent(String date,int state);

    /**
     * 获取月薪资
     * @return
     */
    Map<String,List<EchMonthSalary>> getMonthSalary();
}
