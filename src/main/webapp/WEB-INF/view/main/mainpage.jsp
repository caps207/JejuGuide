<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<!-- <META HTTP-EQUIV="refresh" CONTENT="5"> -->
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
<style type="text/css">
.map_wrap, .map_wrap * {
 margin: 0;
 padding: 0;
 font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
 font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
 color: #000;
 text-decoration: none;
}

.map_wrap {
 position: relative;
 width: 100%;
 height: 500px;
}

#menu_wrap {
 position: absolute;
 top: 0;
 left: 0;
 bottom: 0;
 width: 250px;
 margin: 10px 0 30px 10px;
 padding: 5px;
 overflow-y: auto;
 background: rgba(255, 255, 255, 0.7);
 z-index: 1;
 font-size: 12px;
 border-radius: 10px;
}

.bg_white {
 background: #fff;
}

#menu_wrap hr {
 display: block;
 height: 1px;
 border: 0;
 border-top: 2px solid #5F5F5F;
 margin: 3px 0;
}

#menu_wrap .option {
 text-align: center;
}

#menu_wrap .option p {
 margin: 10px 0;
}

#menu_wrap .option button {
 margin-left: 5px;
}

#placesList li {
 list-style: none;
}

#placesList .item {
 position: relative;
 border-bottom: 1px solid #888;
 overflow: hidden;
 cursor: pointer;
 min-height: 65px;
}

#placesList .item span {
 display: block;
 margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
 text-overflow: ellipsis;
 overflow: hidden;
 white-space: nowrap;
}

#placesList .item .info {
 padding: 10px 0 10px 55px;
}

#placesList .info .gray {
 color: #8a8a8a;
}

#placesList .info .jibun {
 padding-left: 26px;
 background:
  url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
  no-repeat;
}

#placesList .info .tel {
 color: #009900;
}

#placesList .item .markerbg {
 float: left;
 position: absolute;
 width: 36px;
 height: 37px;
 margin: 10px 0 0 10px;
 background:
  url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
  no-repeat;
}

#placesList .item .marker_1 {
 background-position: 0 -10px;
}

#placesList .item .marker_2 {
 background-position: 0 -56px;
}

#placesList .item .marker_3 {
 background-position: 0 -102px
}

#placesList .item .marker_4 {
 background-position: 0 -148px;
}

#placesList .item .marker_5 {
 background-position: 0 -194px;
}

#placesList .item .marker_6 {
 background-position: 0 -240px;
}

#placesList .item .marker_7 {
 background-position: 0 -286px;
}

#placesList .item .marker_8 {
 background-position: 0 -332px;
}

#placesList .item .marker_9 {
 background-position: 0 -378px;
}

#placesList .item .marker_10 {
 background-position: 0 -423px;
}

#placesList .item .marker_11 {
 background-position: 0 -470px;
}

#placesList .item .marker_12 {
 background-position: 0 -516px;
}

#placesList .item .marker_13 {
 background-position: 0 -562px;
}

#placesList .item .marker_14 {
 background-position: 0 -608px;
}

#placesList .item .marker_15 {
 background-position: 0 -654px;
}

#pagination {
 margin: 10px auto;
 text-align: center;
}

#pagination a {
 display: inline-block;
 margin-right: 10px;
}

#pagination .on {
 font-weight: bold;
 cursor: default;
 color: #777;
}
</style>
<!-- 로그인시 자식창 띄우게 해주는 script -->
</head>

<body>
	<!-- 데코레이터 헤더 부분 -->
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
                            <a href="https://www.facebook.com/"><i class="flaticon-facebook"></i></a>
                            <a href="https://twitter.com/"><i class="flaticon-twitter"></i></a>
                            <a href="https://www.instagram.com/"><i class="flaticon-instagram"></i></a>
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
                            <a class="navbar-brand" href="/project/main/mainpage.shop"> <img src="../img/logo3.jpg" alt="logo" width="150" height="60"> </a> <!--  -->
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


	<!-- banner part start-->
	<section class="banner_part">
		<div class="container">
			<div class="row align-items-center justify-content-center"></div>
		</div>
	</section>
	<!-- banner part start-->

	<!-- booking part start-->
	<section class="booking_part">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="booking_menu">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link" id="place-tab"
								data-toggle="tab" href="#place" role="tab" aria-controls="place"
								aria-selected="false"> <font size="10px" color="skyblue">JEJU
										INFOMATION</font></a></li>
						</ul>
					</div>
				</div>
				<!--     <div class="col-lg-12"> -->
				<!--      <div class="booking_content"> -->
				<!--       <div class="tab-content" id="myTabContent"> -->
				<!--        <div class="tab-pane fade show active" id="hotel" role="tabpanel" -->
				<!--         aria-labelledby="hotel-tab"> -->
				<!--         <div class="booking_form"> -->
				<!--          <form action="#"> -->
				<!--           <div class="form-row"> -->
				<!--            <div class="form_colum"> -->
				<!--             <select class="nc_select"> -->
				<!--              <option selected>도시를 선택하세요</option> -->
				<!--              <option value="1">제주시</option> -->
				<!--              <option value="2">서귀포시</option> -->
				<!--             </select> -->
				<!--            </div> -->
				<!--            <div class="form_colum"> -->
				<!--             <select class="nc_select"> -->
				<!--              <option selected>위치를 선택하세요</option> -->
				<!--              <option value="1">One</option> -->
				<!--              <option value="2">Two</option> -->
				<!--              <option value="3">Three</option> -->
				<!--             </select> -->
				<!--            </div> -->
				<!--            <div class="form_colum"> -->
				<!--             <input id="datepicker_1" placeholder="축제 시작 기간"> -->
				<!--            </div> -->
				<!--            <div class="form_colum"> -->
				<!--             <input id="datepicker_2" placeholder="축제 종료 기간"> -->
				<!--            </div> -->

				<!--            <hr> -->
				<!--            <div class="form_btn"> -->
				<!--             <a href="#" class="btn_1">검색하기</a> -->
				<!--            </div> -->
				<!--           </div> -->
				<!--          </form> -->
				<!--         </div> -->
				<!--        </div> -->

				<!--       </div> -->
				<!--      </div> -->
				<!--     </div> -->

				<div style="width: 75%; float: left; margin-left: 30px;">
					<div class="map_wrap">
						<div id="map"
							style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

						<div id="menu_wrap" class="bg_white">
							<div class="option">
								<div>
									<form onsubmit="searchPlaces(); return false;">
										키워드 : <input type="text" id="keyword" size="15">
										<button type="submit">검색하기</button>
									</form>
								</div>
							</div>
							<hr>
							<ul id="placesList"></ul>
							<div id="pagination"></div>
						</div>
					</div>
				</div>
				<div
					style="width: 240px; float: right; height: 100%; margin-left: 10px; background-color: #EFFBFB; padding: 20px;">
					<div>
						<table>
            <tr><td colspan="2" style="text-align: center;"><font size="6px" color="#5882FA">검색 순위<br><br></font></td></tr>
            
            <c:forEach items="${searchrank}" var="searchrank" varStatus="status">
            <tr>
<%--                <td style="width: 90%;">${searchrank.keyword}</td> --%>
<%--                <td style="width: 90%;"><input type="button" class="btn btn-link" style="height: 5px;" value="${searchrank.keyword}" name="searchk" id="searchk${status.index}" onclick="searchPlaces('2', 'searchk${status.index}');"></td> --%>
               <td style="width: 90%;"><input type="button" class="btn btn-link" style="height: 35px;"  value="${searchrank.keyword}" name="searchk" id="searchk${status.index}" onclick="searchPlaces('2', 'searchk${status.index}');"></td>
               <td style="width: 10%;">${searchrank.cnt}&nbsp;&nbsp;&nbsp;명</td>
            </tr>
            </c:forEach>
         </table>
					</div>
				</div>
				<!--   <form action="clickkey.shop" method="post"> -->
				<!-- <form onsubmit="searchPlaces(); return false;"> -->
				<c:if test="${!empty sessionScope.loginUser }">
					<div style="float: left;">
						<br>
						<h2>최근검색어</h2>

						<c:forEach items="${searchlist}" var="searchlist"
							varStatus="status">
							<input type="button" style="margin-bottom: 5px;"
								class="btn btn-primary" value="${searchlist.keyword}"
								name="searchk1" id="searchk1${status.index}"
								onclick="searchPlaces('3', 'searchk1${status.index}');">
						</c:forEach>
					</div>
				</c:if>
				<!--  </form> -->



			</div>
		</div>
	</section>
	<!-- Header part end-->

	<!--::industries start::-->
	<!-- <section class="best_services section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-6">
					<hr>
					<div class="section_tittle text-center">
						<h2 style="width: 1000px; text-align: left">저희 홈페이지는 최고의 정보를
							제공합니다!</h2>
						<p>제주시의 날씨 및 기상 정보를 한눈에!</p>
						<p>제주시의 명소와 축제 정보를 한눈에!</p>
						<p>제주시의 맛집 정보까지!</p>
					</div>
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img src="../img/services_1.jpg" alt="">
						<h3>
							<a href="#"> 날씨 및 기상</a>
						</h3>
						<p>날씨 정보도 중요하잖아요?</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img src="../img/services_2.jpg" alt="">
						<h3>
							<a href="place.shop"> 명소</a>
						</h3>
						<p>다양한 문화와 볼거리가 있잖아요?</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img src="../img/services_3.jpg" alt="">
						<h3>
							<a href="food.shop"> 맛집 </a>
						</h3>
						<p>먹어야 힘이 나잖아요?</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img src="../img/services_4.jpg" alt="">
						<h3>
							<a href="festival.shop"> 축제</a>
						</h3>
						<p>즐기는 것만큼 즐거운 건 없잖아요?</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img src="../img/parking.png" alt="">
						<h3>
							<a href="park.shop"> 주차장</a>
						</h3>
						<p>시간을 아껴야 하잖아요?</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img src="../img/sleep2.JPG" alt="">
						<h3>
							<a href="sleep.shop"> 숙소</a>
						</h3>
						<p>잠은 소중 하잖아요?</p>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="single_ihotel_list">
						<img src="../img/service.PNG" alt="" height="175">
						<h3>
							<a href="service.shop"> 편의시설</a>
						</h3>
						<p>은행 & 마트 & 약국 & 주유소 & 편의점</p>
					</div>
				</div>
			</div>
		</div>
	</section> -->
	<!--::industries end::-->

	<!--top place start-->
	<section class="top_place section_padding">
		<div class="container">
			<div class="row justify-content-center" style="width: 100%;">
				<div class="col-xl-6">
					<hr>
					<div class="section_tittle text-center">
						<h2>제주 최고의 명소!</h2>
						<p>제주특별자치도는 제주도와 그 주변 도서를 포함하는 행정 구역으로, 인구는 적으나 가장 큰 권한을 가진
							특별자치도이다. 대한민국 섬 중에서 가장 큰 제주도와 마라도, 우도, 추자군도 등을 포함한 유인도와 무인도로 구성되어
							있다. 2007년 제주 화산섬과 용암 동굴은 유네스코 세계유산에 등재되었다.</p>
					</div>
					<hr>
				</div>
			</div>
			<!-- 명소 1,2,3,4 순위 -->
			<div class="row" id="result">
				
				
			</div>
			<!-- 명소 1,2,3,4 순위 -->
		</div>
		
	</section>
	<!--top place end-->



	<!--::industries start::-->
	<section class="hotel_list section_padding">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-6">
					<div class="section_tittle text-center">
						<h2>최고의 숙박 업소!</h2>
						<p>원하는 위치의 숙박업소를 보시고 누르시면 해당 홈페이지로 이동합니다.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-6">
					<div class="single_ihotel_list">
						<img src="../img/ind/s1.PNG" alt="">

						<div class="hotel_text_iner">
							<h3>
								<a href="sleepdetail.shop?contentid=1891015"> 끄라비 펜션</a>
							</h3>

							<p>제주특별자치도 서귀포시 토평로148번길 28</p>
							<h5>064-733-3399</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="single_ihotel_list">
						<img src="../img/ind/s2.PNG" alt="">

						<div class="hotel_text_iner">
							<h3>
								<a href="sleepdetail.shop?contentid=2528102"> 꿈꾸는 노마드</a>
							</h3>

							<p>제주특별자치도 서귀포시 선반로 54</p>
							<h5>010-4574-4459</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="single_ihotel_list">
						<img src="../img/ind/s3.PNG" alt="">

						<div class="hotel_text_iner">
							<h3>
								<a href="sleepdetail.shop?contentid=138185"> 금호리조트 제주</a>
							</h3>

							<p>제주특별자치도 서귀포시 남원읍 태위로 522-12</p>
							<h5>064-766-8000</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!--  지도 script 들어가는 부분 -->

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a6ecf8a543ad7d10bc932cc4a55014b9&libraries=services"></script>
	<script src="../jquery-1.11.0.min.js"></script>
	<script>
			$.ajax({
				url : 'mainrank.shop',
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

						console.log(myItem.length);
						
						output += "<div class='col-lg-6 col-md-6'><div class='single_place'>"
						output += "<img src='" + myItem[i].firstimage +  "' alt='' style='width: 100%; height: 100%;'>"
						output += "<div class='hover_Text d-flex align-items-end justify-content-between'><div class='hover_text_iner'>"
						output += "<a href='placedetail.shop?contentid=" + myItem[i].contentid + "' class='place_btn'>상세보기</a>"
						output += "<h3>" +myItem[i].title+ "</h3>"
						output += "<p>" + myItem[i].addr1 + "</p>"
						output += "</div></div></div>"
						result.innerHTML += output;

					}
					result.innerHTML += "<a href='InfoTour.shop' class='btn_1 text-cnter'>더보기</a>"
				}

			});
			</script>
	<script>
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.3878655, 126.5578783), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces('1', null);

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces(num, ids) {
			console.log(num)
			if(num == 2){
				console.log($("#"+ids).val())
				$("#keyword").val($("#"+ids).val())
			}
			if(num == 3){
				console.log($("#"+ids).val())
				$("#keyword").val($("#"+ids).val())
			}
		
			var keyword = document.getElementById('keyword').value;
			var rkeyword = "제주도" + keyword;
			var user = "${loginUser.id}";
			console.log("키워드:"+keyword);

			//     if (!keyword.replace(/^\s+|\s+$/g, '')) {
			//         alert('키워드를 입력해주세요!');
			//         return false;
			//     }
			if (!user == "" && keyword != "") {
				// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
				var allData = {
					"userid" : user,
					"keyword" : rkeyword
				}
			
// 				console.log("키워드:" + keyword); //검색한 결과값 찍어보기.
// 				console.log("세션:" + user);
				// ajax 로 값 controller 단으로 넘겨주기
				$.ajax({
					url : "search.shop",
					dataType : "json",
					type : "POST",
					data : allData,
					success: function(data){
						
						
					}
				});
			}
			ps.keywordSearch(rkeyword, placesSearchCB);
		}
		

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);
				
				// 페이지 번호를 표출합니다
				displayPagination(pagination);
				
				

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('제주도에 검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
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

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
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
