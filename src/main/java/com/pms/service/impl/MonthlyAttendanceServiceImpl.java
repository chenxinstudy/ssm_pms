package com.pms.service.impl;

import com.pms.dao.MonthlyAttendanceMapper;
import com.pms.po.MonthlyAttendance;
import com.pms.service.IMonthlyAttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: cx
 * @Date: 2022/3/9 8:52
 */
@Service
public class MonthlyAttendanceServiceImpl implements IMonthlyAttendanceService {
    @Autowired
    private MonthlyAttendanceMapper monthlyAttendanceMapper;
    public MonthlyAttendance t(int id) {
        return monthlyAttendanceMapper.selectByPrimaryKey(id);
    }

    @Override
    public void deleteByPrimaryKey(int id) {
        monthlyAttendanceMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void deleteByQuery(int[] ids) {
        monthlyAttendanceMapper.deleteByQuery(ids);
    }

    @Override
    public MonthlyAttendance selectByPrimaryKey(int id) {
        return monthlyAttendanceMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateByPrimaryKeySelective(MonthlyAttendance monthlyAttendance) {
        monthlyAttendanceMapper.updateByPrimaryKeySelective(monthlyAttendance);
    }
}
