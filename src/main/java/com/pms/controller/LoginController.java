package com.pms.controller;

import com.pms.exception.CustomException;
import com.pms.po.Employee;
import com.pms.po.SystemManager;
import com.pms.service.impl.LoginServiceImpl;
import com.pms.utils.CaptchaUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @Author: LoginController
 * @Description: 管理员和员工登陆控制
 */
@Controller
public class LoginController {
  @Autowired
  private LoginServiceImpl loginService;
  /**
  *主要调用业务功能
   * findEmployeeByIdAndPassword
   * findSystemManagerByIdAndPassword
   * findEmployeeById
  */

  /**
  *更改验证码
  */
  @RequestMapping(value = "/changeCode.do")
  @ResponseBody
  public void getIdentifyingCode(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    // 验证码存储在session的identifyingCode属性中
    CaptchaUtil.outputCaptcha(request, response);
  }

  /** 获取员工登陆界面 */
  @RequestMapping("/")
  public String getLoginPage() {
    return "employee/login.html";
  }

  /** 获取管理员登陆界面 */
  @RequestMapping("/admin.do")
  public String getAdminLoginPage() {
    //    /WEB-INF/page/  admin/adminLogin.html
    return "admin/adminLogin.html";
  }

  /**
  *员工登录
  */
  @RequestMapping(value = "/employeeLogin.do")
  @ResponseBody
  public Map<String, String> employeeLogin(
          HttpSession httpSession,
          String username,
          String password,
          String identifyingcode) {
    String code = (String) httpSession.getAttribute("identifyingCode");
    HashMap<String, String> map = new HashMap<>();
//    equals 判断内容是否相等
//    equalsIgnoreCase  忽略大小写判断内容是否相等，常用于验证码
    if (identifyingcode.equalsIgnoreCase(code)) {
      Employee employee = null;
      try {
        employee = loginService.findEmployeeByIdAndPassword(username, password);
      } catch (CustomException e) {
        map.put("msg", e.getMessage());
        map.put("status", "500");
        return map;
      }
      // 保存到session
      httpSession.setAttribute("employeeId", employee.geteId());
      map.put("url", "/ssm_pms/loginSuccess.do");
      map.put("msg", "成功");
      map.put("status", "200");
    } else {
      map.put("msg", "验证码错误");
      map.put("status", "0");
    }
    return map;
  }

  @RequestMapping(value = "/loginSuccess.do")
  public String loginSucceses() throws Exception {
    return "employee/";
  }

  /**
  *管理员登录
  */
  @RequestMapping(value = "/adminLogin.do")
  @ResponseBody
  public Map<String, String> adminLogin(
          HttpSession httpSession,
          String username,
          String password,
          String identifyingcode) {
    String code = (String) httpSession.getAttribute("identifyingCode");
    HashMap<String, String> map = new HashMap<>();
    if (identifyingcode.equalsIgnoreCase(code)) {
      SystemManager manager = null;
      try {
        manager = loginService.findSystemManagerByIdAndPassword(username, password);
      } catch (CustomException e) {
        map.put("msg", e.getMessage());
        map.put("status", "500");
        return map;
      }
      // 保存到session
      httpSession.setAttribute("admin", manager);
      map.put("url", "toPage.do?url=admin/index.html");
      map.put("msg", "成功");
      map.put("status", "200");
    } else {
      map.put("msg", "验证码错误");
      map.put("status", "0");
    }
    return map;
  }

  /**
  *从Session中获取admin信息
  */
  @RequestMapping(value = "/getAdminAccount.do")
  @ResponseBody
  public String getAdminAccount(HttpSession httpSession) {
    SystemManager systemManager = (SystemManager) httpSession.getAttribute("admin");
    return systemManager.getSmAccount();
  }

  /**
   *从Session中获取员工信息 account 员工工号 name 员工姓名
   */
  @RequestMapping(value = "/getEmployeeAccount.do")
  @ResponseBody
  public Map<String, String> getEmployeeAccount(HttpSession httpSession) {
    Integer id = (Integer) httpSession.getAttribute("employeeId");
    Employee employee = loginService.findEmployeeById(id);
    HashMap<String, String> map = new HashMap<>();
    map.put("account", employee.geteAccount());
    map.put("name", employee.geteName());
    return map;
  }

  /**
  *员工退出功能
  */
  @RequestMapping(value = "/logout.do")
  public String logout(HttpSession httpSession) {
    httpSession.removeAttribute("employeeId");
    return "redirect:/";
  }

  /**
   *管理员退出功能
   */
  @RequestMapping(value = "/logoutAdmin.do")
  public String logoutAdmin(HttpSession httpSession) {
    httpSession.removeAttribute("admin");
    return "redirect:/admin.do";
  }
}
