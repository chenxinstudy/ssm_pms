package com.pms.dao;

import com.pms.po.Employee;

import java.util.List;

/**
 * @author EmployeeMapper
 */
public interface EmployeeMapper {
    int deleteByPrimaryKey(Integer eId);

    int insert(Employee record);

    int insertSelective(Employee record);

  /**
   * 根据员工主键id查找
   */
  Employee selectByPrimaryKey(Integer eId);

    /**
    *批量更新员工信息
    */
    int updateByPrimaryKeySelective(Employee record);

    /**
     *根据主键全部更新员工信息
     */
    int updateByPrimaryKey(Employee record);

    /**
     * 根据员 account 员工工号 name 员工姓名查找
     */
    Employee selectByAccountAndPassword(Employee employee);

  /**
   * 统计部门员工人数
   * @param eId
   * @return
   */
    int countByDid(Integer eId);

  /**
   * 判断是否有员工依赖该工龄
   * @param eRank
   * @return
   */
  int countByRbid(Integer eRank);

    Employee selectByAccount(String eAcount);

//    void deleteByQuery(int[] ids);

    Employee findByeAccount(String eAccount);

  /**
   * 查询所有在职员工
   * @return
   */
  List<Employee> selectAll();

    int isExistEmployee(String eAccount);

    int selectEidByEaccount(String eAccount);
}