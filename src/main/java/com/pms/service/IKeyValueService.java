package com.pms.service;

import com.pms.po.KeyValue;

public interface IKeyValueService {
    public KeyValue getKeyValueById(int id) throws Exception;
    public KeyValue selectBykvKey(String key)throws Exception;
    public int updateByPrimaryKey(KeyValue kv)throws Exception;
}
