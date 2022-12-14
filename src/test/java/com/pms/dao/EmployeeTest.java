package com.pms.dao;

import com.pms.po.Employee;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class EmployeeTest {
    @Autowired
    private EmployeeMapper employeeMapper = null;

    @Test
    public void  testselectByPrimaryKey(){
        Employee employee = employeeMapper.selectByPrimaryKey(1);
        System.out.println(employee.toString());
    }
}
