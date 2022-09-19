package com.pms.dao;

import com.pms.po.SystemManager;

public interface SystemManagerMapper {
    int deleteByPrimaryKey(Integer smId);

    int insert(SystemManager record);

    int insertSelective(SystemManager record);

    /**
    *根据管理员id查找
    */
    SystemManager selectByPrimaryKey(Integer smId);

    int updateByPrimaryKeySelective(SystemManager record);

    /**
    *根据主键更新管理员
    */
    int updateByPrimaryKey(SystemManager record);

    /**
    *根据管理员帐号和密码查找
    */
    SystemManager selectByAccountAndPassword(SystemManager systemManager);
}