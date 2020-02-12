<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>게시글 수정</title>
<style>
	input { width:100%; }
</style>
<script type="text/javascript">
	function file_delete(){
		document.f.fileurl.value = ""
		file_desc.style.display = "none";
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
						<h2>blog details</h2>
						<p>home . blog details</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!--================Blog Area =================-->

<section class="blog_area single-post-area section_padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 posts-list">
				<form:form modelAttribute="board" action="update.shop" enctype="multipart/form-data" name="f">
				<form:hidden path="num"/>
				<div class="single-post">
					<table class="w3-table w3-striped w3-bordered">
						<tr><td width="10%">게시판</td><td><form:select path="type">
															<option value="">게시판 선택</option>
															<option value="1">여행코스</option>
															<option value="2">맛집</option>
															<option value="3">숙박</option>
															<option value="4">자유게시판</option>
														 </form:select><font color="red"><form:errors path="type"/></font></td></tr>
						<tr><td width="10%">제목</td><td><form:input path="subject"/><font color="red"><form:errors path="subject"/></font></td></tr>
						<tr><td width="10%">내용</td><td><form:textarea path="content" rows="50" cols="80"/>
						<script>CKEDITOR.replace("content",{filebrowserImageUploadUrl:"imgupload.shop"});</script>
						<font color="red"><form:errors path="content"/></font></td></tr>
						<tr><td width="10%">첨부파일</td><td><c:if test="${!empty board.fileurl}">
														<div id="file_desc">
														<a href="file/${board.fileurl}">${board.fileurl}</a>
														<a href="javascript:file_delete()">[첨부파일삭제]</a>
														</div>
														</c:if>
														<form:hidden path="fileurl"/>
														<input type="file" name="file">
						</td></tr>
					</table>
				</div>					
				<div class="navigation-top">
					<div class="navigation-area">
						<div class="row">
							<div class="col-lg-12 col-md-12 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
								<div class="detials">
									<a href="javascript:document.f.submit()">게시글수정</a>
									<a href="list.shop">게시글목록</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				</form:form>
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
                                    <p>${recent.regdate}</p>
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
</body>
</html>