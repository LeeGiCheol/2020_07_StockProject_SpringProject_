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

/* [class*="-btn"].red {
    background: #ff545b;
    border: 1px solid #ff545b;
    color: #fff;
} */
[class*="board-write-btn"] {
	position: relative;
    background: #c8c8c8;
    border: 1px solid #b3b3b3;
    line-height: 100%;
    display: inline-block;
    color: #fff;
    vertical-align: middle;
    box-sizing: border-box;
    text-align: center;
}
.board-write-btn a:hover{
	color: gray !important;
}
[class*="board-write-btn"] {
    padding: 6px 10px;
    min-width: 60px;
    font-size: 14px;
}
.board-free-btn{
	float: left;
}
.board-free-nav{
	height: 30px;
	margin-bottom: 20px;
	position: relative;
}
.board-free-table{
	border-top: #000 1px solid;
	margin-bottom: 15px;
	width: 100%;
}
.writer{
	text-align: left;
}
.board-writer,.board-title{
	text-align: left;
}
.board-title a{
    overflow: hidden;
	max-width: 67%/*80%;; */;
	color: #000;
	display: -webkit-inline-box;
   /*  display: -webkit-box; */
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
}
thead tr{
	border-bottom: 1px solid #dddddd;
	color: #000;
    font-weight: bold;
    text-align: center;
    font-size: 14px !important;
    
}
thead tr th{
	padding: 10px 0 10px 0;	
}

tbody tr{
	border-bottom: 1px solid #dddddd;
    text-align: center;
    font-size: 13px !important;
    color: #888;
  
}
tbody tr td{
	padding: 10px 0 10px 0;	
}
.paging,.search-area {
    clear: both;
    padding: 0 0 30px 0;
    text-align: center;
    position: relative;
}
.paging p.right {
    position: absolute;
    top: 0;
    right: 0;
    z-index: 3;
}
.paging-body {
    display: inline-block;
    padding-left: 0;
}
.search-area-body{
    display: inline-block;
    padding-left: 0;
}
.dropdown-toggle-board{
    border: 1px solid #ced4da;
    color:  #888;
	margin-right: .5rem!important;
    padding: .375rem .75rem;
}
.dropdown-board {
border-radius: 0 !important;
color:  #888 !important;
margin-top: 1px;
}
.board-search, .board-search-btn{
border-radius: 0 !important;
 border: 1px solid #ced4da;
 color:  #888;
}
.page-link{
    color: #888888 !important;
}
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: white;
    border: 1.5px solid #888888 !important;
}
.board-free-nav p.right {
    position: absolute;
    top: 50%;
    right: 0;
    margin-top: -15px;
}
.board-item{
 color:  #888;
}
input[type='radio'] {
  -webkit-appearance:none;
  width:16px;
  height:16px;
  border:1px solid darkgray;
  border-radius:50%;
  outline:none;
  background:#e6e6e6;
  vertical-align: middle;
  margin-right: 5px;
}
input[type='radio']:before {
  content:'';
  display:block;
  width:60%;
  height:60%;
  margin: 20% auto;  
  border-radius:50%;  
  
}
input[type='radio']:checked:before {
  background:gray;
}
.new-board{
	margin-right: 10px;
}
.new-board, .hot-board{
	vertical-align: middle;
}
.paging + .board-search {
    padding-bottom: 30px;
}
.board-views span, .board-likes span {
    display: none;
}
@media only screen and (max-width: 979px){
.containerNew{
	padding: 0;
}
.free-board {
	border: none;
    min-height: auto;
    margin-right: 0;
    padding: 20px 0 120px;
    max-width: none !important;
    width: 100% !important;
}
.board-free-nav{
	margin: 10px;
}
.tit-h1{
	font-size: 20px;
	margin: 0 !important;
}
.board-free-table thead, .board-no{
display: none;
}
.board-free-table tbody tr{
    display: block;
    position: relative;
    padding: 10px;
    height: 64px;
}
.board-title {
    width: 100%;
}
.board-writer, .board-views, .board-likes, .board-date {
    width: auto;
    display: inline-block;
    padding: 0;
    line-height: 22px;
    float: left;
}
.board-writer, .board-views, .board-likes {
    background: url(/resources/img/bg_line.png) no-repeat right 50%;
    padding-right: 10px !important;
    margin-right: 8px;
}
.board-free-table tbody tr td{
	padding: 0;
}
.board-title a{
	max-width: 100%;
	line-height: 22px;
}
.board-views span, .board-likes span {
    display: inline;
}
}
.tab-content{
	position: relative;
    background: #fff;
    margin-bottom: 10px;
    overflow: hidden;
}
.comment-num{
	display: inline-block;
    margin: -1px 0 0 3px;
    font-size: 13px;
    font-weight: normal;
    color: #ff545b;
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
	});
</script>
</head>
<body>

	<%@include file="mainheader.jsp" %> 
	
	
	<div class="containerNew">
	<!-- article start -->
	<div class="free-board">
	<h1 class="tit-h1 line" style="cursor:pointer;">자유게시판</h1>
		<div class="board-type">
			<div class="board-free-nav">
					<form class="board-list-top policy-in">
						<p class="pc-only">
							<input type="radio" class="ordeby" id="orderby1" name="orderby"
								value="recentOrdr" checked=""><label for="orderby1"  class="new-board">최신순</label>
							<input type="radio" class="ordeby" id="orderby2" name="orderby"
								value="popularOrdr"><label for="orderby2" class="hot-board">인기순</label>
						</p>
					</form>
					<p class="right"><a href="/board/free/write" class="board-write-btn">글쓰기</a></p>
			</div>
			<div class="tab-content" id="pills-tabContent">
					<!-- 전체글 -->
					<table class="board-free-table">
 							<colgroup>
								<col width="8%">
								<col width="55%">
								<col width="10%">
								<col width="6%">
								<col width="6%">
								<col width="10%">
							</colgroup>
							<thead>
							<tr>
								<th class="no" scope="col">N0</th>
								<th class="title" scope="col">제목</th>
								<th class="writer" scope="col">작성자</th>
								<th class="views" scope="col">조회</th>
								<th class="likes" scope="col">추천</th>
								<th class="date" scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${boardList}" var="board">
								<c:if test="${board.bno eq 1}">
									<tr>
										<td class="board-no">${board.pno}</td>
										<!-- 글번호 -->
										
										<c:choose>
											<c:when test="${board.commentCount ne 0}">
												<td class="board-title"><a href="/board/free/detail?pno=${board.pno}">${board.title}</a><b class="comment-num">&nbsp;${board.commentCount}</b></td>
										<!-- 글 제목 -->
											</c:when>
											<c:otherwise>
												<td class="board-title"><a href="/board/free/detail?pno=${board.pno}">${board.title}</a></td>
											</c:otherwise>
										</c:choose>
										
										<td class="board-writer">${board.nickname}</td>
										<!-- 글쓴이 -->
										<td class="board-views"><span>조회 </span>${board.views}</td>
										<!-- 조회수 -->
										<td class="board-likes"><span>추천 </span>${board.likes}</td>
										<!-- 추천수 -->
										<td class="board-date">${board.bdateTime}</td>
										<!-- 날짜 -->
									</tr>
								</c:if>
							</c:forEach>

						</tbody>
					</table>
					
					<!-- 페이징 -->
					<div class="paging">	
					<div class="paging-body">				
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
					 <p class="right"><a href='/board/free/write' class="board-write-btn red"">글쓰기</a></p>
				</div>
				
				<div class="search-area">
					<div  class="search-area-body">
					<form class="form-inline my-2 my-lg-0 underSearchForm" action="/board/free">
						<!-- <a class="nav-link dropdown-toggle" href="#" id="dropdown01"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a> -->
						<select class="dropdown-toggle-board" name="searchStyle">
							<option class="nav-link dropdown-toggle board-item" id="dropdown01"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" value="" <c:if test='${searchStyle eq ""}'>selected</c:if>>전체</option>
							<option class="dropdown-item board-item" value="search_title"<c:if test='${searchStyle eq "search_title"}'>selected</c:if>>제목</option> 
							<option class="dropdown-item board-item" value="search_content"<c:if test='${searchStyle eq "search_content"}'>selected</c:if>>내용</option> 
							<option class="dropdown-item board-item" value="search_title_content"<c:if test='${searchStyle eq "search_title_content"}'>selected</c:if>>제목 + 내용</option> 
							<option class="dropdown-item board-item" value="search_nick"<c:if test='${searchStyle eq "search_nick"}'>selected</c:if>>글쓴이</option>
						</select>
						<input class="form-control mr-sm-2 board-search" type="search"
							placeholder="검색어 입력" aria-label="Search">
						<button class="btn btn-outline-secondary my-2 my-sm-0 board-search-btn"
							type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

	<!-- article end -->
	<%@include file="mainfooter.jsp" %>	
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="/resources/jpaginate/jquery.twbsPagination.js" type="text/javascript"></script>
</html>