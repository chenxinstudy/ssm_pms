package com.pms.dao;

import com.pms.po.Salary;
import com.pms.vo.EchSalary;

import java.util.List;
import java.util.Map;

/**
 * @author 酷酷的鑫
 */
public interface SalaryMapper {

  /**
   * 删除工资项目
   * @param sId
   * @return
   */
  int deleteByPrimaryKey(Integer sId);

  int insert(Salary record);

  int insertSelective(Salary record);

  Salary selectByPrimaryKey(Integer sId);

  /**
   * 修改工资，根据查询条件
   * @param record
   * @return
   */
  int updateByPrimaryKeySelective(Salary record);

  int updateByPrimaryKey(Salary record);

  Salary selectByEidAndTime(Integer eId, String time);

  Double selectMaxSalaryByDepartment(Integer dId, String date);

  // 查每个最低，平均，最高工资
  EchSalary selectSalaryByDepartment(Integer dId, String date);

  // 查每个工资总数,时间年月
  Double selectAllSalaryByDepartment(Integer dId, String date);

  // 查每个工资总数,时间年
  Double selectAllSalaryByDepAndYear(Integer dId, String date);

  // 查找员工个人的某年工资记录
  List<Salary> selectEmployeeSalaryList(Integer eId, String data);

  List<Salary> selectByeId(Integer eId);

  /**
   * 根据年月时间查工资总数
   * @param date
   * @return
   */
  Double selectAllSalaryByDate(String date);

  List<Salary> test(String eAccount);

  /**
   * 根据条件查询工资
   *
   * @param map
   * @return
   */
  List<Salary> selectByEaccountDIdDate(Map<String, Object> map);

  /**
   * 根据时间月份和状态查找工资(未发放的员工才查询)
   * @param date
   * @param status
   * @return
   */
  List<Salary> selectByeTimeAndStatus(String date,int status);

  /**
   * 通过eid和状态查询薪资
   * @param eId
   * @param time
   * @param status
   * @return
   */
  Salary selectByEidAndTimeAndStatus(Integer eId, String time, int status);

  /**
   * 根据条件查询工资 且状态是未发工资的
   * @param map
   * @return
   */
  List<Salary> selectByEaccountDIdDateState(Map<String, Object> map);
}
