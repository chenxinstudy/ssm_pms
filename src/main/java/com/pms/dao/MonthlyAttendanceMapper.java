package com.pms.dao;

import com.pms.po.MonthlyAttendance;

import java.util.List;
import java.util.Map;

public interface MonthlyAttendanceMapper {
    int deleteByPrimaryKey(Integer maId);

    int insert(MonthlyAttendance record);

    int insertSelective(MonthlyAttendance record);

    MonthlyAttendance selectByPrimaryKey(Integer maId);

    int updateByPrimaryKeySelective(MonthlyAttendance record);

    int updateByPrimaryKey(MonthlyAttendance record);

    /**
     * 根据员工id和月份查询员工考勤
     * @param eId
     * @param date
     * @return
     */
    MonthlyAttendance selectByeIdAndDate(int eId, String date);

    void deleteByQuery(int[] ids);

    List<MonthlyAttendance> selectMonthlyAttendanceMapperByeEidAndTime (Map<String, Object> map);
}