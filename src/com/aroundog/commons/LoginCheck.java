package com.aroundog.commons;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

// 회원이 로그인 권한이 필요한 페이지에 접속할 경우, 로그인 처리 했는지 확인하는 공통로직
@Aspect
public class LoginCheck {
   
   
   /*------------------------------------------관리자 페이지 로그인 체크------------------------------------------------------*/
   @Pointcut("execution(public * com.aroundog.controller.AdminController.go*(..))")
   public void logincut() {} // ID역할
   
   @Around("logincut()")
   public String sessionCheck(ProceedingJoinPoint jp) throws Throwable {
      String viewName=null;
      HttpServletRequest request=null;
      Object[] objArray= jp.getArgs(); // 메서드 호출시 담긴 변수들
      System.out.println("관리자 로그인 체크 : sessionCheck 호출!!!!!");
      
      // request에서 세션 추출
      for(int i=0;i<objArray.length;i++) {
         if(objArray[i] instanceof HttpServletRequest) {
            request = (HttpServletRequest)objArray[i]; // 세션 있으면 담아주기
            System.out.println("관리자 로그인 체크 : 요청객체 발견");
         }
      }
      
      // 세션으로 로그인 했는지 체크
      if(request.getSession().getAttribute("admin")==null) { // 로그인 안한 사람
         viewName="admin/error/loginError";
         System.out.println("관리자 로그인 체크 : 로그인 안했음");
      }else { // 로그인 한 사람
         viewName=(String) jp.proceed();
         String methodName= jp.getSignature().getName();
         System.out.println("관리자 로그인 체크 : 로그인 했음. 원래 메서드 호출>>"+methodName);
      }
      return viewName;
   }
   
   /*--------------------------------------------------회원 로그인 체크------------------------------------------------------*/
   
   @Pointcut("execution(public * com.aroundog.controller.AdoptController.adoptRegist(..))")
   public void adoptCheck() {}
   @Pointcut("execution(public * com.aroundog.controller.ReportController.goReport(..))")
   public void reportCheck() {}
   
   @Around("adoptCheck() || reportCheck()")
   public String memberLoginCheck(ProceedingJoinPoint jp) throws Throwable {
      String viewName=null;
      HttpServletRequest request=null;
      System.out.println("유저 로그인 체크 호출!!!");
      
      Object[] args= jp.getArgs();
      // 세션 체크
      for(int i=0;i<args.length;i++) {
         Object obj= args[i];
         if(obj instanceof HttpServletRequest) {
            request= (HttpServletRequest)obj;
            String requestURL= request.getRequestURL().toString();
            System.out.println("유저 로그인 체크 : 요청객체 발견 >>>> 요청URL : "+requestURL);
         }
      }
      
      // 세션에 로그인 객체 담겨있는지 체크
      if(request.getSession().getAttribute("member")==null) {
         viewName="user/error/loginError";
         System.out.println("유저 로그인 체크 : 로그인 안 함");
      }else {
         String methodName= jp.getSignature().getName();
         viewName= (String)jp.proceed();
         System.out.println("유저 로그인 체크 : 로그인 함 >>> 원래 메서드 "+methodName+" 호출");
      }
      System.out.println("유저 로그인 체크 >>> 최종반환되는 viewName : "+viewName);
      return viewName;
   }
}









