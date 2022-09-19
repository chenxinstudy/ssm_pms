package com.pms.service.impl;

import com.pms.dao.EmployeeMapper;
import com.pms.dao.SystemManagerMapper;
import com.pms.exception.CustomException;
import com.pms.po.Employee;
import com.pms.po.SystemManager;
import com.pms.service.ILoginService;
import com.pms.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author LoginServiceImpl
 */
@Service
public class LoginServiceImpl implements ILoginService {
  @Autowired private EmployeeMapper employeeMapper;
  @Autowired private SystemManagerMapper systemManagerMapper;

  /** 根据员 account 员工工号 name 员工姓名查找 */
  @Override
  public Employee findEmployeeByIdAndPassword(String account, String password)
      throws CustomException {
    String encode = MD5Utils.encodeByMD5(password);
    Employee employee = new Employee();
    employee.seteAccount(account);
    employee.setePassword(encode);
    // seteIsdel(1) 0 离职  1 在职
    employee.seteIsdel(1);
    Employee employee1 = employeeMapper.selectByAccountAndPassword(employee);
    if (employee1 == null) {
      throw new CustomException("没有找到改员工");
    }
    return employee1;
  }

  /** 根据管理员帐号和密码查找 */
  @Override
  public SystemManager findSystemManagerByIdAndPassword(String account, String password)
      throws CustomException {
    String encode = MD5Utils.encodeByMD5(password);
    System.out.println("encode = " + encode);
    SystemManager systemManager = new SystemManager();
    systemManager.setSmAccount(account);
    systemManager.setSmPassword(encode);
    SystemManager systemManager1 = systemManagerMapper.selectByAccountAndPassword(systemManager);
    if (systemManager1 == null) {
      throw new CustomException("管理员账号或密码错误");
    }
    return systemManager1;
  }

  /** 根据员工id查找 */
  @Override
  public Employee findEmployeeById(int id) {
    return employeeMapper.selectByPrimaryKey(id);
  }

  /** 根据管理员id查找 */
  @Override
  public SystemManager findSystemManagerById(int id) {
    return systemManagerMapper.selectByPrimaryKey(id);
  }
}
