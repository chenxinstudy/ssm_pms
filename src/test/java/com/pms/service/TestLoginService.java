package com.pms.service;

import com.pms.exception.CustomException;
import com.pms.service.impl.LoginServiceImpl;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 * @program: ssm @Author：admin @Description： @Date：2:39 2022/3/6 @Version: 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestLoginService {
  @Autowired private LoginServiceImpl loginService;

  @Test
  public void testFindEmployeeByIdAndPassword() throws Exception {
    System.out.println(loginService.findEmployeeByIdAndPassword("18080833", "123456"));
  }

  @Test
  public void testFindSystemManagerByIdAndPassword() {
    try {
      System.out.println(loginService.findSystemManagerByIdAndPassword("admin", "123456"));
    } catch (CustomException e) {
      System.out.println(e.getMessage());
    }
  }

  @Test
  public void testRam(){
    System.out.println("Math.random() = " + 1000 * Math.random());

    System.out.println(
        "UUID.randomUUID().toString().toUpperCase() = "
            + UUID.randomUUID().toString().toUpperCase());
  }
}
