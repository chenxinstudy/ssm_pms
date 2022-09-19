package com.pms.service.impl;

import com.pms.dao.KeyValueMapper;
import com.pms.po.KeyValue;
import com.pms.service.IKeyValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KeyValueServiceImpl implements IKeyValueService {
    @Autowired
    private KeyValueMapper keyValueMapper;

    @Override
    public KeyValue getKeyValueById(int id) throws Exception{
        return keyValueMapper.selectByPrimaryKey(id);
    }

    @Override
    public KeyValue selectBykvKey(String key) throws Exception {
        return keyValueMapper.selectBykvKey(key);
    }

    @Override
    public int updateByPrimaryKey(KeyValue kv) throws Exception {
        return keyValueMapper.updateByPrimaryKey(kv);
    }
}
