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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
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

.newboard-area {
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
.newboard-nav {
    margin-left: auto;
    margin-right: auto;
    position: relative;
    overflow: hidden;
    z-index: 1;
}
[class*="newboard-nav-tab"] {
    margin-bottom: 30px;
    border: 1px solid #eaeaea;
    background: #f9f9f9;
    box-sizing: border-box !important;
}
.newboard-nav-tab li {
    width: 14.28%;
}
[class*="newboard-nav-tab"] li {
    position: relative;
    float: left;
}
</style>
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
			<div class="newboard-area">
				<h1 class="title-h1">뉴스 게시판</h1>
				<div class="newboard-nav">
					<ul class="nav newboard-nav-tab" id="pills-tab" role="tablist">
						<li class="breadcrumb-item" role="presentation"><a
							class="nav-link active" id="top-nav-font" data-toggle="pill"
							href="#pills-home" role="tab" aria-controls="pills-home"
							aria-selected="true">종합</a></li>
						<li class="breadcrumb-item" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-profile" role="tab" aria-controls="pills-profile"
							aria-selected="false">증권</a></li>
						<li class="breadcrumb-item" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-contact" role="tab" aria-controls="pills-contact"
							aria-selected="false">정치/사회</a></li>
					</ul>
				</div>

				<div class="tab-content" id="pills-tabContent">
					<div class="tab-pane fade show active" id="pills-home"
						role="tabpanel" aria-labelledby="pills-home-tab">
						<div class="headline">
							<a href="#">
								<p>
									<strong>[fn오전시황] 코스피, 미중 갈등 우려에 2000선 내줘</strong> <span>
										[파이낸셜뉴스] 코스피가 상승출발했으나 미중 갈등 악화에 약세로 전환했다. 22일 오전 10시 22분 현재
										코스피는 전 거래일보다 13.82포인트(0.69%) 내린 1984.49를 가리키고 있다. 지수는 전 거래일보다
										0.16%(3.29포인트) 오른 2001.60으로 개장했지만 외국인 매도세가 짙어지며 2000선 아래로
										떨어졌다. 유가증권시장에서 외국인과 기관은 각각 1557억원, 413억원 순매도하며 지수를 끌어내리고 있다.
										개인은 2092억원 순매수하고 있다. 간밤 뉴욕 증시에서 다우존스30 산업평균지수(-0.41%)와
										스탠더드앤드푸어스(S&P) 500 지수(-0.78%), 나스닥 지수(-0.97%) 등 주요 지수는 홍콩시위와
										코로나19 확산 책임을 둘러싼 미중 갈등에 일제히 하락했다. </span>
									<mark>파이낸셜뉴스</mark>
									<em>10:31</em>
								</p>
							</a>
						</div>
						<ul>
							<li id="test_1"><a href="#">[특징주]상보, 中희토류 전략무기화 가능성 상승에
									대체제 부각 '강세'</a> <mark>이데일리</mark> <em>14:53</em></li>
							<li id="test_1"><a href="#">코스피·코스닥, 외국인·기관 동반 매도세에 1%대
									급락</a> <mark>아시아경제</mark> <em>13:53</em></li>
							<li id="test_1"><a href="#">코스피, 외국인·기관 동반 매도에 1% 이상
									'하락'</a> <mark>이데일리</mark> <em>13:35</em></li>
						</ul>
					</div>
					<div class="tab-pane fade" id="pills-profile" role="tabpanel"
						aria-labelledby="pills-profile-tab">
						<div class="headline">
							<a href="#"> <span class="news-img"> <img
									src="resources/img/20200522_16726299.jpg">
							</span>
								<p>
									<strong>코스닥 외국인 순매수,도 상위20종목</strong> <span> 코스닥 외국인 순매수
										상위종목(금액기준) 순위 종목명 금액(억원) 1 에코프로비엠(247540) 135.97 2
										네오위즈(095660) 78.48 3 셀트리온헬스케어(091990) 57.05 4
										NHN한국사이버결제(060250) 34.54 5 KG이니시스(035600) 34.44 6
										에스앤에스텍(101490) 33.93 7 메드팩토(235980) 33.28 8 다우데이타(032190)
										24.68 9 에이디테크놀로지(200710) 21.43 10 컴투스(078340) 19.75 11
										리노공업(058470) 18.59 </span>
									<mark>인포스탁</mark>
									<em>15:51</em>
								</p>
							</a>
						</div>
						<ul>
							<li id="test_1"><a href="#">[특징주]상보, 中희토류 전략무기화 가능성 상승에
									대체제 부각 '강세'</a> <mark>이데일리</mark> <em>14:53</em></li>
							<li id="test_1"><a href="#">코스피·코스닥, 외국인·기관 동반 매도세에 1%대
									급락</a> <mark>아시아경제</mark> <em>13:53</em></li>
							<li id="test_1"><a href="#">코스피, 외국인·기관 동반 매도에 1% 이상
									'하락'</a> <mark>이데일리</mark> <em>13:35</em></li>
						</ul>
					</div>
					<div class="tab-pane fade" id="pills-contact" role="tabpanel"
						aria-labelledby="pills-contact-tab">
						<div class="headline">
							<a href="#">
								<p>
									<strong>[fn오전시황] 코스피, 미중 갈등 우려에 2000선 내줘</strong> <span>
										[파이낸셜뉴스] 코스피가 상승출발했으나 미중 갈등 악화에 약세로 전환했다. 22일 오전 10시 22분 현재
										코스피는 전 거래일보다 13.82포인트(0.69%) 내린 1984.49를 가리키고 있다. 지수는 전 거래일보다
										0.16%(3.29포인트) 오른 2001.60으로 개장했지만 외국인 매도세가 짙어지며 2000선 아래로
										떨어졌다. 유가증권시장에서 외국인과 기관은 각각 1557억원, 413억원 순매도하며 지수를 끌어내리고 있다.
										개인은 2092억원 순매수하고 있다. 간밤 뉴욕 증시에서 다우존스30 산업평균지수(-0.41%)와
										스탠더드앤드푸어스(S&P) 500 지수(-0.78%), 나스닥 지수(-0.97%) 등 주요 지수는 홍콩시위와
										코로나19 확산 책임을 둘러싼 미중 갈등에 일제히 하락했다. </span>
									<mark>파이낸셜뉴스</mark>
									<em>10:31</em>
								</p>
							</a>
						</div>
						<ul>
							<li id="test_1"><a href="#">[특징주]상보, 中희토류 전략무기화 가능성 상승에
									대체제 부각 '강세'</a> <mark>이데일리</mark> <em>14:53</em></li>
							<li id="test_1"><a href="#">코스피·코스닥, 외국인·기관 동반 매도세에 1%대
									급락</a> <mark>아시아경제</mark> <em>13:53</em></li>
							<li id="test_1"><a href="#">코스피, 외국인·기관 동반 매도에 1% 이상
									'하락'</a> <mark>이데일리</mark> <em>13:35</em></li>
						</ul>
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

	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
</body>
</html>