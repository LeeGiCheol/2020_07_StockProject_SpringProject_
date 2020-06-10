<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- CSS파일 -->
<!-- <link href="/resources/css/free-board.css" rel="stylesheet"> -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">

<style>


html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video, button, a {
    font-family: 'Noto Sans KR', sans-serif;
}

html, body, div, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote,
   pre, abbr, address, cite, code, del, dfn, img, ins, kbd, q, samp, small,
   var, i, dl, dt, dd, ol, ul, li, fieldset, form, legend, table, caption,
   tbody, tfoot, thead, tr, article, aside, canvas, details, figcaption,
   figure, footer, header, hgroup, menu, nav, section, summary, time,
   audio, video {
   margin: 0;
   padding: 0;
   border: 0;
   vertical-align: baseline;
   font-size: 14px;
   background: transparent;
   list-style: none;
   box-sizing: border-box;
   word-break: break-all;
}

span, em, mark, strong, b, label {
   margin: 0;
   padding: 0;
   border: 0;
   vertical-align: baseline;
   background: transparent;
   list-style: none;
   box-sizing: border-box;
}

em, i {
   font-style: normal;
}

a, a:link, a:visited, a:active, a:hover {
   text-decoration: none;
}

p {
    line-height: 160%;
}

.table td, .table th {
    padding: 6px;
}
tr td button{
	background: transparent;
	border: none;
	margin: 0;
	padding: 0;
} 
.table{
	margin-bottom: 0;
}
.containerNew{
position: relative;
    max-width: 1260px;
    height: 100%;
    padding: 20px 0 0 0;
    margin: 0 auto;
}
@media (max-width: 979px)
.containerNew {
    padding-top: 104px;
}
@media only screen and (max-width: 979px)
.containerNew {
    padding: 0;
    padding-bottom: 170px;
}
.free-board {
    padding: /*20px 30px 60px 30px*/20px 30px 0 30px;
    margin-bottom: /*70px*/40px;
    background: #fff;
    position: relative;
    border: 1px solid #dddddd;
}
.tit-h1.line {
    margin: 0 -30px 30px;
    border-bottom: 1px solid #eaeaea;
    padding: 0 30px 20px;
}
.tit-h1 {
    font-size: 20px;
    margin-bottom: 30px;
    font-weight: bold;
    line-height: 100%;
}
.board-free-write{
	padding: 6px 10px;
    min-width: 60px;
    font-size: 14px;
    background: #ff545b;
    border: 1px solid #ff545b;
    color: #fff;
    float: right;
}
.nav-pills{
	float: left;
}
.free-board-link{
border-radius:0 !important;
}
.board-free-table{
	width: 100%;
}
</style>
<script>
	$(document).ready(function() {
		$("#jb-checkboxAll-best").click(function() {
			if ($("#jb-checkboxAll-best").prop("checked")) {
				$(".check-best").prop("checked", true);
			} else {
				$(".check-best").prop("checked", false);
			}
		})
		$("#jb-checkboxAll").click(function() {
			if ($("#jb-checkboxAll").prop("checked")) {
				$(".check").prop("checked", true);
			} else {
				$(".check").prop("checked", false);
			}
		})
		$(".remove").click(function() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				alert('JS구성하기');
			} else {
				alert("취소하셨습니다.");
			}
		})
		// pagination 추가  
		/* $(function() {
			window.pagObj = $('#pagination-all').twbsPagination({
				totalPages : 35,
				visiblePages : 5,
				onPageClick : function(event, page) {
					console.info(page + ' (from options)');
				}
			}).on('page', function(event, page) {
				console.info(page + ' (from event listening)');
			});
			}); 
		// pagination 추가  
		$(function() {
		window.pagObj = $('#pagination-best').twbsPagination({
			totalPages : 35,
			visiblePages : 5,
			onPageClick : function(event, page) {
				console.info(page + ' (from options)');
			}
		}).on('page', function(event, page) {
			console.info(page + ' (from event listening)');
		});
		});  */
	});
</script>
</head>
<body>

	<%@include file="mainheader.jsp" %> 
	
	
	<div class="containerNew">
<!-- 	<div class="sideBar col-md-4 order-md-2 mb-4" id="menu-bar">
		<ul class="list-group mb-3">
			java에서 온클릭 위치 바꾸기!!!!!!!!!!!!!!!!!!!
			<li
				class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed free-board"
				onclick="location.href='free-board.jsp'">
				<div>
					<h6 class="my-0">자유 게시판</h6>
				</div>
			</li>
			<li
				class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed news-borad"
				onclick="location.href='#'">
				<div>
					<h6 class="my-0">뉴스 게시판</h6>
				</div>
			</li>
			<li
				class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed protfolio-board"
				onclick="location.href='portfolio-board.jsp'">
				<div>
					<h6 class="my-0">포트폴리오 게시판</h6>
				</div>
			</li>
		</ul>
	</div> -->
	<!-- article start -->
	<div class="free-board">
	<h1 class="tit-h1 line" style="cursor:pointer;">자유게시판</h1>
		<div class="board-type">
			<!-- 게시판 -->
			<div class="board-free-nav">
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					<li class="nav-item" role="presentation">
					<a class="free-board-link nav-link active" id="pills-board-all-tab"
						data-toggle="pill" href="#pills-board-all" role="tab"
						aria-controls="pills-board-all" aria-selected="true">전체글</a>
					</li>
					<li class="nav-item" role="presentation">
					<a class="free-board-link nav-link" id="pills-board-best-tab" data-toggle="pill"
						href="#pills-board-best" role="tab"
						aria-controls="pills-board-best" aria-selected="false">인기글</a>
					</li>
					
				</ul>
				<button class="board-free-write" type="button" onclick="location.href='/board/free/write'">작성</button>	
			</div>
			<div class="tab-content" id="pills-tabContent">
				<div class="tab-pane fade show active" id="pills-board-all"
					role="tabpanel" aria-labelledby="pills-board-all-tab"
					style="margin-bottom: 300px;">
					<!-- 전체글 -->
					<table class="board-free-table">
							<colgroup>
								<col width="10%">
								<col width="35	%">
								<col width="20%">
								<col width="15%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead>
							<tr>
								<th class="no" scope="col">번호</th>
								<th class="title" scope="col">글제목</th>
								<th class="writer" scope="col">글쓴이</th>
								<th class="date" scope="col">작성일</th>
								<th class="views" scope="col">조회</th>
								<th class="likes" scope="col">추천</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${boardList}" var="board">
								<c:if test="${board.bno eq 1}">
									<tr>
										<td>${board.pno}</td>
										<!-- 글번호 -->
										<td><a href="/board/free/detail?pno=${board.pno}">${board.title}</a></td>
										<!-- 글 제목 -->
										<td>${board.nickname}</td>
										<!-- 글쓴이 -->
										<td>${board.bdateTime}</td>
										<!-- 날짜 -->
										<td>${board.views}</td>
										<!-- 조회수 -->
										<td>${board.likes}</td>
										<!-- 추천수 -->
									</tr>
								</c:if>
							</c:forEach>

						</tbody>
					</table>
					<br>
					<form class="form-inline my-2 my-lg-0 underSearchForm">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown01"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a>
						<div class="dropdown-menu" aria-labelledby="dropdown01">
							<a class="dropdown-item" href="#">제목</a> <a class="dropdown-item"
								href="#">내용</a> <a class="dropdown-item" href="#">제목 + 내용</a> <a
								class="dropdown-item" href="#">글쓴이</a>
						</div>
						<input class="form-control mr-sm-2" type="search"
							placeholder="search" aria-label="Search">
						<button class="btn btn-outline-secondary my-2 my-sm-0"
							type="submit">
							<i class="fas fa-search"></i>
						</button>
						<div class="buttons">
							<button class="btn btn-primary btn-lg btn-block add"
								type="button" onclick="location.href='/board/free/write'">작성</button>
							<button class="btn btn-primary btn-lg btn-block remove"
								type="button">삭제</button>
						</div>
					</form>
						
					<!-- 페이징 -->				
					<nav aria-label="..." class="pagination">
					    <ul class="pagination">
					
					
					      <!-- << 버튼 -->
					      <li>
					        <a class="page-link"
					          href="/board/free?bnowPage=1"
					          tabindex="-1" aria-disabled="true">
					          <i class="fas fa-angle-double-left"></i>
					        </a>
					      </li>
					
					      <!-- 1페이지에서 < 버튼 눌렀을 때 -->
					      <c:if test="${boardPage.nowPage == 1}">
					        <li>
					          <a class="page-link"
					            href="/board/free?bnowPage=${boardPage.nowPage}"
					            tabindex="-1" aria-disabled="true">
					            <i class="fas fa-angle-left"></i>
					          </a>
					        </li>
					      </c:if>
					      
					      <!-- 1페이지가 아닌 페이지에서 < 버튼 눌렀을 때 -->
					      <c:if test="${boardPage.nowPage != 1}">
					        <li>
					          <a class="page-link"
					            href="/board/free?bnowPage=${boardPage.nowPage-1}"
					            tabindex="-1" aria-disabled="true">
					            <i class="fas fa-angle-left"></i>
					          </a>
					        </li>
					      </c:if>
					      
					      <!-- 한번에 5개 페이지 보여줌 -->
					       <c:forEach begin="${boardPage.startPage }"
					        end="${boardPage.endPage }" var="p">
					        <c:choose>
					          <c:when test="${p == boardPage.nowPage}">
					            <li class="page-item active" aria-current="page">
					              <a class="page-link" href="#">${p}
					                <span class="sr-only">(current)</span>
					              </a>
					            </li>
					          </c:when>
					          <c:when test="${p != boardPage.nowPage}">
					            <li class="page-item">
					              <a class="page-link" href="/board/free?bnowPage=${p}">${p}</a>
					            </li>
					          </c:when>
					        </c:choose>
					      </c:forEach> 
					      
					      
					      <!-- 현재 페이지가 마지막 페이지일 경우 > 버튼을 눌렀을 때 -->
					      <c:if test="${boardPage.nowPage == boardPage.lastPage}">
					        <li>
					          <a class="page-link"
					            href="/board/free?bnowPage=${boardPage.nowPage}"
					            tabindex="+1" aria-disabled="true">
					            <i class="fas fa-angle-right"></i>
					          </a>
					        </li>
					      </c:if>
					      
					      <!-- 현재 페이지가 마지막 페이지가 아닐 경우에 > 버튼을 눌렀을 때 -->					
					      <c:if test="${boardPage.nowPage != boardPage.lastPage}">
					        <li>
					          <a class="page-link"
					            href="/board/free?bnowPage=${boardPage.nowPage+1}"
					            tabindex="+1" aria-disabled="true" data-ajax="false">
					            <i class="fas fa-angle-right"></i>
					          </a>
					        </li>
					      </c:if> 
					
					      <!-- >> 버튼 -->
					      <li>
					        <a class="page-link"
					        href="/board/free?bnowPage=${boardPage.lastPage}"
					        tabindex="-1" aria-disabled="true">
					          <i class="fas fa-angle-double-right"></i>
					        </a>
					      </li>
					    </ul>
					  </nav>


				</div>
				<!-- 인기글 -->
				<div class="tab-pane fade" id="pills-board-best" role="tabpanel"
					aria-labelledby="pills-board-best-tab"
					style="margin-bottom: 300px;">
					<table class="board-free-table">
						<thead>
							<tr>
								<td class="checkno"><div
										class="custom-control custom-checkbox">
										<input type="checkbox" id="jb-checkboxAll-best"
											class="custom-control-input"><label
											class="custom-control-label" for="jb-checkboxAll-best"></label>
									</div></td>
								<th class="no" scope="col">번호</th>
								<th class="title" scope="col">글제목</th>
								<th class="writer" scope="col">글쓴이</th>
								<th class="date" scope="col">작성일</th>
								<th class="views" scope="col">조회</th>
								<th class="likes" scope="col">추천</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><div class="custom-control custom-checkbox">
										<input type="checkbox" id="jb-checkbox1-best"
											class="custom-control-input check-best"><label
											class="custom-control-label" for="jb-checkbox1-best"></label>
									</div></td>
								<th scope="row">5</th>
								<td><a
									onclick="window.location.href='free-board-detail.jsp'">이 글은
										테스트용 인기글입니다.</a></td>
								<td>글쓴이</td>
								<td>2020.05.21</td>
								<td>270</td>
								<td>30</td>
							</tr>
							<tr>
								<td><div class="custom-control custom-checkbox">
										<input type="checkbox" id="jb-checkbox2-best"
											class="custom-control-input check-best"><label
											class="custom-control-label" for="jb-checkbox2-best"></label>
									</div></td>
								<th scope="row">4</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><div class="custom-control custom-checkbox">
										<input type="checkbox" id="jb-checkbox3-best"
											class="custom-control-input check-best"><label
											class="custom-control-label" for="jb-checkbox3-best"></label>
									</div></td>
								<th scope="row">3</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><div class="custom-control custom-checkbox">
										<input type="checkbox" id="jb-checkbox4-best"
											class="custom-control-input check-best"><label
											class="custom-control-label" for="jb-checkbox4-best"></label>
									</div></td>
								<th scope="row">2</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><div class="custom-control custom-checkbox">
										<input type="checkbox" id="jb-checkbox5-best"
											class="custom-control-input check-best"><label
											class="custom-control-label" for="jb-checkbox5-best"></label>
									</div></td>
								<th scope="row">1</th>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
					<br>
					<form class="form-inline my-2 my-lg-0 underSearchForm">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown01"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a>
						<div class="dropdown-menu" aria-labelledby="dropdown01">
							<a class="dropdown-item" href="#">제목</a> <a class="dropdown-item"
								href="#">내용</a> <a class="dropdown-item" href="#">제목 + 내용</a> <a
								class="dropdown-item" href="#">글쓴이</a>
						</div>
						<input class="form-control mr-sm-2" type="search"
							placeholder="search" aria-label="Search">
						<button class="btn btn-outline-secondary my-2 my-sm-0"
							type="submit">
							<i class="fas fa-search"></i>
						</button>
						<div class="buttons"></div>
					</form>

					<!-- 
            <ul class="pagination">
              <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">◀</a></li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item active" aria-current="page"><a class="page-link" href="#">2 <span class="sr-only">(current)</span></a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item disabled"><a class="page-link" href="#" tabindex="+1" aria-disabled="true">▶</a></li>
            </ul> -->
					<!--    </nav> -->
				</div>
			</div>
		</div>
	</div>
	<!-- article end -->
</div>
	<%@include file="mainfooter.jsp" %>	

</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="/resources/jpaginate/jquery.twbsPagination.js" type="text/javascript"></script>
</html>