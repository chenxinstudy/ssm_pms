package com.pms.po;

/**
 * @author 酷酷的鑫
 * @Description 管理员实体类
 */
public class SystemManager {

  /** 管理员主键id */
  private Integer smId;

  /** 管理员账户名称 */
  private String smAccount;

  /** 管理员密码 */
  private String smPassword;

  public Integer getSmId() {
    return smId;
  }

  public void setSmId(Integer smId) {
    this.smId = smId;
  }

  public String getSmAccount() {
    return smAccount;
  }

  public void setSmAccount(String smAccount) {
    this.smAccount = smAccount == null ? null : smAccount.trim();
  }

  public String getSmPassword() {
    return smPassword;
  }

  public void setSmPassword(String smPassword) {
    this.smPassword = smPassword == null ? null : smPassword.trim();
  }

  @Override
  public String toString() {
    return "SystemManager{"
        + "smId="
        + smId
        + ", smAccount='"
        + smAccount
        + '\''
        + ", smPassword='"
        + smPassword
        + '\''
        + '}';
  }
}
