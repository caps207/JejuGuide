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
.out {width = 100%;
	text-align: center;
	padding: 20px;
	margin: 15px;
}

.in {
	display: inline-block;
	width: 80%;
	height: 100px;
}
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
                            <h2>숙 박</h2>
                            <p>제주 숙박 정보 제공</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!-- hotel list css start-->

		<div class="section-top-border">
		<div class="container box_1170">
			<div class="row gallery-item">
				<div class="col-md-6">

					<!-- 전체를 하나로 묶음 -->
					<h2 style="width: 1000px; text-align: left">숙박 지도</h2>

					<div class="in" style="width: 100%; height: 100%; float: left;">
						<!-- 왼쪽 절반 -->

						<!-- 지도를 표시할 div 입니다 -->
						<div id="map" style="width: 100%; height: 350px;"></div>
					</div>
				</div>
				<div class="col-md-6">
					<!--  왼쪽 절반 여기까지 -->
					<h2 style="width: 1000px; text-align: left">날씨</h2>
					<div style="width: 100%; height: 100%; float: right;">
						<!-- 오른쪽 절반 -->

						<div id="show" style="float: left;"></div>

						<img id="weatherImg" width="300px" height="200px" />

					</div>
				</div>
			</div>
			<!-- 오른쪽 절반 여기까지 -->
		</div>
	</div>
	<!-- 전체를 하나로 묶음 여기까지-->


	<section class="top_place section_padding">
		<div class="container">

			<div class="row" id="result">
			<c:if test="${totalCount == 0}">
					<h2 align="center">검색결과가 없습니다.</h2>
				</c:if>
			</div>

		</div>
	</section>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6ecf8a543ad7d10bc932cc4a55014b9"></script>
	<script src="../jquery-1.11.0.min.js"></script>
	<script>
		//=============================================================== 관광 api부분 =================================================================
		var ylist = new Array(); //각각의 게시글의 x값을 받을 리스트 객체 생성
		var xlist = new Array(); //각각의 게시글의 y값을 받을 리스트 객체 생성
		var title = new Array(); //제목 리스트로 받아서 지도 아이콘 에 마우스오버에 써주기 
		var contentid = new Array(); //각각의 contentid 를 받아서 클릭시 상세정보로 보내주기
		$.ajax({
			url : 'SleepData.shop?pageNo=${pageNo}',
			async : false,
			type : 'get',
			dataType : 'json',
			success : function(data) {
				console.log(data);
				//         console.log(data.response.body.items.item);
				var myItem = data.response.body.items.item;
				
				for (var i = 0; i < myItem.length; i++) {
					var output = '';
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
					output += "<a href='sleepdetail.shop?contentid="+myItem[i].contentid + "&contenttypeid="+myItem[i].contenttypeid + "'><img src="+image+" style='width: 320px; height: 180px;'></a><br>"

					output += "</ul><br></div></div></div>" */
					output += "<div class='col-lg-4 col-md-4'>"
					output += "<a href='sleepdetail.shop?contentid=" + myItem[i].contentid + "&contenttypeid="+ myItem[i].contenttypeid+ "' class='place_btn'>"+"<h4>" +myItem[i].title + "</h4></a>"
					output += "<div class='single_place'>"
					output += "<img src='" + image +  "' alt='' style='width:100%; height:240px;'>"
					output += "<div class='hover_Text d-flex align-items-end justify-content-between'><div class='hover_text_iner'>"
					output += "<a href='sleepdetail.shop?contentid=" + myItem[i].contentid + "&contenttypeid="+ myItem[i].contenttypeid+ "' class='place_btn'>상세보기</a>"
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


		//=============================================================== 지도 부분 =================================================================
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.386795, 126.552206), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 

var positions = [];
for (var i = 0; i < ylist.length; i++) {
	
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
    var iwContent = "<div><a href='sleepdetail.shop?contentid="+contentid[i]+"'>"+title[i]+"</div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({

    	content : iwContent,
        removable : iwRemoveable
    });


    kakao.maps.event.addListener(marker, 'click', makeListener(map, marker, infowindow));
}

function makeListener(map, marker, infowindow) {
return function() {
 infowindow.open(map, marker);
};
}
			

		//===============================================================기상청 api 부분=================================================================

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
							lat : 33.5082797, 
							lon : 126.489,
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
								wf = '<h3><b>현재시간 : </b> </h3><h4>'
									+ today
									+ ' </h4><br>'
									+ '<h3><b>'
									+ '제주시'
									+ '</b></h3>'
									+ '<h4>현재 온도 : '
									+ data.main.temp
									+ '&deg;C </h4>'
									+ '<br>'
									+ '<h4> 현재 날씨 : '
									+ val.main
									+ '</h4>'
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
            <!--  여기까지 내용 들어가는 부분 -->
	<nav class="blog-pagination justify-content-center d-flex">
		<ul class="pagination">
			<c:if test="${totalCount > 0}">
				<c:if test="${pageNo > 1}">
					<li class="page-item active"><a href="sleep.shop?&pageNo=1"
						class="page-link"><<</a></li>
					<c:if test="${pageNo > 1}">
						<li class="page-item active"><a
							href="sleep.shop?pageNo=${pageNo - 1}" class="page-link"><</a></li>
					</c:if>
				</c:if>
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<!-- keyword = 검색어, pageNo = 페이지 이동 -->
					<c:if test="${pageNo == a}">
						<li class="page-item"><a class="page-link">${a}</a></li>
					</c:if>
					<c:if test="${pageNo != a}">
						<li class="page-item active"><a
							href="sleep.shop?&pageNo=${a}" class="page-link">${a}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pageNo < maxpage}">
					<li class="page-item active"><a
						href="sleep.shop?&pageNo=${pageNo + 1}" class="page-link">></a></li>
					<li class="page-item active"><a
						href="sleep.shop?&pageNo=${maxpage}" class="page-link">>></a></li>
				</c:if>
			</c:if>

		</ul>
	</nav>
	<br><br><br>

	<!-- hotel list css end -->

    <!-- footer part start-->
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
    <!-- footer part end-->
	
    <!-- jquery plugins here-->
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