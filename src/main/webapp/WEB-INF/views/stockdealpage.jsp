<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="/resources/css/stockdealpage.css">



<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.0/themes/humanity/jquery-ui.css" />
<script src="https://www.jsviews.com/download/jsrender.js"></script>
<script src="//cdn.syncfusion.com/js/assets/external/jsrender.min.js"></script>

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
				<form class="form-inline my-2 my-lg-0">
					<ul class="navbar-nav ml-auto">
						<input class="form-control mr-sm-2" type="search"
							placeholder="통합검색" aria-label="Search">
						<input class="btn btn-outline-secondary my-2 my-sm-0"
							type="submit">
						<i class="fas fa-search"></i>
						</input>
					</ul>
				</form>
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
					<li class="nav-item"><a class="nav-link" href="#">"${stockName}"거래</a></li>
					<li class="nav-item"><a class="nav-link" href="#">고객센터<span
							class="sr-only">(current)</span></a></li>
				</ul>
			</div>

		</nav>
		<!-- 메인 nav end -->
		<div id="carouselExampleControls" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href="#">[특징주]상보, 中희토류 전략무기화 가능성 상승에 대체제 부각 '강세'</a>
				</div>
				<div class="carousel-item">
					<a href="#">[특징주]상보, 中희토류 전략무기화 가능성 상승에 대체제 부각 '강세'</a>
				</div>
				<div class="carousel-item">
					<a href="#">[특징주]상보, 中희토류 전략무기화 가능성 상승에 대체제 부각 '강세'</a>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>

	<!-- 전체메뉴 백그라운드-->
	<div class="all-dim"></div>


	<div class="container">
		<div class="stock-deal">
			<div class="stock-deal-nav">거래</div>
			<div class="row">
				<div class="col-md-8">
					<div class="chartdata">
						<div class="chartdata-nav">
							<form action="/trade" id="searchForm"
								class="form-inline my-2 my-lg-0 chartdata-form" method="GET">
								<input class="form-control mr-sm-2 stock-search-input"
									type="search" placeholder="통합검색" id="stockSearch"
									aria-label="Search" name="stockName">
								<button
									class="btn btn-outline-secondary my-2 my-sm-0 stock-search-btn"
									id="stockBtn" type="submit"><i class="fas fa-search"></i></button>
								<button type="button"
									class="btn btn-secondary btn-sm companydata-btn ">기업정보
								</button>
							</form>

						</div>
						<div class="chartdata-body">
							<div id="chartContainer"></div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="stock-price-chart">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th scope="col" colspan="3">현재가</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td>호가</td>
									<td></td>
								</tr>
								<tr>
									<td>상한가</td>
									<td>12,550</td>
									<td></td>
								</tr>
								<tr>
									<td rowspan="5"></td>
									<td>9,830</td>
									<td></td>
								</tr>
								<tr>
									<td>9,820</td>
									<td></td>
								</tr>
								<tr>
									<td>9,810</td>
									<td></td>
								</tr>
								<tr>
									<td>9,800</td>
									<td></td>
								</tr>
								<tr>
									<td>9,790</td>
									<td></td>
								</tr>
								<tr>
									<td>현재가</td>
									<td id="price"></td>
									<td id="beforeAndUpdown"></td>
								</tr>
								<tr>
									<td rowspan="5"></td>
									<td>9,770</td>
									<td></td>
								</tr>
								<tr>
									<td>9,760</td>
									<td></td>
								</tr>
								<tr>
									<td>9,750</td>
									<td></td>
								</tr>
								<tr>
									<td>9,740</td>
									<td></td>
								</tr>
								<tr>
									<td>9,730</td>
									<td></td>
								</tr>
								<tr>
									<td>하한가</td>
									<td>6,790</td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="stock-deal-control">
						<div class="stock-deal-control-nav">
							<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
								<li class="nav-item" role="presentation"><a
									class="nav-link active" id="pills-home-tab" data-toggle="pill"
									href="#pills-home" role="tab" aria-controls="pills-home"
									aria-selected="true">매수</a></li>
								<li class="nav-item" role="presentation"><a
									class="nav-link" id="pills-profile-tab" data-toggle="pill"
									href="#pills-profile" role="tab" aria-controls="pills-profile"
									aria-selected="false">매도</a></li>
								<li class="nav-item" role="presentation"><a
									class="nav-link" id="pills-contact-tab" data-toggle="pill"
									href="#pills-contact" role="tab" aria-controls="pills-contact"
									aria-selected="false">정정/취소</a></li>
							</ul>
						</div>
						<div class="tab-content stock-deal-control-body"
							id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-home"
								role="tabpanel" aria-labelledby="pills-home-tab">
								<form id="trad_frm" method="post">
									<div class="stock-buying">
										<div class="input-area">
											<div class="detail unit-price">
												<label for="nOrdUnpr">단가</label> <input type="text"
													class="alignR"> 원 <span class="buying-check">
													<a href="#" onclick="#"
													class="buying-check-btn btnStyle btnS">매수가능</a>
												</span>
											</div>
											<div class="detail unit-price">
												<label for="nOrdUnpr">수량</label> <input type="text"
													class="alignR"> 주 <span class="buying-check">
													<a href="#" onclick="#"
													class="buying-check-btn btnStyle btnS btnSum">10주</a> <a
													href="#" onclick="#"
													class="buying-check-btn btnStyle btnS btnSum">100주</a> <a
													href="#" onclick="#"
													class="buying-check-btn btnStyle btnS btnSum">최대</a>
												</span>
											</div>
										</div>
										<div class="sumArea">
											<span class="text"> <em>총주문금액 :</em> <strong
												class="sum">0</strong> <strong> <span>원</span>
											</strong> (수수료 미포함)
											</span>
										</div>
									</div>
									<button style="width: 100%; height: auto;">매수주문</button>
								</form>
								<div class="tableDesc">
									<ul class="dotList">
										<li>정규시장 주문시간 안내 : 08:20~15:30</li>
										<li>시간외종가 주문시간 안내 : 장 개시 전 종가 – 08:30~08:40 / 장 마감 후 종가 –
											15:40~16:00</li>
										<li>ELW 종목은 시간외 거래 불가</li>
									</ul>
								</div>
							</div>

							<div class="tab-pane fade" id="pills-profile" role="tabpanel"
								aria-labelledby="pills-profile-tab">
								<form id="trad_frm" method="post">
									<div class="stock-buying">
										<div class="input-area">
											<div class="detail unit-price">
												<label for="nOrdUnpr">단가</label> <input type="text"
													class="alignR"> 원 <span class="buying-check">
													<a href="#" onclick="#"
													class="buying-check-btn btnStyle btnS">매도가능</a>
												</span>
											</div>
											<div class="detail unit-price">
												<label for="nOrdUnpr">수량</label> <input type="text"
													class="alignR"> 주 <span class="buying-check">
													<a href="#" onclick="#"
													class="buying-check-btn btnStyle btnS btnSum">10주</a> <a
													href="#" onclick="#"
													class="buying-check-btn btnStyle btnS btnSum">100주</a> <a
													href="#" onclick="#"
													class="buying-check-btn btnStyle btnS btnSum">최대</a>
												</span>
											</div>
										</div>
										<div class="sumArea">
											<span class="text"> <em>총주문금액 :</em> <strong
												class="sum">0</strong> <strong> <span>원</span>
											</strong> (수수료 미포함)
											</span>
										</div>
									</div>
									<button style="width: 100%; height: auto;">매도주문</button>
								</form>
								<div class="tableDesc">
									<ul class="dotList">
										<li>정규시장 주문시간 안내 : 08:20~15:30</li>
										<li>시간외종가 주문시간 안내 : 장 개시 전 종가 – 08:30~08:40 / 장 마감 후 종가 –
											15:40~16:00</li>
										<li>ELW 종목은 시간외 거래 불가</li>
									</ul>
								</div>
							</div>
							<div class="tab-pane fade" id="pills-contact" role="tabpanel"
								aria-labelledby="pills-contact-tab">
								<form id="trad_frm" method="post">
									<div class="stock-buying">
										<div class="choice">
											<strong>주문구분</strong> <input type="radio" id="radio_modify"
												checked="checked"> <label for="radio_modify">정정</label>
											<input type="radio" id="radio_cancle" checked="checked">
											<label for="radio_cancle">취소</label>
										</div>
										<div class="input-area">
											<div class="detail unit-price">
												<label for="nOrdUnpr" style="margin: -2px 6px 0 0;">주문번호</label>
												<input type="text" class="alignR"> <span
													class="buying-check"> <a href="#" onclick="#"
													class="buying-check-btn btnStyle btnS">미체결잔량</a>
												</span>
											</div>
											<div class="detail unit-price">
												<label for="nOrdUnpr" style="margin-right: 35px;">단가</label>
												<input type="text" class="alignR"> 원
											</div>
											<div class="detail unit-price">
												<label for="nOrdUnpr" style="margin-right: 35px;">수량</label>
												<input type="text" class="alignR"> 주

											</div>
										</div>
										<div class="sumArea">
											<span class="text"> <em>총주문금액 :</em> <strong
												class="sum">0</strong> <strong> <span>원</span>
											</strong> (수수료 미포함)
											</span>
										</div>
									</div>
									<button style="width: 100%; height: auto;">정정주문</button>
								</form>
								<div class="tableDesc">
									<ul class="dotList">
										<li>정규시장 주문시간 안내 : 08:20~15:30</li>
										<li>시간외종가 주문시간 안내 : 장 개시 전 종가 – 08:30~08:40 / 장 마감 후 종가 –
											15:40~16:00</li>
										<li>ELW 종목은 시간외 거래 불가</li>
									</ul>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">		
	
	
		
	var stockName = "${stockName}";
	if(stockName === ''){
		stockName = '삼성전자';
	}
		
		
    //console.log("지발"+stockName);
	$("#stockBtn").click(function(){
		stockName = document.all.searchForm.stockSearch.value;
		//console.log("check" + stockName);
	});
	
	$(function() {
		var obj = new Object();
		var jsonData = JSON.stringify(obj);
		
	   
		timer = setInterval( function () {
			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}/Final_Project/trade/search?stockName='+stockName,
				/* data : JSON.stringify(jsonData),  */
				datatype : "JSON",
				success : function(data) {
					//console.log("현재가 = "+JSON.stringify(data.currentPrice));
					//console.log("전일비 + 등락률 = "+JSON.stringify(data.before + data.updown));
					
					//console.log(stockName);
					$('#price').text(data.currentPrice);
					$('#beforeAndUpdown').html(data.before + " , " + data.updown);
				},
				error : function(error) {
					console.log("error");
				}
			}); 
		
		}, 5000); // SET INTERVAL5
	});

	
	
	
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
							text : stockName
						},
						subtitles : [ {
							text : "minute"
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
			
			$.get("/resources/chart/"+stockName+".csv", getDataPointsFromCSV);
			
			function getDataPointsFromCSV(csv) {

				var csvLines = points = [];
				csvLines = csv.split(/[\r?\n|\r|\n]+/);
				for (var i = 1; i < csvLines.length; i++) {
					
					if (csvLines[i].length > 0) {
						points = csvLines[i].split(",");
						if(points[1].substring(0, 1) == '9'){
							points[1] = "09";
						}
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

</body>
</html>