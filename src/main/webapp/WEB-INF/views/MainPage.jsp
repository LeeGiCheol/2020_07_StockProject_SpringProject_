<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="sftylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="/resources/css/main.css"> 

</head>
<body>

	<div class="header">
		<!-- 상단  nav -->
		<ul class="nav justify-content-end top-nav">
			<li class="breadcrumb-item"><a id="top-nav-font" href="#">로그인</a></li>
			<li class="breadcrumb-item"><a id="top-nav-font" href="#">회원가입</a></li>
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
		<div class="row">
			<div class="col-md-9">
				<div class="chartdata">
					<div id="chartContainer"></div>
				</div>

				<div class="stock-ranking">
					<nav>
						<div class="nav nav-tabs" role="tablist">
							<a class="nav-item">인기 종목</a> <a class="nav-item">인기 상품</a>
						</div>
					</nav>
					<div class="tab-content">
						<div class=".tab-pane" id="tab1">
							<ul class="step1">
								<li id="test_1"><a><i>1</i> <span>soccer</span>
										<p class="color-red">21%</p></a></li>
								<li id="test_2"><a><i>2</i> <span>rose</span>
										<p class="color-red">19%</p></a></a></li>
								<li id="test_3"><a><i>3</i> <span>김선달</span>
										<p class="color-red">17%</p></a></li>
								<li id="test_4"><a><i>4</i> <span>칠성부대</span>
										<p class="color-red">14%</p></a></li>
								<li id="test_5"><a><i>5</i> <span>강태공</span>
										<p class="color-red">13%</p></a></li>
							</ul>
						</div>
						<div class=".tab-pane" id="tab2">
							<ul class="step2">
								<li id="test_1"><a><i>1</i> <span>soccer</span>
										<p class="color-red">21%</p></a></li>
								<li id="test_2"><a><i>2</i> <span>rose</span>
										<p class="color-red">19%</p></a></a></li>
								<li id="test_3"><a><i>3</i> <span>김선달</span>
										<p class="color-red">17%</p></a></li>
								<li id="test_4"><a><i>4</i> <span>칠성부대</span>
										<p class="color-red">14%</p></a></li>
								<li id="test_5"><a><i>5</i> <span>강태공</span>
										<p class="color-red">13%</p></a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="community">
					<div class="community-best">
						<nav>
							<div class="nav nav-tabs" role="tablist">
								<a class="nav-item">커뮤니티 베스트</a>
								<button type="button" class="btn btn-secondary btn-sm plus">더보기</button>
							</div>
						</nav>
						<div class="tab-content">
							<div class=".tab-pane" id="tab1">
								<ul class="step1">
									<li id="test_1"><a href="#">직접 경험한 동네의 중요성</a>
										<p class="nickname">승리OK</p></li>
									<li id="test_1"><a href="#">테슬라 model3 충돌 테스트</a>
										<p class="nickname">스톡king</p></li>
									<li id="test_1"><a href="#">출시 후 단 한 명의 사망자도 발생하지 않은</a>
										<p class="nickname">증권가속보3</p></li>
									<li id="test_1"><a href="#">전고체배터리 기술변화에 따른 전망</a>
										<p class="nickname">승리OK</p></li>
									<li id="test_1"><a href="#">대치동 은마아파트 실거주 후기</a>
										<p class="nickname">증권가속보3</p></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="community-new">
						<nav>
							<div class="nav nav-tabs" role="tablist">
								<a class="nav-item">신규 글</a>
								<button type="button" class="btn btn-secondary btn-sm plus">더보기</button>
							</div>
						</nav>
						<div class="tab-content">
							<div class=".tab-pane" id="tab1">
								<ul class="step1">
									<li id="test_1"><a href="#">직접 경험한 동네의 중요성</a>
										<p class="nickname">승리OK</p></li>
									<li id="test_1"><a href="#">테슬라 model3 충돌 테스트</a>
										<p class="nickname">스톡king</p></li>
									<li id="test_1"><a href="#">출시 후 단 한 명의 사망자도 발생하지 않은</a>
										<p class="nickname">증권가속보3</p></li>
									<li id="test_1"><a href="#">전고체배터리 기술변화에 따른 전망</a>
										<p class="nickname">승리OK</p></li>
									<li id="test_1"><a href="#">대치동 은마아파트 실거주 후기</a>
										<p class="nickname">증권가속보3</p></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="news-ranking">
					<div class="news-nav">
						<ul class="nav top-nav" id="pills-tab" role="tablist">
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
										<strong>[fn오전시황] 코스피, 미중 갈등 우려에 2000선 내줘</strong> 
										<span>
											[파이낸셜뉴스] 코스피가 상승출발했으나 미중 갈등 악화에 약세로 전환했다. 22일 오전 10시 22분 현재
											코스피는 전 거래일보다 13.82포인트(0.69%) 내린 1984.49를 가리키고 있다. 지수는 전 거래일보다
											0.16%(3.29포인트) 오른 2001.60으로 개장했지만 외국인 매도세가 짙어지며 2000선 아래로
											떨어졌다. 유가증권시장에서 외국인과 기관은 각각 1557억원, 413억원 순매도하며 지수를 끌어내리고 있다.
											개인은 2092억원 순매수하고 있다. 간밤 뉴욕 증시에서 다우존스30 산업평균지수(-0.41%)와
											스탠더드앤드푸어스(S&P) 500 지수(-0.78%), 나스닥 지수(-0.97%) 등 주요 지수는 홍콩시위와
											코로나19 확산 책임을 둘러싼 미중 갈등에 일제히 하락했다. 
										</span>
											<mark>파이낸셜뉴스</mark>
											<em>10:31</em>
									</p>
								</a>
							</div>
							<ul class="step1">
								<li id="test_1"><a href="#">직접 경험한 동네의 중요성</a></li>
								<li id="test_1"><a href="#">직접 경험한 동네의 중요성</a></li>
								<li id="test_1"><a href="#">직접 경험한 동네의 중요성</a></li>
								<li id="test_1"><a href="#">직접 경험한 동네의 중요성</a></li>
								<li id="test_1"><a href="#">직접 경험한 동네의 중요성</a></li>
							</ul>
						</div>
						<div class="tab-pane fade" id="pills-profile" role="tabpanel"
							aria-labelledby="pills-profile-tab">문창훈</div>
						<div class="tab-pane fade" id="pills-contact" role="tabpanel"
							aria-labelledby="pills-contact-tab">박원희</div>
					</div>
				</div>

			</div>



			<div class="col-md-3">
				<div class="login-box">
					<div class="titB">
						<strong>로그인</strong> <a href="#" target="_blank">회원가입</a>
					</div>
					<div class="inpB">
						<span> <input data-val="true"
							data-val-required="사용자 아이디 필드가 필요합니다." id="UserName"
							maxlength="30" name="UserName" placeholder="아이디" type="text"
							value="" /> <input data-val="true"
							data-val-required="암호 필드가 필요합니다." id="Password" maxlength="30"
							name="Password"
							onkeypress="if(event.keyCode == 13){ $.app.front.auth.login.submit(); }"
							placeholder="패스워드" type="password" />
						</span>
						<button class="btnLogin" title="로그인" style="cursor: pointer;"
							onclick="$.app.front.auth.login.submit(); return false;">로그인</button>
					</div>
					<div class="botLink">
						<span> <input type="checkbox"><label for="">로그인
								상태 유지</label>
						</span> <a href="#" target="_blank">아이디/비밀번호 찾기</a>
						<p id="errorBox" style="display: none;">아이디 또는 패스워드가 일치하지
							않습니다.</p>
					</div>
				</div>

				<div class="ranking">
					<span class="ranking-nav">주간 랭킹</span>
					<div class="ranking-body">
						<ul>
							<li id="test_1"><a><i>1</i> <span>soccer</span>
									<p class="color-red">21%</p></a></li>
							<li id="test_2"><a><i>2</i> <span>rose</span>
									<p class="color-red">19%</p></a></a></li>
							<li id="test_3"><a><i>3</i> <span>김선달</span>
									<p class="color-red">17%</p></a></li>
							<li id="test_4"><a><i>4</i> <span>칠성부대</span>
									<p class="color-red">14%</p></a></li>
							<li id="test_5"><a><i>5</i> <span>강태공</span>
									<p class="color-red">13%</p></a></li>
							<li id="test_6"><a><i>6</i> <span>황금돼지</span>
									<p class="color-red">11%</p></a></li>
							<li id="test_7"><a><i>7</i> <span>사오정</span>
									<p class="color-red">10%</p></a></li>
							<li id="test_8"><a><i>8</i> <span>개미왕</span>
									<p class="color-red">7%</p></a></li>
							<li id="test_9"><a><i>9</i> <span>답없다</span>
									<p class="color-red">5%</p></a></li>
							<li id="test_10"><a><i>10</i> <span>어부</span>
									<p class="color-red">4%</p></a></li>
						</ul>
					</div>
				</div>

				<div class="faq">
					<nav>
						<div class="nav nav-tabs" role="tablist">
							<a class="nav-item">FAQ</a>
							<button type="button" class="btn btn-secondary btn-sm plus">더보기</button>
						</div>
					</nav>
					<div class="tab-content">
						<div class=".tab-pane" id="tab1">
							<ul class="step1">
								<li id="test_1"><a href="#">[회원가입] 나의 투자 정보 공개 여부</a></li>
								<li id="test_1"><a href="#">[거래] 매매 시 수익률 관련</a></li>
								<li id="test_1"><a href="#">[커뮤니티] 광고성 글 및 선정적 글 신고</a></li>
								<li id="test_1"><a href="#">[이벤트] 주간 랭킹 TOP 3 상품 안내</a></li>
								<li id="test_1"><a href="#">[이벤트] 주간 추천 유저</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script>
		window.onload = function() {

			var dataPoints = [];
			var test = [];

			var chart = new CanvasJS.Chart(
					"chartContainer",
					{
						animationEnabled : true,
						theme : "light2", // "light1", "light2", "dark1", "dark2"
						exportEnabled : true,
						title : {
							text : "Netflix Stock Price in 2016"
						},
						subtitles : [ {
							text : "Weekly Averages"
						} ],
						axisX : {
							interval : 1,
							valueFormatString : "mm"
						},
						axisY : {
							includeZero : false,
							prefix : "",
							title : "Price"
						},
						toolTip : {
							content : "Date: {z}<br /><strong>Price:</strong><br />시초가: {y[0]}, 종가: {y[3]}<br />고가: {y[1]}, 저가: {y[2]}"
						},
						data : [ {
							type : "candlestick",
							yValueFormatString : "##0원",
							dataPoints : dataPoints
						} ]
					});

			$.get("/resources/testmin.csv", getDataPointsFromCSV);

			function getDataPointsFromCSV(csv) {

				var csvLines = points = [];
				csvLines = csv.split(/[\r?\n|\r|\n]+/);
				for (var i = 1; i < csvLines.length; i++) {
					if (csvLines[i].length > 0) {
						points = csvLines[i].split(",");
						dataPoints.push({
							x : new Date(parseInt(points[0].substring(0, 4)),
									parseInt(points[0].substring(4, 6)),
									parseInt(points[0].substring(6, 8)),
									parseInt(points[1].substring(0, 2)),
									parseInt(points[1].substring(2, 4))

							),
							y : [ parseFloat(points[2]), parseFloat(points[3]),
									parseFloat(points[4]),
									parseFloat(points[5]) ],
							z : points[0].substring(0, 4) + '-'
									+ points[0].substring(4, 6) + '-'
									+ points[0].substring(6, 8) + " "
									+ points[1].substring(0, 2) + ":"
									+ points[1].substring(2, 4)
						});
					}
				}
				chart.render();
			}

		}
	</script>
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