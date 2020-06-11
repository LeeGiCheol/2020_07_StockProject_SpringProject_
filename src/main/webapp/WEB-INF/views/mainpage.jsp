<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>mainpage</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="/resources/css/mainpage.css">
<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<style type="text/css">
.containerNew {
    position: relative;
    max-width: 1260px;
    height: 100%;
    padding: 20px 0 0 0;
    margin: 0 auto;
}
@media only screen and (max-width: 979px){
.containerNew {
    padding: 0;
}
}
</style>
</head>
<body>
	<%@include file="mainheader.jsp"%>
	<!-- 전체메뉴 백그라운드-->
	<div class="all-dim"></div>

	<div class="containerNew">
		
		<div class="row">
			<div class="col-md-9">

			KOSPI: ${current/100 } 
			<!-- 현재 코스피 주가지수 -->
				<div class="chartdata">
				</div>

				<div class="stock-ranking">
					<nav>
						<div class="nav nav-tabs" role="tablist">
							<a class="nav-item">TOP 종목</a> <a class="nav-item">인기 검색 종목</a>
						</div>
					</nav>
					<div class="tab-content">

						<div class=".tab-pane" id="tab1">
							<table class="tbl_home_left">
								<colgroup>
									<col width="45%">
									<col width="25%">
									<col width="30%">
								</colgroup>
								<tbody class="rank-table" id="topRank">

								</tbody>


							</table>

						</div>

						<div class=".tab-pane" id="tab2">
							<table class="tbl_home_right">
								<colgroup>
									<col width="45%">
									<col width="25%">
									<col width="30%">
								</colgroup>
								<tbody class="rank-table" id="searchRank">

								</tbody>


							</table>

						</div>




					</div>
				</div>

				<div class="community">
					<div class="community-best">
						<nav>
							<div class="nav nav-tabs" role="tablist">
								<a class="nav-item">커뮤니티 베스트</a>
								<button type="button" class="btn btn-secondary btn-sm plus" onclick="location.href='/board/free?orderby=best'">더보기</button>
							</div>
						</nav>
						<div class="tab-content">
							<div class=".tab-pane" id="tab1">
								<ul class="step1">
									<c:forEach var="bestBoardList" items="${bestBoardList}">
										<li id="test_1"><a href="/board/free/detail?pno=${bestBoardList.pno}">${bestBoardList.title}</a>
											<p class="nickname">${bestBoardList.nickname}</p></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>


					<div class="community-new">
						<nav>
							<div class="nav nav-tabs" role="tablist">
								<a class="nav-item">신규 글</a>
								<button type="button" class="btn btn-secondary btn-sm plus" onclick="location.href='/board/free'">더보기</button>
							</div>
						</nav>
						<div class="tab-content">
							<div class=".tab-pane" id="tab1">
								<ul class="step1">
									<c:forEach var="newBoardList" items="${newBoardList}">
										<li id="test_1"><a href="/board/free/detail?pno=${newBoardList.pno}">${newBoardList.title}</a>
											<p class="nickname">${newBoardList.nickname}</p></li>
									</c:forEach>
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

				<c:choose>
					<c:when test="${loginUser eq null}">
						<div class="login-box">
							<div class="div-login-box">
								<form method='post' action="#">
									<fieldset>
										<div class="chk">
											<input type="checkbox" name="sID" id="check-id">
											<label for="check-id">아이디 저장</label>
											<input type="checkbox" name="autoLogin" onClick="" id="check-log">
											<label for="check-log">자동로그인</label>
										</div>
										<p>
											<input type="text" name="custId" value="" id="user_id" title="아이디 입력" placeholder="아이디">
											<input type="password" name="passwd" value="" id="user_pw" title="비밀번호 입력" placeholder="비밀번호"> 
											<input type="submit" value="로그인" onclick="">	
										</p>
									</fieldset>
								</form>
								<p>
									<a href="/signUpPage">회원가입</a>
									<span><a href="/forgetId" class="idforgot">아이디 찾기</a>
									<a href="/forgetPassword">비밀번호 찾기</a></span>
								    <span class="social-login"> 
								    <a href="#" class="social-type naver">네이버 로그인</a>
									<a href="#" class="social-type kakaotalk">카카오톡 로그인</a>
									<a href="#" class="social-type facebook">페이스북 로그인</a>
									<a href="#" class="social-type google">구글 로그인</a>
									</span>
								</p>
							</div>
						</div>
					</c:when>

					<c:otherwise>
						<div class="login-box">
							<div class="div-login-box-after" style class="login-out">
								<p class="proimg_div-after">
									<a href="/myPage01"><img class="" cust_id="" id="_myhomeId"
										src="/resources/img/pi_08.png"></a> <span id="_gnbBadge"><img
										class="current_badge_s"
										src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="></span>
								</p>
								<dl>
									<dt>
										<strong>${loginUser.nickname}</strong>님
										<button type="button" class="logout"
											onclick="location.href='/logOut';">로그아웃</button>
									</dt>
									<dd>
										<a href="/myPage01">내정보</a>
										<a href="mypageUpdatePassword">비밀번호 변경</a>
									</dd>
								</dl>
								<ul class="dot-list02 color-rightgray">
									<li id="_liBall">자산 <a href="/myPage02">0</a> 원</li>
									<li id="_liCyber">포인트 <a href="/myPage01">${loginUser.point}점</a></li>
								</ul>
							</div>
							<div class="login-after-btn">
								<a href="/myPage01">마이페이지</a> <a href="/myPage04">알림<span>N</span></a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>


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

	<%@include file="mainfooter.jsp"%>

	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	
	<script>
	$(document).ready(function(){
		
		function stockRanking(){
			$.ajax({
				type : "GET",
				url : '${pageContext.request.contextPath}/mainPage/stockRankAjax',
				datatype : "JSON",
				success : function(data) {
				
					// top 종목(상한가) 5개
					var topRank = "";
					var a = 1;
					
					for(var i=0; i<data.topName.length-1; i++){
						if(data.topName[i] != null){
							topRank += '<tr class="up">'
							topRank += '<th scope="row"><em>'+a+'</em>'
							topRank += 	'<a href="/trade?stockName='+data.topName[i]+'"'
							topRank += 	'onclick="clickcr(this, &quot;boa.list&quot;, &quot;007570&quot;, &quot;1&quot;, event);">'+data.topName[i]+'</a></th>'
							topRank += '<td>'+data.topCurrentPrice[i]+'</td>'
								topRank += '<td><em class="bu_p bu_pup2"><span class="blind">상한가</span></em>'
								topRank += 	'<span class="tah p11 red02">'+data.topBefore[i]+'</span></td>'
								topRank += '</tr>'
							a++
						}
					}
					$("#topRank").html(topRank);
					
					
					
					//인기검색종목 5개
					var searchRank = "";
					var a = 1;
					
					 for(var i=0; i<data.searchName.length; i++){
					     if(data.searchSangHa[i]=="up"){
					       searchRank += '<tr class="up">'
					     }
					     
					     else if(data.searchSangHa[i]=="down"){
					       searchRank += '<tr class="down">'
					     }
					     else if(data.searchSangHa[i]=='0'){
					       searchRank += '<tr class="same">'
					     }
					     searchRank += '<th scope="row"><em>'+a+'</em>'
					     
					     searchRank += 	'<a href="/trade?stockName='+data.searchName[i]+'">'+data.searchName[i]+'</a></th>'
					     searchRank += '<td>'+data.searchCurrentPrice[i]+'</td>'
					       
					     if(data.searchSangHa[i]=="up"){
					       searchRank += '<td><em class="bu_p bu_pup2"><span class="blind">상한가</span></em>'
					       searchRank += 	'<span class="tah p11 red02">'+data.searchUpDown[i]+'</span></td>'
					     }
					             
					     else if(data.searchSangHa[i]=="down"){
					       searchRank +=   '<td><em class="bu_p bu_pdn"><span class="blind">하락</span></em>'
					       searchRank +=     '<span class="tah p11 nv01">'+data.searchUpDown[i]+'</span></td>'
					     }
					     else if(data.searchSangHa[i]=='0'){
					       searchRank += '<td><span class="tah p11"> 0 </span></td>'
					     }
							searchRank += '</tr>'
						a++
					}
					$("#searchRank").html(searchRank);
					
					}
				})
		
			}stockRanking();
			
			
			timer = setInterval(function () {
				stockRanking();
			},5000)
			
//			<!-- 차트 자리 -->
			var day_d = [${day_d[0]}, ${day_d[1]}, ${day_d[2]}, ${day_d[3]}, ${day_d[4]}, ${day_d[5]}, ${day_d[6]}, ${day_d[7]}, ${day_d[8]}, ${day_d[9]}, ${day_d[10]}, ${day_d[11]}, ${day_d[12]}, ${day_d[13]}, ${day_d[14]}, ${day_d[15]}, ${day_d[16]}, ${day_d[17]}, ${day_d[18]}, ${day_d[19]}, ${day_d[20]}, ${day_d[21]}, ${day_d[22]}, ${day_d[23]}, ${day_d[24]}, ${day_d[25]}, ${day_d[26]}, ${day_d[27]}, ${day_d[28]}, ${day_d[29]}, ${day_d[30]}, ${day_d[31]}, ${day_d[32]}, ${day_d[33]}, ${day_d[34]}, ${day_d[35]}, ${day_d[36]}, ${day_d[37]}, ${day_d[38]}, ${day_d[39]}, ${day_d[40]}, ${day_d[41]}, ${day_d[42]}, ${day_d[43]}, ${day_d[44]}, ${day_d[45]}, ${day_d[46]}, ${day_d[47]}, ${day_d[48]}, ${day_d[49]}, ${day_d[50]}, ${day_d[51]}, ${day_d[52]}, ${day_d[53]}, ${day_d[54]}, ${day_d[55]}, ${day_d[56]}, ${day_d[57]}, ${day_d[58]}, ${day_d[59]}]; 
			var day_startprice = [${day_startprice[0]}, ${day_startprice[1]}, ${day_startprice[2]}, ${day_startprice[3]}, ${day_startprice[4]}, ${day_startprice[5]}, ${day_startprice[6]}, ${day_startprice[7]}, ${day_startprice[8]}, ${day_startprice[9]}, ${day_startprice[10]}, ${day_startprice[11]}, ${day_startprice[12]}, ${day_startprice[13]}, ${day_startprice[14]}, ${day_startprice[15]}, ${day_startprice[16]}, ${day_startprice[17]}, ${day_startprice[18]}, ${day_startprice[19]}, ${day_startprice[20]}, ${day_startprice[21]}, ${day_startprice[22]}, ${day_startprice[23]}, ${day_startprice[24]}, ${day_startprice[25]}, ${day_startprice[26]}, ${day_startprice[27]}, ${day_startprice[28]}, ${day_startprice[29]}, ${day_startprice[30]}, ${day_startprice[31]}, ${day_startprice[32]}, ${day_startprice[33]}, ${day_startprice[34]}, ${day_startprice[35]}, ${day_startprice[36]}, ${day_startprice[37]}, ${day_startprice[38]}, ${day_startprice[39]}, ${day_startprice[40]}, ${day_startprice[41]}, ${day_startprice[42]}, ${day_startprice[43]}, ${day_startprice[44]}, ${day_startprice[45]}, ${day_startprice[46]}, ${day_startprice[47]}, ${day_startprice[48]}, ${day_startprice[49]}, ${day_startprice[50]}, ${day_startprice[51]}, ${day_startprice[52]}, ${day_startprice[53]}, ${day_startprice[54]}, ${day_startprice[55]}, ${day_startprice[56]}, ${day_startprice[57]}, ${day_startprice[58]}, ${day_startprice[59]}];
   			var day_highprice = [${day_highprice[0]}, ${day_highprice[1]}, ${day_highprice[2]}, ${day_highprice[3]}, ${day_highprice[4]}, ${day_highprice[5]}, ${day_highprice[6]}, ${day_highprice[7]}, ${day_highprice[8]}, ${day_highprice[9]}, ${day_highprice[10]}, ${day_highprice[11]}, ${day_highprice[12]}, ${day_highprice[13]}, ${day_highprice[14]}, ${day_highprice[15]}, ${day_highprice[16]}, ${day_highprice[17]}, ${day_highprice[18]}, ${day_highprice[19]}, ${day_highprice[20]}, ${day_highprice[21]}, ${day_highprice[22]}, ${day_highprice[23]}, ${day_highprice[24]}, ${day_highprice[25]}, ${day_highprice[26]}, ${day_highprice[27]}, ${day_highprice[28]}, ${day_highprice[29]}, ${day_highprice[30]}, ${day_highprice[31]}, ${day_highprice[32]}, ${day_highprice[33]}, ${day_highprice[34]}, ${day_highprice[35]}, ${day_highprice[36]}, ${day_highprice[37]}, ${day_highprice[38]}, ${day_highprice[39]}, ${day_highprice[40]}, ${day_highprice[41]}, ${day_highprice[42]}, ${day_highprice[43]}, ${day_highprice[44]}, ${day_highprice[45]}, ${day_highprice[46]}, ${day_highprice[47]}, ${day_highprice[48]}, ${day_highprice[49]}, ${day_highprice[50]}, ${day_highprice[51]}, ${day_highprice[52]}, ${day_highprice[53]}, ${day_highprice[54]}, ${day_highprice[55]}, ${day_highprice[56]}, ${day_highprice[57]}, ${day_highprice[58]}, ${day_highprice[59]}];
   			var day_lowprice = [${day_lowprice[0]}, ${day_lowprice[1]}, ${day_lowprice[2]}, ${day_lowprice[3]}, ${day_lowprice[4]}, ${day_lowprice[5]}, ${day_lowprice[6]}, ${day_lowprice[7]}, ${day_lowprice[8]}, ${day_lowprice[9]}, ${day_lowprice[10]}, ${day_lowprice[11]}, ${day_lowprice[12]}, ${day_lowprice[13]}, ${day_lowprice[14]}, ${day_lowprice[15]}, ${day_lowprice[16]}, ${day_lowprice[17]}, ${day_lowprice[18]}, ${day_lowprice[19]}, ${day_lowprice[20]}, ${day_lowprice[21]}, ${day_lowprice[22]}, ${day_lowprice[23]}, ${day_lowprice[24]}, ${day_lowprice[25]}, ${day_lowprice[26]}, ${day_lowprice[27]}, ${day_lowprice[28]}, ${day_lowprice[29]}, ${day_lowprice[30]}, ${day_lowprice[31]}, ${day_lowprice[32]}, ${day_lowprice[33]}, ${day_lowprice[34]}, ${day_lowprice[35]}, ${day_lowprice[36]}, ${day_lowprice[37]}, ${day_lowprice[38]}, ${day_lowprice[39]}, ${day_lowprice[40]}, ${day_lowprice[41]}, ${day_lowprice[42]}, ${day_lowprice[43]}, ${day_lowprice[44]}, ${day_lowprice[45]}, ${day_lowprice[46]}, ${day_lowprice[47]}, ${day_lowprice[48]}, ${day_lowprice[49]}, ${day_lowprice[50]}, ${day_lowprice[51]}, ${day_lowprice[52]}, ${day_lowprice[53]}, ${day_lowprice[54]}, ${day_lowprice[55]}, ${day_lowprice[56]}, ${day_lowprice[57]}, ${day_lowprice[58]}, ${day_lowprice[59]}];
   			var day_lastprice = [${day_lastprice[0]}, ${day_lastprice[1]}, ${day_lastprice[2]}, ${day_lastprice[3]}, ${day_lastprice[4]}, ${day_lastprice[5]}, ${day_lastprice[6]}, ${day_lastprice[7]}, ${day_lastprice[8]}, ${day_lastprice[9]}, ${day_lastprice[10]}, ${day_lastprice[11]}, ${day_lastprice[12]}, ${day_lastprice[13]}, ${day_lastprice[14]}, ${day_lastprice[15]}, ${day_lastprice[16]}, ${day_lastprice[17]}, ${day_lastprice[18]}, ${day_lastprice[19]}, ${day_lastprice[20]}, ${day_lastprice[21]}, ${day_lastprice[22]}, ${day_lastprice[23]}, ${day_lastprice[24]}, ${day_lastprice[25]}, ${day_lastprice[26]}, ${day_lastprice[27]}, ${day_lastprice[28]}, ${day_lastprice[29]}, ${day_lastprice[30]}, ${day_lastprice[31]}, ${day_lastprice[32]}, ${day_lastprice[33]}, ${day_lastprice[34]}, ${day_lastprice[35]}, ${day_lastprice[36]}, ${day_lastprice[37]}, ${day_lastprice[38]}, ${day_lastprice[39]}, ${day_lastprice[40]}, ${day_lastprice[41]}, ${day_lastprice[42]}, ${day_lastprice[43]}, ${day_lastprice[44]}, ${day_lastprice[45]}, ${day_lastprice[46]}, ${day_lastprice[47]}, ${day_lastprice[48]}, ${day_lastprice[49]}, ${day_lastprice[50]}, ${day_lastprice[51]}, ${day_lastprice[52]}, ${day_lastprice[53]}, ${day_lastprice[54]}, ${day_lastprice[55]}, ${day_lastprice[56]}, ${day_lastprice[57]}, ${day_lastprice[58]}, ${day_lastprice[59]}];
			
   			var mainData = [];
   			for (var i = 0; i < 60; i++) {
   				mainData.push({
   			         x: new Date(
   			        		 parseInt(day_d[i]/10000),
   			                  parseInt(day_d[i]%10000/100)-1,
   			                  day_d[i]%100+1
   			                  ),
   			         y:  [ parseFloat(day_startprice[i]), parseFloat(day_highprice[i]),
   		                parseFloat(day_lowprice[i]),
   		                parseFloat(day_lastprice[i])/100 ]
   			     });
   			 }
   		    
   		    var options = {
   		   		
   		        series: [{
   		        	data: mainData
   		        }],
   		        chart: {
   		            type: 'candlestick',
   		            redrawOnParentResize: true,
   		            zoom: {
   		                enabled: false}
   		        },
   		        xaxis: {
   		            type: 'datetime',
   		            labels: {
   		                datetimeFormatter: {
   		                    year: 'yyyy',
   		                    month: 'MM/dd',
   		                    day: 'dd',
   		                    hour: 'HH:mm'
   		                }
   		            },
   		            tooltip: {
   		                formatter: function(val, opts) {
   		                  var st = new Date(val);
   		                  var mon = st.getMonth()+1;
   		                  var day = st.getDate()-1;
   		                  if(day == 0 ){
   		               	   day = 31;
   		               	   mon = mon-1;
   		                  }
   		                  var text = mon + "/" +day;
   		                  return text
   		                }
   		              }
   		        },
   		        yaxis: {labels: {
   				    formatter: function (value) {
   		  		      	value = parseInt(value);
   				    	return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   		  		    }
   		  		  },
   		            tooltip: {
   		                enabled: true
   		            }
   		        },
   		        
   		        plotOptions: {
   		       	 candlestick: {
   		       	        colors: {
   		       	          upward: '#FF0000',
   		       	          downward: '#5B5AFF'
   		       	        },
   		       	        wick: {
   		       	          useFillColor: true
   		       	        }
   		       	      }, 
   		       	 bar: {
   				          horizontal: false,
   				          startingShape: 'flat',
   				          endingShape: 'flat',
   				          columnWidth: '15%',
   				          barHeight: '70%',
   				          distributed: false,
   				          rangeBarOverlap: true,
   				          colors: {
   				              ranges: [{
   				                  from: 0,
   				                  to: 0,
   				                  color: undefined
   				              }],
   				              backgroundBarColors: [],
   				              backgroundBarOpacity: 1,
   				              backgroundBarRadius: 0,
   				          }
   				      }
   				  },
   				  tooltip: {
   					  custom: function({series, seriesIndex, dataPointIndex, w}) {
   		               
   					    return '<DIV style="height: auto; width: auto; padding:15px; /* background-color: rgba(249, 249, 249, 0.85); */ font-size: 16px;"><p>● 시가: '+mainData[dataPointIndex].y[0].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '</p><p>● 종가: ' + mainData[dataPointIndex].y[3].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ '</p><p style="color: #5B5AFF;">▼ 저가: ' + mainData[dataPointIndex].y[2].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ '</p><p style="color: #FF0000;">▲ 고가: ' + mainData[dataPointIndex].y[1].toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ '</p></DIV>'
   					  }
   					}
   				 
   		    };

   		    var chart = new ApexCharts(document.querySelector(".chartdata"), options);
   		    chart.render();
			
		});

</script>
</body>
</html>