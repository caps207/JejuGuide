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
                            <h2>숙 소</h2>
                            <p>제주 숙박 정보 제공</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!-- hotel list css start-->
	<br><br>


	<!-- 지도 뿌려주는 부분  오른쪽 절반 상단-->
	<div style="width: 40%; float: right; margin-right: 80px;">
	<h1><b>위치정보</b></h1><br><br>
	<div id="map" style="width: 100%; height: 550px; float: right;"></div>
	<!-- 여기까지 -->

		<div style="width: 100%; height:30%; float: right; "> <!-- 오른쪽 절반 하단 -->
	
	<div id="show" style="float: left; width: 40%;"></div>

	<div style="border: 1px; float: right; width: 60%;">
		<img id="weatherImg" width="300px" height="200px" />
	</div> <!-- 오른쪽 절반 하단 여기까지 -->
	
	</div>
</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6ecf8a543ad7d10bc932cc4a55014b9"></script>
	<script src="../jquery-1.11.0.min.js"></script>
	<script>
		//=============================================================== 관광 api부분 =================================================================
		var ylist = 0; //각각의 게시글의 x값을 받을 리스트 객체 생성
		var xlist = 0; //각각의 게시글의 y값을 받을 리스트 객체 생성
		var title = "";
		var contentid = '${param.contentid}'
		console.log(contentid);

		$.ajax({
			url : 'sledetail.shop?contentid=' + contentid,
			async : false,
			type : 'get',
			dataType : 'json',
			success : function(data) {
				console.log(data);
				//         console.log(data.response.body.items.item);
				var myItem = data.response.body.items.item;
				var output = '';
				var homepage = myItem.homepage;
				var tel = myItem.tel;
				if(tel == undefined)
				{
					tel = "<h4>전화번호 없음</h4>"
				}
				if(homepage == undefined)
				{
					homepage = "<h4>홈페이지 없음</h4>"
				}
				output += '<div style="width: 50%; float: left; margin-left: 50px;"><h1><b>' + myItem.title + '</b></h1>';
				output += '<h4>' + myItem.addr1 + '</h4>';
				output += '<h4>' + tel + '</h4>';
				output += '<img src='+myItem.firstimage+'>';
				output += '<h3 src='+myItem.firstimage+'>';
				output += '<h1><b> 상세 설명  </b></h1>';
				output += '<h5>' + myItem.overview + '</h5>';
				output += "<h4>" + homepage + "</h4>";
				output += "<br><br><br>";
				output += "<div><form action='scrap.shop' method='post'>";
				output += "<input type='hidden' name='url' value='${scrapurl }'>";
				output += "<input type='hidden' name='title' value='"+ myItem.title +"'>";
				output += "<input type='submit' value='스크랩'></form></div>";
				output += "<h2>가는 방법이 궁금하다면?  <a href='https://map.kakao.com/link/to/"+ myItem.addr1 +","+ myItem.mapx +","+ myItem.mapy +"' target='_blank'>길찾기</a></h2><br>";
				output += "<h2><a href='https://map.kakao.com/link/to/"+ myItem.addr1 +","+ myItem.mapx +","+ myItem.mapy +"' target='_blank'>로드뷰 보기</a></h2></div>"
				document.body.innerHTML += output;
				
				ylist = myItem.mapy;
				xlist = myItem.mapx;
				title = myItem.title;
				
			}
		

		});
		//=============================================================== 지도 api부분 =================================================================
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(ylist, xlist), // 지도의 중심좌표
			level : 2
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(ylist, xlist);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div style="padding:5px;">'+ title +'</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent
		});

		// 마커에 마우스오버 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseover', function() {
		  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		    infowindow.open(map, marker);
		});

		// 마커에 마우스아웃 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseout', function() {
		    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
		    infowindow.close();
		});
//=============================================================== 날씨 api부분 =================================================================
		//여기부터 날씨
		$(document).ready(
				function() {
					setInterval(

					function() {
						//날씨 api
						var weather; //맑음,흐림,눈,비
						// 					var city = 'jeju'; //지역 설정한 변수
						var key = '629e3494271ebaffe08859cff110783c';//key 값
						$.ajax({
							url : 'http://api.openweathermap.org/data/2.5/weather',
							dataType : 'Json',
							type : 'GET',
							data : {
								// 							q : city,
								lat : ylist, 
								lon : xlist,
								appid : key,
								units : 'metric'
							},

							success : function(data) {
								//시간 설정
								var day = new Date();
								var today = day.getFullYear() + "년"
										+ (day.getMonth() + 1) + "월"
										+ day.getDate() + "일" + day.getHours()
										+ "시" + day.getMinutes() + "분";

								var weather = ""; //날씨 정보 담을 변수의 초기화.
								var wf = ''; //화면에 뿌려줄 객체 초기화.

								$.each(data.weather, function(index, val) {
									wf = '<h3><b>현재시간 : </b>	</h3><h4>' + today
											+ ' </h4><br>' + '<h3><b>' + '제주시'
											+ '</b></h3>' + '<h4>현재 온도 : '
											+ data.main.temp + '&deg;C </h4>'
											+ '<br>' + '<h4> 현재 날씨 : ' + val.main + '<br><br>'
											+ '위도 :'+ ylist + '<br>경도 :'+ xlist +'</h4>'
									weather = val.main;
									var img;
									if (weather == "Clear") { //날씨가 맑으면 맑음 이미지 출력
										img = "../wimg/clear.PNG";
									} else if (weather == "Rain") { //날씨가 비오면 비 이미지 출력
										img = "../wimg/rain.PNG";
									} else if (weather == "Clouds") { //날씨가 구름이면 구름 이미지 출력
										img = "../wimg/cludes.PNG";
									} else if (weather == "Snow") { //날씨가 눈이면 눈 이미지 출력
										img = "../wimg/snow.PNG";
									}

									$("#weatherImg").attr("src", img);
								});
								$("#show").html(wf); //id 값이show 인 div에 뿌려주기 
							},
							error : function() {

							}
						});
					}, 1000)
				})		
	</script>

</body>
</html>