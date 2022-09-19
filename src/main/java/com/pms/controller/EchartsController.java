package com.pms.controller;

import com.pms.service.IEchartsService;
import com.pms.vo.EchDepartmentSalary;
import com.pms.vo.EchEmployeeNums;
import com.pms.vo.EchMonthSalary;
import com.pms.vo.EchSalaryPercent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
/**
 * @Author: cx
 * @Description: 图表制作类
 * @Date: 22:24 2022/3/6
 */
@Controller
public class EchartsController {
  @Autowired
  private IEchartsService echartsService;

  @RequestMapping(value = "/showEmployeeNums.do")
  @ResponseBody
  public Map<String, List<EchEmployeeNums>> showEmployeeNums() {
    /*
     * 各部门的员工数量柱状图的数据
     * json格式{"list":[{"department":"人事部","num":480},{"department":"行政部","num":380}]}
     */
    return echartsService.getEmployeeNums();
  }

  /**
   * 展示部门的薪资
   * @param date
   * @return
   */
  @RequestMapping(value = "/showDepartmentSalary.do")
  @ResponseBody
  public Map<String, List<EchDepartmentSalary>> showDepartmentSalary(String date) {
    return echartsService.getDepartmentSalary(date);
  }

  @RequestMapping(value = "/showSalaryPercent.do")
  @ResponseBody
  public Map<String, List<EchSalaryPercent>> showSalaryPercent(String date, int state) {
    return echartsService.getSalaryPercent(date, state);
  }

  @RequestMapping(value = "/showMonthSalary.do")
  @ResponseBody
  public Map<String, List<EchMonthSalary>> showMonthSalary() {
    return echartsService.getMonthSalary();
  }
}
