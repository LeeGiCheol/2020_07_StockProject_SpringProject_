<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이페이지</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<link rel="stylesheet" href="/resources/css/mainfooter.css">
	<link rel="stylesheet" href="/resources/css/mainheader.css">
	<link href="resources/css/mypage03.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
	<%@include file="mainheader.jsp"%>
	<!-- section start -->
	<div class="containerNew">
		<!-- contents -->
		<div class="contents member" id="contents">
			<div class="row">
				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu" style="position: relative; top: initial;">
						<ul>
							<li><a href="/myPage01"><span>내 정보 관리</span></a></li>
							<li class="mid"><a href="/mypageUpdatePassword"><span>비밀번호 변경</span></a></li>
							<li class="last"><a href="/myPage02"><span>계좌정보</span></a></li>
							<li class="mid"><a href="/myPage03"><span>작성 글 | 댓글</span></a></li>
							<li class="last"><a href="/myPage04"><span>알림</span></a></li>
						</ul>
					</div>
				</div>
				<!-- section end -->

				<!-- article start -->
				<div class="col-md-10">
					<div class="row">
						<div class="sideBar col-md-4 order-md-2 mb-4">
							<div class="col-md-8 order-md-1"></div>
							<h4 class="mb-3">알림</h4>
							<h6>(확인시 자동 삭제)</h6>
						</div>
					</div>
					<!-- 게시판 -->
					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
						<li class="nav-item" role="presentation">
							<a class="nav-link active" id="pills-trade-tab" data-toggle="pill" href="#pills-trade" role="tab"
								aria-controls="pills-trade" aria-selected="true">거래체결</a>
						</li>
						<li class="nav-item" role="presentation">
							<a class="nav-link" id="pills-board-tab" data-toggle="pill" href="#pills-board" role="tab"
								aria-controls="pills-board" aria-selected="false">게시판 알림</a>
						</li>
					</ul>
					<div class="tab-content" id="pills-tabContent">
						<!-- 게래체결 -->
						<div class="tab-pane fade show active" id="pills-trade" role="tabpanel" aria-labelledby="pills-trade-tab"
							style="margin-bottom: 300px;">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="tno" scope="col">거래번호</th>
										<th class="stockName" scope="col">종목명</th>
										<th class="tprice" scope="col">단가</th>
										<th class="quantity" scope="col">수량</th>
										<th class="tdatetime" scope="col">거래일시</th>
										<th class="category" scope="col">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${modifiedNotice}" var="list">
										<tr>

											<td class="first" title="주문번호">
												<c:out value="${list.tno}" />
											</td>
											<td title="종목명">
												<c:out value="${list.stockName}" />
											</td>
											<td title="주문단가">
												<c:out value="${list.tprice}" />
											</td>
											<td title="주문수량">
												<c:out value="${list.quantity}" />
											</td>
											<td title="거래일시">
												<fmt:formatDate value="${list.tdatetime}" pattern="yyyy-MM-dd HH:mm:ss" />
											</td>
											<td title="상태">
												<c:out value="${list.category}" />
											</td>
										</tr>
									</c:forEach>
							</table>
						</div>
						<!-- 게시판알림 -->
						<div class="tab-pane fade" id="pills-board" role="tabpanel" aria-labelledby="pills-board-tab"
							style="margin-bottom: 300px;">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="no" scope="col">글번호</th>
										<th class="title" scope="col">내용</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${commentNotice}" var="list">
										<tr>
											<td class="first" title="글번호">
												<c:out value="${list.pno}" />
											</td>
											<td title="내용">
												<c:out value="${list.title}" /> 글에 댓글이 달렸습니다.</td>
										</tr>
									</c:forEach>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

<!-- <form name="alarmForm">
			<input type="hidden" name="flag" id="flag" value="">

			<div class="my-list-scrap">
				<input type="checkbox" class="check_all" id="check-all">
				<label for="check-all">총 <i>1</i>개
				</label>
				<p>
					<button type="button" class="btn-s adhere del selectAlarmDelete">삭제</button>
					<button type="button" class="btn-s adhere readAlarmDelete">읽은 알림 삭제</button>
				</p>
			</div>
			<div class="alarm-area">
				<ul>
					2017.04.26 추가
					
					
					//2017.04.26 추가

					//2017.04.28 추가
					읽은 내용 <a> 태그 부모에 class="visited" 삽입 → a 텍스트 색 #888 처리됩니다.
					
						
							
								<li>
									<p class="check">
										<input type="checkbox" id="eventSeq_28900862" class="seq_check" name="eventSeq" value="28900862">
										<label for="eventSeq_28900862">선택 삭제</label>
									</p>
									
										
										
											<p class="img">
												<span class="pro-badge"> <img class="pax_f2_proimg" cust_id="g_1589453219" src="https://www.paxnet.co.kr/my/files/proimg/di/pi_08.png"><i style="display: none;"><img class="current_badge_s" cust_id="g_1589453219" id="current_badge_g_1589453219"></i>
												</span>
											</p>
										
									
									<dl>
										<dt class="" id="visited_28900862">
											방문여부 : visited
											<span class="red">[댓글]</span> <strong>
													
														<a href="#" onclick="javascript:goView('28900862', 'http://www.paxnet.co.kr/tbbs/view?id=N10841&amp;seq=150357583596792');return false;" title="http://www.paxnet.co.kr/tbbs/view?id=N10841&amp;seq=150357583596792">내가 쓴 글의 댓글이 작성되었습니다.</a>
													
													
												</strong>
										</dt>

										
										
											
											
												<dd>
													<span><a href="#">개미굴리트</a></span> <span>2020.06.18 22:47</span>
												</dd>
											
										
									</dl>
								</li>
							
						
						
					
				</ul>
			</div>
			//board-type

			<div class="mobile-only-check fixed">
				fixed
				<span><input type="checkbox" id="check_all_mo" class="check_all"><label for="check_all_mo">전체선택</label></span> <span><button type="button" class="del selectAlarmDelete">삭제</button></span> <span><button type="button" class="cancel">취소</button></span>
			</div>
		</form> -->
	<div class="all-dim"></div>
	<div class="containerNew">
		<div class="board-page">
			<div class="row">
				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu">
						<ul>
							<li><a href="/myPage01"><span>내 정보 관리</span></a></li>
							<li class="mid"><a href="/mypageUpdatePassword"><span>비밀번호 변경</span></a></li>
							<li class="last"><a href="/myPage02"><span>나의 계좌정보</span></a></li>
							<li class="mid"><a href="/myPage03"><span>작성 글 | 댓글</span></a></li>
							<li class="last"><a href="/myPage04"><span>알림</span></a></li>
						</ul>
					</div>
				</div>
  <div class="col-md-10">
	<div class="free-board">
						<div class="drop-nav">
							<h1 class="tit-h1 line">작성 글 | 댓글</h1>
						</div>
						<div class="m-drop-nav">
							<h1 class="m-drop-tit-title line" style="cursor: pointer;">작성 글 | 댓글 ▼</h1>
						</div>
						<div class="m-drop-down">
							<h1 class="m-drop-tit-body first line" style="cursor: pointer;">
								<a href="/news">내 정보 관리</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/board/free">비밀번호 변경</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/board/free">나의 계좌정보</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/board/free">작성 글 | 댓글</a>
							</h1>
							<h1 class="m-drop-tit-body last line" style="cursor: pointer;">
								<a href="#">알림</a>
							</h1>
						</div>
		<div class="board-type">
			<div class="board-free-nav">
					<form id="form" class="board-list-top policy-in" action='/board/free'>
						<p class="pc-only">
							<input type="radio" class="ordeby" id="orderby1" name="orderby"
								value="new" checked=""><label for="orderby1"  class="new-board">작성 글</label>
							<input type="radio" class="ordeby" id="orderby2" name="orderby"
								value="best"><label for="orderby2" class="hot-board" >작성 댓글</label>
						</p>
					</form>
		 			 
		 			 <c:if test="${loginUser != null}">
						<p class="right"><a href="/board/free/write" class="board-write-btn">삭제</a></p>
					 </c:if>	
					 		
			</div>
			<div class="tab-content" id="pills-tabContent">
					<!-- 전체글 -->
					<table class="board-free-table">
 							<colgroup>
								<col width="5%">
								<col width="10%">
								<col width="50%">
								<col width="10%">
								<col width="5%">
								<col width="5%">
								<col width="15%">
							</colgroup>
							<thead>
							<tr>
								<th class="no" scope="col">
									<p class="check">
										<input type="checkbox" id="eventSeq_28900862" class="seq_check" name="eventSeq" value="28900862">
										<label for="eventSeq_28900862">선택 삭제</label>
									</p>
								</th>
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
										<td class="board-check">
											<p class="check">
												<input type="checkbox" id="eventSeq_28900862" class="seq_check" name="eventSeq" value="28900862">
												<label for="eventSeq_28900862">선택 삭제</label>
											</p>
										</td>
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
										
										<td class="board-writer">${board.nickname}</td>
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
					      
					      
					      
					 	 <c:if test="${boardPage.nowPage != boardPage.lastPage}">    
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
					      
					      </c:if>
					    </ul>
					  </nav>
					 </div>


					 <c:if test="${loginUser != null}">
						<p class="right"><a href="/board/free/write" class="board-write-btn">삭제</a></p>
					 </c:if>
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
</div>
</div>
  <script type="text/javascript">
  $( document ).ready(function() {
	  console.log( "document ready!" );

	  var $sticky = $('.sticky');
	  var $stickyrStopper = $('.footer_info');
	  if (!!$sticky.offset()) { // make sure ".sticky" element exists

	    var generalSidebarHeight = $sticky.innerHeight();
	    var stickyTop = $sticky.offset().top;
	    var stickOffset = 0;
	    var stickyStopperPosition = $stickyrStopper.offset().top;
	    var stopPoint = stickyStopperPosition - generalSidebarHeight - stickOffset;
	    var diff = stopPoint + stickOffset;

	    $(window).scroll(function(){ // scroll event
	      var windowTop = $(window).scrollTop(); // returns number

	      if (stopPoint < windowTop) {
	          $sticky.css({ position: 'relative', top: diff });
	      } else if (stickyTop < windowTop+stickOffset) {
	          $sticky.css({ position: 'fixed', top: stickOffset });
	      } else {
	          $sticky.css({position: 'relative', top: 'initial'});
	      }
	    });

	  }
	  $(".m-drop-nav").click(function(){
		    $(".m-drop-down").slideToggle("slow");
		  });
  });
  


 
  </script>
	</div>		
		
		
	
	<!-- article end -->
	<%@include file="mainfooter.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>