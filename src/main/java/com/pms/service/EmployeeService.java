package com.pms.service;

import com.pms.po.Employee; /**
 * @Author: cx
 * @Date: 2022/3/10 15:20
 */
public interface EmployeeService {
    void deleteByPrimaryKey(int id);

    void deleteByQuery(int[] ids);

    void insert(Employee employee);

    Employee findByeAccount(String eAccount);

    void updateByPrimaryKeySelective(Employee employee);
}
