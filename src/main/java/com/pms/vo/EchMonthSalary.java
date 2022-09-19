package com.pms.vo;

import java.util.List;

/**
 * @program: ssm
 * @Author：cx
 * @Description：
 * @Date：21:28 2022/3/8
 * @Version: 1.0
 */
public class EchMonthSalary {
    private String year;
    private List<Double> salary;

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public List<Double> getSalary() {
        return salary;
    }

    public void setSalary(List<Double> salary) {
        this.salary = salary;
    }

    public EchMonthSalary(){}
    public EchMonthSalary(String year, List<Double> salary) {
        this.year = year;
        this.salary = salary;
    }
}
