<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Q&amp;A</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- CSS파일 -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link href="/resources/css/free-board-detail.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/mainfooter2.css">
<link rel="stylesheet" href="/resources/css/mainheader2.css">
<link rel="stylesheet" href="/resources/css/sidebar.css">
</head>
<body>

	<%@include file="mainheader.jsp"%>
	<div class="all-dim"></div>
	<div class="containerNew">
		<div class="board-page">
			<div class="row">	
				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu" style="position: relative;">
						<ul>
							<li class="mid"><a href="/customer"><span>고객센터</span></a></li>
							<li class="mid"><a href="/customerNotice"><span>공지사항</span></a></li>
							<li class="mid"><a href="/customerqna"><span>도움말</span></a></li>
							<li class="mid"><a href="/customerClaim/write"><span>1:1문의</span></a></li>
							<li class="selected"><a href="/customerClaim/list"><span>Q&amp;A</span></a></li>
						</ul>
					</div>
				</div>
		<div class="col-md-10">
		<div class="cont-area">	
 							<div class="drop-nav">
								<h1 class="tit-h1 line">Q&amp;A</h1>
							</div>
							<div class="m-drop-nav">
								<h1 class="m-drop-tit-title line" style="cursor: pointer;">Q&amp;A <i class="fas fa-angle-down"></i></h1>
							</div>
							<div class="m-drop-down">
								<h1 class="m-drop-tit-body first line" style="cursor: pointer;">
									<a href="/customer">고객센터</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerNotice">공지사항</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerqna">도움말</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerClaim/write">1:1문의</a>
								</h1>														
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerClaim/list">Q&amp;A</a>
								</h1>
							</div>	
		<!-- <h1 class="tit-h1">Q&amp;A</h1> -->

		<div class="qna-desc">
			<strong class="import">서비스 이용중 궁금한 내역이 있으시면, 언제든지 문의해주세요!</strong>
			<span class="time">1:1로 접수 주시면 빠른답변을 받아보실 수 있습니다. 평일 08:30~17:30</span>
			<a href="/customerClaim/write" class="inquiry">1:1문의</a>
		</div>
		<!-- // qna-desc -->

		<h2 class="tit-h2 type mopad">문의내역</h2>
		<div class="table-scroll-no">
			<table class="table-row">
				<caption>Q&amp;A 상세내용 : 처리현황, 닉네임, 제목, 내용에 대한 정보</caption>
				<colgroup>
					<col style="width:25%;">
					<col style="width:75%;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">처리현황</th>
						<td><span class="ing">${qna.qcheck}</span></td>
					</tr>
					<tr>
						<th scope="row">닉네임</th>
						<td>${qna.nickname}</td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td>${qna.qtitle}</td>
					</tr>
					<tr>
						<th scope="row">작성일</th>
						<fmt:formatDate value="${qna.qdateTime}" var="time"
							pattern="MM/dd HH:mm" />
						<td class="board-date">${time}</td>
					</tr>
					<c:if test="${qna.acontent ne null}">
						<tr>
							<th scope="row">답변완료일</th>
							<fmt:formatDate value="${qna.adateTime}" var="time"
								pattern="MM/dd HH:mm" />
							<td class="board-date">${time}</td>
						</tr>
					</c:if>
					<tr>
						<th scope="row">내용</th>
						<td><div><p>${qna.qcontent}<br></p></div></td>
					</tr>
				</tbody>
			</table>
			<!-- //table-row -->
		</div>
		<!-- // table-scroll-no -->

		
			<div class="answer-box">
				<strong class="tit">문의주신 내역에 대한 답변입니다.</strong>
				
					
					<c:if test="${qna.acontent eq null}">
						<div class="answer no-answer">
							죄송합니다. 운영자의 답변이 아직 기재되지 않았습니다.<br>
							24시간이 경과한 이후에도 답변이 없다면, 다시 문의하여 주시기 바랍니다. 빠른 시간안에 답변을 드리겠습니다.
						</div>
					</c:if>
					
					<c:if test="${qna.acontent ne null }">
					<div class="answer">
						${qna.acontent}
					</div>
					</c:if>					
				
					
			</div>	
		
		
		<!-- // answer-box -->

		<div class="bt-area">
			<span>
				<a href="/customerClaim/list" class="btn-s">목록</a>
				
				<a href="/customerClaim/delete?qno=${qno}" class="btn-s fantasy">삭제</a>
			</span> 
		</div>

	</div>
	</div>
</div>
</div>
</div>


	<%@include file="mainfooter2.jsp"%>
	
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
<script src="/resources/jpaginate/jquery.twbsPagination.js"
	type="text/javascript"></script>
</html>