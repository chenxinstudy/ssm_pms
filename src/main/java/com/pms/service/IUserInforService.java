package com.pms.service;

import com.pms.exception.CustomException;
import com.pms.po.Employee;
import com.pms.vo.EmployeeCustomVo;
import com.pms.po.Salary;
import com.pms.po.SystemManager;

import java.util.List;

/**
 * @program: ssm
 * @Author：admin
 * @Description：
 * @Date：20:31 2022/3/6
 * @Version: 1.0
 */
public interface IUserInforService {
    public void updateSystemManagePassword(int id, SystemManager systemManager);
    public void updateEmployeePassword(int id, String oldPassword, String newPassword) throws CustomException;
    public EmployeeCustomVo getInforEmployee(int id);
    public int  updateEmployeeById(int id, Employee employee);
    // 查找员工个人的某年工资记录
    public List<Salary> getEmployeeSalaryList(int eId, String year);
}
