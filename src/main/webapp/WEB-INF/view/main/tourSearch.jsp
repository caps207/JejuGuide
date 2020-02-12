<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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
<title>JEJU</title>
<style>
h3 {
	color: blue;
}
.name {
	display: inline-block;
	text-overflow: ellipsis; /* 위에 설정한 100px 보다 길면 말줄임표처럼 표시합니다. */
	white-space: nowrap; /* 줄바꿈을 하지 않습니다. */
	overflow: hidden; /* 내용이 길면 감춤니다 */
	display: block; /* ie6이상 현재요소를 블럭처리합니다. */
}

li {
	list-style: none;
}
h4{
	overflow: hidden;
	display: inline-block;
	width: 100%;
	font-weight: bold;
	font-size: 20px;
	color: #000;
	text-overflow: ellipsis;
	white-space: nowrap;
}
</style>


<script type="text/javascript">
	function listdo(page)
	{
		document.searchform.pageNo.value=page;
		document.searchform.submit();
	}
</script>
<script src="../jquery-1.11.0.min.js"></script>
<script>

var ylist = new Array(); //각각의 게시글의 x값을 받을 리스트 객체 생성
var xlist = new Array(); //각각의 게시글의 y값을 받을 리스트 객체 생성
var title = new Array(); //제목 리스트로 받아서 지도 아이콘 에 마우스오버에 써주기 
var contentid = new Array(); //각각의 contentid 를 받아서 클릭시 상세정보로 보내주기

	$(function json()
	{
		var data = ${data}
		var myItem = data.response.body.items.item;
		//글의 전체갯수
		var totalCount = data.response.body.totalCount;
		if(${listcount == 0})
		{
			output = '<h3>검색결과가 없습니다</h3>'; 
			document.body.innerHTML += output;
		}
		else
		{
			for (var i = 0; myItem.length; i++) 
			{
				var image = myItem[i].firstimage
				var result = document.getElementById("result");
				var output = '';
				if(myItem[i].firstimage == undefined)
				{
					image = "../img/Jejulogo.jpg"
				}
				console.log(myItem.length);
				/* output += "<div class='col-md-4'><div class='single-defination'>"
				output += "<ul><div class='name'>"+ 
				"<a href='SearchDetail.shop?contentid="+myItem[i].contentid + "&contenttypeid="+myItem[i].contenttypeid + "'><h4 class='mb-20'>" + myItem[i].title + "</h4></a>"
				output += '<p>' +  myItem[i].addr1 + '<p>'
				output += "<a href='SearchDetail.shop?contentid="+myItem[i].contentid + "&contenttypeid="+myItem[i].contenttypeid + "'><img src="+image+" style='width: 320px; height: 180px;'></a><br>"

				output += "</ul><br></div></div></div>" */
				output += "<div class='col-lg-4 col-md-4'>"
				output += "<a href='SearchDetail.shop?contentid=" + myItem[i].contentid + "&contenttypeid="+ myItem[i].contenttypeid+ "' class='place_btn'>"+"<h4>" +myItem[i].title + "</h4></a>"
				output += "<div class='single_place'>"
				output += "<img src='" + image +  "' alt='' style='width:100%; height:240px;'>"
				output += "<div class='hover_Text d-flex align-items-end justify-content-between'><div class='hover_text_iner'>"
				output += "<a href='SearchDetail.shop?contentid=" + myItem[i].contentid + "&contenttypeid="+ myItem[i].contenttypeid+ "' class='place_btn'>상세보기</a>"
				output += "<h3>" +myItem[i].title+ "</h3>"
				output += "<p>" + myItem[i].addr1 + "</p>"
				output += "</div></div></div>"
 				result.innerHTML += output;
				ylist.push(myItem[i].mapy); //for문을 돌면서 각 x값을 xlist 리스트에 저장
				xlist.push(myItem[i].mapx); //for문을 돌면서 각 y값을 ylist 리스트에 저장
				title.push(myItem[i].title); //for문을 돌면서 각 title값을 title 리스트에 저장
				contentid.push(myItem[i].contentid); //for문을 돌면서 각 contentid값을 contentid 리스트에 저장
			}
		}
	});

</script>

</head>
<body>
	<!-- 데코레이터 헤더 부분 -->
	<header class="main_menu">
		<div class="sub_menu">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-sm-12 col-md-6">
						<div class="sub_menu_right_content">
							<span> </span> <a href="#"> </a> <a href="#"> </a> <a href="#">
							</a>
						</div>
					</div>
					<div class="col-lg-6 col-sm-12 col-md-6">
						<div class="sub_menu_social_icon">
							<a href="#"><i class="flaticon-facebook"></i></a> <a href="#"><i
								class="flaticon-twitter"></i></a> <a href="#"><i
								class="flaticon-skype"></i></a> <a href="#"><i
								class="flaticon-instagram"></i></a> <span><i
								class="flaticon-phone-call"></i>010-1234-5678</a></span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="main_menu_iner">
			<div class="container">
				<div class="row align-items-center ">
					<div class="col-lg-12">
						<nav
							class="navbar navbar-expand-lg navbar-light justify-content-between">
							<a class="navbar-brand" href="mainpage.shop"> <img
								src="../img/logo3.jpg" alt="logo" width="150" height="60">
							</a>
							<!--  -->
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>

							<div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="../main/mainpage.shop">홈</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="../main/InfoTour.shop">통합검색</a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle"  id="navbarDropdown_1"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">제주정보</a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                           	<a class="dropdown-item" href="../main/place.shop">명 소</a>
                                           	<a class="dropdown-item" href="../main/food.shop">맛 집</a>
                                           	<a class="dropdown-item" href="../main/festival.shop">축 제</a>
                                            <a class="dropdown-item" href="../main/sleep.shop">숙 박</a>
                                            <a class="dropdown-item" href="../main/park.shop">주차장</a>
                                        	<a class="dropdown-item" href="../main/service.shop">편의시설</a>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="../board/list.shop">정보공유</a>
                                    </li>
                                </ul>
                            </div>
							 <c:if test="${empty sessionScope.loginUser }">
                            <a href="../user/login.shop" class="btn_1 d-none d-lg-block">로그인</a>
                            <a href="../user/userEntry.shop" class="btn_1 d-none d-lg-block">회원가입</a>
                            </c:if>
                            <c:if test="${!empty sessionScope.loginUser }">
                            <a href="../user/mypage.shop?id=${loginUser.id}">${loginUser.id}</a>님이 로그인 하셨습니다.<br>
                        <a href="../user/logout.shop">로그아웃</a>
                        </c:if>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>관광정보</h2>
							<p>관광정보 조회</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 여기까지 -->
	
	<br><br>
	<h2 style="text-align:center">관광정보 검색</h2>
	<form action="TourSearch.shop" method="get">
		<div class="container box_1170">
			<div class="blog_right_sidebar">
				<aside class="single_sidebar_widget search_widget">
					<div class="form-group">
						<div class="input-group mb-3">
							<select name="arrange" id="sel">
								<option value="A">제목순</option>
								<option value="B">인기순</option>
							</select> <input type="text" class="form-control" name="keyword"
								placeholder="Search Keyword" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Search Keyword'">

							<div class="input-group-append">
								<button class="btn" type="button">
									<i class="ti-search"></i>
								</button>
							</div>

						</div>
					</div>
					<button class="button rounded-0 primary-bg text-white w-100 btn_1"
						type="submit">Search</button>
				</aside>
			</div>
		</div>
	</form>

	<section class="top_place section_padding">
		<div class="container">

			<div class="row" id="result">
			<c:if test="${totalCount == 0}">
					<h2 align="center">검색결과가 없습니다.</h2>
				</c:if>
			</div>

		</div>
	</section>

	<form action="TourSearch.shop" method="get">

		<div class="container box_1170">
			<div class="blog_right_sidebar">
				<aside class="single_sidebar_widget search_widget">
					<div class="form-group">
						<div class="input-group mb-3">
							<select name="arrange" id="sel">
								<option value="A">제목순</option>
								<option value="B">인기순</option>
							</select> <input type="text" class="form-control" name="keyword"
								placeholder="Search Keyword" onfocus="this.placeholder = ''"
								onblur="this.placeholder = 'Search Keyword'">

							<div class="input-group-append">
								<button class="btn" type="button">
									<i class="ti-search"></i>
								</button>
							</div>

						</div>
					</div>
					<button class="button rounded-0 primary-bg text-white w-100 btn_1"
						type="submit">Search</button>
				</aside>
			</div>
		</div>

		<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">
				<c:if test="${totalCount > 0}">
					<c:if test="${pageNo > 1}">
						<li class="page-item active"><a
							href="TourSearch.shop?arrange=${arrange}&keyword=${keyword}&pageNo=1"
							class="page-link"><<</a></li>
						<c:if test="${pageNo > 1}">
							<li class="page-item active"><a
								href="TourSearch.shop?arrange=${arrange}&keyword=${keyword}&pageNo=${pageNo - 1}"
								class="page-link"><</a></li>
						</c:if>
					</c:if>
					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<!-- keyword = 검색어, pageNo = 페이지 이동 -->
						<c:if test="${pageNo == a}">
							<li class="page-item"><a class="page-link">${a}</a></li>
						</c:if>
						<c:if test="${pageNo != a}">
							<li class="page-item active"><a
								href="TourSearch.shop?arrange=${arrange}&keyword=${keyword}&pageNo=${a}"
								class="page-link">${a}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageNo < maxpage}">
						<li class="page-item active"><a
							href="TourSearch.shop?arrange=${arrange}&keyword=${keyword}&pageNo=${pageNo + 1}"
							class="page-link">></a></li>
						<li class="page-item active"><a
							href="TourSearch.shop?arrange=${arrange}&keyword=${keyword}&pageNo=${maxpage}"
							class="page-link">>></a></li>
					</c:if>
				</c:if>
				
			</ul>
		</nav>
	</form>

	<br>
	<br>
	<br>
	<footer class="footer-area">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-sm-6 col-md-6">
                    <div class="single-footer-widget footer_icon">
                        <h4>Address</h4>
                        <p>Jeju, Republic of Korea</p>
                        <span>jeju@jeju.com</span>
						<div class="social-icons">
                            <a href="https://www.facebook.com/"><i class="ti-facebook"></i></a>
                            <a href="https://twitter.com/"><i class="ti-twitter-alt"></i></a>
                            <a href="https://www.instagram.com/"><i class="ti-instagram"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="col-sm-6 col-md-6">
                    <div class="single-footer-widget footer_icon">
                        <h4>주소</h4>
                        <p>대한민국 제주특별자치도</p>
                        <span>jeju@jeju.com</span>
                        <div class="social-icons">
                            <a href="https://www.facebook.com/"><i class="ti-facebook"></i></a>
                            <a href="https://twitter.com/"><i class="ti-twitter-alt"></i></a>
                            <a href="https://www.instagram.com/"><i class="ti-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="copyright_part_text text-center">
                        <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
 &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="#" target="_blank">제주도</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    
     <script src="../js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="../js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="../js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="../js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="../js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="../js/jquery.nice-select.min.js"></script>
    <script src="../js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="../js/jquery.ajaxchimp.min.js"></script>
    <script src="../js/jquery.form.js"></script>
    <script src="../js/jquery.validate.min.js"></script>
    <script src="../js/mail-script.js"></script>
    <script src="../js/contact.js"></script>
    <!-- custom js -->
    <script src="../js/custom.js"></script>
</body>
</html>

<%-- <form method="get" action="TourSearch.shop" name="searchform">
	검색어:<input type="text" name="keyword">
		<select name="arrange" id="sel">
			<option value="A">제목순</option>
			<option value="B">인기순</option>
		</select>
		<input type="submit" value="검색"/>
		<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">
				<c:if test="${totalCount > 0}">
					<c:if test="${pageNo > 1}">
						<li class="page-item active">
						
							<a href="TourSearch.shop?arrange=${arrange}&keyword=${keyword}&pageNo=1" class="page-link"><<</a>
						</li>
						<c:if test="${pageNo > 1}">
							<li class="page-item active">
								<a href="TourSearch.shop?arrange=${arrange}&keyword=${keyword}&pageNo=${pageNo - 1}" class="page-link"><</a>
							</li>
						</c:if>
					</c:if>
					<c:forEach var="a" begin="${startpage}" end="${endpage}">
						<!-- keyword = 검색어, pageNo = 페이지 이동 -->
						<c:if test="${pageNo == a}">
						<li class="page-item">
							<a class="page-link">${a}</a>
						</li>
						</c:if>
						<c:if test="${pageNo != a}">
							<li class="page-item active">
							<a href="TourSearch.shop?arrange=${arrange}&keyword=${keyword}&pageNo=${a}" class="page-link">${a}</a>
							</li>
						</c:if>
					</c:forEach>
					<c:if test="${pageNo < maxpage}">
						<li class="page-item active">
						<a href="TourSearch.shop?arrange=${arrange}&keyword=${keyword}&pageNo=${pageNo + 1}" class="page-link">></a>
						</li>
						<li class="page-item active">
						<a href="TourSearch.shop?arrange=${arrange}&keyword=${keyword}&pageNo=${maxpage}" class="page-link">>></a>
						</li>
					</c:if>
				</c:if>
				<c:if test="${totalCount == 0}">
					<h3>검색결과가 없습니다.</h3>

				</c:if>
			</ul>
		</nav>
	</form> --%>