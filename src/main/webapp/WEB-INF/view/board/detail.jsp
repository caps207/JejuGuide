<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>게시물 상세보기</title>
<script type="text/javascript">
	function del(){
		if(confirm("삭제하시겠습니까?")) {
		    location.href = "delete.shop?num=${board.num}"
		}
	}
	function commentdel(){
		if(confirm("삭제하시겠습니까?")) {
		    location.href = "commentdelete.shop?num=${comment.num}"
		}
	}
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
                                    <h2>details</h2>
                                    
                              </div>
                        </div>
                  </div>
            </div>
      </div>
</section>
      <!-- breadcrumb start-->

    <!--================Blog Area =================-->
    <section class="blog_area single-post-area section_padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 posts-list">
                    <div class="single-post">
                    	<!--
                        <div class="feature-img">
                            <img class="img-fluid" src="../img/blog/single_blog_1.png" alt="">
                        </div>
                         -->
                        <div class="blog_details">
                            <h2>${board.subject}</h2>
                            <ul class="blog-info-link mt-3 mb-4">
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
                            <p class="excert">
                                ${board.content}
                            </p>
                        </div>
                    </div>
                    
                    <div class="navigation-top">
                        <div class="d-sm-flex justify-content-between text-center">
                        	<form action="recommend.shop" method="post" name="r">
								<input type="hidden" name="num" value="${board.num}"/>
								<input type="hidden" name="url" value="${scrapurl}"/>
	                            <p class="like-info"><span class="align-middle"><i class="fas fa-heart" style="color:red"></i></span><a href="javascript:r.submit();">좋아요</a></p>
	                        </form>
                            <div class="col-sm-4 text-center my-2 my-sm-0">
                                <!-- <p class="comment-count"><span class="align-middle"><i class="far fa-comment"></i></span> 06 Comments</p> -->
                            </div>
                            <ul class="social-icons">
                            	<li>
                            	<!-- 스크랩 폼 -->
								<form action="scrap.shop" method="post">
									<input type="hidden" name="title" value="${board.subject }">
									<input type="hidden" name="url" value="${scrapurl }">
									<input type="hidden" name="type" value="${type }">
									<input type="submit" value="스크랩">
								</form>
								<!-- 스크랩 폼 -->
                            	</li>
                                <li><a href="https://www.facebook.com/"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="https://twitter.com/"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="https://www.instagram.com/"><i class="flaticon-instagram"></i></a>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="blog-author">
                        <div class="media align-items-center">
                            <c:if test="${loginUser.id == 'admin' || loginUser.id == board.id}">
							<button type="button" class="button rounded-0 primary-bg text-white w-100 btn_1" onclick="location.href='update.shop?num=${board.num}'">Update</button>
							<button type="button" class="button rounded-0 primary-bg text-white w-100 btn_1" onclick="del()">Delete</button>
							</c:if>
							<button type="button" class="button rounded-0 primary-bg text-white w-100 btn_1" onclick="location.href='list.shop'">List</button>
                        </div>
                    </div>
                    <div class="comments-area">
                        <h4>댓글</h4>
                        <c:if test="${board.comment == 0 }">
                        <div class="comment-list">
                            <div class="single-comment justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                    <div class="desc">
                                        <p class="comment" >
											등록된 댓글이 없습니다
                                        </p>
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex align-items-center">
                                            </div>
                                            <div class="reply-btn">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:if>
                        <c:if test="${board.comment > 0 }">
                        <c:forEach var="comment" items="${commentlist}">
                        <div class="comment-list">
                            <div class="single-comment justify-content-between d-flex">
                                <div class="user justify-content-between d-flex">
                                    <div class="desc">
                                        <p class="comment">
                                            ${comment.content}
                                        </p>
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex align-items-center">
                                                <h5>
                                       				<a href="#">${comment.id}</a>
                                   				</h5>
                                                <p class="date">${comment.regdate}</p>
                                            </div>
                                            <div class="reply-btn">
                                            <c:if test="${loginUser.id == 'admin' || loginUser.id == comment.id}">
                                                <a href="commentdelete.shop?num=${comment.num}" class="btn-reply text-uppercase">삭제</a>
                                            </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        </c:if>
                        <form action="detail.shop?num=${board.num}&pageNum=${pageNum}" method="post" name="searchform">
						<input type="hidden" name="pageNum" value="1">

                        <c:if test="${board.comment > 0 }">
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
                                    <a href="detail.shop?num=${board.num}&pageNum=${a}" class="page-link">${a}</a>
                                </li>
                                </c:if>
                                </c:forEach>
                                <c:if test="${pageNum < maxpage}">
                                <li class="page-item">
                                    <a href="detail.shop?num=${board.num}&pageNum=${pageNum +1}" class="page-link" aria-label="Next">
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
                        </form>
                        
                    </div>
                    <div class="comment-form">
                        <h4>댓글 남기기</h4>
                        <form:form modelAttribute="comment" action="commentwrite.shop" method="post" name="f">
                        <input type="hidden" value="${board.num}" name="num">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <form:textarea path="content" class="form-control w-100" cols="30" rows="9" placeholder="Write Comment"/>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="button button-contactForm btn_1">Send Message</button>
                            </div>
                        </form:form>
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
                            <h3 class="widget_title">Recent Post</h3>
                            <c:forEach var="recent" items="${recentlist }">
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
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================ Blog Area end =================-->
</body>
</html>