package com.pms.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @program: ssm
 * @Author：admin
 * @Description：
 * @Date：1:34 2022/3/13
 * @Version: 1.0
 */
public class LoginInterceptor implements HandlerInterceptor {
  @Override
  public boolean preHandle(
      HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o)
      throws Exception {

    if (httpServletRequest.getSession().getAttribute("employeeId") == null) {
      // 推荐使用重定向
      httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/employeeLogin.do");
      return false;
    } else if (httpServletRequest.getSession().getAttribute("admin") == null) {
      // 推荐使用重定向
      httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/adminLogin.do");
      return false;
    }

    //     String employeeId = (String) httpServletRequest.getSession().getAttribute("employeeId");
    //    SystemManager systemManager =
    //        (SystemManager) httpServletRequest.getSession().getAttribute("admin");
    //    if (employeeId != null) {
    //      return true;
    //    } else if (employeeId == null) {
    //      httpServletResponse.sendRedirect("/employeeLogin.do");
    //      return false;
    //    } else if (systemManager != null) {
    //      return true;
    //    } else {
    //      httpServletResponse.sendRedirect("/admin.do");
    //      return false;
    //    }
    return true;
  }

  @Override
  public void postHandle(
      HttpServletRequest httpServletRequest,
      HttpServletResponse httpServletResponse,
      Object o,
      ModelAndView modelAndView)
      throws Exception {}

  @Override
  public void afterCompletion(
      HttpServletRequest httpServletRequest,
      HttpServletResponse httpServletResponse,
      Object o,
      Exception e) {}
}
