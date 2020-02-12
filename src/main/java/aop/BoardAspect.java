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
public class BoardAspect {
	@Around("execution(* controller.Board*.check*(..)) && args(..,session)")
	public Object boardCheck(ProceedingJoinPoint joinPoint,
			 HttpSession session) throws Throwable{
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException
			       ("로그인 후 이용 가능합니다","../board/list.shop");
		}
//		if(!loginUser.getId().equals("admin") &&
//			!loginUser.getId().equals(id)) {
//			throw new LoginException
//		       ("본인만 이용가능합니다.","main.shop");
//		}
		Object ret = joinPoint.proceed();
		return ret;
	}
}
