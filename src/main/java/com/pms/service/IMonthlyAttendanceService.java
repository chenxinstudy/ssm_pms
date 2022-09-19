package com.pms.service;

import com.pms.po.MonthlyAttendance;

/**
 * @Author: cx
 * @Date: 2022/3/9 8:51
 */
public interface IMonthlyAttendanceService {
    void deleteByPrimaryKey(int id);

    void deleteByQuery(int[] ids);

    MonthlyAttendance selectByPrimaryKey(int id);

    void updateByPrimaryKeySelective(MonthlyAttendance monthlyAttendance);
}
