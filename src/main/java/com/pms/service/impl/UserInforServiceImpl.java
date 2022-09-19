package com.pms.service.impl;

import com.pms.dao.*;
import com.pms.exception.CustomException;
import com.pms.po.*;
import com.pms.service.IUserInforService;
import com.pms.utils.MD5Utils;
import com.pms.vo.EmployeeCustomVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: ssm
 * @Author：admin
 * @Description：
 * @Date：20:31 2022/3/6
 * @Version: 1.0
 */
@Service
public class UserInforServiceImpl implements IUserInforService {
    @Autowired
    private SystemManagerMapper systemManagerMapper;
    @Autowired
    private EmployeeMapper employeeMapper;
    @Autowired
    private RankBonusMapper rankBonusMapper;
    @Autowired
    private PositionMapper positionMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private EmployeeCustomVoMapper employeeCustomVoMapper;
    @Autowired
    private SalaryMapper salaryMapper;
    /**
    *修改管理员密码
    */
    @Override
    public void updateSystemManagePassword(int id, SystemManager systemManager) {
        systemManagerMapper.updateByPrimaryKey(systemManager);
    }

    /**
     *修改员工密码
     */
    @Override
    public void updateEmployeePassword(int id, String oldPassword, String newPassword) throws CustomException {
        Employee employee = employeeMapper.selectByPrimaryKey(id);
        String encodeOld = MD5Utils.encodeByMD5(oldPassword);
        if (encodeOld.equals(employee.getePassword())) {
            String encodeNew = MD5Utils.encodeByMD5(newPassword);
            employee.setePassword(encodeNew);
            employeeMapper.updateByPrimaryKeySelective(employee);
        } else {
            throw new CustomException("原密码错误");
        }
    }

    @Override
    public EmployeeCustomVo getInforEmployee(int id) {
//        EmployeeCustomVo employeeCustomVo = new EmployeeCustomVo();
//        Employee employee = employeeMapper.selectByPrimaryKey(id);
//        Department department = departmentMapper.selectByPrimaryKey(employee.getdId());
//        Position position = positionMapper.selectByPrimaryKey(employee.getpId());
//        RankBonus rankBonus = rankBonusMapper.selectByPrimaryKey(employee.geteRank());
//        employeeCustomVo.setEmployee(employee);
//        employeeCustomVo.setDepartment(department);
//        employeeCustomVo.setPosition(position);
//        employeeCustomVo.setRankBonus(rankBonus);
        return employeeCustomVoMapper.selectEmployeeById(id);
    }

    @Override
    public int updateEmployeeById(int id, Employee employee)  {
        int i = employeeMapper.updateByPrimaryKeySelective(employee);
        if (i == 1) {
            return 1;
        } else {
            return 0;
        }
    }

    @Override
    public List<Salary> getEmployeeSalaryList(int eId, String year) {
        if ("1".equals(year)){
            return  salaryMapper.selectByeId(eId);
        }else {
                return salaryMapper.selectEmployeeSalaryList(eId,year);
        }
    }
}
