<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>게시판 목록</title>
	<script type="text/javascript">
	function listdo(page){
		document.searchform.pageNum.value=page;
		document.searchform.submit();
	}
	</script>
</head>
<body>
    <section class="breadcrumb breadcrumb_bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>정보공유</h2>
                            <p>제주도 정보 공유</p>
                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!--================Blog Area =================-->
    <section class="blog_area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                        <article class="blog_item">
                        	<c:if test="${listcount == 0}">
                        		<div class="blog_item_img" style="text-align:center">
                        			<a href="write.shop"><i class="far fa-times-circle fa-7x"></i></a>
                        		</div>
                        		<div class="blog_details" style="text-align:center">
                                <a class="d-inline-block" href="write.shop">
                                    <h2>등록된 게시글이 없습니다</h2>
                                </a>
                            </div>
                        	</c:if>
                        	<c:if test="${listcount > 0}">
                        	<c:forEach var="board" items="${boardlist}">
                            <div class="blog_details">
                                <a class="d-inline-block" href="detail.shop?num=${board.num}">
                                    <h2>${board.subject}</h2>
                                </a>
                                <c:if test="${fn:length(board.content) > 100}">
                                <p>${fn:substring(board.content,0,100)}...</p>
                                </c:if>
                                <c:if test="${fn:length(board.content) <= 100}">
                                <p>${board.content}</p>
                                </c:if>
                                <ul class="blog-info-link">
                                    <li><a href="#"><i class="fab fa-angellist"></i>
                                    										<c:choose>
                                    											<c:when test="${board.type==1}">여행코스</c:when>
                                    											<c:when test="${board.type==2}">맛집</c:when>
                                    											<c:when test="${board.type==3}">숙박</c:when>
                                    											<c:when test="${board.type==4}">자유게시판</c:when>
                                    										</c:choose>
                                    										</a></li>
                                    <li><a href="#"><i class="far fa-user"></i> ${board.id}</a></li>
                                    <li><i class="far fa-comments"></i> ${board.comment} Comments</a></li>
                                    <li><i class="fas fa-heart" style="color:red"></i>${board.recommend}</li>
                                    <li><i class="far fa-clock"></i> <fmt:formatDate var="rdate" value="${board.regdate}" pattern="yyyyMMdd" />
                                    										 	 <fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" /></a></li>
                                </ul>
                            </div>
                            </c:forEach>
                            </c:if>
                        </article>
						<div class="blog-author">
                        	<div class="media align-items-center">
								<button type="button" class="button rounded-0 primary-bg text-white w-100 btn_1" onclick="location.href='write.shop'">Write</button>
                        	</div>
                    	</div>
                    	
                    	<c:if test="${listcount > 0}">
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                            	<c:if test="${pageNum > 1}">
                                <li class="page-item">
                                    <a href="javascript:listdo(${pageNum - 1})" class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </a>
                                </li>
                                </c:if>
                                <c:if test="${pageNum <= 1}">
                                <li class="page-item">
                                    <button class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </button>
                                </li>
                                </c:if>
                                <c:forEach var="a" begin="${startpage}" end="${endpage}">
                                <c:if test="${a == pageNum}">
                                <li class="page-item">
                                    <button class="page-link">${a}</button>
                                </li>
                                </c:if>
                                <c:if test="${a != pageNum}">
                                <li class="page-item active">
                                    <a href="javascript:listdo(${a})" class="page-link">${a}</a>
                                </li>
                                </c:if>
                                </c:forEach>
                                <c:if test="${pageNum < maxpage}">
                                <li class="page-item">
                                    <a href="javascript:listdo(${pageNum + 1})" class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </li>
                                </c:if>
                                <c:if test="${pageNum >= maxpage}">
                                <li class="page-item">
                                    <button class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </button>
                                </li>
                                </c:if>
                            </ul>
                        </nav>
                        </c:if>
                        
                        
                    </div>
                </div>
   
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget search_widget">
                            <form action="list.shop" method="post" name="searchform">
                            <input type="hidden" name="pageNum" value="1">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                    	<select name="searchtype" style="width:100px;">
										<option value="">선택하세요</option>
										<option value="subject">제목</option>
										<option value="id">작성자</option>
										<option value="content">내용</option>
										</select>
										<script type="text/javascript">
											searchform.searchtype.value="${param.searchtype}";
										</script>
                                        <input type="text" name="searchcontent" class="form-control" value="${param.searchcontent }"
                                        	placeholder='Search Keyword'
                                            onfocus="this.placeholder = ''"
                                            onblur="this.placeholder = 'Search Keyword'">
                                        <div class="input-group-append">
                                            <button class="btn" type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1"
                                    type="submit">Search</button>
                            </form>
                        </aside>

                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Category</h4>
                            <ul class="list cat-list">
                                <li>
                                    <a href="trip.shop" class="d-flex">
                                        <p>여행코스</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="food.shop" class="d-flex">
                                        <p>맛집</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="sleep.shop" class="d-flex">
                                        <p>숙박</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="free.shop" class="d-flex">
                                        <p>자유게시판</p>
                                    </a>
                                </li>
                            </ul>
                        </aside>
                        <aside class="single_sidebar_widget popular_post_widget">
                            <h3 class="widget_title">최근 게시글</h3>
                            <c:forEach var="recent" items="${recentlist}">
                            <div class="media post_item">
                                
                                <div class="media-body">
                                    <a href="detail.shop?num=${recent.num}">
                                        <h3>${recent.subject}</h3>
                                    </a>
                                    <p><fmt:formatDate value="${recent.regdate}" pattern="yyyy-MM-dd" /></p>
                                </div>
                                <hr>
                            </div>
                           </c:forEach>
                        </aside>
                        <!-- 태그 -->
                        <!-- <aside class="single_sidebar_widget tag_cloud_widget">
                            <h4 class="widget_title">Tag Clouds</h4>
                            <ul class="list">
                                <li>
                                    <a href="#">project</a>
                                </li>
                                <li>
                                    <a href="#">love</a>
                                </li>
                                <li>
                                    <a href="#">technology</a>
                                </li>
                                <li>
                                    <a href="#">travel</a>
                                </li>
                                <li>
                                    <a href="#">restaurant</a>
                                </li>
                                <li>
                                    <a href="#">life style</a>
                                </li>
                                <li>
                                    <a href="#">design</a>
                                </li>
                                <li>
                                    <a href="#">illustration</a>
                                </li>
                            </ul>
                        </aside> -->
                        <!-- 태그 -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->
</body>
</html>