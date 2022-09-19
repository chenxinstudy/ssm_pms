package com.pms.service;

import com.pms.exception.CustomException;
import com.pms.po.Employee;
import com.pms.po.SystemManager;


/**
 * @author ILoginService
 */
public interface ILoginService {
  /**
  *根据员工工号和密码查找
  */
  Employee findEmployeeByIdAndPassword(String account, String password) throws CustomException;

  /**
   *根据管理员帐号和密码查找
   */
  SystemManager findSystemManagerByIdAndPassword(String account, String password)
      throws CustomException;

  /**
   *根据员工id查找
   */
  Employee findEmployeeById(int id);

  /**
   *根据管理员id查找
   */
  SystemManager findSystemManagerById(int id);
}
