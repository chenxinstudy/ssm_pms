package com.pms.dao;

import com.pms.po.KeyValue;

public interface KeyValueMapper {
    int deleteByPrimaryKey(Integer kvId);

    int insert(KeyValue record);

    int insertSelective(KeyValue record);

    KeyValue selectByPrimaryKey(Integer kvId);

    int updateByPrimaryKeySelective(KeyValue record);

    int updateByPrimaryKey(KeyValue record);

    KeyValue selectBykvKey(String kvKey);
}