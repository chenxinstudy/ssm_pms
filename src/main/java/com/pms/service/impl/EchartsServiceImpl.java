package com.pms.service.impl;

import com.pms.dao.DepartmentMapper;
import com.pms.dao.EmployeeMapper;
import com.pms.dao.SalaryMapper;
import com.pms.po.Department;
import com.pms.service.IEchartsService;
import com.pms.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author: cx @Description: @Date: 22:30 2022/3/6
 */
@Service
public class EchartsServiceImpl implements IEchartsService {
  @Autowired private DepartmentMapper departmentMapper;
  @Autowired private EmployeeMapper employeeMapper;
  @Autowired private SalaryMapper salaryMapper;

  @Override
  public Map<String, List<EchEmployeeNums>> getEmployeeNums() {
    /**
     * @Author: cx @Description: @Date: 2022/3/7 @Param: [] @Return:
     * java.util.Map<java.lang.String,java.util.List<com.pms.vo.EchEmployeeNums>>
     */
    List<EchEmployeeNums> echEmployeeNumsList = new ArrayList();
    Map<String, List<EchEmployeeNums>> map = new HashMap<>();
    List<Department> departmentList = departmentMapper.selectAll();
    int nums = 0;
    for (Department department : departmentList) {
      // 统计部门员工人数
      nums = employeeMapper.countByDid(department.getdId());
      EchEmployeeNums echEmployeeNums = new EchEmployeeNums();
      // 填入部门名
      echEmployeeNums.setDepartment(department.getdName());
      // 填入部门员工人数
      echEmployeeNums.setNum(nums);
      echEmployeeNumsList.add(echEmployeeNums);
      // 清零
      nums = 0;
    }
    map.put("list", echEmployeeNumsList);
    return map;
  }

  @Override
  public Map<String, List<EchDepartmentSalary>> getDepartmentSalary(String date) {
    /**
     * @Author: cx @Description:各部门工资折线图 @Date: 14:36 2022/3/7 @Param: [] @Return:
     * java.util.Map<java.lang.String,java.util.List<com.pms.vo.EchDepartmentSalary>>
     */
    List<EchDepartmentSalary> echDepartmentSalaryList = new ArrayList<>();

    Map<String, List<EchDepartmentSalary>> stringListMap = new HashMap<>();

    List<Department> departmentList = (List<Department>) departmentMapper.selectAll();
    // 遍历所有部门
    for (Department department : departmentList) {
      EchDepartmentSalary echDepartmentSalary = new EchDepartmentSalary();
      // 填入部门名称
      echDepartmentSalary.setDepartment(department.getdName());
      // 查找每个部门最高，平均，最低工资,并用vo类echSalary接收
      EchSalary echSalary = salaryMapper.selectSalaryByDepartment(department.getdId(), date);
      // 查找不到数据，则赋值为0
      if (echSalary == null) {
        echSalary = new EchSalary(0.00, 0.00, 0.00);
      }
      // 填入每个部门最高，平均，最低工资
      List<Double> salary = new ArrayList<Double>();
      salary.add(echSalary.getMinSalary());
      salary.add(echSalary.getAvgSalary());
      salary.add(echSalary.getMaxSalary());

      echDepartmentSalary.setSalary(salary);
      // 填入一条数据（department,salary[10,20,30]）到VO
      echDepartmentSalaryList.add(echDepartmentSalary);
    }
    stringListMap.put("list", echDepartmentSalaryList);
    return stringListMap;
  }

  @Override
  public Map<String, List<EchSalaryPercent>> getSalaryPercent(String date, int state) {
    List<EchSalaryPercent> echSalaryPercentList = new ArrayList<>();
    Map<String, List<EchSalaryPercent>> map = new HashMap<>();
    List<Department> departmentList = (List<Department>) departmentMapper.selectAll();
    // 遍历所有部门
    for (Department department : departmentList) {
      EchSalaryPercent echSalaryPercent = new EchSalaryPercent();
      // 填入部门名称
      echSalaryPercent.setDepartment(department.getdName());
      // 查找每个部门工资总数,并用vo类echSalaryDepartment接收
      // 时间为年月
      Double allSalary = 0.00;
      if (state == 0) {
        allSalary = salaryMapper.selectAllSalaryByDepartment(department.getdId(), date);
      } else {
        allSalary = salaryMapper.selectAllSalaryByDepAndYear(department.getdId(), date);
      }
      // 查找不到数据，则赋值为0
      if (allSalary == null) {
        allSalary = 0.00;
      }
      // 填入每个部门工资总数
      echSalaryPercent.setSalary(allSalary);
      // 填入一条数据到VO
      echSalaryPercentList.add(echSalaryPercent);
    }
    map.put("list", echSalaryPercentList);
    return map;
  }

  @Override
  public Map<String, List<EchMonthSalary>> getMonthSalary() {
    List<EchMonthSalary> echMonthSalaryList = new ArrayList<>();
    Map<String, List<EchMonthSalary>> stringListMap = new HashMap<>();

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
    // 当前年
    Integer year = Integer.parseInt(sdf.format(new Date()));
    String date = null;
    // 近三年（不包括本年）
    for (int i = year - 2; i <= year; i++) {
      EchMonthSalary echMonthSalary = new EchMonthSalary();
      echMonthSalary.setYear(i + "年");
      List<Double> salary = new ArrayList<Double>();
      for (int month = 1; month <= 12; month++) {
        if (month < 10) {
          date = i + "-0" + month;
        } else {
          date = i + "-" + month;
        }
        // 查找某年某一月的总工资
        Double ymSalary = salaryMapper.selectAllSalaryByDate(date);
        if (ymSalary == null) {
          ymSalary = 0.00;
        }
        salary.add(ymSalary);
      }
      echMonthSalary.setSalary(salary);
      echMonthSalaryList.add(echMonthSalary);
    }
    stringListMap.put("list", echMonthSalaryList);
    return stringListMap;
  }
}
