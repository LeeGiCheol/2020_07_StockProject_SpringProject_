<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
<style type="text/css">
.containerNew {
    position: relative;
    max-width: 1260px;
    height: 100%;
    padding: 20px 0 0 0;
    margin: 0 auto;
}
.btnOverInfo {
float:left;
    font-size: 28px;
    font-weight: 500;
    line-height: 28px;
    color: #333;
}
#nowStock {
    margin-left: 10px;
    padding: 0;
        font-size: 25px;
    color: #1a64d2 !important;
}
@media only screen and (max-width: 979px){
.containerNew {
    padding: 0;
}
}
.refresh {
position:relative;
    float: left;
    margin-left: 5px;
    font-size: 12px;
    font-weight: 600;
    padding-top: 5px;
    color: #333;
    top: 7px;
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
			<!-- 현재 코스피 주가지수 -->
					<div class="chartdata-1">
						<div class="chartdata-body">
						<div class="chartdate-nav">
							<h3 class="btnOverInfo" id="h3_stockName">KOSPI<span id="nowStock">${current_kospi/100 } ${(kospi_lastprice[0]-kospi_lastprice[1])/100} ${fn:substring((kospi_lastprice[0]-kospi_lastprice[1])/kospi_lastprice[1]*100,0,5) }%</span></h3>
							
						</div>
						<div id="chartcontainer"></div>
						</div>
					</div>
					<div class="chartdata-2">
						<div class="chartdata-body">
						<div class="chartdate-nav">
							<h3 class="btnOverInfo" id="h3_stockName">KOSDAQ<span id="nowStock">${current_kosdaq/100 } ${(kosdaq_lastprice[0]-kosdaq_lastprice[1])/100} ${fn:substring((kosdaq_lastprice[0]-kosdaq_lastprice[1])/kosdaq_lastprice[1]*100,0,5) }%</span></h3>
							
						</div>
						<div id="chartcontainer2"></div>
						</div>
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
					<c:when test="${loginUser eq null and naverLoginUser eq null}">
						<div class="login-box">
							<div class="div-login-box">
								<form method='post' action="/signIn">
									<fieldset>
										<div class="chk">
											<input type="checkbox" name="sID" id="check-id">
											<label for="check-id">아이디 저장</label>
											<input type="checkbox" name="autoLogin" onClick="" id="check-log">
											<label for="check-log">자동로그인</label>
										</div>
										<p>
											<input type="text" name="id" value="" id="user_id" title="아이디 입력" placeholder="아이디">
											<input type="password" name="pw" value="" id="user_pw" title="비밀번호 입력" placeholder="비밀번호"> 
											<input type="submit" value="로그인" onclick="">	
										</p>
									</fieldset>
								</form>
								<p>
									<a href="/signUpPage/1">회원가입</a>
									<span><a href="/forgetId" class="idforgot">아이디 찾기</a>
									<a href="/forgetPassword">비밀번호 찾기</a></span>
								    <span class="social-login"> 
								    <a href="/naverLogin" class="social-type naver">네이버 로그인</a>
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
										<c:choose>
										<c:when test="${loginUser.nickname ne null}"><strong>${loginUser.nickname}</strong>　님 </c:when>
										<c:when test="${naverLoginUser ne null}"><strong>${naverLoginUser}</strong>　님</c:when>
										</c:choose>
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
								<a href="/myPage01">마이페이지</a> <a href="/myPage04">알림<span id="noticeMain"></span></a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
					<script type="text/javascript">
		$(function() {
		var obj = new Object();
		var jsonData = JSON.stringify(obj);
		timer = setInterval( function () {
			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}/notice/json',
			 	/* data : JSON.stringify(jsonData),  */
				datatype : "JSON",
				success : function(data) {
					if(data=='NOTICE')
						$('#noticeMain').text('NEW');
					else $('#noticeMain').text('');
					}	
				}); 
			}, 1000); // SET INTERVAL5
		});
		</script>


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
								topRank += 	'<span>'+data.topBefore[i]+'</span></td>'
								topRank += 	'<td><span class="tah p11 red02">'+'+'+data.topUpDown[i].substring(1)+'</span></td>'
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
					       searchRank += 	'<span>'+data.topBefore[i]+'</span></td>'
					       searchRank += 	'<td><span class="tah p11 red02">'+'+'+data.searchUpDown[i].substring(1)+'</span></td>'
					     }
					             
					     else if(data.searchSangHa[i]=="down"){
					       searchRank +=   '<td><em class="bu_p bu_pdn"><span class="blind">하락</span></em>'
					       searchRank += 	'<span>'+data.topBefore[i]+'</span></td>'
					       searchRank +=     '<td><span class="tah p11 nv01">'+'-'+data.searchUpDown[i].substring(1)+'</span></td>'
					     }
					     else if(data.searchSangHa[i]=='0'){
					       searchRank += '<td><span class="tah p11"> 0 </span></td>'
					       searchRank += 	'<td><span>'+data.topBefore[i]+'</span></td>'
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
			var kospi_d = [${kospi_d[0]}, ${kospi_d[1]}, ${kospi_d[2]}, ${kospi_d[3]}, ${kospi_d[4]}, ${kospi_d[5]}, ${kospi_d[6]}, ${kospi_d[7]}, ${kospi_d[8]}, ${kospi_d[9]}, ${kospi_d[10]}, ${kospi_d[11]}, ${kospi_d[12]}, ${kospi_d[13]}, ${kospi_d[14]}, ${kospi_d[15]}, ${kospi_d[16]}, ${kospi_d[17]}, ${kospi_d[18]}, ${kospi_d[19]}, ${kospi_d[20]}, ${kospi_d[21]}, ${kospi_d[22]}, ${kospi_d[23]}, ${kospi_d[24]}, ${kospi_d[25]}, ${kospi_d[26]}, ${kospi_d[27]}, ${kospi_d[28]}, ${kospi_d[29]}, ${kospi_d[30]}, ${kospi_d[31]}, ${kospi_d[32]}, ${kospi_d[33]}, ${kospi_d[34]}, ${kospi_d[35]}, ${kospi_d[36]}, ${kospi_d[37]}, ${kospi_d[38]}, ${kospi_d[39]}, ${kospi_d[40]}, ${kospi_d[41]}, ${kospi_d[42]}, ${kospi_d[43]}, ${kospi_d[44]}, ${kospi_d[45]}, ${kospi_d[46]}, ${kospi_d[47]}, ${kospi_d[48]}, ${kospi_d[49]}, ${kospi_d[50]}, ${kospi_d[51]}, ${kospi_d[52]}, ${kospi_d[53]}, ${kospi_d[54]}, ${kospi_d[55]}, ${kospi_d[56]}, ${kospi_d[57]}, ${kospi_d[58]}, ${kospi_d[59]}]; 
			var kospi_startprice = [${kospi_startprice[0]}, ${kospi_startprice[1]}, ${kospi_startprice[2]}, ${kospi_startprice[3]}, ${kospi_startprice[4]}, ${kospi_startprice[5]}, ${kospi_startprice[6]}, ${kospi_startprice[7]}, ${kospi_startprice[8]}, ${kospi_startprice[9]}, ${kospi_startprice[10]}, ${kospi_startprice[11]}, ${kospi_startprice[12]}, ${kospi_startprice[13]}, ${kospi_startprice[14]}, ${kospi_startprice[15]}, ${kospi_startprice[16]}, ${kospi_startprice[17]}, ${kospi_startprice[18]}, ${kospi_startprice[19]}, ${kospi_startprice[20]}, ${kospi_startprice[21]}, ${kospi_startprice[22]}, ${kospi_startprice[23]}, ${kospi_startprice[24]}, ${kospi_startprice[25]}, ${kospi_startprice[26]}, ${kospi_startprice[27]}, ${kospi_startprice[28]}, ${kospi_startprice[29]}, ${kospi_startprice[30]}, ${kospi_startprice[31]}, ${kospi_startprice[32]}, ${kospi_startprice[33]}, ${kospi_startprice[34]}, ${kospi_startprice[35]}, ${kospi_startprice[36]}, ${kospi_startprice[37]}, ${kospi_startprice[38]}, ${kospi_startprice[39]}, ${kospi_startprice[40]}, ${kospi_startprice[41]}, ${kospi_startprice[42]}, ${kospi_startprice[43]}, ${kospi_startprice[44]}, ${kospi_startprice[45]}, ${kospi_startprice[46]}, ${kospi_startprice[47]}, ${kospi_startprice[48]}, ${kospi_startprice[49]}, ${kospi_startprice[50]}, ${kospi_startprice[51]}, ${kospi_startprice[52]}, ${kospi_startprice[53]}, ${kospi_startprice[54]}, ${kospi_startprice[55]}, ${kospi_startprice[56]}, ${kospi_startprice[57]}, ${kospi_startprice[58]}, ${kospi_startprice[59]}];
   			var kospi_highprice = [${kospi_highprice[0]}, ${kospi_highprice[1]}, ${kospi_highprice[2]}, ${kospi_highprice[3]}, ${kospi_highprice[4]}, ${kospi_highprice[5]}, ${kospi_highprice[6]}, ${kospi_highprice[7]}, ${kospi_highprice[8]}, ${kospi_highprice[9]}, ${kospi_highprice[10]}, ${kospi_highprice[11]}, ${kospi_highprice[12]}, ${kospi_highprice[13]}, ${kospi_highprice[14]}, ${kospi_highprice[15]}, ${kospi_highprice[16]}, ${kospi_highprice[17]}, ${kospi_highprice[18]}, ${kospi_highprice[19]}, ${kospi_highprice[20]}, ${kospi_highprice[21]}, ${kospi_highprice[22]}, ${kospi_highprice[23]}, ${kospi_highprice[24]}, ${kospi_highprice[25]}, ${kospi_highprice[26]}, ${kospi_highprice[27]}, ${kospi_highprice[28]}, ${kospi_highprice[29]}, ${kospi_highprice[30]}, ${kospi_highprice[31]}, ${kospi_highprice[32]}, ${kospi_highprice[33]}, ${kospi_highprice[34]}, ${kospi_highprice[35]}, ${kospi_highprice[36]}, ${kospi_highprice[37]}, ${kospi_highprice[38]}, ${kospi_highprice[39]}, ${kospi_highprice[40]}, ${kospi_highprice[41]}, ${kospi_highprice[42]}, ${kospi_highprice[43]}, ${kospi_highprice[44]}, ${kospi_highprice[45]}, ${kospi_highprice[46]}, ${kospi_highprice[47]}, ${kospi_highprice[48]}, ${kospi_highprice[49]}, ${kospi_highprice[50]}, ${kospi_highprice[51]}, ${kospi_highprice[52]}, ${kospi_highprice[53]}, ${kospi_highprice[54]}, ${kospi_highprice[55]}, ${kospi_highprice[56]}, ${kospi_highprice[57]}, ${kospi_highprice[58]}, ${kospi_highprice[59]}];
   			var kospi_lowprice = [${kospi_lowprice[0]}, ${kospi_lowprice[1]}, ${kospi_lowprice[2]}, ${kospi_lowprice[3]}, ${kospi_lowprice[4]}, ${kospi_lowprice[5]}, ${kospi_lowprice[6]}, ${kospi_lowprice[7]}, ${kospi_lowprice[8]}, ${kospi_lowprice[9]}, ${kospi_lowprice[10]}, ${kospi_lowprice[11]}, ${kospi_lowprice[12]}, ${kospi_lowprice[13]}, ${kospi_lowprice[14]}, ${kospi_lowprice[15]}, ${kospi_lowprice[16]}, ${kospi_lowprice[17]}, ${kospi_lowprice[18]}, ${kospi_lowprice[19]}, ${kospi_lowprice[20]}, ${kospi_lowprice[21]}, ${kospi_lowprice[22]}, ${kospi_lowprice[23]}, ${kospi_lowprice[24]}, ${kospi_lowprice[25]}, ${kospi_lowprice[26]}, ${kospi_lowprice[27]}, ${kospi_lowprice[28]}, ${kospi_lowprice[29]}, ${kospi_lowprice[30]}, ${kospi_lowprice[31]}, ${kospi_lowprice[32]}, ${kospi_lowprice[33]}, ${kospi_lowprice[34]}, ${kospi_lowprice[35]}, ${kospi_lowprice[36]}, ${kospi_lowprice[37]}, ${kospi_lowprice[38]}, ${kospi_lowprice[39]}, ${kospi_lowprice[40]}, ${kospi_lowprice[41]}, ${kospi_lowprice[42]}, ${kospi_lowprice[43]}, ${kospi_lowprice[44]}, ${kospi_lowprice[45]}, ${kospi_lowprice[46]}, ${kospi_lowprice[47]}, ${kospi_lowprice[48]}, ${kospi_lowprice[49]}, ${kospi_lowprice[50]}, ${kospi_lowprice[51]}, ${kospi_lowprice[52]}, ${kospi_lowprice[53]}, ${kospi_lowprice[54]}, ${kospi_lowprice[55]}, ${kospi_lowprice[56]}, ${kospi_lowprice[57]}, ${kospi_lowprice[58]}, ${kospi_lowprice[59]}];
   			var kospi_lastprice = [${kospi_lastprice[0]}, ${kospi_lastprice[1]}, ${kospi_lastprice[2]}, ${kospi_lastprice[3]}, ${kospi_lastprice[4]}, ${kospi_lastprice[5]}, ${kospi_lastprice[6]}, ${kospi_lastprice[7]}, ${kospi_lastprice[8]}, ${kospi_lastprice[9]}, ${kospi_lastprice[10]}, ${kospi_lastprice[11]}, ${kospi_lastprice[12]}, ${kospi_lastprice[13]}, ${kospi_lastprice[14]}, ${kospi_lastprice[15]}, ${kospi_lastprice[16]}, ${kospi_lastprice[17]}, ${kospi_lastprice[18]}, ${kospi_lastprice[19]}, ${kospi_lastprice[20]}, ${kospi_lastprice[21]}, ${kospi_lastprice[22]}, ${kospi_lastprice[23]}, ${kospi_lastprice[24]}, ${kospi_lastprice[25]}, ${kospi_lastprice[26]}, ${kospi_lastprice[27]}, ${kospi_lastprice[28]}, ${kospi_lastprice[29]}, ${kospi_lastprice[30]}, ${kospi_lastprice[31]}, ${kospi_lastprice[32]}, ${kospi_lastprice[33]}, ${kospi_lastprice[34]}, ${kospi_lastprice[35]}, ${kospi_lastprice[36]}, ${kospi_lastprice[37]}, ${kospi_lastprice[38]}, ${kospi_lastprice[39]}, ${kospi_lastprice[40]}, ${kospi_lastprice[41]}, ${kospi_lastprice[42]}, ${kospi_lastprice[43]}, ${kospi_lastprice[44]}, ${kospi_lastprice[45]}, ${kospi_lastprice[46]}, ${kospi_lastprice[47]}, ${kospi_lastprice[48]}, ${kospi_lastprice[49]}, ${kospi_lastprice[50]}, ${kospi_lastprice[51]}, ${kospi_lastprice[52]}, ${kospi_lastprice[53]}, ${kospi_lastprice[54]}, ${kospi_lastprice[55]}, ${kospi_lastprice[56]}, ${kospi_lastprice[57]}, ${kospi_lastprice[58]}, ${kospi_lastprice[59]}];
   			var mainData = [];
   			for (var i = 0; i < 60; i++) {
   				mainData.push({
   			         x: new Date(
   			        		 parseInt(kospi_d[i]/10000),
   			                  parseInt(kospi_d[i]%10000/100)-1,
   			               kospi_d[i]%100+1
   			                  ),
   			         y:  [ parseFloat(kospi_startprice[i]), parseFloat(kospi_highprice[i]),
   		                parseFloat(kospi_lowprice[i]),
   		                parseFloat(kospi_lastprice[i])/100 ]
   			     });
   			 }
   		    
   		    var options = {
   		   		
   		        series: [{
   		        	data: mainData
   		        }],
   		        chart: {
   		            type: 'candlestick',
   		            redrawOnParentResize: true,
   		        	 height: '300px',
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
   				          columnWidth: '12%',
   				          barHeight: '80%',
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

   		    var chart = new ApexCharts(document.querySelector("#chartcontainer"), options);
   		    chart.render();
   		    
   		    
   		 var kosdaq_d = [${kosdaq_d[0]}, ${kosdaq_d[1]}, ${kosdaq_d[2]}, ${kosdaq_d[3]}, ${kosdaq_d[4]}, ${kosdaq_d[5]}, ${kosdaq_d[6]}, ${kosdaq_d[7]}, ${kosdaq_d[8]}, ${kosdaq_d[9]}, ${kosdaq_d[10]}, ${kosdaq_d[11]}, ${kosdaq_d[12]}, ${kosdaq_d[13]}, ${kosdaq_d[14]}, ${kosdaq_d[15]}, ${kosdaq_d[16]}, ${kosdaq_d[17]}, ${kosdaq_d[18]}, ${kosdaq_d[19]}, ${kosdaq_d[20]}, ${kosdaq_d[21]}, ${kosdaq_d[22]}, ${kosdaq_d[23]}, ${kosdaq_d[24]}, ${kosdaq_d[25]}, ${kosdaq_d[26]}, ${kosdaq_d[27]}, ${kosdaq_d[28]}, ${kosdaq_d[29]}, ${kosdaq_d[30]}, ${kosdaq_d[31]}, ${kosdaq_d[32]}, ${kosdaq_d[33]}, ${kosdaq_d[34]}, ${kosdaq_d[35]}, ${kosdaq_d[36]}, ${kosdaq_d[37]}, ${kosdaq_d[38]}, ${kosdaq_d[39]}, ${kosdaq_d[40]}, ${kosdaq_d[41]}, ${kosdaq_d[42]}, ${kosdaq_d[43]}, ${kosdaq_d[44]}, ${kosdaq_d[45]}, ${kosdaq_d[46]}, ${kosdaq_d[47]}, ${kosdaq_d[48]}, ${kosdaq_d[49]}, ${kosdaq_d[50]}, ${kosdaq_d[51]}, ${kosdaq_d[52]}, ${kosdaq_d[53]}, ${kosdaq_d[54]}, ${kosdaq_d[55]}, ${kosdaq_d[56]}, ${kosdaq_d[57]}, ${kosdaq_d[58]}, ${kosdaq_d[59]}]; 
			var kosdaq_startprice = [${kosdaq_startprice[0]}, ${kosdaq_startprice[1]}, ${kosdaq_startprice[2]}, ${kosdaq_startprice[3]}, ${kosdaq_startprice[4]}, ${kosdaq_startprice[5]}, ${kosdaq_startprice[6]}, ${kosdaq_startprice[7]}, ${kosdaq_startprice[8]}, ${kosdaq_startprice[9]}, ${kosdaq_startprice[10]}, ${kosdaq_startprice[11]}, ${kosdaq_startprice[12]}, ${kosdaq_startprice[13]}, ${kosdaq_startprice[14]}, ${kosdaq_startprice[15]}, ${kosdaq_startprice[16]}, ${kosdaq_startprice[17]}, ${kosdaq_startprice[18]}, ${kosdaq_startprice[19]}, ${kosdaq_startprice[20]}, ${kosdaq_startprice[21]}, ${kosdaq_startprice[22]}, ${kosdaq_startprice[23]}, ${kosdaq_startprice[24]}, ${kosdaq_startprice[25]}, ${kosdaq_startprice[26]}, ${kosdaq_startprice[27]}, ${kosdaq_startprice[28]}, ${kosdaq_startprice[29]}, ${kosdaq_startprice[30]}, ${kosdaq_startprice[31]}, ${kosdaq_startprice[32]}, ${kosdaq_startprice[33]}, ${kosdaq_startprice[34]}, ${kosdaq_startprice[35]}, ${kosdaq_startprice[36]}, ${kosdaq_startprice[37]}, ${kosdaq_startprice[38]}, ${kosdaq_startprice[39]}, ${kosdaq_startprice[40]}, ${kosdaq_startprice[41]}, ${kosdaq_startprice[42]}, ${kosdaq_startprice[43]}, ${kosdaq_startprice[44]}, ${kosdaq_startprice[45]}, ${kosdaq_startprice[46]}, ${kosdaq_startprice[47]}, ${kosdaq_startprice[48]}, ${kosdaq_startprice[49]}, ${kosdaq_startprice[50]}, ${kosdaq_startprice[51]}, ${kosdaq_startprice[52]}, ${kosdaq_startprice[53]}, ${kosdaq_startprice[54]}, ${kosdaq_startprice[55]}, ${kosdaq_startprice[56]}, ${kosdaq_startprice[57]}, ${kosdaq_startprice[58]}, ${kosdaq_startprice[59]}];
			var kosdaq_highprice = [${kosdaq_highprice[0]}, ${kosdaq_highprice[1]}, ${kosdaq_highprice[2]}, ${kosdaq_highprice[3]}, ${kosdaq_highprice[4]}, ${kosdaq_highprice[5]}, ${kosdaq_highprice[6]}, ${kosdaq_highprice[7]}, ${kosdaq_highprice[8]}, ${kosdaq_highprice[9]}, ${kosdaq_highprice[10]}, ${kosdaq_highprice[11]}, ${kosdaq_highprice[12]}, ${kosdaq_highprice[13]}, ${kosdaq_highprice[14]}, ${kosdaq_highprice[15]}, ${kosdaq_highprice[16]}, ${kosdaq_highprice[17]}, ${kosdaq_highprice[18]}, ${kosdaq_highprice[19]}, ${kosdaq_highprice[20]}, ${kosdaq_highprice[21]}, ${kosdaq_highprice[22]}, ${kosdaq_highprice[23]}, ${kosdaq_highprice[24]}, ${kosdaq_highprice[25]}, ${kosdaq_highprice[26]}, ${kosdaq_highprice[27]}, ${kosdaq_highprice[28]}, ${kosdaq_highprice[29]}, ${kosdaq_highprice[30]}, ${kosdaq_highprice[31]}, ${kosdaq_highprice[32]}, ${kosdaq_highprice[33]}, ${kosdaq_highprice[34]}, ${kosdaq_highprice[35]}, ${kosdaq_highprice[36]}, ${kosdaq_highprice[37]}, ${kosdaq_highprice[38]}, ${kosdaq_highprice[39]}, ${kosdaq_highprice[40]}, ${kosdaq_highprice[41]}, ${kosdaq_highprice[42]}, ${kosdaq_highprice[43]}, ${kosdaq_highprice[44]}, ${kosdaq_highprice[45]}, ${kosdaq_highprice[46]}, ${kosdaq_highprice[47]}, ${kosdaq_highprice[48]}, ${kosdaq_highprice[49]}, ${kosdaq_highprice[50]}, ${kosdaq_highprice[51]}, ${kosdaq_highprice[52]}, ${kosdaq_highprice[53]}, ${kosdaq_highprice[54]}, ${kosdaq_highprice[55]}, ${kosdaq_highprice[56]}, ${kosdaq_highprice[57]}, ${kosdaq_highprice[58]}, ${kosdaq_highprice[59]}];
			var kosdaq_lowprice = [${kosdaq_lowprice[0]}, ${kosdaq_lowprice[1]}, ${kosdaq_lowprice[2]}, ${kosdaq_lowprice[3]}, ${kosdaq_lowprice[4]}, ${kosdaq_lowprice[5]}, ${kosdaq_lowprice[6]}, ${kosdaq_lowprice[7]}, ${kosdaq_lowprice[8]}, ${kosdaq_lowprice[9]}, ${kosdaq_lowprice[10]}, ${kosdaq_lowprice[11]}, ${kosdaq_lowprice[12]}, ${kosdaq_lowprice[13]}, ${kosdaq_lowprice[14]}, ${kosdaq_lowprice[15]}, ${kosdaq_lowprice[16]}, ${kosdaq_lowprice[17]}, ${kosdaq_lowprice[18]}, ${kosdaq_lowprice[19]}, ${kosdaq_lowprice[20]}, ${kosdaq_lowprice[21]}, ${kosdaq_lowprice[22]}, ${kosdaq_lowprice[23]}, ${kosdaq_lowprice[24]}, ${kosdaq_lowprice[25]}, ${kosdaq_lowprice[26]}, ${kosdaq_lowprice[27]}, ${kosdaq_lowprice[28]}, ${kosdaq_lowprice[29]}, ${kosdaq_lowprice[30]}, ${kosdaq_lowprice[31]}, ${kosdaq_lowprice[32]}, ${kosdaq_lowprice[33]}, ${kosdaq_lowprice[34]}, ${kosdaq_lowprice[35]}, ${kosdaq_lowprice[36]}, ${kosdaq_lowprice[37]}, ${kosdaq_lowprice[38]}, ${kosdaq_lowprice[39]}, ${kosdaq_lowprice[40]}, ${kosdaq_lowprice[41]}, ${kosdaq_lowprice[42]}, ${kosdaq_lowprice[43]}, ${kosdaq_lowprice[44]}, ${kosdaq_lowprice[45]}, ${kosdaq_lowprice[46]}, ${kosdaq_lowprice[47]}, ${kosdaq_lowprice[48]}, ${kosdaq_lowprice[49]}, ${kosdaq_lowprice[50]}, ${kosdaq_lowprice[51]}, ${kosdaq_lowprice[52]}, ${kosdaq_lowprice[53]}, ${kosdaq_lowprice[54]}, ${kosdaq_lowprice[55]}, ${kosdaq_lowprice[56]}, ${kosdaq_lowprice[57]}, ${kosdaq_lowprice[58]}, ${kosdaq_lowprice[59]}];
			var kosdaq_lastprice = [${kosdaq_lastprice[0]}, ${kosdaq_lastprice[1]}, ${kosdaq_lastprice[2]}, ${kosdaq_lastprice[3]}, ${kosdaq_lastprice[4]}, ${kosdaq_lastprice[5]}, ${kosdaq_lastprice[6]}, ${kosdaq_lastprice[7]}, ${kosdaq_lastprice[8]}, ${kosdaq_lastprice[9]}, ${kosdaq_lastprice[10]}, ${kosdaq_lastprice[11]}, ${kosdaq_lastprice[12]}, ${kosdaq_lastprice[13]}, ${kosdaq_lastprice[14]}, ${kosdaq_lastprice[15]}, ${kosdaq_lastprice[16]}, ${kosdaq_lastprice[17]}, ${kosdaq_lastprice[18]}, ${kosdaq_lastprice[19]}, ${kosdaq_lastprice[20]}, ${kosdaq_lastprice[21]}, ${kosdaq_lastprice[22]}, ${kosdaq_lastprice[23]}, ${kosdaq_lastprice[24]}, ${kosdaq_lastprice[25]}, ${kosdaq_lastprice[26]}, ${kosdaq_lastprice[27]}, ${kosdaq_lastprice[28]}, ${kosdaq_lastprice[29]}, ${kosdaq_lastprice[30]}, ${kosdaq_lastprice[31]}, ${kosdaq_lastprice[32]}, ${kosdaq_lastprice[33]}, ${kosdaq_lastprice[34]}, ${kosdaq_lastprice[35]}, ${kosdaq_lastprice[36]}, ${kosdaq_lastprice[37]}, ${kosdaq_lastprice[38]}, ${kosdaq_lastprice[39]}, ${kosdaq_lastprice[40]}, ${kosdaq_lastprice[41]}, ${kosdaq_lastprice[42]}, ${kosdaq_lastprice[43]}, ${kosdaq_lastprice[44]}, ${kosdaq_lastprice[45]}, ${kosdaq_lastprice[46]}, ${kosdaq_lastprice[47]}, ${kosdaq_lastprice[48]}, ${kosdaq_lastprice[49]}, ${kosdaq_lastprice[50]}, ${kosdaq_lastprice[51]}, ${kosdaq_lastprice[52]}, ${kosdaq_lastprice[53]}, ${kosdaq_lastprice[54]}, ${kosdaq_lastprice[55]}, ${kosdaq_lastprice[56]}, ${kosdaq_lastprice[57]}, ${kosdaq_lastprice[58]}, ${kosdaq_lastprice[59]}];
			var mainData = [];
			for (var i = 0; i < 60; i++) {
				mainData.push({
			         x: new Date(
			        		 parseInt(kosdaq_d[i]/10000),
			                  parseInt(kosdaq_d[i]%10000/100)-1,
			               kosdaq_d[i]%100+1
			                  ),
			         y:  [ parseFloat(kosdaq_startprice[i]), parseFloat(kosdaq_highprice[i]),
		                parseFloat(kosdaq_lowprice[i]),
		                parseFloat(kosdaq_lastprice[i])/100 ]
			     });
			 }
		    
		    var options = {
		   		
		        series: [{
		        	data: mainData
		        }],
		        chart: {
		            type: 'candlestick',
		            redrawOnParentResize: true,
		        	 height: '300px',
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
				          columnWidth: '12%',
				          barHeight: '80%',
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

		    var chart_kosdaq = new ApexCharts(document.querySelector("#chartcontainer2"), options);
		    chart_kosdaq.render();
		    
   		
		})
		
		
		

</script>
</body>
</html>