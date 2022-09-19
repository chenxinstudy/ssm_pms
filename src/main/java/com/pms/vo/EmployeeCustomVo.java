package com.pms.vo;

import com.pms.po.Department;
import com.pms.po.Employee;
import com.pms.po.Position;
import com.pms.po.RankBonus;

/**
 * @program: ssm
 * @Author：admin
 * @Description：
 * @Date：14:31 2022/3/7
 * @Version: 1.0
 */
public class EmployeeCustomVo {

    private Employee employee;
    private RankBonus rankBonus;
    private Position position;
    private Department department;

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public RankBonus getRankBonus() {
        return rankBonus;
    }

    public void setRankBonus(RankBonus rankBonus) {
        this.rankBonus = rankBonus;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    @Override
    public String toString() {
        return "EmployeeCustomVo{" +
                "employee=" + employee +
                ", rankBonus=" + rankBonus +
                ", position=" + position +
                ", department=" + department +
                '}';
    }
}
