package com.pms.vo;

import com.pms.po.Department;
import com.pms.po.Employee;
import com.pms.po.MonthlyAttendance;


/**
 * @author 酷酷的鑫
 *
 * @Description MonthlyAttendanceCustomVo
 */
public class MonthlyAttendanceCustomVo {
    private MonthlyAttendance monthlyAttendance;
    private Employee employee;
    private Department department;

    @Override
    public String toString() {
        return "MonthlyAttendanceCustomVo{" +
                "monthlyAttendance=" + monthlyAttendance +
                ", employee=" + employee +
                ", department=" + department +
                '}';
    }

    public MonthlyAttendance getMonthlyAttendance() {
        return monthlyAttendance;
    }

    public void setMonthlyAttendance(MonthlyAttendance monthlyAttendance) {
        this.monthlyAttendance = monthlyAttendance;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
