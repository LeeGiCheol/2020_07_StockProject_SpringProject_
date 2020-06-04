<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 상세조회</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- CSS파일 -->
<link href="/resources/css/free-board-detail1.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">

<script>
	$(document).ready(function() {
		$("#btnDelete").click(function() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				location.href = '/board/free/delete?pno=${boardDetail.pno}';
			} else {
				alert("취소하셨습니다.");
			}
		})
	});
</script>
<style>
div>ul>li {
	width: 380px;
}
</style>
</head>

<body>

<%@include file="mainheader.jsp" %> 

	<!-- article start -->
	<!-- 상단메뉴 -->
	<div class="sideBar col-md-4 order-md-2 mb-4" id="menu-bar">
		<ul class="list-group mb-3">
			<!-- java에서 온클릭 위치 바꾸기!!!!!!!!!!!!!!!!!!!-->
			<li
				class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed free-board"
				onclick="location.href='free-board.jsp'">
				<div>
					<h6 class="my-0">자유 게시판</h6>
				</div>
			</li>
			<li
				class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed news-borad"
				onclick="location.href='newsboard.jsp'">
				<div>
					<h6 class="my-0">뉴스 게시판</h6>
				</div>
			</li>
			<li
				class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed protfolio-board"
				onclick="location.href='#'">
				<div>
					<h6 class="my-0">포트폴리오 게시판</h6>
				</div>
			</li>
		</ul>
	</div>
	<!-- 상단메뉴 끝 -->
	<article class="bg-light container">
		<div class="allBody">
			<div class="row">
				<div class="sideBar col-md-4 order-md-2 mb-4">
					<div class="col-md-8 order-md-1"></div>
					<hr>
					<div>
						<div>
							<div class="notice-header">
								<div class="title-wrap">
									<p class="category-info">
										<a href="/notice">자유게시판</a>
									</p>
									<h2 id="" class="notice-title">${boardDetail.title}</h2>
								</div>
								<div class="info-wrap">
									<ul class="notice-info">
										<li class="author"><i class="fa fa-user-circle"></i>${boardDetail.nickname}</li>
										<li class="date"><i class="far fa-clock"></i>${boardDetail.bdateTime}</li>
									</ul>
								</div>
								<div class="article">${boardDetail.bcontent}</div>
							</div>
							<hr>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<c:forEach var="commentList" items="${commentList}">
				<!-- 댓글 -->
				<h2 id="commentBody" class="comment-title">댓글</h2>
				<div class="commentBody">
					<i class="fa fa-user-circle"></i> <b>${commentList.nickname}</b><br>
					<i class="far fa-clock"></i>${commentList.cdataTime}<br> <br>
					${commentList.ccontent}

					<c:if test="${loginUser.nickname eq commentList.nickname}">
						<button type="button" class="btn btn-sm btn-primary"
							id="btnUpdate"
							onclick="location.href='/board/free/update?pno=${boardDetail.pno}'">수정</button>
						<button type="button" class="btn btn-sm btn-primary"
							id="btnDelete">삭제</button>
					</c:if>
					<br>
					<hr class="comment-hr">

				</div>

			</c:forEach>

			<!-- 댓글이 없으면 버튼이 안뜨게 하려고 -->
			<c:if test="${commentList[0] ne null}">
				<nav aria-label="..." class="pagination">
					<ul class="pagination">
	
	
						<!-- << 버튼 -->
						<li>
							<a class="page-link"
								href="/board/free/detail?pno=${boardDetail.pno}&bnowPage=1"
								tabindex="-1" aria-disabled="true">
								<i class="fas fa-angle-double-left"></i>
							</a>
						</li>
	
						<!-- 1페이지에서 < 버튼 눌렀을 때 -->
						<c:if test="${commentPage.nowPage == 1}">
							<li>
								<a class="page-link"
									href="/board/free/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.nowPage}"
									tabindex="-1" aria-disabled="true">
									<i class="fas fa-angle-left"></i>
								</a>
							</li>
						</c:if>
						
						<!-- 1페이지가 아닌 페이지에서 < 버튼 눌렀을 때 -->
						<c:if test="${commentPage.nowPage != 1}">
							<li>
								<a class="page-link"
									href="/board/free/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.nowPage-1}"
									tabindex="-1" aria-disabled="true">
									<i class="fas fa-angle-left"></i>
								</a>
							</li>
						</c:if>
						
						
						<!-- 한번에 5개 페이지 보여줌 -->
						<c:forEach begin="${commentPage.startPage }"
							end="${commentPage.endPage }" var="p">
							<c:choose>
								<c:when test="${p == commentPage.nowPage}">
									<li class="page-item active" aria-current="page">
										<a class="page-link" href="#">${p}
											<span class="sr-only">(current)</span>
										</a>
									</li>
								</c:when>
								<c:when test="${p != commentPage.nowPage}">
									<li class="page-item">
										<a class="page-link" href="/board/free/detail?pno=${boardDetail.pno}&bnowPage=${p}">${p}</a>
									</li>
								</c:when>
							</c:choose>
						</c:forEach>
						
						<!-- 현재 페이지가 마지막 페이지일 경우 > 버튼을 눌렀을 때 -->
						<c:if test="${commentPage.nowPage == commentPage.lastPage}">
							<li>
								<a class="page-link"
									href="/board/free/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.nowPage}"
									tabindex="+1" aria-disabled="true">
									<i class="fas fa-angle-right"></i>
								</a>
							</li>
						</c:if>
						
						<!-- 현재 페이지가 마지막 페이지가 아닐 경우에 > 버튼을 눌렀을 때 -->					
						<c:if test="${commentPage.nowPage != commentPage.lastPage}">
							<li>
								<a class="page-link"
									href="/board/free/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.nowPage+1}"
									tabindex="+1" aria-disabled="true">
									<i class="fas fa-angle-right"></i>
								</a>
							</li>
						</c:if> 
	
						<!-- >> 버튼 -->
						<li>
							<a class="page-link"
							href="/board/free/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.lastPage}"
							tabindex="-1" aria-disabled="true">
								<i class="fas fa-angle-double-right"></i>
							</a>
						</li>
					</ul>
				</nav>
	
			</c:if>

			<hr>
			<div class="comment-wrap">
				<div>
					<div class="comment-form">
						<form action="/board/writeComment" method="POST">
							<fieldset>
								<dl class="comment-write">
									<dt>
										<label for="[##_comment_input_comment_##]">내용</label>
									</dt>
									<dd>
										<textarea name="ccontent" id="[##_comment_input_comment_##]"
											placeholder="여러분의 소중한 댓글을 입력해주세요"></textarea>
									</dd>
								</dl>
								<button type="submit" class="reply-btn">댓글 남기기</button>
							</fieldset>
						</form>




					</div>
				</div>
				<div class="buttons">
					<button type="button" class="btn btn-sm btn-primary" id="btnList"
						onclick="window.location.href='free-board.jsp'">목록</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnMyList"
						onclick="window.location.href='mypage03.jsp'">내가 쓴글</button>

					<c:if test="${loginUser.nickname eq boardDetail.nickname}">
						<button type="button" class="btn btn-sm btn-primary"
							id="btnUpdate"
							onclick="location.href='/board/free/update?pno=${boardDetail.pno}'">수정</button>
						<button type="button" class="btn btn-sm btn-primary"
							id="btnDelete">삭제</button>
					</c:if>
				</div>
			</div>
		</div>
		<!-- 댓글 끝 -->
	</article>

	<!-- article end -->

<%@include file="mainfooter.jsp" %>


</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>