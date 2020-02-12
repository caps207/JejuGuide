<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/signutil.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/signmain.css">
<!--===============================================================================================-->
</head>
<body>
<script>
function win_open(page) { <%-- 밑에 버튼 에 onclick메서드를 구현하기위한 함수부분이다. 자식창을 열어주느데 파라미터(page)에 따라 
	   다른 자식창을 열어준다. --%>
	      var op = "width = 500, height = 600, top = 300, left = 300"
	      open(page + ".shop", "", op);
}
</script>
<form:form modelAttribute="user" method="post" action="login.shop">
	<input type="hidden" name="name" value="의미없는 이름"/>
	<input type="hidden" name="birthday" value="2000-01-01"/>
	<input type="hidden" name="tel" value="의미없는 연락처"/>
	<input type="hidden" name="email" value="의미없는 이메일"/>

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100 p-t-50 p-b-90">
			<form class="login100-form validate-form flex-sb flex-w">
				<span class="login100-form-title p-b-51">
				Login
				</span>
				<font color="red"><form:errors path="id"/></font>
				<div class="wrap-input100 validate-input m-b-16">
					<form:input path="id" class="input100" placeholder="Id"/>
					<span class="focus-input100"></span>
				</div>
				<font color="red"><form:errors path="password"/></font>
				<div class="wrap-input100 validate-input m-b-16">
					<form:password path="password" class="input100" placeholder="Password"/>
					<span class="focus-input100"></span>
				</div>
				<div class="flex-sb-m w-full p-t-3 p-b-24">
					<div>
					<a href=# style="color:purple; font-weight: bold;" onclick="win_open('searchid')">아이디 찾기&nbsp;&nbsp;|</a>
					<a href=# style="color:purple; font-weight: bold;" onclick="win_open('searchpw')">&nbsp;비밀번호 찾기</a>
					</div>
				</div>
				<spring:hasBindErrors name="user">
					<font color="red">
					<c:forEach items="${errors.globalErrors}" var="error">
						<spring:message code="${error.code}"/>
					</c:forEach>
					</font>
				</spring:hasBindErrors>
				<div class="container-login100-form-btn m-t-17">
					<button class="login100-form-btn">
					로 그 인
					</button>
				</div>
				<div class="flex-col-c p-t-224">
					<span class="txt2 p-b-10">
					계정이 없으신가요?
					</span>
					<a href="userEntry.shop" class="txt3 bo1 hov1">
					SIGN UP
					</a>
				</div>
			</form>
		</div>
	</div>
</div>
</form:form>
<div id="dropDownSelect1"></div>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>