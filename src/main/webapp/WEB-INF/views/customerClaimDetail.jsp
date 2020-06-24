<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1 문의 내역</title>
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
<style>

body {
    line-height: 1;
    -webkit-text-size-adjust: none;
    background: #eff3f6;
    color: #000;
}
table {
    table-layout: fixed;
    border-collapse: collapse;
    border-spacing: 0;
    border: 0;
}
td, th {
    word-break: break-all;
    margin: 0;
    padding: 0;
    font-size: 14px;
    box-sizing: border-box;
}
legend, caption {
    font-size: 0;
    overflow: hidden;
    text-indent: -9999999px;
    height: 0;
    width: 0;
    line-height: 0;
}
.all-menu, .all-dim, .mob-menu {
    visibility: hidden;
}
.all-dim {
    content: "";
    position: fixed;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    z-index: 6;
    background-color: rgba(0,0,0, 0.5);
    text-indent: -9999px;
}
.containerNew {
    position: relative;
    max-width: 1260px;
    height: 100%;
    padding: 20px 0 0 0;
    margin: 0 auto;
}
.cont-area {
    padding: /*20px 30px 60px 30px*/20px 30px 0 30px;
    margin-bottom: /*70px*/40px;
    background: #fff;
    position: relative;
}
.qna-desc, .qna-desc .import, .qna-desc .time {
    line-height: 150%;
}
.qna-desc {
    padding: 55px 30px;
    min-height: 220px;
    background: url(/resources/img/bg_customer_qna_pc.png) no-repeat 50% 50%;
    background-size: 100% 100%;
    color: #fff;
    text-align: center;
}
.qna-desc .import {
    font-weight: normal;
    font-size: 24px;
}
.qna-desc, .qna-desc .import, .qna-desc .time {
    line-height: 150%;
}
.qna-desc .time {
    display: block;
    margin: 5px 0 0 0;
    font-size: 16px;
}
.qna-desc .inquiry {
    display: inline-block;
    margin: 15px 0 0 0;
    padding: 6px 14px;
    border: 1px solid #7d828c;
    color: #fff;
    line-height: 1;
}
.tit-h2.type {
    margin-top: 25px;
}
.tit-h2 {
    font-size: 16px;
    margin-bottom: 10px;
    font-weight: bold;
}
.table-scroll-no {
    width: 100%;
    border-top: #888 1px solid;
}
.table-row {
    width: 100%;
    color: #000;
}
.table-row th:first-child {
    border-left: 0;
}
.table-row tbody th {
    text-align: left;
    background-color: #f9f9f9;
    border-bottom: #eaeaea 1px solid;
    border-left: #eaeaea 1px solid;
    padding: 12px 5px;
    font-weight: normal;
}
td, th {
    word-break: break-all;
    margin: 0;
    padding: 0;
    font-size: 14px;
    box-sizing: border-box;
}
.table-row td {
    text-align: left;
    border-bottom: #eaeaea 1px solid;
    padding: 9px 5px;
    line-height: 1.4;
}
.table-row .ing {
    color: #888;
}
.answer-box {
    margin: 20px 0 0 0;
    border: 1px solid #eaeaea;
}
.answer-box .tit {
    display: block;
    padding: 16px 0 16px 20px;
    background: #f9f9f9;
    font-weight: normal;
    color: rgba(46,87,255,1);
}
.answer-box .answer.no-answer {
    padding: 36px 20px 30px;
    color: #888;
    text-align: center;
}
.answer-box .answer {
    padding: 20px;
    line-height: 150%;
}
.answer-box .answer.no-answer:before {
    content: "";
    display: block;
    width: 60px;
    height: 60px;
    margin: 0 auto 10px;
    background: url(/resources/img/icon_answer.png) no-repeat 0 0;
    background-size: 60px;
}
.bt-area {
    overflow: hidden;
    padding: 20px 0 40px;
}
.bt-area span {
    display: block;
    float: right;
}
[class*="btn-s"] {
    padding: 6px 10px;
    min-width: 60px;
    font-size: 14px;
    border: 1px solid #ccc;
    color: #888;
}
[class*="btn-"] {
    position: relative;
    background: #fff;
    border: 1px solid #444;
    line-height: 100%;
    display: inline-block;
    color: #000;
    vertical-align: middle;
    box-sizing: border-box;
    text-align: center;
}
[class*="btn-"].fantasy {
    background: rgba(46,87,255,1);
    border: 1px solid rgba(46,87,255,1);
    color: #fff;
}



@media only screen and (max-width: 1599px){
.cont-area {
    margin-right: 0;
    float: left;
    
}
}
@media only screen and (max-width: 979px){
.all-menu, .all-dim {
    display: none;
    visibility: hidden;
}
.containerNew {
    padding-top: 104px;
}
.containerNew {
    padding: 0;
    /* padding-bottom: 170px; */
}
.qna-desc {
    padding: 80px 15px 87px;
    background: url(/resources/img/bg_customer_qna_m.png) no-repeat 50% 50%;
    background-size: 100% 100%;
    border-bottom: 10px solid #eff3f6;
}
.qna-desc .import {
    font-size: 20px;
}
.tit-h2.mopad, .tit-h3.mopad {
    padding-left: 15px;
}
.answer-box {
    margin: 20px 15px 15px;
}
.bt-area {
    clear: both;
    overflow: hidden;
    padding: 0 15px 40px;
}
}

</style>
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
							<li class="selected"><a href="/customerClaim/list"><span>1:1문의 내역</span></a></li>
						</ul>
					</div>
				</div>
		<div class="col-md-10">
		<div class="cont-area">	
 							<div class="drop-nav">
								<h1 class="tit-h1 line">1:1문의 내역</h1>
							</div>
							<div class="m-drop-nav">
								<h1 class="m-drop-tit-title line" style="cursor: pointer;">1:1문의 내역 <i class="fas fa-angle-down"></i></h1>
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
									<a href="/customerClaim/list">1:1문의 내역</a>
								</h1>
							</div>	
		<!-- <h1 class="tit-h1">Q&amp;A</h1> -->

		<div class="qna-desc">
			<strong class="import">서비스 이용중 궁금한 내역이 있으시면, 언제든지 문의해주세요!</strong>
			<span class="time">1:1로 접수 주시면 빠른답변을 받아보실 수 있습니다. 평일 08:30~17:30</span>
			<a href="javascript:pageMove('serviceInqryInsert');" class="inquiry">1:1문의</a>
		</div>
		<!-- // qna-desc -->

		<h2 class="tit-h2 type mopad">문의내역</h2>
		<div class="table-scroll-no">
			<table class="table-row">
				<caption>Q&amp;A 상세내용 : 처리현황, 아이디, 제목, 내용에 대한 정보</caption>
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
						<th scope="row">아이디</th>
						<td>${qna.id}</td>
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
				
					
					<c:if test="${qna.atitle eq null}">
						<div class="answer no-answer">
							죄송합니다. 운영자의 답변이 아직 기재되지 않았습니다.<br>
							24시간이 경과한 이후에도 답변이 없다면, 다시 문의하여 주시기 바랍니다. 빠른 시간안에 답변을 드리겠습니다.
						</div>
					</c:if>
					
					<c:if test="${qna.atitle ne null }">
					<div class="answer no-answer">
						${qna.acontent}
					</div>
					</c:if>					
				
					
			</div>	
		
		
		<!-- // answer-box -->

		<div class="bt-area">
				<c:if test="${qna.qcheck eq '준비중'}">
					<a href="/customerClaim/update?qno=${qno}" class="btn-s">수정</a>
				</c:if>
				<a href="/qnaAnswer/write?qno=${qno}" class="btn-s fantasy">답변</a>
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