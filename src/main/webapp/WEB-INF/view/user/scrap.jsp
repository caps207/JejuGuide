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
</head>
<body>

<!-- 스크랩 리스트 뽑아주기. -->
   <div class="container">
   <span class="login100-form-title p-b-51">
	Book Mark
   </span>
   <hr>
   <h4>제주 정보</h4>
   <c:forEach var="info" items="${infolist}" >
      <div class="d-flex justify-content-between">
         <div class="d-flex align-items-center">
         <!-- 스크랩 게시물이 없는경우 -->
         <c:if test="${info.url.equals(null) }">
            <h4>스크랩 게시물이 없습니다.</h4>
         </c:if>
         <!-- 스크랩 게시물이 있는경우 -->
            <a href="${info.url }"><i class="far fa-bookmark"></i>${info.title}</a>
         </div>
      </div>
   </c:forEach>
   <hr>
   <h4>여행코스</h4>
   <c:forEach var="trip" items="${triplist}" >
      <div class="d-flex justify-content-between">
         <div class="d-flex align-items-center">
         <!-- 스크랩 게시물이 없는경우 -->
         <c:if test="${trip.url.equals(null) }">
            <h4>스크랩 게시물이 없습니다.</h4>
         </c:if>
         <!-- 스크랩 게시물이 있는경우 -->
            <a href="${trip.url }"><i class="far fa-bookmark"></i>${trip.title}</a>
         </div>
      </div>
   </c:forEach>
   <hr>
   <h4>맛 집</h4>
   <c:forEach var="food" items="${foodlist}" >
      <div class="d-flex justify-content-between">
         <div class="d-flex align-items-center">
         <!-- 스크랩 게시물이 없는경우 -->
         <c:if test="${food.url.equals(null) }">
            <h4>스크랩 게시물이 없습니다.</h4>
         </c:if>
         <!-- 스크랩 게시물이 있는경우 -->
            <a href="${food.url }"><i class="far fa-bookmark"></i></i>${food.title}</a>
         </div>
      </div>
   </c:forEach>
   <hr>
   <h4>숙 박</h4>
   <c:forEach var="sleep" items="${sleeplist}" >
      <div class="d-flex justify-content-between">
         <div class="d-flex align-items-center">
         <!-- 스크랩 게시물이 없는경우 -->
         <c:if test="${sleep.url.equals(null)}">
            <h4>스크랩 게시물이 없습니다.</h4>
         </c:if>
         <!-- 스크랩 게시물이 있는경우 -->
            <a href="${sleep.url }"><i class="far fa-bookmark"></i>${sleep.title}</a>
         </div>
      </div>
   </c:forEach>
   <hr>
   <h4>자유게시판</h4>
   <c:forEach var="free" items="${freelist}" >
      <div class="d-flex justify-content-between">
         <div class="d-flex align-items-center">
         <!-- 스크랩 게시물이 없는경우 -->
         <c:if test="${free.url.equals(null)}">
            <h4>스크랩 게시물이 없습니다.</h4>
         </c:if>
         <!-- 스크랩 게시물이 있는경우 -->
            <a href="${free.url }"><i class="far fa-bookmark"></i>${free.title}</a>
         </div>
      </div>
   </c:forEach>
   <hr>
   <h4>좋아요</h4>
   <c:forEach var="brecom" items="${brecom}" >
      <div class="d-flex justify-content-between">
         <div class="d-flex align-items-center">
         <!-- 스크랩 게시물이 없는경우 -->
         <c:if test="${brecom.id.equals(null) }">
            <h4>스크랩 게시물이 없습니다.</h4>
         </c:if>
         <!-- 스크랩 게시물이 있는경우 -->
            <a href="${brecom.url}"><i class="fas fa-heart" style="color:red"></i>${brecom.subject}</a>
         </div>
      </div>
   </c:forEach>
   </div>
   <br>
   
   <!-- 스크랩 리스트 뽑아주기. -->



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