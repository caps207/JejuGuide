<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>


<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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

table .even {
	background: #fdf3f5;
}

.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 350px;
}

#category {
	position: absolute;
	top: 10px;
	left: 10px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}
</style>
<!-- 로그인시 자식창 띄우게 해주는 script -->
<script type="text/javascript">
	function win_login() {
		var op = "width=500, height=900, left=50,top=150";
		open("../user/login.shop", "", op);
	}
	function win_signup() {
		var op = "width=500, height=900, left=50,top=150";
		open("../user/userEntry.shop", "", op);
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
	<!-- 여기까지 -->
	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>편의시설</h2>
							<p>은행 & 마트 & 약국 & 주유소 & 편의점</p>
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
					<h2>편의시설 정보</h2>
					<p>마우스 휠 사용으로 지도의 확대가 가능합니다.</p>
					<p>마커펜클릭시 카테고리 상세정보로 이동합니다.</p>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="map_wrap" style="align: center;">
				<div id="map"
					style="width: 100%; height: 500px; position: relative; overflow: hidden;"></div>
				<ul id="category">
					<li id="BK9" data-order="0"><span class="category_bg bank"></span>
						은행</li>
					<li id="MT1" data-order="1"><span class="category_bg mart"></span>
						마트</li>
					<li id="PM9" data-order="2"><span class="category_bg pharmacy"></span>
						약국</li>
					<li id="OL7" data-order="3"><span class="category_bg oil"></span>
						주유소</li>
					<li id="CS2" data-order="5"><span class="category_bg store"></span>
						편의점</li>
				</ul>
			</div>
		</div>
		<br><br><br><br><br><br><br><br><br><br><br>
	</section>
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
	<!-- 지도를 표시할 div 입니다 -->
	

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6ecf8a543ad7d10bc932cc4a55014b9&libraries=services"></script>
	<script>
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new kakao.maps.CustomOverlay({
			zIndex : 1
		}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		markers = [], // 마커를 담을 배열입니다
		currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.3878655, 126.5578783), // 지도의 중심좌표
			level : 9
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map);

		// 지도에 idle 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', searchPlaces);

		// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
		contentNode.className = 'placeinfo_wrap';

		// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

		// 커스텀 오버레이 컨텐츠를 설정합니다
		placeOverlay.setContent(contentNode);

		// 각 카테고리에 클릭 이벤트를 등록합니다
		addCategoryClickEvent();

		// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		function addEventHandle(target, type, callback) {
			if (target.addEventListener) {
				target.addEventListener(type, callback);
			} else {
				target.attachEvent('on' + type, callback);
			}
		}

		// 카테고리 검색을 요청하는 함수입니다
		function searchPlaces() {
			if (!currCategory) {
				return;
			}

			// 커스텀 오버레이를 숨깁니다 
			placeOverlay.setMap(null);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			ps.categorySearch(currCategory, placesSearchCB, {
				useMapBounds : true
			});
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
				displayPlaces(data);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

			} else if (status === kakao.maps.services.Status.ERROR) {
				// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

			}
		}

		// 지도에 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
			// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
			var order = document.getElementById(currCategory).getAttribute(
					'data-order');

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var marker = addMarker(new kakao.maps.LatLng(places[i].y,
						places[i].x), order);

				// 마커와 검색결과 항목을 클릭 했을 때
				// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
				(function(marker, place) {
					kakao.maps.event.addListener(marker, 'click', function() {
						displayPlaceInfo(place);
					});
				})(marker, places[i]);
			}
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, order) {
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(11, 28)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		function displayPlaceInfo(place) {
			var content = '<div class="placeinfo">'
					+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
					+ place.place_name + '</a>';

			if (place.road_address_name) {
				content += '    <span title="' + place.road_address_name + '">'
						+ place.road_address_name
						+ '</span>'
						+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
						+ place.address_name + ')</span>';
			} else {
				content += '    <span title="' + place.address_name + '">'
						+ place.address_name + '</span>';
			}

			content += '    <span class="tel">' + place.phone + '</span>'
					+ '</div>' + '<div class="after"></div>';

			contentNode.innerHTML = content;
			placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
			placeOverlay.setMap(map);
		}

		// 각 카테고리에 클릭 이벤트를 등록합니다
		function addCategoryClickEvent() {
			var category = document.getElementById('category'), children = category.children;

			for (var i = 0; i < children.length; i++) {
				children[i].onclick = onClickCategory;
			}
		}

		// 카테고리를 클릭했을 때 호출되는 함수입니다
		function onClickCategory() {
			var id = this.id, className = this.className;

			placeOverlay.setMap(null);

			if (className === 'on') {
				currCategory = '';
				changeCategoryClass();
				removeMarker();
			} else {
				currCategory = id;
				changeCategoryClass(this);
				searchPlaces();
			}
		}

		// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		function changeCategoryClass(el) {
			var category = document.getElementById('category'), children = category.children, i;

			for (i = 0; i < children.length; i++) {
				children[i].className = '';
			}

			if (el) {
				el.className = 'on';
			}
		}
	</script>
	
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