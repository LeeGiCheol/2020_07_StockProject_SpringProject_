package com.bitcamp.project.common.log;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {
	@Pointcut("execution(* com.bitcamp.project..*ServiceImpl.*(..))")
	public void allPointcut() {}
	
	@Pointcut("execution(* com.bitcamp.project..*ServiceImpl.get*(..))")
	public void getPointcut() {}
}





