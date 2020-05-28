<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>mainpage</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="resources/css/newboard.css">

<style>
.all-dim {
	content: "";
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: -1;
	background: #eff3f6;
	text-indent: -9999px;
}

.newsboard-area {
	padding: /*20px 30px 60px 30px*/ 20px 30px 20px 30px;
	background: #fff;
	position: relative;
}

.contents {
	position: relative;
	z-index: 1;
}

.title-h1 {
	font-size: 20px;
	margin-bottom: 20px;
	font-weight: bold;
	line-height: 100%;
}

.newsboard-nav {
	margin-left: auto;
	margin-right: auto;
	position: relative;
	overflow: hidden;
	z-index: 1;
}

[class*="newsboard-nav-tab"] {
	margin-bottom: 30px;
	border: 1px solid #eaeaea;
	background: #f9f9f9;
	box-sizing: border-box !important;
}

.newsboard-nav-tab li {
	width: 33.333%;
}

[class*="newsboard-nav-tab"] li {
	position: relative;
	float: left;
}

[class*="newsboard-nav-tab"] li a {
	position: relative;
	z-index: 1;
	display: block;
	line-height: 50px;
	text-align: center;
	color: #000;
	border-right: 1px solid #eaeaea;
	background: #f9f9f9;
	box-sizing: border-box;
}

.newsboard-nav-tab li.selected a, .newsboard-nav-tab li:active>a,
	.newsboard-nav-tab li.active>a {
	z-index: 3;
	background: #fff;
	line-height: 50px;
	color: #5a6268 !important;
}

[class*="newsboard-nav-tab"] li.selected a:after, li:active>a, li.active>a
	{
	border-bottom: 2px solid #5a6268;
}

[class*="newsboard-nav-tab"] li:after {
	content: "";
	position: absolute;
	left: 0;
	bottom: 0;
	top: 0;
	z-index: 2;
}

.day-nav {
	clear: both;
	position: relative;
}

.week {
	min-height: 30px;
	margin: 0 -30px;
	padding: 0 30px 20px;
	border-bottom: #444444 1px solid;
	position: relative;
	
}

.tab-content {
	margin-bottom: 26px;
}

.newslist li {
	position: relative;
	padding: 15px 20px 15px 20px;
	border-bottom: #eaeaea 1px solid;
	min-height: 120px;
	width: 100%;
	display: table;
}

.newslist li>.img {
	display: table-cell;
	position: relative;
	width: 150px;
	vertical-align: middle;
	height: 90px;
}

.newslist li>.img span {
	position: absolute;
	left: 0;
	width: 130px;
	height: 90px;
	margin-right: 20px;
	transform: translateY(-50%);
	border: 1px solid #eaeaea;
	overflow: hidden;
	text-align: center;
}

.newslist li>.img img {
	height: 90px;
}

.newslist li>.text {
	display: table-cell;
	vertical-align: middle;
}

.newslist li>.text dt {
	padding-bottom: 5px;
	line-height: 1.4;
}

.newslist li>.text dt a {
	font-size: 16px;
	color: #000;
	font-weight: bold;
}

.newslist li>.text dd.cont {
	line-height: 1.4;
	padding-bottom: 8px;
	color: #000;
}

.newslist li>.text dd.cont a {
	font-size: 14px;
	color: #000;
}

.newslist li>.text dd.date {
	padding-bottom: 0;
	line-height: 1.4;
}

.newslist li>.text dd.date span {
	display: inline-block;
	font-size: 13px;
	color: #888;
	padding-right: 10px;
	margin-right: 5px;
	vertical-align: middle;
}

.paging {
	clear: both;
	padding: 0 0 30px 0;
	text-align: center;
	position: relative;
	margin-left: 4px;
}

.paging-body {
	display: inline-block;
	padding-left: 0;
	margin: 20px 0;
	border-radius: 4px;
}
.week .input-group-addon .calendar{
	width: 28px;
    height: 28px;
	display: inline-block;
	overflow: hidden;
	text-indent: -9999em;
	background: url(resources/img/btn_board.png) no-repeat -82px 0px;
	vertical-align: middle;
}
.datepicker-dropdown{
    top: 335px !important;
}
.input-style.short {
    width: 320px;
    
}
[class*="input-style"] {
    position: relative;
    margin-left: 30px;
}
input[type="text"]{
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    line-height: 1;
    padding: 5px 35px 6px 10px;
    border: 1px solid #ccc;
    background: #fff;
    color: #000;
    vertical-align: middle;
    box-sizing: border-box;
    border-radius: 0;
}
[class*="btn-"].gray {
    background: #444;
    border: 1px solid #444;
    color: #fff;
}
[class*="btn-t"] {
    padding: 6px 10px;
    min-width: 60px;
    font-size: 14px;
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

</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".newboard-nav-item").each(function() {
			$(this).click(function() {
				$(this).addClass("selected"); //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
				$(this).siblings().removeClass("selected"); //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
			});
		});
		$(function() {
			var sBtn = $("ul > li"); //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
			sBtn.find("a").click(function() { // sBtn에 속해 있는  a 찾아 클릭 하면.
				sBtn.removeClass("active"); // sBtn 속에 (active) 클래스를 삭제 한다.
				$(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
			})
		})
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : 35,
				visiblePages : 5,
				onPageClick : function(event, page) {
					console.info(page + ' (from options)');
				}
			}).on('page', function(event, page) {
				console.info(page + ' (from event listening)');
			});
		});
	});
</script>
</head>
<body>
	<div class="header">
		<!-- 상단  nav -->
		<ul class="nav justify-content-end top-nav">
			<li class="breadcrumb-item"><a id="top-nav-font" href="#">로그인</a></li>
			<li class="breadcrumb-item"><a id="top-nav-font" href="#">회원가입</a></li>
		</ul>
		<ul class="nav justify-content-end top-nav">
			<a href="#"><img class="" cust_id="" id="_myhomeId"
				src="resources/img/pi_08.png"></a>
			<dl>
				<dt>
					<strong>개미굴</strong> 님
				</dt>
			</dl>
			<li class="breadcrumb-item"><a id="top-nav-font" href="#">로그아웃</a></li>
			<li class="breadcrumb-item"><a id="top-nav-font" href="#">마이페이지</a></li>
		</ul>
		<!-- 상단  nav end -->
		<!-- 메인  nav -->
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light navbar-custom">
			<a class="navbar-brand" href="#"><i class="fas fa-users"></i>Stock
				gallery</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<form class="form-inline my-2 my-lg-0">
						<input class="form-control mr-sm-2" type="search"
							placeholder="통합검색" aria-label="Search">
						<button class="btn btn-outline-secondary my-2 my-sm-0"
							type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> 커뮤니티 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">자유게시판</a> <a
								class="dropdown-item" href="#">포트폴리오</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">뉴스</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="#">거래</a></li>
					<li class="nav-item"><a class="nav-link" href="#">고객센터<span
							class="sr-only">(current)</span></a></li>
				</ul>
			</div>
		</nav>
		<!-- 메인 nav end -->
	</div>

	<!-- 전체메뉴 백그라운드-->
	<div class="all-dim"></div>


	<div class="container">
		<div class="contents">
			<div class="newsboard-area">
				<h1 class="title-h1">뉴스 게시판</h1>
				<div class="newsboard-nav">
					<ul class="nav newsboard-nav-tab" id="pills-tab" role="tablist">
						<li class="newsboard-nav-item active" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-home" role="tab" aria-controls="pills-home"
							aria-selected="true">종합</a></li>
						<li class="newsboard-nav-item" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-profile" role="tab" aria-controls="pills-profile"
							aria-selected="false">증권</a></li>
						<li class="newsboard-nav-item" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-contact" role="tab" aria-controls="pills-contact"
							aria-selected="false" style="border-right: none;">정치/사회</a></li>
					</ul>
				</div>

				<div class="board-calendar">

					<div class="week ">
					<p class="date">
							<strong style="margin-right: 5px">기준일</strong>
							<span class="input-group-addon"> 
								<input type="text" class="dateview">
								<i class="far fa-calendar-alt"></i>
							</span>
						
							<script type="text/javascript">
								$(document).ready(function() {
									$('.input-group-addon').datepicker({
										format : 'yyyy.mm.dd',
										clearBtn : true,
										language : "ko",
										orientation : "bottom auto",
										autoclose : true,
										todayBtn : "linked"
									});
								});
							</script>
							
							<span class="input-style short">
								<input type="text" placeholder="뉴스검색" title="뉴스검색" value onkeyup="enter();">
							</span>
								<button type="button" onclick="#" class="btn-t gray">검색</button>
							<button type="button" onclick="#" class="btn-t gray">새로고침</button>
					</p>
					</div>
					<!-- //week -->
				</div>
				<!-- //board-calendar -->


				<div class="tab-content" id="pills-tabContent">
					<div class="tab-pane fade show active" id="pills-home"
						role="tabpanel" aria-labelledby="pills-home-tab">
						<ul class="newslist">
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="전운 감도는 美·中…희토류 관련株 급등" src="resources/img/희토류.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">전운 감도는 美·中…희토류 관련株 급등</a>
									</dt>
									<dd class="cont">
										<a href="#">- 中희토류 무기화 가능성 부각- “美제재 범위 따라 대응해야”[이데일리 김윤지
											기자] 미국과 중국 갈등 고조에 희토류 관련주가 급등했다. 양국 관계가 악화되면 중국이 희토류 무기화 카드를
											꺼낼 가능성이 부각되면…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 19:47</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">IMM PE, 한국콜마 제약부문·콜마파마 인수[마켓워치]</a>
									</dt>
									<dd class="cont">
										<a href="#">5125억원에 주식매매계약 체결 IMM프라이빗에쿼티(PE)가 한국콜마의
											제약사업부문과 한국콜마홀딩스의 자회사 콜마파마를 인수한다. IMM PE는 27일 한국콜마그룹은 한국콜마의
											제약사업부문과 한국콜마홀딩스의 자회사이자 의약품 생산업체인 콜마파마 인수에 관한 주식매…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 19:46</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">금융당국, 회계부정 신고 대상 확대…"분기 및 반기 재무제표까지"</a>
									</dt>
									<dd class="cont">
										<a href="#">- 회계부정 신고 독려 목적[이데일리 유현욱 기자] 앞으로는 기말 재무제표뿐만
											아니라 분·반기 재무제표 관련 회계부정 신고에도 정부 포상금을 지급한다.금융위원회는 27일 제10차 정례회의를
											열어 이런 내용을 담은 ‘회계 관련 부정행위 신고 및 포상 등에 대한 규정 …</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:28</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">충남 천안·아산 28개 학교 등교 연기…"코로나19 확산 우려로 3일만 연기"</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] 충남 천안과 아산지역 28개 학교가 신종
											코로나바이러스감염증(코로나19) 확산 우려에 등교수업을 중단했다.충남교육청은 27일 천안 18개, 아산 10개
											학교가 등교를 연기했다고 밝혔다. 학교별로 1~3일 등 일정 기간만 연기한다는 방침이다. 천안…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:28</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="[이준기의 미국in]회복하는 美경제…트럼프·바이든 누구 손들어줄까"
											src="resources/img/트럼프.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">[이준기의 미국in]회복하는 美경제…트럼프·바이든 누구 손들어줄까</a>
									</dt>
									<dd class="cont">
										<a href="#">- 바이든, 트럼프의 '전유물' 경제 파고드나- 일각 "트럼프 잘해왔다"…자충수 될
											수도- 바이든, 경제대응 실패·회복 적임자 강조사진=AFP[뉴욕=이데일리 이준기 특파원]미국 민주당의
											대선후보로 확정된 조 바이든(사…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="쿠팡 물류센터발 코로나19 재확산…확진자 30명으로 늘어"
											src="resources/img/쿠팡.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">쿠팡 물류센터발 코로나19 재확산…확진자 30명으로 늘어</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] 쿠팡 부천 물류센터를 중심으로 다시 확산되고 있는 신종
											코로나바이러스감염증(코로나19)이 수도권 일대에서 확산하고 있다. 인천시는 부천 물류센터와 관련한 코로나19
											확진자가 27일 오후 3…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">27일 장 마감 후 주요 종목뉴스</a>
									</dt>
									<dd class="cont">
										<a href="#">[이데일리 이광수 기자] 다음은 27일 장 마감 후 주요 종목
											뉴스다.△웅진씽크빅(095720)은 공시 번복했지만 감경 사유로 불성실공시법인에 지정되진 않았다고 공시.

											△SK이노베이션(096770)은 미국 소재 자회사인 SK배터리아메리카에 5567억원 규모의 채무보증을 결정했…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="LG화학, 현대·기아차에 전기차 배터리 공급…CATL도 첫 공급"
											src="resources/img/lg화학.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">LG화학, 현대·기아차에 전기차 배터리 공급…CATL도 첫 공급</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] LG화학이 현대·기아자동차에 수조 원대 규모의 전기차
											배터리를 공급한다.27일 자동차 및 배터리업계에 따르면 LG화학은 현대·기아차가 2022년부터 양산 예정인
											순수 전기차 전용 플랫폼 ‘E…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 18:58</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="차환 막힌 단기증권, '원금상환'사상최대" src="resources/img/단기증권.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">차환 막힌 단기증권, '원금상환'사상최대"</a>
									</dt>
									<dd class="cont">
										<a href="#">이달에만 순상환액 12조 넘어 이달 들어 기업어음(CP)과
											자산유동화기업어음(ABCP) 등 단기증권 순상환액이 12조원을 넘어섰다. 단기자금 시장이 경색되면서 기업들이
											발행한 단기증권보다 상…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 18:46</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="밑천 드러난 나라살림.. 증세 불지피는 국책硏" src="resources/img/나라살림.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">밑천 드러난 나라살림.. 증세 불지피는 국책硏</a>
									</dt>
									<dd class="cont">
										<a href="#">KDI 이어 조세재정硏도 언급전문가들 "시기 문제일뿐 수순"부자 겨냥 핀셋증세는
											효과 적어국민 소득세 구간 확대가 대안靑·기재부는 여전히 "검토 안해" 정부와 청와…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 18:46</span>
									</dd>
								</dl>
							</li>
						</ul>
					</div>
					<div class="tab-pane fade" id="pills-profile" role="tabpanel"
						aria-labelledby="pills-profile-tab">
						<ul class="newslist">
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="[이준기의 미국in]회복하는 美경제…트럼프·바이든 누구 손들어줄까"
											src="resources/img/트럼프.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">[이준기의 미국in]회복하는 美경제…트럼프·바이든 누구 손들어줄까</a>
									</dt>
									<dd class="cont">
										<a href="#">- 바이든, 트럼프의 '전유물' 경제 파고드나- 일각 "트럼프 잘해왔다"…자충수 될
											수도- 바이든, 경제대응 실패·회복 적임자 강조사진=AFP[뉴욕=이데일리 이준기 특파원]미국 민주당의
											대선후보로 확정된 조 바이든(사…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="전운 감도는 美·中…희토류 관련株 급등" src="resources/img/희토류.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">전운 감도는 美·中…희토류 관련株 급등</a>
									</dt>
									<dd class="cont">
										<a href="#">- 中희토류 무기화 가능성 부각- “美제재 범위 따라 대응해야”[이데일리 김윤지
											기자] 미국과 중국 갈등 고조에 희토류 관련주가 급등했다. 양국 관계가 악화되면 중국이 희토류 무기화 카드를
											꺼낼 가능성이 부각되면…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 19:47</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">IMM PE, 한국콜마 제약부문·콜마파마 인수[마켓워치]</a>
									</dt>
									<dd class="cont">
										<a href="#">5125억원에 주식매매계약 체결 IMM프라이빗에쿼티(PE)가 한국콜마의
											제약사업부문과 한국콜마홀딩스의 자회사 콜마파마를 인수한다. IMM PE는 27일 한국콜마그룹은 한국콜마의
											제약사업부문과 한국콜마홀딩스의 자회사이자 의약품 생산업체인 콜마파마 인수에 관한 주식매…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 19:46</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">금융당국, 회계부정 신고 대상 확대…"분기 및 반기 재무제표까지"</a>
									</dt>
									<dd class="cont">
										<a href="#">- 회계부정 신고 독려 목적[이데일리 유현욱 기자] 앞으로는 기말 재무제표뿐만
											아니라 분·반기 재무제표 관련 회계부정 신고에도 정부 포상금을 지급한다.금융위원회는 27일 제10차 정례회의를
											열어 이런 내용을 담은 ‘회계 관련 부정행위 신고 및 포상 등에 대한 규정 …</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:28</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">충남 천안·아산 28개 학교 등교 연기…"코로나19 확산 우려로 3일만 연기"</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] 충남 천안과 아산지역 28개 학교가 신종
											코로나바이러스감염증(코로나19) 확산 우려에 등교수업을 중단했다.충남교육청은 27일 천안 18개, 아산 10개
											학교가 등교를 연기했다고 밝혔다. 학교별로 1~3일 등 일정 기간만 연기한다는 방침이다. 천안…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:28</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="쿠팡 물류센터발 코로나19 재확산…확진자 30명으로 늘어"
											src="resources/img/쿠팡.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">쿠팡 물류센터발 코로나19 재확산…확진자 30명으로 늘어</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] 쿠팡 부천 물류센터를 중심으로 다시 확산되고 있는 신종
											코로나바이러스감염증(코로나19)이 수도권 일대에서 확산하고 있다. 인천시는 부천 물류센터와 관련한 코로나19
											확진자가 27일 오후 3…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">27일 장 마감 후 주요 종목뉴스</a>
									</dt>
									<dd class="cont">
										<a href="#">[이데일리 이광수 기자] 다음은 27일 장 마감 후 주요 종목
											뉴스다.△웅진씽크빅(095720)은 공시 번복했지만 감경 사유로 불성실공시법인에 지정되진 않았다고 공시.

											△SK이노베이션(096770)은 미국 소재 자회사인 SK배터리아메리카에 5567억원 규모의 채무보증을 결정했…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="LG화학, 현대·기아차에 전기차 배터리 공급…CATL도 첫 공급"
											src="resources/img/lg화학.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">LG화학, 현대·기아차에 전기차 배터리 공급…CATL도 첫 공급</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] LG화학이 현대·기아자동차에 수조 원대 규모의 전기차
											배터리를 공급한다.27일 자동차 및 배터리업계에 따르면 LG화학은 현대·기아차가 2022년부터 양산 예정인
											순수 전기차 전용 플랫폼 ‘E…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 18:58</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="차환 막힌 단기증권, '원금상환'사상최대" src="resources/img/단기증권.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">차환 막힌 단기증권, '원금상환'사상최대"</a>
									</dt>
									<dd class="cont">
										<a href="#">이달에만 순상환액 12조 넘어 이달 들어 기업어음(CP)과
											자산유동화기업어음(ABCP) 등 단기증권 순상환액이 12조원을 넘어섰다. 단기자금 시장이 경색되면서 기업들이
											발행한 단기증권보다 상…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 18:46</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="밑천 드러난 나라살림.. 증세 불지피는 국책硏" src="resources/img/나라살림.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">밑천 드러난 나라살림.. 증세 불지피는 국책硏</a>
									</dt>
									<dd class="cont">
										<a href="#">KDI 이어 조세재정硏도 언급전문가들 "시기 문제일뿐 수순"부자 겨냥 핀셋증세는
											효과 적어국민 소득세 구간 확대가 대안靑·기재부는 여전히 "검토 안해" 정부와 청와…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 18:46</span>
									</dd>
								</dl>
							</li>
						</ul>
					</div>
					<div class="tab-pane fade" id="pills-contact" role="tabpanel"
						aria-labelledby="pills-contact-tab">
						<ul class="newslist">
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="밑천 드러난 나라살림.. 증세 불지피는 국책硏" src="resources/img/나라살림.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">밑천 드러난 나라살림.. 증세 불지피는 국책硏</a>
									</dt>
									<dd class="cont">
										<a href="#">KDI 이어 조세재정硏도 언급전문가들 "시기 문제일뿐 수순"부자 겨냥 핀셋증세는
											효과 적어국민 소득세 구간 확대가 대안靑·기재부는 여전히 "검토 안해" 정부와 청와…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 18:46</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">IMM PE, 한국콜마 제약부문·콜마파마 인수[마켓워치]</a>
									</dt>
									<dd class="cont">
										<a href="#">5125억원에 주식매매계약 체결 IMM프라이빗에쿼티(PE)가 한국콜마의
											제약사업부문과 한국콜마홀딩스의 자회사 콜마파마를 인수한다. IMM PE는 27일 한국콜마그룹은 한국콜마의
											제약사업부문과 한국콜마홀딩스의 자회사이자 의약품 생산업체인 콜마파마 인수에 관한 주식매…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 19:46</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">금융당국, 회계부정 신고 대상 확대…"분기 및 반기 재무제표까지"</a>
									</dt>
									<dd class="cont">
										<a href="#">- 회계부정 신고 독려 목적[이데일리 유현욱 기자] 앞으로는 기말 재무제표뿐만
											아니라 분·반기 재무제표 관련 회계부정 신고에도 정부 포상금을 지급한다.금융위원회는 27일 제10차 정례회의를
											열어 이런 내용을 담은 ‘회계 관련 부정행위 신고 및 포상 등에 대한 규정 …</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:28</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="전운 감도는 美·中…희토류 관련株 급등" src="resources/img/희토류.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">전운 감도는 美·中…희토류 관련株 급등</a>
									</dt>
									<dd class="cont">
										<a href="#">- 中희토류 무기화 가능성 부각- “美제재 범위 따라 대응해야”[이데일리 김윤지
											기자] 미국과 중국 갈등 고조에 희토류 관련주가 급등했다. 양국 관계가 악화되면 중국이 희토류 무기화 카드를
											꺼낼 가능성이 부각되면…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 19:47</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">충남 천안·아산 28개 학교 등교 연기…"코로나19 확산 우려로 3일만 연기"</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] 충남 천안과 아산지역 28개 학교가 신종
											코로나바이러스감염증(코로나19) 확산 우려에 등교수업을 중단했다.충남교육청은 27일 천안 18개, 아산 10개
											학교가 등교를 연기했다고 밝혔다. 학교별로 1~3일 등 일정 기간만 연기한다는 방침이다. 천안…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:28</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="[이준기의 미국in]회복하는 美경제…트럼프·바이든 누구 손들어줄까"
											src="resources/img/트럼프.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">[이준기의 미국in]회복하는 美경제…트럼프·바이든 누구 손들어줄까</a>
									</dt>
									<dd class="cont">
										<a href="#">- 바이든, 트럼프의 '전유물' 경제 파고드나- 일각 "트럼프 잘해왔다"…자충수 될
											수도- 바이든, 경제대응 실패·회복 적임자 강조사진=AFP[뉴욕=이데일리 이준기 특파원]미국 민주당의
											대선후보로 확정된 조 바이든(사…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="쿠팡 물류센터발 코로나19 재확산…확진자 30명으로 늘어"
											src="resources/img/쿠팡.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">쿠팡 물류센터발 코로나19 재확산…확진자 30명으로 늘어</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] 쿠팡 부천 물류센터를 중심으로 다시 확산되고 있는 신종
											코로나바이러스감염증(코로나19)이 수도권 일대에서 확산하고 있다. 인천시는 부천 물류센터와 관련한 코로나19
											확진자가 27일 오후 3…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">27일 장 마감 후 주요 종목뉴스</a>
									</dt>
									<dd class="cont">
										<a href="#">[이데일리 이광수 기자] 다음은 27일 장 마감 후 주요 종목
											뉴스다.△웅진씽크빅(095720)은 공시 번복했지만 감경 사유로 불성실공시법인에 지정되진 않았다고 공시.

											△SK이노베이션(096770)은 미국 소재 자회사인 SK배터리아메리카에 5567억원 규모의 채무보증을 결정했…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="LG화학, 현대·기아차에 전기차 배터리 공급…CATL도 첫 공급"
											src="resources/img/lg화학.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">LG화학, 현대·기아차에 전기차 배터리 공급…CATL도 첫 공급</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] LG화학이 현대·기아자동차에 수조 원대 규모의 전기차
											배터리를 공급한다.27일 자동차 및 배터리업계에 따르면 LG화학은 현대·기아차가 2022년부터 양산 예정인
											순수 전기차 전용 플랫폼 ‘E…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 18:58</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="차환 막힌 단기증권, '원금상환'사상최대" src="resources/img/단기증권.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">차환 막힌 단기증권, '원금상환'사상최대"</a>
									</dt>
									<dd class="cont">
										<a href="#">이달에만 순상환액 12조 넘어 이달 들어 기업어음(CP)과
											자산유동화기업어음(ABCP) 등 단기증권 순상환액이 12조원을 넘어섰다. 단기자금 시장이 경색되면서 기업들이
											발행한 단기증권보다 상…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 18:46</span>
									</dd>
								</dl>
							</li>
						</ul>
					</div>
				</div>
				<div class="paging">
					<div class="paging-body">
						<ul class="pagination" id="pagination"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- footer start -->
	<div class=footer_div>
		<footer class="footer_info">
			<p>
				<a href="https://www.naver.com">회사소개</a> | <a
					href="https://www.google.co.kr">광고안내</a> | <a
					href="https://www.naver.com">이용약관</a> | <a
					href="https://www.google.co.kr"><strong>개인정보처리방침</strong></a>
			</p>
			<p>Copyright ⓒ 2020 - 2020 stock gallery. All rights reserved.</p>
		</footer>
	</div>
	<!-- footer end -->
	<script src="resources/jpaginate/jquery.twbsPagination.js"></script>
	<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
	<script src="resources/js/bootstrap-datepicker.ko.min.js"></script>
	<!-- paginate -->
	<script src="resources/jpaginate/jquery.twbsPagination.js"
		type="text/javascript"></script>
	<!-- paginate -->
</body>
</html>