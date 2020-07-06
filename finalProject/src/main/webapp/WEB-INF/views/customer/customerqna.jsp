<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>newsboard</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="resources/css/newboard.css">
	<link rel="stylesheet" href="/resources/css/sidebar.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$(".newsboard-nav-item").each(function () {
				$(this).click(function () {
					$(this).addClass("selected"); //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적
					$(this).siblings().removeClass("selected"); //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
				});
			});
			/* 		$(function() {
						var sBtn = $("ul > li"); //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
						sBtn.find("a").click(function() { // sBtn에 속해 있는  a 찾아 클릭 하면.
							sBtn.removeClass("active"); // sBtn 속에 (active) 클래스를 삭제 한다.
							$(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
						})
					}) */
			$(function () {
				window.pagObj = $('#pagination').twbsPagination({
					totalPages: 35,
					visiblePages: 5,
					onPageClick: function (event, page) {
						console.info(page + ' (from options)');
					}
				}).on('page', function (event, page) {
					console.info(page + ' (from event listening)');
				});
			});
		});
	</script>

<style>
.newsboard-area{
	height: 600px !important;
}
.newsboard-nav-tab li{
	border-bottom: 1px solid #eaeaea;
	
}

.newsboard-nav-tab li.selected {
    z-index: 3;
    background: #fff;
    line-height: 50px;
    color: #5a6268 !important;
    border-bottom: 2px solid #1e78ff;
    font-weight: 600;
}
.newsboard-nav-tab li {
    width: 33.333%;
    letter-spacing: 1px;
}
.text-left{
background-color: transparent !important;
}
@media only screen and (max-width: 979px) {
.newsboard-area {

    margin-bottom: 0;

}

} 
</style>

</head>
<body>

	<%@include file="../mainheader.jsp" %>

	<!-- 전체메뉴 백그라운드-->
	<div class="all-dim"></div>


	<div class="containerNew">
		<div class="contents">
			<div class="row">


				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu" style="position: relative;">
						<ul>
							<li class="mid"><a href="/customer"><span>고객센터</span></a></li>
							<li class="mid"><a href="/customerNotice"><span>공지사항</span></a></li>
							<li class="selected mid"><a href="/customerQna"><span>도움말</span></a></li>
							<li class="mid"><a href="/customerClaim/write"><span>1:1문의</span></a></li>
							<li><a href="/customerClaim/list"><span>Q&amp;A</span></a></li>
						</ul>
					</div>
				</div>






				<div class="col-md-10">



					<div class="newsboard-area">


 							<div class="drop-nav">
								<h1 class="tit-h1 line">도움말</h1>
							</div>
							<div class="m-drop-nav">
								<h1 class="m-drop-tit-title line" style="cursor: pointer;">도움말 <i class="fas fa-angle-down"></i></h1>
							</div>
							<div class="m-drop-down">
								<h1 class="m-drop-tit-body first line" style="cursor: pointer;">
									<a href="/customer">고객센터</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerNotice">공지사항</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerQna">도움말</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerClaim/write">1:1문의</a>
								</h1>														
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerClaim/list">Q&amp;A</a>
								</h1>
							</div>	



				<div class="newsboard-nav">
					<ul class="nav newsboard-nav-tab" id="pills-tab" role="tablist">
						<li class="newsboard-nav-item selected" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-home" role="tab" aria-controls="pills-home"
							aria-selected="true">회원</a></li>
						<li class="newsboard-nav-item" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-profile" role="tab" aria-controls="pills-profile"
							aria-selected="false">커뮤니티</a></li>
						<li class="newsboard-nav-item" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-contact" role="tab" aria-controls="pills-contact"
							aria-selected="false" style="border-right: none;">거래</a></li>
					</ul>
				</div>



						<div class="tab-content" id="pills-tabContent">



							<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
								<div class="accordion" id="accordionExample">



									<!-- 반복시작 -->
									<div class="card">
										<div class="card-header" id="headingOne">
											<h2 class="mb-0">
												<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse"
													data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
													[아이디/비밀번호]비밀번호를 잊어버렸습니다.
												</button>
											</h2>
										</div>

										<div id="collapseOne" class="collapse" aria-labelledby="headingOne"
											data-parent="#accordionExample">
											<div class="card-body">
												<div class="qAnswer">
													<p>회원가입시 설정하신 비밀번호는 모두 암호화되어 저장되므로,
													고객센터에서 확인이 불가능합니다.
													<span>로그인 영역> 아이디 찾기, 비밀번호 찾기</span>를 통해 확인 부탁 드립니다.
													</p>
												</div>
											</div>
										</div>
									</div>
									<!-- 반복끝 -->

									<div class="card">
										<div class="card-header" id="headingOne-1">
											<h2 class="mb-0">
												<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse"
													data-target="#collapseOne-1" aria-expanded="false" aria-controls="collapseOne-1">
													[아이디/비밀번호]아이디 변경은 어떻게 하나요?
												</button>
											</h2>
										</div>
										<div id="collapseOne-1" class="collapse" aria-labelledby="headingOne-1" data-parent="#accordionExample">
											<div class="card-body">
												<div class="qAnswer">
													<p><span>로그인영역>아이디찾기 </span>에서 ID를 확인 하실 수 있습니다.
													아이디 확인이 불가한 경우
													회원님의 성함, 휴대폰번호, 이메일주소(회원가입시 작성하셨던 계정)
													기재하셔서 <span> (zooozp2@gmail.com)</span>로 보내주시면
													확인후 답변 드리겠습니다.
													</p>
												</div>
											</div>
										</div>
									</div>
									
									<div class="card">
										<div class="card-header" id="headingOne-2">
											<h2 class="mb-0">
												<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse"
													data-target="#collapseOne-2" aria-expanded="false" aria-controls="collapseOne-2">
													[회원탈퇴]회원탈퇴를 하고싶습니다.
												</button>
											</h2>
										</div>

										<div id="collapseOne-2" class="collapse" aria-labelledby="headingOne-2"
											data-parent="#accordionExample">
											<div class="card-body">
												<div class="qAnswer">
													<p>마이페이지에서 비밀번호확인 후 회원탈퇴가능합니다. 회원탈퇴시 각 게시판의 기존 글은 유지됩니다.<br>
													소셜로그인 회원분들은 비밀번호 확인이 없으시니 유의해주시길바랍니다.</p>

												</div>
											</div>
										</div>
									</div>


								</div>


							</div>


							<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
							
								<div class="accordion" id="accordionExample">



									<!-- 반복시작 -->
									<div class="card">
										<div class="card-header" id="headingtwo">
											<h2 class="mb-0">
												<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse"
													data-target="#collapsetwo" aria-expanded="false" aria-controls="collapsetwo">
													[알림]내가 받을 수 있는 알림의 종류는 무엇이 있나요?
												</button>
											</h2>
										</div>

										<div id="collapsetwo" class="collapse" aria-labelledby="headingtwo"
											data-parent="#accordionExample">
											<div class="card-body">
												<div class="qAnswer">
													<p>내가 받을 수 있는 알림은 아래 사항과 같습니다.<br>
													- 내가 작성한 글에 대한 댓글알림<br>
													- 내가 작성한 댓글에 대한 알림<br>
													- 매도/매수 등 거래에 대한 알림
													</p>
												</div>
											</div>
										</div>
									</div>
									<!-- 반복끝 -->

									<div class="card">
										<div class="card-header" id="headingtwo2">
											<h2 class="mb-0">
												<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse"
													data-target="#collapsetwo1" aria-expanded="false" aria-controls="collapsetwo1">
													[검색]통합검색은 무엇인가요?
												</button>
											</h2>
										</div>
										<div id="collapsetwo1" class="collapse" aria-labelledby="headingtwo2" data-parent="#accordionExample">
											<div class="card-body">
												<div class="qAnswer">
													<p>메인홈페이지 혹은 각 페이지상단에 [통합검색]에 원하시는 키워드를 입력하여서
													종목 & 자유게시판 & 포트폴리오 & 회원으로 나누어 검색이 가능합니다. 
													추가 궁금하신부분이 있으시면 1:1문의를 통해 접수가능합니다.
													</p>
												</div>
											</div>
										</div>
									</div>



								</div>

							</div>




							<div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
								<div class="accordion" id="accordionExample">



									<!-- 반복시작 -->
									<div class="card">
										<div class="card-header" id="headingthree-1">
											<h2 class="mb-0">
												<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse"
													data-target="#collapsethree-1" aria-expanded="false" aria-controls="collapsethree-1">
													[거래]거래는 어떻게 하나요?
												</button>
											</h2>
										</div>

										<div id="collapsethree-1" class="collapse" aria-labelledby="headingthree-1"
											data-parent="#accordionExample">
											<div class="card-body">
												<div class="qAnswer">
													<p><a href="/trade"><span>거래는 거래 페이지</span>에서 원하는 종목을 검색 후 하실 수 있습니다.
													오른쪽에서 원하는 가격을 누르고 수량 입력 후 매수, 매도를 하실 수 있습니다.</a></p>
												</div>
											</div>
										</div>
									</div>
									
									<div class="card">
										<div class="card-header" id="headingthree-2">
											<h2 class="mb-0">
												<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse"
													data-target="#collapsethree-2" aria-expanded="false" aria-controls="collapsethree-2">
													[거래]미체결 거래 정정은 어떻게 하나요?
												</button>
											</h2>
										</div>

										<div id="collapsethree-2" class="collapse" aria-labelledby="headingthree-2"
											data-parent="#accordionExample">
											<div class="card-body">
												<div class="qAnswer">
													<p><a href="/trade"><span>정정은 거래 페이지</span>의 하단에서 정정탭을 선택하시면 할 수 있습니다.
													미체결 버튼을 누르시고 나오는 거래번호를 입력수 원하는 가격 수량을 누르면 정정가능합니다.</a></p>
												</div>
											</div>
										</div>
									</div>


								</div>

							</div>
		
						

						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../mainfooter2.jsp" %>
		<script type="text/javascript">
			$(document).ready(
					function() {
						console.log("document ready!");

						var $sticky = $('.sticky');
						var $stickyrStopper = $('.tab-content');
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
	<script src="resources/jpaginate/jquery.twbsPagination.js"></script>
	<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
	<script src="resources/js/bootstrap-datepicker.ko.min.js"></script>
	<!-- paginate -->
	<script src="resources/jpaginate/jquery.twbsPagination.js" type="text/javascript"></script>
	<!-- paginate -->
</body>

</html>