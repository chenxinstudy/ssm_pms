package com.pms.po;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * @author 酷酷的鑫 工资实体
 */
public class Salary {

  private Integer sId;

  private Integer eId;

  private Integer dId;

  private Employee employee;

  private Department department;

  /** 工资发放时间 2020-09-09 */
  private Date sTime;

  /** 工资发放状态 0 未发 1 已发 */
  private Integer sState;

  /** 基本工资 */
  private Double basePay;

  /** 餐引补贴 */
  private Double foodPay;

  /** 岗位补贴 */
  private Double postPay;

  /** 工作年限补贴 */
  private Double workingYearPay;

  /** 职称补贴 */
  private Double rankPay;

  /** 交通补贴 */
  private Double trafficPay;

  /** 养老保险 */
  private Double persionPay;

  /** 医疗保险 */
  private Double medicalPay;

  /** 失业保险 */
  private Double unemploymentPay;

  /** 工伤保险 */
  private Double injuryPay;

  /** 生育保险 */
  private Double birthPay;

  /** 住房公积金 */
  private Double housingPay;

  /** 迟到罚款 */
  private Double latePay;

  /** 早退罚款 */
  private Double earlyPay;

  /** 加班奖金 */
  private Double overtimePay;

  /** 病假扣额 */
  private Double sickPay;

  /** 事假扣额 */
  private Double thingPay;

  /** 出差补贴 */
  private Double businessTravelPay;

  /** 全勤补贴 */
  private Double fullAttendancePay;

  /** 补发金额 */
  private Double rissuePay;

  /** 个人所得税扣除 */
  private Double individualIncomeTax;

  /** 应发工资 */
  private Double shouldPay;

  /** 实发工资 */
  private Double actualPay;

  public Integer getsId() {
    return sId;
  }

  public void setsId(Integer sId) {
    this.sId = sId;
  }

  public Integer geteId() {
    return eId;
  }

  public void seteId(Integer eId) {
    this.eId = eId;
  }

  public Integer getdId() {
    return dId;
  }

  public void setdId(Integer dId) {
    this.dId = dId;
  }

  public Department getDepartment() {
    return department;
  }

  public void setDepartment(Department department) {
    this.department = department;
  }

  public Employee getEmployee() {
    return employee;
  }

  public void setEmployee(Employee employee) {
    this.employee = employee;
  }

  @JsonFormat(pattern = "yyyy-MM", timezone = "GMT+8")
  public Date getsTime() {
    return sTime;
  }

  public void setsTime(Date sTime) {
    this.sTime = sTime;
  }

  public Integer getsState() {
    return sState;
  }

  public void setsState(Integer sState) {
    this.sState = sState;
  }

  public Double getBasePay() {
    return basePay;
  }

  public void setBasePay(Double basePay) {
    this.basePay = basePay;
  }

  public Double getFoodPay() {
    return foodPay;
  }

  public void setFoodPay(Double foodPay) {
    this.foodPay = foodPay;
  }

  public Double getPostPay() {
    return postPay;
  }

  public void setPostPay(Double postPay) {
    this.postPay = postPay;
  }

  public Double getWorkingYearPay() {
    return workingYearPay;
  }

  public void setWorkingYearPay(Double workingYearPay) {
    this.workingYearPay = workingYearPay;
  }

  public Double getRankPay() {
    return rankPay;
  }

  public void setRankPay(Double rankPay) {
    this.rankPay = rankPay;
  }

  public Double getTrafficPay() {
    return trafficPay;
  }

  public void setTrafficPay(Double trafficPay) {
    this.trafficPay = trafficPay;
  }

  public Double getPersionPay() {
    return persionPay;
  }

  public void setPersionPay(Double persionPay) {
    this.persionPay = persionPay;
  }

  public Double getMedicalPay() {
    return medicalPay;
  }

  public void setMedicalPay(Double medicalPay) {
    this.medicalPay = medicalPay;
  }

  public Double getUnemploymentPay() {
    return unemploymentPay;
  }

  public void setUnemploymentPay(Double unemploymentPay) {
    this.unemploymentPay = unemploymentPay;
  }

  public Double getInjuryPay() {
    return injuryPay;
  }

  public void setInjuryPay(Double injuryPay) {
    this.injuryPay = injuryPay;
  }

  public Double getBirthPay() {
    return birthPay;
  }

  public void setBirthPay(Double birthPay) {
    this.birthPay = birthPay;
  }

  public Double getHousingPay() {
    return housingPay;
  }

  public void setHousingPay(Double housingPay) {
    this.housingPay = housingPay;
  }

  public Double getLatePay() {
    return latePay;
  }

  public void setLatePay(Double latePay) {
    this.latePay = latePay;
  }

  public Double getEarlyPay() {
    return earlyPay;
  }

  public void setEarlyPay(Double earlyPay) {
    this.earlyPay = earlyPay;
  }

  public Double getOvertimePay() {
    return overtimePay;
  }

  public void setOvertimePay(Double overtimePay) {
    this.overtimePay = overtimePay;
  }

  public Double getSickPay() {
    return sickPay;
  }

  public void setSickPay(Double sickPay) {
    this.sickPay = sickPay;
  }

  public Double getThingPay() {
    return thingPay;
  }

  public void setThingPay(Double thingPay) {
    this.thingPay = thingPay;
  }

  public Double getBusinessTravelPay() {
    return businessTravelPay;
  }

  public void setBusinessTravelPay(Double businessTravelPay) {
    this.businessTravelPay = businessTravelPay;
  }

  public Double getFullAttendancePay() {
    return fullAttendancePay;
  }

  public void setFullAttendancePay(Double fullAttendancePay) {
    this.fullAttendancePay = fullAttendancePay;
  }

  public Double getRissuePay() {
    return rissuePay;
  }

  public void setRissuePay(Double rissuePay) {
    this.rissuePay = rissuePay;
  }

  public Double getIndividualIncomeTax() {
    return individualIncomeTax;
  }

  public void setIndividualIncomeTax(Double individualIncomeTax) {
    this.individualIncomeTax = individualIncomeTax;
  }

  public Double getShouldPay() {
    return shouldPay;
  }

  public void setShouldPay(Double shouldPay) {
    this.shouldPay = shouldPay;
  }

  public Double getActualPay() {
    return actualPay;
  }

  public void setActualPay(Double actualPay) {
    this.actualPay = actualPay;
  }

  @Override
  public String toString() {
    return "Salary{"
        + "sId="
        + sId
        + ", eId="
        + eId
        + ", employee="
        + employee
        + ", dId="
        + dId
        + ", department="
        + department
        + ", sTime="
        + sTime
        + ", sState="
        + sState
        + ", basePay="
        + basePay
        + ", foodPay="
        + foodPay
        + ", postPay="
        + postPay
        + ", workingYearPay="
        + workingYearPay
        + ", rankPay="
        + rankPay
        + ", trafficPay="
        + trafficPay
        + ", persionPay="
        + persionPay
        + ", medicalPay="
        + medicalPay
        + ", unemploymentPay="
        + unemploymentPay
        + ", injuryPay="
        + injuryPay
        + ", birthPay="
        + birthPay
        + ", housingPay="
        + housingPay
        + ", latePay="
        + latePay
        + ", earlyPay="
        + earlyPay
        + ", overtimePay="
        + overtimePay
        + ", sickPay="
        + sickPay
        + ", thingPay="
        + thingPay
        + ", businessTravelPay="
        + businessTravelPay
        + ", fullAttendancePay="
        + fullAttendancePay
        + ", rissuePay="
        + rissuePay
        + ", individualIncomeTax="
        + individualIncomeTax
        + ", shouldPay="
        + shouldPay
        + ", actualPay="
        + actualPay
        + '}';
  }
}
