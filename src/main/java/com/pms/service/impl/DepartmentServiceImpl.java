package com.pms.service.impl;

import com.pms.dao.DepartmentMapper;
import com.pms.po.Department;
import com.pms.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 酷酷的鑫
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    public DepartmentMapper departmentMapper;

    @Override
    public Department selectByPrimaryKey(int id) {
       return departmentMapper.selectByPrimaryKey(id);
    }

    @Override
    public int insertSelective(Department department) {
        return departmentMapper.insertSelective(department);
    }

    @Override
    public void updateByPrimaryKeySelective(Department department) {
        departmentMapper.updateByPrimaryKeySelective(department);
    }

    @Override
    public void deleteByPrimaryKey(int id) {
        departmentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Department> findSelective(Department department) {
        return departmentMapper.findSelective(department);
    }

    @Override
    public void deleteByQuery(int[] ids) {
        departmentMapper.deleteByQuery(ids);
    }

    @Override
    public Department findByDname(String d_name) {
        return departmentMapper.findByDname(d_name);
    }
}
