package com.pms.service.impl;

import com.pms.dao.*;
import com.pms.exception.CustomException;
import com.pms.po.Employee;
import com.pms.po.MonthlyAttendance;
import com.pms.po.Salary;
import com.pms.service.ISalaryService;
import com.pms.vo.SalaryPages;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: ssm @Author：admin @Description： @Date：23:23 2022/3/9 @Version: 1.0
 */
@Service
public class SalaryServiceImpl implements ISalaryService {
  @Autowired private SalaryMapper salaryMapper;
  @Autowired private MonthlyAttendanceMapper monthlyAttendanceMapper;
  @Autowired private EmployeeMapper employeeMapper;
  @Autowired private RankBonusMapper rankBonusMapper;
  @Autowired private PositionMapper positionMapper;
  @Autowired private WorkingYearsBonusMapper workingYearsBonusMapper;
  @Autowired private KeyValueMapper keyValueMapper;
  @Autowired private DepartmentMapper departmentMapper;

  /**
   * 根据员工工号和月份精准发放
   *
   * @param eAccount
   * @param date
   * @throws CustomException
   */
  @Override
  public void insertSalaryByAcountAndDate(String eAccount, String date) throws CustomException {

    Employee employee = null;
    employee = employeeMapper.selectByAccount(eAccount);
    if (employee == null) {
      throw new CustomException("此工号不存在");
    } else {
      if (salaryMapper.selectByEidAndTimeAndStatus(employee.geteId(), date, 1) != null) {
        throw new CustomException("本工号的此月工资已发放，不能再结算");
      } else {
        insertSalary(employee, date);
      }
    }
  }

  /**
   * 根据月份发放所有员工工资
   *
   * @param date
   * @throws CustomException
   */
  @Override
  public void insertSalaryAllByDate(String date) throws CustomException {
    List<Salary> salaryList = salaryMapper.selectByeTimeAndStatus(date, 1);
    if (salaryList.size() >= 1) {
      throw new CustomException("此月工资已发放,不能再进行工资结算");
    } else {
      List<Employee> employeeList = null;
      employeeList = employeeMapper.selectAll();
      for (Employee employee : employeeList) {
        insertSalary(employee, date);
      }
    }
  }

  /**
   * 通过提供员工和计算某年某月的工资时间，计算员工工资
   * @param employee
   * @param date
   */
  private void insertSalary(Employee employee, String date) {
    // 按照年月和工号查出这个员工的考勤记录，
    // 1.考勤存在就计算考勤
    // 2.考勤不存在即为0

    MonthlyAttendance monthlyAttendance =
        monthlyAttendanceMapper.selectByeIdAndDate(employee.geteId(), date);
    // 判断数据库是否存在
    Salary salarySelect = salaryMapper.selectByEidAndTimeAndStatus(employee.geteId(), date, 0);

    Salary salary = new Salary();

    DateFormat format1 = new SimpleDateFormat("yyyy-MM");
    Date dateNew = null;

    salary.setEmployee(employee);

    salary.setDepartment(departmentMapper.selectByPrimaryKey(employee.getdId()));
    try {
      dateNew = format1.parse(date);
    } catch (ParseException e) {
      e.printStackTrace();
    }
    // 工资日期
    salary.setsTime(dateNew);
    Double basePay = employee.geteBasePay();
    // 基本工资
    salary.setBasePay(basePay);

    if (monthlyAttendance != null) {
      // 计算考勤
      // 迟到
      double late_buckle_pay = keyValueMapper.selectBykvKey("late_buckle_pay").getKvValue();
      // 早退
      double early_buckle_pay = keyValueMapper.selectBykvKey("early_buckle_pay").getKvValue();
      // 出差补贴
      double missionallowance = keyValueMapper.selectBykvKey("missionallowance").getKvValue();
      // 全勤奖
      double full_attendance_pay = keyValueMapper.selectBykvKey("full_attendance_pay").getKvValue();
      // 迟到罚金
      salary.setLatePay(monthlyAttendance.getLateNum() * late_buckle_pay);
      // 早退罚金
      salary.setEarlyPay(monthlyAttendance.getEarlyNum() * early_buckle_pay);

      double x = basePay / 21.75 / 8;

      double overTimePay =
          x * monthlyAttendance.getOvertimeHour() * 1.5
              + x * monthlyAttendance.getWeekendHour() * 2
              + x * monthlyAttendance.getHolidayHour() * 3;
      // 加班补贴
      salary.setOvertimePay(overTimePay);

      // 病假大于3天扣钱
      if (monthlyAttendance.getSickLeaveNum() > 3) {
        salary.setSickPay((monthlyAttendance.getSickLeaveNum() - 3) * (-30.00));
      } else {
        salary.setSickPay(0.00);
      }
      // 大于3天扣钱
      if (monthlyAttendance.getSickLeaveNum() > 2) {
        // 事假扣钱
        salary.setThingPay((monthlyAttendance.getCompassionateLeaveNum() - 2) * (-50.00));
      } else {
        salary.setThingPay(0.00);
      }
      // 出差补贴
      salary.setBusinessTravelPay(monthlyAttendance.getCompassionateLeaveNum() * missionallowance);
      // 全勤奖励
      if (monthlyAttendance.getAbsenceNum() < 1) {
        salary.setFullAttendancePay(full_attendance_pay);
      } else {
        salary.setFullAttendancePay(0.00);
      }
    } else {
      // 不用计算考勤
      // 迟到罚金
      salary.setLatePay(0.00);
      // 早退罚金
      salary.setEarlyPay(0.00);
      // 加班补贴
      salary.setOvertimePay(0.00);
      // 病假扣钱
      salary.setSickPay(0.00);
      // 事假扣钱
      salary.setThingPay(0.00);
      // 出差补贴
      salary.setBusinessTravelPay(0.00);
      // 全勤奖励
      salary.setFullAttendancePay(0.00);
    }
    // 餐饮补贴
    double food_pay = keyValueMapper.selectBykvKey("food_pay").getKvValue();
    // 交通补贴
    double traffic_pay = keyValueMapper.selectBykvKey("traffic_pay").getKvValue();
    // 餐饮补贴
    salary.setFoodPay(food_pay);
    // 交通补贴
    salary.setTrafficPay(traffic_pay);
    // 岗位补贴
    salary.setPostPay(positionMapper.selectByPrimaryKey(employee.getpId()).getpPostPay());
    // 职称补贴
    salary.setRankPay(
        (double) (rankBonusMapper.selectByPrimaryKey(employee.geteRank()).getRbBonus()));

    long dateSum = (dateNew.getTime() - employee.geteEntryTime().getTime());
    int years = (int) (dateSum / 31536000 / 1000);
    try {
      // 工龄补贴
      salary.setWorkingYearPay(workingYearsBonusMapper.findByYear(years).getWybBonus());
    } catch (Exception e) {
      salary.setWorkingYearPay(0.00);
    }

    // 养老保险
    salary.setPersionPay(-(basePay * 0.08));
    // 医疗保险
    salary.setMedicalPay(-(basePay * 0.02 + 10));
    // 失业保险
    salary.setUnemploymentPay(-(basePay * 0.01));
    // 工伤保险
    salary.setInjuryPay(0.00);
    // 生育保险
    salary.setBirthPay(0.00);
    // 住房公积金
    salary.setHousingPay(-(basePay * 0.08));

    if (salarySelect != null) {
      // 补发金额
      salary.setRissuePay(salarySelect.getRissuePay());
    } else {
      // 补发金额
      salary.setRissuePay(0.00);
    }

    // shouldPay 应发金额 10项
    double shouldPay =
        salary.getBasePay()
            + salary.getFoodPay()
            + salary.getPostPay()
            + salary.getWorkingYearPay()
            + salary.getRankPay()
            + salary.getTrafficPay()
            + salary.getOvertimePay()
            + salary.getBusinessTravelPay()
            + salary.getFullAttendancePay()
            + salary.getRissuePay();

    // 五险一金扣费 6项
    double insurances =
        salary.getPersionPay()
            + salary.getMedicalPay()
            + salary.getUnemploymentPay()
            + salary.getInjuryPay()
            + salary.getBirthPay()
            + salary.getHousingPay();

    // 考勤扣费 4项
    double attendance =
        salary.getLatePay() + salary.getEarlyPay() + salary.getSickPay() + salary.getThingPay();

    double incomeTax = 0;

    // 纳税超额部分
    double taxable = shouldPay + insurances + attendance - salary.getBusinessTravelPay() - 3500;

    if (0 < taxable && taxable <= 1500) {
      incomeTax = taxable * 0.03;
    } else if (1500 < taxable && taxable <= 4500) {
      incomeTax = taxable * 0.1 - 105;
    } else if (4500 < taxable && taxable <= 9000) {
      incomeTax = taxable * 0.2 - 555;
    } else if (9000 < taxable && taxable <= 35000) {
      incomeTax = taxable * 0.25 - 1005;
    } else if (35000 < taxable && taxable <= 55000) {
      incomeTax = taxable * 0.3 - 2755;
    } else if (55000 < taxable && taxable <= 80000) {
      incomeTax = taxable * 0.35 - 5505;
    } else if (80000 < taxable) {
      incomeTax = taxable * 0.45 - 13505;
    }
    // 个人所得税
    salary.setIndividualIncomeTax(-incomeTax);

    // 应发工资
    salary.setShouldPay(shouldPay);
    // 实发工资
    salary.setActualPay(shouldPay + insurances + attendance - incomeTax);
    // 工资状态未发
    salary.setsState(0);

    if (salarySelect != null) {
      salary.setsId(salarySelect.getsId());
      salaryMapper.updateByPrimaryKeySelective(salary);
    } else {
      salaryMapper.insertSelective(salary);
    }
  }

  @Override
  public SalaryPages selectSalaryByEaccountDIdDate(
      Integer pageNum, Integer limit, String eAccount, Integer dId, String sTime) {
    Map<String, Object> map = new HashMap<>();
    map.put("eAccount", eAccount);
    map.put("dId", dId);
    map.put("sTime", sTime);
    // pageNum:起始页面  pageSize:每页的大小
    PageHelper.startPage(pageNum, limit);
    // 查找条件，一定要紧跟在startPage后
    // 获取满足条件的数据
    List<Salary> salaries = salaryMapper.selectByEaccountDIdDate(map);
    PageInfo pageResult = new PageInfo(salaries);
    // 返回layui表格要求的格式数据
    return new SalaryPages(0, "", (int) pageResult.getTotal(), pageResult.getList());
  }

  /**
   * 删除工资项目
   *
   * @param ids
   */
  @Override
  public void deleteSalaryByEid(int[] ids) {
    for (int i : ids) {
      salaryMapper.deleteByPrimaryKey(i);
    }
  }

  /**
   * 发放工资。其实就是更新state=1 已发
   *
   * @param ids
   */
  @Override
  public void updateSalaryBySid(int[] ids) {
    Salary salary = new Salary();
    for (int i : ids) {
      salary.setsId(i);
      salary.setsState(1);
      salaryMapper.updateByPrimaryKeySelective(salary);
    }
  }

  /**
   * 根据条件查询工资 且状态是未发工资的
   *
   * @param pageNum
   * @param limit
   * @param eAccount
   * @param dId
   * @param sTime
   * @return
   */
  @Override
  public SalaryPages selectSalaryByEaccountDIdDateState(
      int pageNum, int limit, String eAccount, Integer dId, String sTime) {
    Map<String, Object> map = new HashMap<>();
    map.put("eAccount", eAccount);
    map.put("dId", dId);
    map.put("sTime", sTime);
    // pageNum:起始页面  pageSize:每页的大小
    PageHelper.startPage(pageNum, limit);
    // 查找条件，一定要紧跟在startPage后
    // 获取满足条件的数据
    List<Salary> salaries = salaryMapper.selectByEaccountDIdDateState(map);
    PageInfo pageResult = new PageInfo(salaries);
    // 返回前端需要的数据
    return new SalaryPages(0, "", (int) pageResult.getTotal(), pageResult.getList());
  }

  /**
   * 修改其他工资项目
   *
   * @param sId
   * @param rissuePay
   */
  @Override
  public void updateSalaryByEidAndRissuePay(int sId, double rissuePay) {
    Salary salary = salaryMapper.selectByPrimaryKey(sId);
    salary.setRissuePay(rissuePay);
    // shouldPay 应发金额 10项
    double shouldPay =
        salary.getBasePay()
            + salary.getFoodPay()
            + salary.getPostPay()
            + salary.getWorkingYearPay()
            + salary.getRankPay()
            + salary.getTrafficPay()
            + salary.getOvertimePay()
            + salary.getBusinessTravelPay()
            + salary.getFullAttendancePay()
            + salary.getRissuePay();

    // 五险一金扣费 6项
    double insurances =
        salary.getPersionPay()
            + salary.getMedicalPay()
            + salary.getUnemploymentPay()
            + salary.getInjuryPay()
            + salary.getBirthPay()
            + salary.getHousingPay();

    // 考勤扣费 4项
    double attendance =
        salary.getLatePay() + salary.getEarlyPay() + salary.getSickPay() + salary.getThingPay();

    double incomeTax = 0;
    // 纳税超额部分
    double taxable = shouldPay + insurances + attendance - salary.getBusinessTravelPay() - 3500;
    if (0 < taxable && taxable <= 1500) {
      incomeTax = taxable * 0.03;
    } else if (1500 < taxable && taxable <= 4500) {
      incomeTax = taxable * 0.1 - 105;
    } else if (4500 < taxable && taxable <= 9000) {
      incomeTax = taxable * 0.2 - 555;
    } else if (9000 < taxable && taxable <= 35000) {
      incomeTax = taxable * 0.25 - 1005;
    } else if (35000 < taxable && taxable <= 55000) {
      incomeTax = taxable * 0.3 - 2755;
    } else if (55000 < taxable && taxable <= 80000) {
      incomeTax = taxable * 0.35 - 5505;
    } else if (80000 < taxable) {
      incomeTax = taxable * 0.45 - 13505;
    }

    // 修改个人所得税
    salary.setIndividualIncomeTax(-incomeTax);

    // 修改应发工资
    salary.setShouldPay(shouldPay);

    // 修改实发工资
    salary.setActualPay(shouldPay + insurances + attendance - incomeTax);

    salaryMapper.updateByPrimaryKeySelective(salary);
  }
}
