package com.pms.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.pms.exception.CustomException;
import com.pms.service.impl.SalaryServiceImpl;
import com.pms.vo.SalaryPages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 酷酷的鑫
 */
@Controller
public class SalaryController {

  @Autowired private SalaryServiceImpl salaryService;
  /**
   * 根据月份发放所有员工工资
   *
   * @param date
   * @return
   */
  @RequestMapping("salarySettlementAll.do")
  @ResponseBody
  public Map<String, String> salarySettlementAll(String date) {
    Map<String, String> stringMap = new HashMap<>();
    try {
      salaryService.insertSalaryAllByDate(date);
      stringMap.put("msg", "工资结算完成");
      return stringMap;
    } catch (CustomException e) {
      stringMap.put("msg", e.getMessage());
      return stringMap;
    }
  }

  /**
   * 根据员工工号和月份精准发放
   * @param eAccount
   * @param date
   * @return
   */
  @RequestMapping("salarySettlementByAcount.do")
  @ResponseBody
  public Map<String, String> salarySettlementByAcount(String eAccount, String date) {
    Map<String, String> stringMap = new HashMap<>();
    try {
      salaryService.insertSalaryByAcountAndDate(eAccount, date);
      stringMap.put("msg", "工资结算完成");
      return stringMap;
    } catch (CustomException e) {
      stringMap.put("msg", e.getMessage());
      return stringMap;
    }
  }

  /**
   * @Description 删除工资项目
   * @Param [ids]
   * @return int
   * @Author Mr Chen
   */
  @RequestMapping("deleteSalaryByEid.do")
  @ResponseBody
  public int deleteSalaryByEid(@RequestParam(value = "arr") int[] ids) {
    salaryService.deleteSalaryByEid(ids);
    return 1;
  }

  /** 发放工资项目 */
  @RequestMapping("issueSalaryByEid.do")
  @ResponseBody
  public void issueSalaryByEid(@RequestParam(value = "arr") int[] ids) {
    salaryService.updateSalaryBySid(ids);
  }

  /**
   * 根据条件查询表格 //produces 返回值为json 字符集编码utf-8
   *
   * @param pageNum
   * @param limit
   * @param eAccount
   * @param dId
   * @param sTime
   * @return
   */
  @RequestMapping(
      value = "selectSalaryByEaccountDIdDate.do",
      produces = "application/json;charset=utf-8")
  @ResponseBody
  public String selectSalaryByEaccountDIdDate(
      @RequestParam(value = "page", defaultValue = "1") int pageNum,
      @RequestParam(value = "limit", defaultValue = "5") int limit,
      String eAccount,
      Integer dId,
      String sTime) {
    SalaryPages salaryPages =
        salaryService.selectSalaryByEaccountDIdDate(pageNum, limit, eAccount, dId, sTime);
    // 使用fastjson以字符串形式返回数据
    JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM";
    return JSON.toJSONString(salaryPages, SerializerFeature.WriteDateUseDateFormat);
  }

  /**
   * 根据条件查询工资 且状态是未发工资的
   *
   * @param pageNum
   * @param limit
   * @param eAccount
   * @param dId
   * @param sTime
   * @return
   */
  @RequestMapping(
      value = "selectSalaryByEaccountDIdDateState.do",
      produces = "application/json;charset=utf-8")
  @ResponseBody
  public String selectSalaryByEaccountDIdDateState(
      @RequestParam(value = "page", defaultValue = "1") int pageNum,
      @RequestParam(value = "limit", defaultValue = "5") int limit,
      String eAccount,
      Integer dId,
      String sTime) {
    SalaryPages salaryPages =
        salaryService.selectSalaryByEaccountDIdDateState(pageNum, limit, eAccount, dId, sTime);
    // 使用fastjson以字符串形式返回数据
    JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM";
    return JSON.toJSONString(salaryPages, SerializerFeature.WriteDateUseDateFormat);
  }

  /**
   * 其他工资修改
   *
   * @param sId
   * @param rissuePay
   */
  @RequestMapping(value = "updateSalaryByEidAndRissuePay.do")
  @ResponseBody
  public void updateSalaryByEidAndRissuePay(int sId, double rissuePay) {
    salaryService.updateSalaryByEidAndRissuePay(sId, rissuePay);
  }
}
