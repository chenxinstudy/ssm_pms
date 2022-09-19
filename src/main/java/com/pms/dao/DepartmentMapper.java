package com.pms.dao;

import com.pms.po.Department;

import java.util.List;

/**
 * @author 酷酷的鑫
 */
public interface DepartmentMapper {
    int deleteByPrimaryKey(Integer dId);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer dId);

    List<Department> selectAll();

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);

    List<Department> findSelective(Department department);

    void deleteByQuery(int[] ids);

    Department findByDname(String d_name);
}