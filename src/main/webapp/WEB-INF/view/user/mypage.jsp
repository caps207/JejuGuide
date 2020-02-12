<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MyPage</title>
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
<script type="text/javascript">
	function win_open(page) { <%-- 밑에 버튼 에 onclick메서드를 구현하기위한 함수부분이다. 자식창을 열어주느데 파라미터(page)에 따라 
		   다른 자식창을 열어준다. --%>
		      var op = "width = 500, height = 450, top = 300, left = 300"
		      open(page + ".shop", "", op);
	}
	function win_open(){
		var op = "width = 500, height = 450, top = 300, left = 300"
		open("delete.shop?id=${user.id}","",op);
	}
	
	$(document).ready(function(){
		$("#minfo").show();	//회원정보는 보이도록
		$("#cinfo").hide(); //추천내역은 안보이도록
		$(".saleLine").each(function(){
			$(this).hide();
		})
		$("#tab1").addClass("select");
	})
	
	function disp_div(id,tab){
		$(".info").each(function(){
			$(this).hide();
		})
		$(".tab").each(function(){
			$(this).removeClass("select");
		})
		$("#"+id).show();
		$("#"+tab).addClass("select");
	}
	function list_disp(id){
		$("#"+id).toggle();
	}
</script>
</head>
<body>

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100 p-t-50 p-b-90">
			<form class="login100-form validate-form flex-sb flex-w">
				<span class="login100-form-title p-b-51">
				My Page
				</span>
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input100" type="text" name="id" value="${user.id}" readonly>
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input100" type="text" name="name" value="${user.name}" readonly>
					<span class="focus-input100"></span>
				</div>
				
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input100" type="text" name="birthday" value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>" readonly>
					<span class="focus-input100"></span>
				</div>
				
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input100" type="text" name="tel" value="${user.tel}" readonly>
					<span class="focus-input100"></span>
				</div>
				
				<div class="wrap-input100 validate-input m-b-16">
					<input class="input100" type="text" name="email" value="${user.email}" readonly>
					<span class="focus-input100"></span>
				</div>
				<div class="flex-sb-m w-full p-t-3 p-b-24">
				</div>
				<div class="container-login100-form-btn m-t-17">
					<button class="login100-form-btn" onClick="location.href='update.shop?id=${user.id}';return false;">
					회원정보 수정
					</button>
				</div>
				<div class="container-login100-form-btn m-t-17">
					<button class="login100-form-btn" onClick="location.href='scrap.shop?id=${user.id}';return false;">
					북마크
					</button>
				</div>
				<div class="container-login100-form-btn m-t-17">
					<button class="login100-form-btn" onClick="location.href='/project/main/mainpage.shop';return false;">
					홈
					</button>
				</div>
				<div class="container-login100-form-btn m-t-17">
					<button class="login100-form-btn" onClick="win_open();return false;">
					회원탈퇴
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
</body>
</html>