package com.pms.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

/**
 * @ClassName TimeAop
 * @Description TODO
 * @Author Mr Chen
 * @Date: 2022/4/18
 * @Version 1.0
 */
// 将当前类标记为切面类
@Aspect
// 交给Spring容器管理
@Component
public class TimeAop {
    @Around("execution(* com.pms.service.impl.*.*(..))")
    public Object around(ProceedingJoinPoint pjp) throws Throwable {
        // 记录起始时间
        long start = System.currentTimeMillis();
        // 执行连接点方法，即切面所在位置对应的方法。本项目中表示执行注册或执行登录等
        // proceed() 调用目标方法 例如 login
        Object result = pjp.proceed();
        // 记录结束时间
        //  插入数据库
        long end = System.currentTimeMillis();
        // 计算耗时
        System.err.println(pjp.getSignature().getName() + "这个功能耗时：" + (end - start) + "ms");
        // 返回连接点方法的返回值
        return result;
    }
}
