package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import exception.LoginException;
import logic.User;

@Component
@Aspect
@Order(2)
public class UserLoginAspect {
	//advice : 핵심로직 전 , 후
	@Around("execution(* controller.User*.check*(..)) && args(.., session)")//pointcut : 핵심로직 설정
	public Object userLoginCheck (ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException("로그인 후 이용 가능합니다.","login.shop");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	@Around("execution(* controller.User*.check*(..)) && args(id, session)")
	public Object userIdCheck (ProceedingJoinPoint joinPoint, String id, HttpSession session) throws Throwable {
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException("로그인 후 이용 가능합니다.","login.shop");
		}
		if(!loginUser.getId().equals("admin") && !loginUser.getId().equals(id)) {
			throw new LoginException("본인만 이용가능합니다.","../main/mainpage.shop");
		}
		Object ret = joinPoint.proceed();
		return ret;
	} 
}
