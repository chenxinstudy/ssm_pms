package com.pms.vo;

import com.pms.po.Position;

import java.util.List;

/**
 * @Author: cx
 *
 * @Date: 2022/3/8 16:54
 */
public class PositionPages {
    Integer code;
    String msg;
    Integer count;
    List<Position> data;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
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

    public List<Position> getData() {
        return data;
    }

    public void setData(List<Position> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "PositionPages{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", count=" + count +
                ", data=" + data +
                '}';
    }
}
