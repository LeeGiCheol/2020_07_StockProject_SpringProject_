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
	<link rel="stylesheet" href="/resources/css/mainfooter.css">
	<link rel="stylesheet" href="/resources/css/mainheader.css">
	<link rel="stylesheet" href="resources/css/newboard.css">
	<link rel="stylesheet" href="/resources/css/customers.css">
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

	<script type="text/javascript">
	</script>

</head>

<body>

	<%@include file="mainheader.jsp" %>

	<!-- 전체메뉴 백그라운드-->
	<div class="all-dim"></div>


	<div class="containerNew">
		<div class="contents">
			<div class="row">


				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu">
						<ul>
						<li id="sideTitle"><a  href="/customer"><span>고객센터</span></a></li>
						<li><a href="/customerNotice"><span>공지사항</span></a></li>
						<li><a href="/customerqna"><span>도움말</span></a></li>
						<li><a href="/customClaimWrite"><span>1:1문의</span></a></li>
						</ul>
					</div>
				</div>






				<div class="col-md-10">



					<div class="newsboard-area">


						<div class="drop-nav">
							<h1 class="tit-h1 line">도움말</h1>
						</div>

						<div class="m-drop-nav">
							<h1 class="m-drop-tit-title line" style="cursor:pointer;">도움말 ▼</h1>
						</div>
						<div class="m-drop-down">
							<h1 class="m-drop-tit-body first line" style="cursor:pointer;"><a href="/customer">고객센터</a></h1>
							<h1 class="m-drop-tit-body line" style="cursor:pointer;"><a href="/customerNotice">공지사항</a></h1>
							<h1 class="m-drop-tit-body line" style="cursor:pointer;"><a href="/customerqna">도움말</a></h1>
							<h1 class="m-drop-tit-body last line" style="cursor:pointer;"><a href="/customClaimWrite">1:1문의</a></h1>
					</div>


						<div class="newsboard-nav">
							<ul class="nav newsboard-nav-tab" id="pills-tab" role="tablist">
								<li class="newsboard-nav-item selected" role="presentation"><a class="nav-link" id="top-nav-font"
										data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home"
										aria-selected="true">회원</a></li>
								<li class="newsboard-nav-item" role="presentation"><a class="nav-link" id="top-nav-font"
										data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile"
										aria-selected="false">커뮤니티</a></li>
								<li class="newsboard-nav-item" role="presentation"><a class="nav-link" id="top-nav-font"
										data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact"
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
<span>로그인 영역> 비밀번호 찾기</span> 를 통해 확인 부탁 드립니다.</p>
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
회원님의 성함,  필명, 생년월일, 성별, 휴대폰번호, 이메일주소(회원가입시 작성하셨던 계정)
기재하셔서 <span> (webmaster@unistock.kr)</span>로 보내주시면
확인후 답변 드리겠습니다.</p>
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
													data-target="#collapsetwo" aria-expanded="true" aria-controls="collapsetwo">
													내가 받을 수 있는 알림의 종류는 무엇이 있나요?
												</button>
											</h2>
										</div>

										<div id="collapsetwo" class="collapse show" aria-labelledby="headingtwo"
											data-parent="#accordionExample">
											<div class="card-body">
												<div class="qAnswer">
													<p>내가 받을 수 있는 알림은 아래 사항과 같습니다.
- 내가 작성한 글에 대한 댓글알림
- 내가 작성한 방명록글에 대한 댓글알림
- 내가 작성한 글이 인기글로 선정되었을 시 알림
- 내가 작성한 글이 베스트글로 선정되었을 시 알림
- 신규 선호회원이 등록된 경우 제공되는 알림
- 방명록에 새글이 등록된 경우 제공되는 알림
- 내글이 300건이상 조회수를 초과했을 시 제공되는 조회수 달성알림
- 내글이 10건이상의 조회수를 초과했을 시 제공되는 추천수 달성알림
- 내가 작성한 글이 신고접수 되었을 시 제공되는 신고 알림
- 나의 선호회원중 프로필이 변경된 회원이 발생한 경우 제공되는 프로필변경알림
- 나를 차단한 회원이 발생하였을 시 제공되는 차단알림</p>
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
													[게시판]베스트글 선정기준이 무엇인가요?
												</button>
											</h2>
										</div>
										<div id="collapsetwo1" class="collapse" aria-labelledby="headingtwo2" data-parent="#accordionExample">
											<div class="card-body">
												<div class="qAnswer">
													<p><span>베스트글은 인기글중 추천수 15개 이상의 베스트추천수를 받았을 경우 </span>
베스트글로 선정되며, 토론실 최상단에 특별 배치됩니다.
<span>신규 베스트글이 나타났을 경우 익일 교체되며, 베스트글 유지기간은 최대 2일입니다. </span>
인기글과 베스트글은 자동으로 선정이 되기 때문에 종목별로 차이를 두고 있지 않습니다.
다만 인기글로 선정된 글이라도 운영원칙에 위반되는 글 등 선정 기준에 부합하지 않은 경우 
해지가 될 수 있습니다</p>
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
										<div class="card-header" id="headingthree">
											<h2 class="mb-0">
												<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse"
													data-target="#collapsethree" aria-expanded="true" aria-controls="collapsethree">
													[관심종목]관심종목 등록은 어떻게 하나요?
												</button>
											</h2>
										</div>

										<div id="collapsethree" class="collapse show" aria-labelledby="headingthree"
											data-parent="#accordionExample">
											<div class="card-body">
												<div class="qAnswer">
													<p>팍스넷 상단의 관심종목을 클릭하면 관심종목 등록 페이지로 이동 합니다.
해당 페이지에서 <span>"괸심종목 등록/변경"</span>버튼을 통해 종목을 등록할 수 있습니다.</p>
												</div>
											</div>
										</div>
									</div>
									<!-- 반복끝 -->



								</div>

							</div>
		
						

						</div>

					</div>
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