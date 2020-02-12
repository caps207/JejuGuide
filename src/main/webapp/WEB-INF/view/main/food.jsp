<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>


<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>JEJU</title>
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
    <style>
.out {
	width = 100%;
	text-align: center;
	padding: 20px;
	margin: 15px;
}
.in {
	display: inline-block;
	width: 80%;
	height: 100px;
}
table {
	border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
}
thead th {
width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #e7708d;
    margin: 20px 10px;
    text-align: center;
    }

tbody th {
width: 150px;
    padding: 10px;
    }
tbody td {
width: 350px;
    padding: 10px;
    vertical-align: top;
    text-align: center;
    }
table .even{
	background: #fdf3f5;
}    
</style>
<!-- 로그인시 자식창 띄우게 해주는 script -->
<script type="text/javascript">
function win_login() {
   var op = "width=500, height=900, left=50,top=150";
   open("../user/login.shop","",op);
}
function win_signup() {
   var op = "width=500, height=900, left=50,top=150";
   open("../user/userEntry.shop","",op);
}    
</script>
</head>

<body>
<!--  데코레이터 헤더부분 -->
<header class="main_menu">
        <div class="sub_menu">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-sm-12 col-md-6">
                        <div class="sub_menu_right_content">
                            <span>   </span>
                            <a href="#"> </a>
                            <a href="#"> </a>
                            <a href="#"> </a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12 col-md-6">
                        <div class="sub_menu_social_icon">
                            <a href="#"><i class="flaticon-facebook"></i></a>
                            <a href="#"><i class="flaticon-twitter"></i></a>
                            <a href="#"><i class="flaticon-skype"></i></a>
                            <a href="#"><i class="flaticon-instagram"></i></a>
                            <span><i class="flaticon-phone-call"></i>010-1234-5678</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="mainpage.shop"> <img src="../img/logo3.jpg" alt="logo" width="150" height="60"> </a> <!--  -->
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
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
    <!-- 여기까지 -->   

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>맛 집</h2>
                            <p>제주 맛집 정보 제공</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!-- hotel list css start-->
    <section class="top_place section_padding">
       
            <div class="row justify-content-center">
                <div class="col-xl-6">
                    <div class="section_tittle text-center">
                        <h2>맛집 정보</h2>
                        <p>마우스 휠 사용으로 지도의 확대가 가능합니다.</p>
                        <p>마커펜클릭시 주차장 상세정보로 이동합니다.</p>
                    </div>
                </div>
            </div>
    </section> 
    
	<!-- 지도를 표시할 div 입니다 -->
	<div class="container">
		<div>
			<div id="head" style="text-align: center;"></div>
			<div id="map" style="width: 64%; height: 400px; float: left;"></div>
			<div id="food" style="width: 34%; float: right;"></div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6ecf8a543ad7d10bc932cc4a55014b9"></script>
	<script src="../jquery-1.11.0.min.js"></script>
	<script>
		//=============================================================== 관광 api부분 =================================================================
		var ylist = new Array(); //각각의 게시글의 x값을 받을 리스트 객체 생성
var xlist = new Array(); //각각의 게시글의 y값을 받을 리스트 객체 생성
var title = new Array(); //제목 리스트로 받아서 지도 아이콘 에 마우스오버에 써주기 
	
	$.ajax({
		url: "goodfood.xml",
		type: 'GET',
		async : false,
		dataType : 'xml',
		success: function(data){
			$(data).find("Row").each(function(){
				
				
				title.push($(this).find("업소명").text());
				ylist.push($(this).find("위도").text());
				xlist.push($(this).find("경도").text());
				
				
				
			});
			
		}
	});


		//=============================================================== 지도 부분 =================================================================

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.2519475, 126.511215), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 

var positions = [];
for (var i = 0; i < ylist.length; i++) {
// 	positions[i] = "content: '<div>'"+title[i]+"'</div>',latlng: "+new kakao.maps.LatLng(ylist[i], xlist[i]);
	positions.push({
			latlng: new kakao.maps.LatLng(ylist[i], xlist[i])
	});
	
	
}


for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커의 위치
        clickable: true 
    });
	
    var iwContent = "<div><a href='javascript:void(0);' onclick='detail("+ylist[i]+")'>"+title[i]+"</a></div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
    	content : iwContent,
        removable : iwRemoveable
    });

    kakao.maps.event.addListener(marker, 'click', makeListener(map, marker, infowindow));
}

function detail(y){//onclick 메서드를 통해 들어온 각각의 위도 값
	
	var y = y;
	
	$.ajax({
		url: "goodfood.xml",
		type: 'GET',
		async : false,
		dataType : 'xml',
		success: function(data){
			
			$(data).find("Row").each(function(){
				
				if($(this).find("위도").text()== y){
				$("#food").empty();
				$("#head").empty();
				var head = "";
				head += "<h1><b>" + $(this).find("업소명").text() +"</b></h1><br>";	
				var info = "";
				info += "<div style='text-align: center;'>";	
				info += "<table style='margin: auto;'>";
				info += "<thead><tr><th scope='cols'>타이틀</th><th scope='cols'>내용</th></tr></thead>"
				info += "<tbody>";
				info += "<tr><th>업종 </th><td>" + $(this).find("업종").text() +"</td></tr>";
				info += "<tr><th class='even'>주소 </th><td class='even'>" + $(this).find("주소").text() +"</td></tr>";
				info += "<tr><td colspan='2'><a href='https://map.kakao.com/link/to/제주"+ $(this).find("업소명").text() +","+ $(this).find("위도").text() +","+ $(this).find("경도").text() +"' target='_blank'>길찾기</a></td></tr>";
				info += "</tbody>";
				info += "<table>";
				
				info += "</div>";
				$("#head").append(head);
				$("#food").append(info);
				
				}
				
				
			});
			
		}
	});

	
}


function makeListener(map, marker, infowindow) {
	return function() {
	 infowindow.open(map, marker);
	};
}


	</script>
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
            <!--  여기까지 내용 들어가는 부분 -->
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