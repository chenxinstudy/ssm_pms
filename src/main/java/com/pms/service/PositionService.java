package com.pms.service;

import com.pms.po.Position;

import java.util.List;

/**
 * @Author: cx
 * @Date: 2022/3/7 8:28
 */
public interface PositionService {
    List<Position> findSelective(Position position);

    int insertSelective(Position position);

    Position findByPrimaryKey(int id);

    void updateByPrimaryKeySelective(Position position);

    void deleteByPrimaryKey(int id);

    void deleteByQuery(int[] ids);

    Position findByDname(String p_name);
}
