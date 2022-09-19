package com.pms.dao;

import com.pms.vo.MonthlyAttendanceCustomVo;

import java.util.List;
import java.util.Map;

/**
 * @program: ssm
 * @Author：admin
 * @Description：
 * @Date：10:47 2022/3/9
 * @Version: 1.0
 */
public interface  MonthlyAttendanceCustomVoMapper {
    public List<MonthlyAttendanceCustomVo>
    selectMonthlyAttendanceCustomVoMapperByeAccountAnddIdAndTime(Map<String,Object> map);

    MonthlyAttendanceCustomVo selectVoByPrimaryKey(int id);
}
