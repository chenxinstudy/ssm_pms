package com.pms.service;

import com.pms.po.RankBonus;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: cx
 * Date: 2022-03
 * Time: 10:22
 * Projectname:   ssm
 */
public interface IRankBonusService {
    //添加工龄奖金记录
    boolean addRankBonus(RankBonus rb);

    //删除
    boolean moveRankBonus(int rbId);

    //修改
    boolean modifyRankName(RankBonus rb);

    //查询所有
    List<RankBonus> findAll();

    //根据id查询
    RankBonus findById(int rbId);

    RankBonus findByName(String rankName);

    int CountByRbid(Integer rbid);

    int CountByName(String name);

    List<RankBonus> findSelective(RankBonus rb) throws Exception;


}
