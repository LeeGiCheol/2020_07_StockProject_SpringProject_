<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link href="resources/css/mypage03.css" rel="stylesheet">
<link href="resources/css/mainheader2.css" rel="stylesheet">
<link href="resources/css/mainfooter.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/sidebar.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
	if($("#typeRef").val() === "board")
		$("#pills-tabContentComment").hide();
	else
		$("#pills-tabContentBoard").hide();
		
	$("#orderby1").click(function(){
		$("#pills-tabContentComment").hide();
		$("#pills-tabContentBoard").show();
	});
	$("#orderby2").click(function(){
		$("#pills-tabContentBoard").hide();
		$("#pills-tabContentComment").show();
	});
	
	$("#eventSeq_all_comment").click(function(){
	    if($("#eventSeq_all_comment").prop("checked")){
	        $(".comment").prop("checked",true);
	    }else{
	        $(".comment").prop("checked",false);
	    }
	})
	$("#eventSeq_all").click(function(){
	    if($("#eventSeq_all").prop("checked")){
	        $(".board").prop("checked",true);
	    }else{
	        $(".board").prop("checked",false);
	    }
	})
});
function deleteBoard(){
	console.log("delete board");
	var boardID = "";
	
	var deleted = new Array();
	$("input[name='check']:checked").each(function(){
		deleted.push($(this).attr("data-on"));
	});
	for(i=0; i < deleted.length; i++){
		boardID = boardID + deleted[i];
		boardID = boardID + ",";
	}
	if(boardID === ""){
		swal({text:"삭제할 글을 체크해주세요.", icon:"error"});
		return;
	}
	$('#delBoardList').val(boardID);
	window.location.href = '/delete/myBoard?delBoardList='+boardID;
}

function deleteComment(){
	var commentID = "";
	
	var deleted = new Array();
	$("input[name='check']:checked").each(function(){
		deleted.push($(this).attr("data-on"));
	});
	console.log(deleted);
	for(i=0; i < deleted.length; i++){
		commentID = commentID + deleted[i];
		commentID = commentID + ","
	}
	if(commentID === ""){
		swal({text:"삭제할 댓글을 체크해주세요.", icon:"error"});
		return;
	}
	$('#delCommentList').val(commentID);
	console.log(commentID);
	window.location.href = '/delete/myComment?delCommentList='+commentID;
}

</script>
</head>
<body>
	<%@include file="mainheader.jsp" %> 
	<div class="all-dim"></div>
	<div class="containerNew">
		<div class="board-page">
			<div class="row">
				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu">
						<ul>
							<li class="mid"><a href="/myPage01"><span>내 정보 관리</span></a></li>
							<li class="mid"><a href="/mypageUpdatePassword"><span>비밀번호 재설정</span></a></li>
							<li class="mid"><a href="/myPage02"><span>나의 계좌정보</span></a></li>
							<li class="selected mid"><a href="/myPage03"><span>작성 글 | 댓글</span></a></li>
							<li><a href="/myPage04"><span>알림</span></a></li>
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
								<a href="/myPage03">비밀번호 재설정</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/myPage03">나의 계좌정보</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/myPage03">작성 글 | 댓글</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="#">알림</a>
							</h1>
						</div>
						<input type="hidden" id="typeRef" value="${type}">
		<div class="board-type">
			<div class="board-free-nav">
					<form id="form" class="board-list-top policy-in" action='/myPage03'>
						<p class="pc-only">
							<input type="radio" class="ordeby" id="orderby1" name="orderby"
								value="myBoard" <c:if test='${type eq "board"}'>checked="checked"</c:if>><label for="orderby1"  class="new-board">작성 글 </label>
							<input type="radio" class="ordeby" id="orderby2" name="orderby"
								value="myComment" <c:if test='${type eq "comment"}'>checked="checked"</c:if>><label for="orderby2" class="hot-board" >작성 댓글 </label>
						</p>
					</form>
		 			 <!-- 
		 			 <c:if test="${loginUser != null}">
						<p class="right"><button class="board-write-btn fantasy" type="button" onclick="deleteBoard();">삭제</button></p>
					 </c:if>
					  -->	
					 		
			</div>
			<div class="tab-content" id="pills-tabContentBoard">
			
			<!-- 1111 -->
			<c:choose>
			<c:when test="!${myBoard.size() > 0}">
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
										<input type="checkbox" id="eventSeq_all" class="seq_check board" name="eventSeq">
										<label for="eventSeq_all">선택 삭제</label>
									</p>
								</th>
								<th class="no" scope="col">N0.</th>
								<th class="title" scope="col">제목</th>
								<th class="writer" scope="col">작성자</th>
								<th class="views" scope="col">조회</th>
								<th class="likes" scope="col">추천</th>
								<th class="date" scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${myBoard}" var="board">
							
								<c:if test="${board.bno eq 1}">
									<tr>
										<td class="board-check">
											<p class="check">
												<input type="checkbox" id="eventSeq_${board.pno}" class="seq_check board" name="check" value="${board.pno}" data-on="${board.pno}">
												<label for="eventSeq_${board.pno}">선택 삭제</label>
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
							<c:if test="${myBoard.size() == 0}">
							    <tr>
							        <td colspan="7" style="text-align: center;">:::::내 글이 없습니다.::::::</td>
							    </tr>
							</c:if>
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
					          href="/myPage03?bnowPage=1&type=board&boardKeyword=${boardKeyword}&bSearchStyle=${bSearchStyle}"
					          tabindex="-1" aria-disabled="true">
					          <i class="fas fa-angle-double-left"></i>
					        </a>
					      </li>
					      <!-- 1페이지에서 < 버튼 눌렀을 때 -->
					      <c:if test="${boardPage.nowPage == 1}">
					        <li>
					          <a class="page-link"
					            href="/myPage03?bnowPage=${boardPage.nowPage}&type=board&boardKeyword=${boardKeyword}&bSearchStyle=${bSearchStyle}"
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
					            href="/myPage03?bnowPage=${boardPage.nowPage-1}&type=board&boardKeyword=${boardKeyword}&bSearchStyle=${bSearchStyle}"
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
					              <a class="page-link" href="/myPage03?bnowPage=${p}&type=board&boardKeyword=${boardKeyword}&bSearchStyle=${bSearchStyle}">${p}</a>
					            </li>
					          </c:when>
					        </c:choose>
					      </c:forEach> 
					      
					      
					      
					 	 <c:if test="${boardPage.nowPage != boardPage.lastPage}">    
					      <!-- 현재 페이지가 마지막 페이지일 경우 > 버튼을 눌렀을 때 -->
					      <c:if test="${boardPage.nowPage == boardPage.lastPage}">
					        <li>
					          <a class="page-link"
					            href="/myPage03?bnowPage=${boardPage.nowPage}&type=board&boardKeyword=${boardKeyword}&bSearchStyle=${bSearchStyle}"
					            tabindex="+1" aria-disabled="true">
					            <i class="fas fa-angle-right"></i>
					          </a>
					        </li>
					      </c:if>
					      
					      <!-- 현재 페이지가 마지막 페이지가 아닐 경우에 > 버튼을 눌렀을 때 -->					
					      <c:if test="${boardPage.nowPage != boardPage.lastPage}">
					        <li>
					          <a class="page-link"
					            href="/myPage03?bnowPage=${boardPage.nowPage+1}&type=board&boardKeyword=${boardKeyword}&bSearchStyle=${bSearchStyle}"
					            tabindex="+1" aria-disabled="true" data-ajax="false">
					            <i class="fas fa-angle-right"></i>
					          </a>
					        </li>
					      </c:if> 
					
					      <!-- >> 버튼 -->
					      <li>
					        <a class="page-link"
					        href="/myPage03?bnowPage=${boardPage.lastPage}&type=board&boardKeyword=${boardKeyword}&bSearchStyle=${bSearchStyle}"
					        tabindex="-1" aria-disabled="true">
					          <i class="fas fa-angle-double-right"></i>
					        </a>
					      </li>
					      
					      </c:if>
					    </ul>
					  </nav>
					 </div>


					 <c:if test="${loginUser != null}">
						<p class="right"><button class="board-write-btn fantasy" type="button" onclick="deleteBoard();">삭제</button></p>
					 </c:if>
				</div>
				
				<div class="search-area">
					<div  class="search-area-body">
					<form class="form-inline my-2 my-lg-0 underSearchForm" action="/myPage03">
						<!-- <a class="nav-link dropdown-toggle" href="#" id="dropdown01"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a> -->
						<select class="dropdown-toggle-board" name="bsearchStyle">
							<option class="nav-link dropdown-toggle board-item" id="dropdown01"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" value="" <c:if test='${searchStyle eq ""}'>selected</c:if>>전체</option>							
							<option class="dropdown-item board-item" value="search_title"<c:if test='${searchStyle eq "search_title"}'>selected</c:if>>제목</option> 
							<option class="dropdown-item board-item" value="search_content"<c:if test='${searchStyle eq "search_content"}'>selected</c:if>>내용</option>
						</select>
						<input type="hidden" name="type" value="board">
						<input class="form-control mr-sm-2 board-search" type="search"
							placeholder="검색어 입력" aria-label="Search" name="bSearchKeyword" value="${bSearchKeyword}">
						<button class="btn btn-outline-secondary my-2 my-sm-0 board-search-btn"
							type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>
					</div>
				</div>
				</c:when>
				
				
				<c:otherwise>
				<!-- 22222 -->
					<div class="message-wrap">
						<div class="message-st-01">
							<p class="big-text">아직 발생한 알림이 없습니다.</p>
							<p>거래 체결과 커뮤니티에서 다양한 이야기를 나누면 알림이 발생합니다!</p>
						</div>
					</div>
				</c:otherwise>
				</c:choose>
			</div>
		</div>
		
			<div class="tab-content" id="pills-tabContentComment">
			
			
			<!-- 3333 -->
				<!-- 전체글 -->
				<c:choose>
					<c:when test="${myComment.size() > 0}">
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
										<input type="checkbox" id="eventSeq_all_comment" class="seq_check" name="WeventSeq">
										<label for="eventSeq_all_comment">선택 삭제</label>
									</p>
								</th>
								<th class="no" scope="col">N0</th>
								<th class="title" scope="col">내용</th>
								<th class="writer" scope="col">작성자</th>
								
								<th class="date" scope="col">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${myComment}" var="board">
							
								<c:if test="true">
									<tr>
										<td class="board-check">
											<p class="check">
												<input type="checkbox" id="CeventSeq_${comment.cno}" class="seq_check comment" name="check" value="${comment.cno},${comment.pno}">
												<label for="CeventSeq_${comment.cno}">선택 삭제</label>
											</p>
										</td>
										<td class="board-no">${board.pno}</td>
										<!-- 글번호 -->
										
										<td class="board-title"><a href="/board/free/detail?pno=${board.pno}">${board.ccontent}</a></td>
										
										<td class="board-writer">${board.nickname}</td>
										<!-- 글쓴이 -->
										<fmt:formatDate value="${board.cdateTime}" var="time" pattern="MM/dd HH:mm"/>
										<td class="board-date">${time}</td>
										<!-- 날짜 -->
									</tr>
								</c:if>
							</c:forEach>
							<c:if test="${myBoard.size() == 0}">
							    <tr>
							        <td colspan="7" style="text-align: center;">:::::내 댓글이 없습니다.::::::</td>
							    </tr>
							</c:if>
						</tbody>
					</table>
					
					<!-- 페이징 -->
					<div class="paging">	
					<div class="paging-body">				
					<nav aria-label="..." class="pagination">
					    <ul class="pagination">
					
					<c:if test="${commentPage.nowPage != 1}">
					      <!-- << 버튼 -->
					      <li>
					        <a class="page-link"
					          href="/myPage03?cnowPage=1&type=comment&commentKeyword=${commentKeyword}"
					          tabindex="-1" aria-disabled="true">
					          <i class="fas fa-angle-double-left"></i>
					        </a>
					      </li>
					      <!-- 1페이지에서 < 버튼 눌렀을 때 -->
					      <c:if test="${commentPage.nowPage == 1}">
					        <li>
					          <a class="page-link"
					            href="/myPage03?cnowPage=${commentPage.nowPage}&type=comment&commentKeyword=${commentKeyword}"
					            tabindex="-1" aria-disabled="true">
					            <i class="fas fa-angle-left"></i>
					          </a>
					        </li>
					      </c:if>
					</c:if>
					      
					      <!-- 1페이지가 아닌 페이지에서 < 버튼 눌렀을 때 -->
					      <c:if test="${commentPage.nowPage != 1}">
					        <li>
					          <a class="page-link"
					            href="/myPage03?cnowPage=${commentPage.nowPage-1}&type=comment&commentKeyword=${commentKeyword}"
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
					              <a class="page-link" href="/myPage03?cnowPage=${p}&type=comment&commentKeyword=${commentKeyword}">${p}</a>
					            </li>
					          </c:when>
					        </c:choose>
					      </c:forEach> 
					      
					      
					      
					 	 <c:if test="${commentPage.nowPage != commentPage.lastPage}">    
					      <!-- 현재 페이지가 마지막 페이지일 경우 > 버튼을 눌렀을 때 -->
					      <c:if test="${commentPage.nowPage == commentPage.lastPage}">
					        <li>
					          <a class="page-link"
					            href="/myPage03?cnowPage=${commentPage.nowPage}&type=comment&commentKeyword=${commentKeyword}"
					            tabindex="+1" aria-disabled="true">
					            <i class="fas fa-angle-right"></i>
					          </a>
					        </li>
					      </c:if>
					      
					      <!-- 현재 페이지가 마지막 페이지가 아닐 경우에 > 버튼을 눌렀을 때 -->					
					      <c:if test="${commentPage.nowPage != commentPage.lastPage}">
					        <li>
					          <a class="page-link"
					            href="/myPage03?cnowPage=${commentPage.nowPage+1}&type=comment&commentKeyword=${commentKeyword}"
					            tabindex="+1" aria-disabled="true" data-ajax="false">
					            <i class="fas fa-angle-right"></i>
					          </a>
					        </li>
					      </c:if> 
					
					      <!-- >> 버튼 -->
					      <li>
					        <a class="page-link"
					        href="/myPage03?cnowPage=${commentPage.lastPage}&type=comment&commentKeyword=${commentKeyword}"
					        tabindex="-1" aria-disabled="true">
					          <i class="fas fa-angle-double-right"></i>
					        </a>
					      </li>
					      
					      </c:if>
					    </ul>
					  </nav>
					 </div>


					 <c:if test="${loginUser != null}">
						<p class="right"><button class="board-write-btn fantasy" type="button" onclick="deleteComment();">삭제</button></p>
					 </c:if>
				</div>
				
				<div class="search-area">
					<div  class="search-area-body">
					<form class="form-inline my-2 my-lg-0 underSearchForm" action="/myPage03">
						<!-- <a class="nav-link dropdown-toggle" href="#" id="dropdown01"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a> -->
						<input class="form-control mr-sm-2 board-search" type="search"
							placeholder="검색어 입력" aria-label="Search">
						<button class="btn btn-outline-secondary my-2 my-sm-0 board-search-btn"
							type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>
					</div>
				</div>
				</c:when>
				<c:otherwise>
				<!-- 4444 -->
					<div class="message-wrap">
						<div class="message-st-01">
							<p class="big-text">아직 발생한 알림이 없습니다.</p>
							<p>거래 체결과 커뮤니티에서 다양한 이야기를 나누면 알림이 발생합니다!</p>
						</div>
					</div>
				</c:otherwise>
				</c:choose>				
			</div>
		
		
		
	</div>
</div>
</div>
</div>
	</div>
	


	<%@include file="mainfooter2.jsp" %>	
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
</body>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script> -->
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</html>