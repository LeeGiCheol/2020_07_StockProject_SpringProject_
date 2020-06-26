//package com.bitcamp.project.util;
//
//import javax.servlet.http.HttpSessionAttributeListener;
//import javax.servlet.http.HttpSessionBindingEvent;
//import javax.servlet.http.HttpSessionEvent;
//import javax.servlet.http.HttpSessionIdListener;
//import javax.servlet.http.HttpSessionListener;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//import com.bitcamp.project.service.AdminService;
//import com.bitcamp.project.vo.AdminVO;
//
//@Component
//public class VisitCounter implements HttpSessionListener, HttpSessionIdListener, HttpSessionAttributeListener {
//
//	@Autowired
//	AdminService adminService;
//	
//	@Override
//	public void sessionCreated(HttpSessionEvent se) {
//		// 세션 생성시 호출
//		System.out.println("[ session ] created / id : " + se.getSession().getId());
////		ApplicationContext context = 
////				new GenericXmlApplicationContext("classpath:applicationContext.xml");
//		//AdminVO vo =  context.getBean("AdminVO",AdminVO.class);
//		System.out.println(3);
//		AdminVO vo = new AdminVO();
//		
//		
//		adminService.userVisit(vo);
//	}
//
//	@Override
//	public void sessionDestroyed(HttpSessionEvent se) {
//		// 세션 소멸시 호출
//		System.out.println("[ session ] destroyed / id : " + se.getSession().getId());
//	}
//
//	@Override
//	public void sessionIdChanged(HttpSessionEvent se, String oldSessionId) {
//		// 세션ID 변경시 호출
//		System.out.println("[ session ] changed / oldId : " + oldSessionId + " / newId : " + se.getSession().getId());
//	}
//
//	@Override
//	public void attributeAdded(HttpSessionBindingEvent se) {
//		// 프라퍼티 추가시 호출
//		System.out.println("[ session ] add / key : " + se.getName() + ", value : " + se.getValue());
//	}
//
//	@Override
//	public void attributeRemoved(HttpSessionBindingEvent se) {
//		// 프라퍼티 삭제시 호출
//		System.out.println("[ session ] remove / key : " + se.getName());
//	}
//
//	@Override
//	public void attributeReplaced(HttpSessionBindingEvent se) {
//		// 프라퍼티 값 변경시 호출
//		System.out.println("[ session ] replace / key : " + se.getName() + ", value : " + se.getValue() + " --> "
//				+ se.getSession().getAttribute(se.getName()));
//	}
//}