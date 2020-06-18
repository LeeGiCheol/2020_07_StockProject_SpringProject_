<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>고객센터</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<link rel="stylesheet" href="/resources/css/mainpage.css">
	<link rel="stylesheet" href="/resources/css/mainfooter.css">
	<link rel="stylesheet" href="/resources/css/mainheader.css">
	<link rel="stylesheet" href="/resources/css/customers.css">

	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style type="text/css">

	</style>
</head>

<body>
	<%@include file="mainheader.jsp" %>


	<!-- 전체메뉴 백그라운드-->
	<div class="all-dim"></div>

	<div class="containerNew">

		<div class="row">
			<div class="col-md-2">


				<div class="sidebar sticky" id="cssmenu">
					<ul>
						<li id="sideTitle"><a  href="#"><span>고객센터</span></a></li>
						<li><a href="#"><span>공지사항</span></a></li>
						<li><a href="#"><span>도움말</span></a></li>
						<li><a href="#"><span>1:1문의</span></a></li>
					</ul>
				</div>



			</div>











			<div class="col-md-10">
<div class="m-menu">
						<div class="m-drop-nav">
							<h1 class="m-drop-tit-title line" style="cursor:pointer;">고객센터 ▼</h1>
						</div>
						<div class="m-drop-down">
							<h1 class="m-drop-tit-body first line" style="cursor:pointer;"><a href="/board/free">고객센터</a></h1>
							<h1 class="m-drop-tit-body line" style="cursor:pointer;"><a href="#">공지사항</a></h1>
							<h1 class="m-drop-tit-body line" style="cursor:pointer;"><a href="#">도움말</a></h1>
							<h1 class="m-drop-tit-body last line" style="cursor:pointer;"><a href="/news">1:1문의</a></h1>
					
						</div>
</div>
				<div class="community" role="main">








					<!-- 검색 -->
					<div id="searchArea" class="sectionBox">
						<div class="phe_main_search">
							<fieldset>
								<strong class="tit">궁금하신 사항을 검색해주세요.</strong>
								<div class="input-box">
									<input type="text" onkeydown="javascript:onKeyDown();" id="question" name="question" class="text">
									<button type="button" onclick="javascript:search();" class="search">검색</button>
								</div>
								<div class="inquiry-box">
									<p class="inquiry-txt">궁금하신 사항에 대하여 답변을 찾지 못하셨다면 1:1문의를 하세요.</p>
									<a href="/rpan/help/serviceInqry" class="link">1:1 문의</a>
				
								</div>
							</fieldset>
						</div>
					</div>

					<!-- 공지사항 -->
					<div id="noticeArea" class="sectionBox">
						<div class="sectionWrapper">
							<dl>
								<h2 class="main-tit">공지사항</h2>
								<a class="moreBttn right blue" href="#">더보기</a>
								<dd>

								
								
									<div class="noticeList">
										<c:forEach items="${boardList}" var="board">
									
										<ul class="list-group">
											<!-- 현재 고객센터 공지사항 -> 일반 공지사항으로 변경 요청 -->
								<c:if test="${ not empty board}">

											<li class="list-group-item"><a href="/board/free/detail?pno=${board.pno}">${board.title}</a> </li>

								</c:if>


										</ul>
										</c:forEach>
										
									</div>
								</dd>
							</dl>
						</div>
					</div>

					<!-- 자주하는질문top5 -->
					<div class="sectionBox">

						<div class="sectionWrapper">
							<h2 class="main-tit">자주하는질문 TOP 5</h2>

							<div class="accordion" id="accordionExample">


								<div class="card">
									<div class="card-header" id="headingOne">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse"
												data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
												[아이디/비밀번호]비밀번호를 잊어버렸습니다.
											</button>
										</h2>
									</div>

									<div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="qAnswer">
												<p>회원가입시 설정하신 비밀번호는 모두 암호화되어 저장되므로,
													고객센터에서 확인이 불가능합니다.
													로그인 영역> 비밀번호 찾기 를 통해 확인 부탁 드립니다.</p>
											</div>
										</div>
									</div>
								</div>

								<div class="card">
									<div class="card-header" id="headingTwo">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse"
												data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
												[아이디/비밀번호]아이디 변경은 어떻게 하나요?
											</button>
										</h2>
									</div>
									<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
										<div class="card-body">
											<div class="qAnswer">
												<p>회원가입 상태에서는 아이디를 변경하실 수가 없습니다.
													단, 아이디를 제외한 나머지 정보들(필명,이메일,주소,전화번호,비밀번호 등)은 변경이 가능합니다.
													아이디를 변경하시기 위해서는 회원 탈퇴 후 다시 재가입 을 하셔야 합니다.

													회원탈퇴를 하시기전에 사용하셨던
													아이디, 유료서비스 등의 사용이 불가능 하므로
													탈퇴하시기 전에 반드시 유료서비스를 먼저 해지하여주시기 바랍니다.</p>
											</div>
										</div>
									</div>
								</div>


								<div class="card">
									<div class="card-header" id="headingThree">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse"
												data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
												[팍스넷 신규 회원 무료쿠폰]은 어떤 서비스인가요?
											</button>
										</h2>
									</div>
									<div id="collapseThree" class="collapse" aria-labelledby="headingThree"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="qAnswer">
												<p>탈퇴하시기 전에 반드시 유료서비스를 먼저 해지하여주시기 바랍니다.</p>
											</div>

										</div>
									</div>
								</div>

								<div class="card">
									<div class="card-header" id="headingFour">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse"
												data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
												[팍스넷 신규 회원 무료쿠폰]은 어떤 서비스
												인가요?
											</button>
										</h2>
									</div>
									<div id="collapseFour" class="collapse" aria-labelledby="headingThree"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="qAnswer">
												<p>탈퇴하시기 전에 반드시 유료서비스를 먼저 해지하여주시기 바랍니다.</p>
											</div>
										</div>
									</div>
								</div>

								<div class="card">
									<div class="card-header" id="headingFive">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse"
												data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
												[팍스넷 신규 회원 무료쿠폰]은 어떤 서비스
												인가요?
											</button>
										</h2>
									</div>
									<div id="collapseFive" class="collapse" aria-labelledby="headingThree"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="qAnswer">
												<p>회원가입 상태에서는 아이디를 변경하실 수가 없습니다.
													단, 아이디를 제외한 나머지 정보들(필명,이메일,주소,전화번호,비밀번호 등)</p>
											</div>
										</div>
									</div>
								</div>




							</div>

						</div>


					</div>





				</div>

				<!-- 도움말과 1:1문의 -->
				<div class="sectionBox">



					<a href="#" id="cBoxa" class="cBox">
						<p class="cBoxTitle">도움말</p>
						<svg class="bi bi-chat-dots" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd"
								d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z" />
							<path
								d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
						</svg>
					</a>






					<a href="#" id="cBoxb" class="cBox">
						<p class="cBoxTitle">1:1 문의</p>
						<svg class="bi bi-people-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd"
								d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z" />
						</svg>
					</a>





				</div>





			</div>






		</div>
	</div>

	<%@include file="mainfooter.jsp" %>
	<script type="text/javascript">
		$(document).ready(function () {
			console.log("document ready!");

			var $sticky = $('.sticky');
			var $stickyrStopper = $('.footer_info');
			if (!!$sticky.offset()) { // make sure ".sticky" element exists

				var generalSidebarHeight = $sticky.innerHeight();
				var stickyTop = $sticky.offset().top;
				var stickOffset = 0;
				var stickyStopperPosition = $stickyrStopper.offset().top;
				var stopPoint = stickyStopperPosition - generalSidebarHeight - stickOffset;
				var diff = stopPoint + stickOffset;

				$(window).scroll(function () { // scroll event
					var windowTop = $(window).scrollTop(); // returns number

					if (stopPoint < windowTop) {
						$sticky.css({
							position: 'relative',
							top: diff
						});
					} else if (stickyTop < windowTop + stickOffset) {
						$sticky.css({
							position: 'fixed',
							top: stickOffset
						});
					} else {
						$sticky.css({
							position: 'relative',
							top: 'initial'
						});
					}
				});

			}
			$(".m-drop-nav").click(function () {
				$(".m-drop-down").slideToggle("slow");
			});
		});
	</script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script>

	</script>


</body>

</html>