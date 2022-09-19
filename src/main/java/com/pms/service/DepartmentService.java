package com.pms.service;

import com.pms.po.Department;

import java.util.List;


public interface DepartmentService {

  Department selectByPrimaryKey(int id) throws Exception;

  /**
   * @Description //TODO
   * @Param [department]
   * @return int
   * @Author Mr Chen
   * @Date 2022/5/17 15:31:05
   */
  int insertSelective(Department department) throws Exception;

  void updateByPrimaryKeySelective(Department department) throws Exception;

  void deleteByPrimaryKey(int id) throws Exception;

  List<Department> findSelective(Department department) throws Exception;

  void deleteByQuery(int[] ids);

  Department findByDname(String d_name);
}
