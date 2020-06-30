<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link href="resources/css/mainheader2.css" rel="stylesheet">
<link href="resources/css/mainfooter.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/sidebar.css">
<link href="resources/css/mypage03.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
	<%@include file="../mainheader.jsp"%>
	<!-- section start -->
	<div class="all-dim"></div>
	<div class="containerNew">
		<div class="board-page">
			<div class="row">
				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu">
						<ul>
							<li class="mid"><a href="/myPagePwCheck01"><span>내 정보 관리</span></a></li>
								<c:set var="socialId" value="${loginUser.id}"/>
									<c:choose>
										<c:when test="${fn:contains(socialId,'_')}">
										</c:when>
										<c:otherwise>
											<li class="mid"><a href="mypageUpdatePassword"><span>비밀번호 재설정</span></a></li>
										</c:otherwise>
									</c:choose>
							<li class="mid"><a href="/myPagePwCheck02"><span>계좌정보</span></a></li>
							<li class="mid"><a href="/myPagePwCheck03"><span>작성 글 | 댓글</span></a></li>
							<li class="selected"><a href="/myPage04"><span>알림</span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-10">
					<div class="free-board">
						<div class="drop-nav">
							<h1 class="tit-h1 line">알림</h1>

						</div>
						<div class="m-drop-nav">
							<h1 class="m-drop-tit-title line" style="cursor: pointer;">알림
								<i class="fas fa-angle-down"></i></h1>
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
								<form id="form" class="board-list-top policy-in"
									action='/board/free'>
									<p class="pc-only">
										<input type="radio" class="ordeby" id="orderby1"
											name="orderby" value="new" checked=""><label
											for="orderby1" class="new-board">거래 알림</label> <input
											type="radio" class="ordeby" id="orderby2" name="orderby"
											value="best"><label for="orderby2" class="hot-board">커뮤니티
											알림</label>
									</p>
								</form>


							</div>
							<div class="tab-content" id="pills-tabContent">
								<!-- 전체글 -->
								<table class="board-free-table">
									<colgroup>
										<col width="10%">
										<col width="35%">
										<col width="15%">
										<col width="10%">
										<col width="15%">
										<col width="10%">
									</colgroup>
									<thead id="a_title">
										<tr>
											<th class="no" scope="col">NO</th>
											<th class="title" scope="col">종목명</th>
											<th class="writer" scope="col">단가</th>
											<th class="views" scope="col">수량</th>
											<th class="likes" scope="col">거래일시</th>
											<th class="date" scope="col">상태</th>
										</tr>
									</thead>
									<tbody id="a_contents">
										<c:forEach items="${modifiedNotice}" var="list">
											<tr>
												<c:choose>
													<c:when test="${list.confirm eq 1}">
													<td class="first" title="주문번호" style="color: red">NEW</td>
													</c:when>
													<c:otherwise>
													<td class="first" title="주문번호"><c:out
														value="${list.tno}" /></td>
													</c:otherwise>
												</c:choose>
												<td title="종목명"><c:out value="${list.stockName}" /></td>
												<td title="주문단가"><c:out value="${list.tprice}" /></td>
												<td title="주문수량"><c:out value="${list.quantity}" /></td>
												<td title="거래일시"><fmt:formatDate
														value="${list.tdatetime}" pattern="yyyy-MM-dd HH:mm:ss" />
												</td>
												<td title="상태"><c:out value="${list.category}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							<div class="message-wrap" id="message">
							<c:if test="${modifiedNotice eq null}">
								<div class="message-st-01">
									<p class="big-text">아직 발생한 알림이 없습니다.</p>
									<p>거래 체결과 커뮤니티에서 다양한 이야기를 나누면 알림이 발생합니다!</p>
								</div>
							</c:if>
							</div>
<script type="text/javascript">
    $(document)
        .ready(
            function () {
                $("#orderby2")
                    .click(
                        function () {
                            $(
                                "#a_title")
                                .html(
                                    "<tr><th class='no' scope='col'>글번호</th><th class='title' scope='col'>내용</th><th class='time' scope='col'>시간</th></tr>");
                            console
                                .log("클릭");
                            $(
                                "#a_contents")
                                .html(
                                    '<c:forEach items="${commentNotice}" var="list"><tr><c:choose><c:when test="${list.confirm eq 1}"><td class="first" title="글번호" style="color: red">NEW</td></c:when><c:otherwise><td class="first" title="글번호""><c:out value="${list.pno}" /></td></c:otherwise></c:choose><td title="내용"><c:out value="${list.title}" /> 글에 댓글이 달렸습니다.</td><td title="시간"><fmt:formatDate value="${list.ndatetime}" pattern="yyyy-MM-dd HH:mm:ss" /></td></tr></c:forEach>');
                            if("${commentNotice}"==="[]"){
                            	$("#message").html('<div class="message-st-01"><p class="big-text">아직 발생한 알림이 없습니다.</p><p>거래 체결과 커뮤니티에서 다양한 이야기를 나누면 알림이 발생합니다!</p></div>')
                            }else{
                            	$("#message").html('')
                            }
                            
                        })
                $("#orderby1")
                    .click(
                        function () {
                            $(
                                "#a_title")
                                .html(
                                    '<tr><th class="no" scope="col">NO</th><th class="title" scope="col">종목명</th><th class="writer" scope="col">단가</th><th class="views" scope="col">수량</th><th class="likes" scope="col">거래일시</th><th class="date" scope="col">상태 </th></tr>');
                            console
                                .log("클릭");
                            $(
                                "#a_contents")
                                .html(
                                    '<c:forEach items="${modifiedNotice}" var="list"><tr><c:choose><c:when test="${list.confirm eq 1}"><td class="first" title="주문번호" style="color: red">NEW</td></c:when><c:otherwise><td class="first" title="주문번호"><c:out value="${list.tno}" /></td>	</c:otherwise></c:choose><td title="종목명"><c:out value="${list.stockName}" /></td><td title="주문단가"><c:out value="${list.tprice}" /></td><td title="주문수량"><c:out value="${list.quantity}" /></td><td title="거래일시"><fmt:formatDate value="${list.tdatetime}" pattern="yyyy-MM-dd HH:mm:ss" /></td><td title="상태"><c:out value="${list.category}" /></td></tr></c:forEach>');
                            if("${modifiedNotice}"==="[]"){
                            	$("#message").html('<div class="message-st-01"><p class="big-text">아직 발생한 알림이 없습니다.</p><p>거래 체결과 커뮤니티에서 다양한 이야기를 나누면 알림이 발생합니다!</p></div>')
                            }else{
                            	$("#message").html('')
                            }
                        })	

            })
</script>


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>



	<!-- article end -->
	<%@include file="../mainfooter2.jsp"%>
		<script type="text/javascript">
			$(document).ready(
					function() {
						console.log("document ready!");

						var $sticky = $('.sticky');
						var $stickyrStopper = $('.footer_content');
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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>