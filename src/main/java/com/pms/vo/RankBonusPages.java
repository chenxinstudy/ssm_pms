package com.pms.vo;

import com.pms.po.RankBonus;

import java.util.List;


/**
 * @author 酷酷的鑫
 *
 * @Description RankBonusPages
 */
public class RankBonusPages {
    Integer code;
    String msg;
    Integer count;
    List<RankBonus> data;

    @Override
    public String toString() {
        return "RankBonusPages{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", count=" + count +
                ", data=" + data +
                '}';
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public List<RankBonus> getData() {
        return data;
    }

    public void setData(List<RankBonus> data) {
        this.data = data;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }
}
