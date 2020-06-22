<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="/resources/css/mainfooter3.css">
<link rel="stylesheet" href="/resources/css/mainheader2.css">
<link rel="stylesheet" href="/resources/css/free-board.css">
  <link rel="stylesheet" href="/resources/css/sidebar.css">

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
	    $("input:radio[name='orderby']").click(function(){

	    	$("#form").submit()
	    })
		$(".sidebar").each(function() {
			$(this).click(function() {
				$(this).addClass("selected"); //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
				$(this).siblings().removeClass("selected"); //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
			});
		});
	});
	
</script>
</head>
<body>

	<%@include file="mainheader.jsp" %> 
	<div class="all-dim"></div>
	<div class="containerNew">
	<div class="board-page">
	<!-- article start -->
	<div class="row">
	<div class="col-md-2">
		<div class="sidebar sticky" id="cssmenu" style="position: relative;">
			<ul>	
				<li class="selected"><a href="/board/free"><span>자유게시판</span></a></li>
				<li class="mid"><a href="/board/portfolio"><span>포트폴리오</span></a></li>
				<li class="last"><a href="/news"><span>오늘의 뉴스</span></a></li>
			</ul>
		</div>
  </div>
  <div class="col-md-10">
	<div class="free-board">
						<div class="drop-nav">
							<h1 class="tit-h1 line">자유게시판</h1>
						</div>
						<div class="m-drop-nav">
							<h1 class="m-drop-tit-title line" style="cursor: pointer;">자유게시판 <i class="fas fa-angle-down"></i></h1>
						</div>
						<div class="m-drop-down">
							<h1 class="m-drop-tit-body first line" style="cursor: pointer;">
								<a href="/board/free">자유게시판</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/board/portfolio">포트폴리오</a>
							</h1>
							<h1 class="m-drop-tit-body last line" style="cursor: pointer;">
								<a href="/news">뉴스</a>
							</h1>
						</div>
		<div class="board-type">
			<div class="board-free-nav">
					<form id="form" class="board-list-top policy-in" action='/board/free'>
						<p class="pc-only">
							<input type="radio" class="ordeby" id="orderby1" name="orderby"
								value="new" href="/board/free"><label for="orderby1"  class="new-board">최신순</label>
							<input type="radio" class="ordeby" id="orderby2" name="orderby"
								value="best" href="/board/free/best" checked=""><label for="orderby2" class="hot-board" >인기순</label>
						</p>
					</form>
		 			 
		 			 <c:if test="${loginUser != null}">
						<p class="right"><a href="/board/free/write" class="board-write-btn fantasy">글쓰기</a></p>
					 </c:if>	
					 		
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
												<td class="board-title"><a href="/board/free/detail?pno=${board.pno}">${board.title}</a><b class="comment-num"><i class="far fa-comment-dots"></i>&nbsp;${board.commentCount}</b></td>
										<!-- 글 제목 -->
											</c:when>
											<c:otherwise>
												<td class="board-title"><a href="/board/free/detail?pno=${board.pno}">${board.title}</a></td>
											</c:otherwise>
										</c:choose>
										
										<td class="board-writer"><a href="/selectUserMoney?nickname=${board.nickname}">${board.nickname}</a></td>
										<!-- 글쓴이 -->
										<td class="board-views"><span>조회 </span>${board.views}</td>
										<!-- 조회수 -->
										<td class="board-likes"><span>추천 </span>${board.likes}</td>
										<!-- 추천수 -->
										<fmt:formatDate value="${board.bdateTime}" var="time" pattern="MM/dd HH:mm"/>
										<td class="board-date">${time}</td>
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
					
					<c:if test="${boardPage.nowPage != 1}">
					      <!-- << 버튼 -->
					      <li>
					        <a class="page-link"
					          href="/board/free/best?bnowPage=1"
					          tabindex="-1" aria-disabled="true">
					          <i class="fas fa-angle-double-left"></i>
					        </a>
					      </li>
					      <!-- 1페이지에서 < 버튼 눌렀을 때 -->
					      <c:if test="${boardPage.nowPage == 1}">
					        <li>
					          <a class="page-link"
					            href="/board/free/best?bnowPage=${boardPage.nowPage}"
					            tabindex="-1" aria-disabled="true">
					            <i class="fas fa-angle-left"></i>
					          </a>
					        </li>
					      </c:if>
					</c:if>
					      
					      <!-- 1페이지가 아닌 페이지에서 < 버튼 눌렀을 때 -->
					      <c:if test="${boardPage.nowPage != 1}">
					        <li>
					          <a class="page-link"
					            href="/board/free/best?bnowPage=${boardPage.nowPage-1}"
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
					              <a class="page-link" href="/board/free/best?bnowPage=${p}">${p}</a>
					            </li>
					          </c:when>
					        </c:choose>
					      </c:forEach> 
					      
					      
					      
					 	 <c:if test="${boardPage.nowPage != boardPage.lastPage}">    
					      <!-- 현재 페이지가 마지막 페이지일 경우 > 버튼을 눌렀을 때 -->
					      <c:if test="${boardPage.nowPage == boardPage.lastPage}">
					        <li>
					          <a class="page-link"
					            href="/board/free/best?bnowPage=${boardPage.nowPage}"
					            tabindex="+1" aria-disabled="true">
					            <i class="fas fa-angle-right"></i>
					          </a>
					        </li>
					      </c:if>
					      
					      <!-- 현재 페이지가 마지막 페이지가 아닐 경우에 > 버튼을 눌렀을 때 -->					
					      <c:if test="${boardPage.nowPage != boardPage.lastPage}">
					        <li>
					          <a class="page-link"
					            href="/board/free/best?bnowPage=${boardPage.nowPage+1}"
					            tabindex="+1" aria-disabled="true" data-ajax="false">
					            <i class="fas fa-angle-right"></i>
					          </a>
					        </li>
					      </c:if> 
					
					      <!-- >> 버튼 -->
					      <li>
					        <a class="page-link"
					        href="/board/free/best?bnowPage=${boardPage.lastPage}"
					        tabindex="-1" aria-disabled="true">
					          <i class="fas fa-angle-double-right"></i>
					        </a>
					      </li>
					      
					      </c:if>
					    </ul>
					  </nav>
					 </div>


					 <c:if test="${loginUser != null}">
						<p class="right"><a href="/board/free/write" class="board-write-btn fantasy">글쓰기</a></p>
					 </c:if>
				</div>
				
				<div class="search-area">
					<div  class="search-area-body">
					<form class="form-inline my-2 my-lg-0 underSearchForm" action="/board/free/">
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
</div>
</div>
		<script type="text/javascript">
			$(document).ready(
					function() {
						console.log("document ready!");

						var $sticky = $('.sticky');
						var $stickyrStopper = $('.footer_content	');
						if (!!$sticky.offset()) { // make sure ".sticky" element exists

							var generalSidebarHeight = $sticky.innerHeight();
							var stickyTop = $sticky.offset().top;
							var stickOffset = 0;
							var stickyStopperPosition = $stickyrStopper
									.offset().top;
							var stopPoint = stickyStopperPosition
									- generalSidebarHeight - stickOffset;
							var diff = stopPoint + stickOffset;

							$(window).scroll(
									function() { // scroll event
										var windowTop = $(window).scrollTop(); // returns number

										if (stopPoint < windowTop) {
											$sticky.css({
												position : 'relative',
												top : diff
											});
										} else if (stickyTop < windowTop
												+ stickOffset) {
											$sticky.css({
												position : 'fixed',
												top : stickOffset
											});
										} else {
											$sticky.css({
												position : 'relative',
												top : 'initial'
											});
										}
									});

						}
						$(".m-drop-nav").click(function() {
							$(".m-drop-down").slideToggle("slow");
						});
					});
		</script>
	</div>

	<!-- article end -->
	<%@include file="mainfooter2.jsp" %>	
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="/resources/jpaginate/jquery.twbsPagination.js" type="text/javascript"></script>
</html>