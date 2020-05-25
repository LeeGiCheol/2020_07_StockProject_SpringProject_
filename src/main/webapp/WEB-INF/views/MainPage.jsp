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
<link rel="stylesheet" href="/resources/css/mainpage.css">
</head>
<body>
	<div class="header">
		<!-- 상단  nav -->
		<ul class="nav justify-content-end top-nav">
			<li class="breadcrumb-item"><a id="top-nav-font" href="#">로그인</a></li>
			<li class="breadcrumb-item"><a id="top-nav-font" href="#">회원가입</a></li>
		</ul>
		<ul class="nav justify-content-end top-nav">
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
										src="img/20200522_16726299.jpg">
								</span>
									<p>
										<strong>코스닥 외국인 순매수,도 상위20종목</strong> <span> 코스닥 외국인
											순매수 상위종목(금액기준) 순위 종목명 금액(억원) 1 에코프로비엠(247540) 135.97 2
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

			<div class="col-md-3">
				<div class="login-box">
					<div class="div-login-box">
						<form method='post' action="#">
							<fieldset>
								<div class="chk">
									<input type="checkbox" name="sID" id="check-id"><label
										for="check-id">아이디 저장</label> <input type="checkbox"
										name="autoLogin" onClick="" id="check-log"><label
										for="check-log">자동로그인</label>
								</div>
								<p>
									<input type="text" name="custId" value="" id="user_id"
										title="아이디 입력" placeholder="아이디"> <input
										type="password" name="passwd" value="" id="user_pw"
										title="비밀번호 입력" placeholder="비밀번호"> <input
										type="button" value="로그인" onclick="">
								</p>
							</fieldset>
						</form>
						<p>
							<a href="#">회원가입</a><span><a href="#">아이디</a>/<a href="#">비밀번호
									찾기</a></span> <span class="social-login"> <a href="#"
								class="social-type naver">네이버 로그인</a> <a href="#"
								class="social-type kakaotalk">카카오톡 로그인</a> <a href="#"
								class="social-type facebook">페이스북 로그인</a> <a href="#"
								class="social-type google">구글 로그인</a>
							</span>
						</p>
					</div>
				</div>

				<div class="login-box">
					<div class="div-login-box-after" style class="login-out">
						<p class="proimg_div-after">
							<a href="#"><img class="" cust_id="" id="_myhomeId"
								src="img/pi_08.png"></a> <span id="_gnbBadge"><img
								class="current_badge_s"
								src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="></span>
						</p>
						<dl>
							<dt>
								<strong>개미굴</strong>님
								<button type="button" class="logout"
									onclick="location.href='https://member.paxnet.co.kr/rpan/member/logout';">로그아웃</button>
							</dt>
							<dd>
								<a href="https://member.paxnet.co.kr/rpan/member/info/userInfo">내정보</a>
								<a
									href="https://member.paxnet.co.kr/rpan/member/searchPwd/changePswd">비밀번호
									변경</a>
							</dd>
						</dl>
						<ul class="dot-list02 color-rightgray">
							<li id="_liBall">자산 <a href="#">0</a> 원
							</li>
							<li id="_liCyber">포인트 <a href="#">0</a></li>
						</ul>
						<div>
							<a href="http://www.paxnet.co.kr/my/home">MyPage</a> <a
								href="http://www.paxnet.co.kr/pro/cafeHome/main/myCafe">알림</a>
						</div>
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

			$.get("testmin.csv", getDataPointsFromCSV);

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