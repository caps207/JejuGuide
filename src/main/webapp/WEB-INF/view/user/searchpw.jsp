<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="../../img/logo3.jpg">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<!-- animate CSS -->
<link rel="stylesheet" href="../css/animate.css">
<!-- owl carousel CSS -->
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<!-- themify CSS -->
<link rel="stylesheet" href="../css/themify-icons.css">
<!-- flaticon CSS -->
<link rel="stylesheet" href="../css/flaticon.css">
<!-- fontawesome CSS -->
<link rel="stylesheet" href="../fontawesome/css/all.min.css">
<!-- magnific CSS -->
<link rel="stylesheet" href="../css/magnific-popup.css">
<link rel="stylesheet" href="../css/gijgo.min.css">
<!-- niceselect CSS -->
<link rel="stylesheet" href="../css/nice-select.css">
<!-- slick CSS -->
<link rel="stylesheet" href="../css/slick.css">
<!-- style CSS -->
<link rel="stylesheet" href="../css/style.css">
<title>비밀번호 찾기 & 변경</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/signutil.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/signmain.css">

</head>
<body>

	<form action="resultpw.shop" method="post" name="pwform">
		<div class="limiter">
			<div class="container-login100">
				<div class="wrap-login100 p-t-50 p-b-90">


					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item"><a class="nav-link" id="place-tab"
							data-toggle="tab" role="tab" aria-controls="place"
							aria-selected="false"> <font size="10px" color="skyblue">SEARCH
									PW</font></a></li>
					</ul>

					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="name" placeholder="Name">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" name="id" placeholder="Id">
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn" onclick="pwform.submit();">
							SEARCH PW</button>

					</div>

				</div>
			</div>
		</div>
	</form>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script
		src="${pageContext.request.contextPath}/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>