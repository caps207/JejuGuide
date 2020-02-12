<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sign up</title>
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
<form:form modelAttribute="user" method="post" action="userEntry.shop">
<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100 p-t-50 p-b-90">
			<form class="login100-form validate-form flex-sb flex-w">
				<span class="login100-form-title p-b-51">
				Sign up
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
				<font color="red"><form:errors path="name"/></font>
				<div class="wrap-input100 validate-input m-b-16">
					<form:input path="name" class="input100" placeholder="Name"/>
					<span class="focus-input100"></span>
				</div>
				<font color="red"><form:errors path="birthday"/></font>
				<div class="wrap-input100 validate-input m-b-16">
					<form:input path="birthday" class="input100" placeholder="Birthday(YYYY-MM-DD)"/>
					<span class="focus-input100"></span>
				</div>
				<font color="red"><form:errors path="tel"/></font>
				<div class="wrap-input100 validate-input m-b-16">
					<form:input path="tel" class="input100" placeholder="Tel"/>
					<span class="focus-input100"></span>
				</div>
				<font color="red"><form:errors path="email"/></font>
				<div class="wrap-input100 validate-input m-b-16">
					<form:input path="email" class="input100" placeholder="Email"/>
					<span class="focus-input100"></span>
				</div>
				<div class="flex-sb-m w-full p-t-3 p-b-24">
				</div>
				<spring:hasBindErrors name="user">
					<font color="red">
						<c:forEach items="${errors.globalErrors}" var="error">
							<spring:message code="${error.code}"/>
						</c:forEach>
					</font>
				</spring:hasBindErrors>
				<div class="container-login100-form-btn m-t-17">
					<button class="login100-form-btn" type="submit">
					회원가입
					</button>
				</div>
				<div class="container-login100-form-btn m-t-17">
					<button class="login100-form-btn" type="reset">
					초기화
					</button>
				</div>
			</form>
		</div>
	</div>
</div>
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
</form:form>
</body>
</html>