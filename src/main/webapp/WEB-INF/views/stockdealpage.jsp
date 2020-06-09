<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.0/themes/humanity/jquery-ui.css" />
<link rel="stylesheet" href="/resources/css/stockdealpage2.css">
<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://www.jsviews.com/download/jsrender.js"></script>
<script src="//cdn.syncfusion.com/js/assets/external/jsrender.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>

<style>
tr td button{
	background: transparent;
	border: none;
	margin: 0;
	padding: 0;
} 
</style>

<body>

	<%@include file="mainheader.jsp" %> 

	<!-- 전체메뉴 백그라운드-->
	<div class="all-dim"></div>
	<div class="containerNew">
		<div class="stock-deal">
			<div class="stock-deal-nav">거래</div>
			<div class="row">
			<div class="chartdata-nav">
							<form action="/trade" id="searchForm"
								class="form-inline chartdata-form" method="GET">
								<input class="form-control mr-sm-2 stock-search-input"
									type="search" placeholder="종목 검색" id="stockSearch"
									aria-label="Search" name="stockName">
								<button
									class="btn btn-outline-secondary stock-search-btn"
									id="stockBtn" type="submit">
									<i class="fas fa-search"></i>
								</button>
								<h3 class="btnOverInfo" id="h3_stockName">${stockName}</h3>
								<span id="nowStock"> </span>
						<div class="stock-deal-button">
								<button type="button"
									class="btn btn-secondary companydata-btn stock-btn"
									onclick="window.open('http://media.kisline.com/highlight/mainHighlight.nice?paper_stock=${stockCode}')">기업정보
								</button>
								<button type="button"
									class="btn btn-secondary companydata-btn stock-btn" id="minute">
									분차트보기</button>
								<button type="button"
									class="btn btn-secondary companydata-btn stock-btn" id="day">
									일차트보기</button>
								<button type="button"
									class="btn btn-secondary companydata-btn stock-btn" onclick="window.open('/trade_history?page=1','거래기록','width=500,height=600,location=no,status=no,scrollbars=yes');">
									거래 기록</button>
								<button type="button"
									class="btn btn-secondary companydata-btn stock-btn" onclick="window.open('/myStock?page=1','보유 주식','width=500,height=600,location=no,status=no,scrollbars=yes');">
									보유 종목</button>
								</div>
							</form>

						</div>
				<div class="col-md-9">
					<div class="chartdata">
						<div class="chartdata-body">
							<div id="chartcontainer"></div>
						</div>
					</div>
					<div class="aside_area aside_popular">
					
						<h3 class="h_popular-left">
							<span>TOP 종목</span>
						</h3>
						<h3 class="h_popular-right">
							<span>인기 검색 종목</span>
						</h3>
					
					<div class="table-body-left">
						<table class="tbl_home_left">
							<caption>
								인기 검색 종목표 <span>종목명에 대한 현재가,전일대비로 구분되어 있습니다.</span>
							</caption>
							<colgroup>
								<col width="40%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">구분</th>
									<th scope="col">현재가</th>
									<th scope="col">전일대비</th>
								</tr>
							</thead>
							<tbody id="topRank">
								
							</tbody>
						</table>
						</div>
						<div class="table-body-rigth">
						<table class="tbl_home_right">
							<caption>
								인기 검색 종목표 <span>종목명에 대한 현재가,전일대비로 구분되어 있습니다.</span>
							</caption>
							<colgroup>
								<col width="40%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">구분</th>
									<th scope="col">현재가</th>
									<th scope="col">전일대비</th>
								</tr>
							</thead>
							<tbody class="rank-table" id="searchRank">
								
							</tbody>
						</table>
						</div>
						<a href="/sise/lastsearch2.nhn" class="btn_more"
							onclick="clickcr(this, 'boa.more', '', '', event);"><em
							class="btn_more4"><span class="blind">인기 검색 종목 더보기</span></em></a>
					</div>
					<div class="stock-deal-control">
						<div class="stock-deal-control-nav">
							<ul class="nav stock-nav-tab" id="pills-tab" role="tablist">
								<li class="nav-item active" role="presentation"><a
									class="nav-link" id="pills-home-tab" data-toggle="pill"
									href="#pills-home" role="tab" aria-controls="pills-home"
									aria-selected="true">매수</a></li>
								<li class="nav-item" role="presentation"><a
									class="nav-link" id="pills-profile-tab" data-toggle="pill"
									href="#pills-profile" role="tab" aria-controls="pills-profile"
									aria-selected="false">매도</a></li>
								<li class="nav-item nav-item-last" role="presentation"><a
									class="nav-link" id="pills-contact-tab" data-toggle="pill"
									href="#pills-contact" role="tab" aria-controls="pills-contact"
									aria-selected="false">정정/취소</a></li>
							</ul>
						</div>
						<div class="tab-content stock-deal-control-body"
							id="pills-tabContent">
							<div class="tab-pane fade show active" id="pills-home"
								role="tabpanel" aria-labelledby="pills-home-tab">
								<form id="trad_frm" action="/buying" method="post">
									<div class="stock-buying">
										<div class="input-area">
											<div class="detail unit-price">
												<label for="nOrdUnpr" style="margin-right: 14px;">단가</label><span data-tooltip-text="호가 클릭 시 단가가 입력 됩니다."><input type="text"
													class="alignR" id="buying_price" name="buyingPrice"
													readOnly></span> 원 <span class="buying-check"> <a
													class="buying-check-btn btnStyle btnS buying-checking">매수가능</a>
													<script>
												$(document).ready(function() {
													  $(".popClose, .nav-item").click(function(){
													    $(".layerPopup").hide();
													  });
													  $(".buying-checking").click(function(){
													    $(".layerPopup").show();
													  });
													  $(".popClose, .nav-item").click(function(){
														    $(".layerPopup-buying-cancel").hide();
														  });
														  $(".buying-cancel").click(function(){
														    $(".layerPopup-buying-cancel").show();
														  });
													  $("input:text[numberOnly]").on("keyup", function() {
														    $(this).val($(this).val().replace(/[^0-9]/g,""));
														});
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
															});
														});
													});
												</script>
													<div class="layerPopup" style="display: none;">
														<div class="layerBox layerStock" id="poplayer_possible"
															style="display: block;">
															<h1>매수가능</h1>
															<!-- conSection -->
															<div class="conSection">
																<!-- 조회 -->
																<div class="stockBox">
																	<fieldset>

																		<table>
																			<colgroup>
																				<col width="12%">
																				<col width="40%">
																				<col width="10%">
																				<col>
																			</colgroup>
																			<tbody>
																				<tr>
																					<td class="title"><span>종목명</span></td>
																					<td><div class="tdArea">${stockName }</div></td>
																				</tr>
																			</tbody>
																		</table>
																	</fieldset>
																</div>
																<!-- //조회 -->

																<table class="tableDefault tableRow tableSmall">
																	<colgroup>
																		<col width="20%">
																		<col>
																		<col width="20%">
																		<col width="30%">
																	</colgroup>
																	<tbody>
																		<tr>
																			<td class="title"><span>보유 금액</span></td>
																			<td><div class="tdArea">${money }</div></td>
																		</tr>
																	</tbody>
																</table>
															</div>
															<!--// conSection-->
															<a href="#none" class="popClose">보유 금액 닫기</a>
														</div>
													</div> <input type="hidden" for="nOrdUnpr" name="sName"
													value="${stockName}" />
												</span>
											</div>
											<div class="detail unit-price">
												<label for="nOrdUnpr">수량</label> <input type="text"
													class="alignR" name="buyingQu" id="buying_qu" value="0"
													onclick="" numberOnly> 주 <span class="buying-check">
													<a onclick="sumplus(10);"
													class="buying-check-btn btnStyle btnS btnSum">10주</a> <a
													onclick="sumplus(100);"
													class="buying-check-btn btnStyle btnS btnSum">100주</a> 
													<a id= "buy_max" class="buying-check-btn btnStyle btnS btnSum">최대</a>
												</span>
											</div>
											<script>
											$(document).ready(function(){
												$("#buy_max").click(function(){
													var money = parseInt('${money}'.replace(/,/g,"").replace('원',''))
													var price = parseInt($("#buying_price").val().replace(/,/g,""))
													var max_qu = parseInt(money / price)
													$("#buying_qu").val(max_qu);
													var result = price * max_qu
													$("#buying_result").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
												});
												
												$("#buying_qu").change(function(){
													var result = parseInt($("#buying_price").val().replace(/,/g,"")) * $("#buying_qu").val()
													$("#buying_result").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
												});
												
												$("#buying_price").change(function(){
													var result = parseInt($("#buying_price").val().replace(/,/g,"")) * $("#buying_qu").val()
													$("#buying_result").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
												});
												
												$("#selling_price").keyup(function(){
													var result = parseInt($("#selling_price").val().replace(/,/g,"")) * $("#selling_qu").val()
													$("#selling_result").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
												});
												
												$("#selling_qu").keyup(function(){
													var result = parseInt($("#selling_price").val().replace(/,/g,"")) * $("#selling_qu").val()
													$("#selling_result").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
												});
												
											});
											function sumplus(num) {
												var text = document.getElementById("buying_qu");
												text_val = parseInt(buying_qu.value);
												text_val += num;
												text.value = text_val;
												var result = parseInt($("#buying_price").val().replace(/,/g,"")) * $("#buying_qu").val()
												$("#buying_result").text(result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
											}
											</script>
										</div>
										<div class="sumArea">
											<span class="text"> <em>총주문금액 :</em> <strong
												id="buying_result">0</strong> <strong> <span>원</span>
											</strong> (수수료 미포함)
											</span>
										</div>
									</div>
									<button type="submit">매수주문</button>
								</form>
							</div>

							<div class="tab-pane fade" id="pills-profile" role="tabpanel"
								aria-labelledby="pills-profile-tab">
								<form id="trad_frm" action="/selling" method="post">
									<div class="stock-buying">
										<div class="input-area">
											<div class="detail unit-price">

												<label for="nOrdUnpr" style="margin-right: 14px;">단가</label><span data-tooltip-text="호가 클릭 시 단가가 입력 됩니다."><input type="text"
													class="alignR" id="selling_price" name="sellingPrice" readOnly></span> 원 
													<span class="buying-check"> <a onclick="#" class="buying-check-btn btnStyle btnS buying-checking">매도가능</a>

													<div class="layerPopup">
														<div class="layerBox layerStock"  id="poplayer_possible"
															style="display: block;">
															<h1>매도가능</h1>
															<!-- conSection -->
															<div class="conSection">
																<!-- tableWrap -->
																<div class="tableWrap tableDataWrap">
																	<table class="tableDefault tableCol tableSmall"
																		summary="종목명, 잔고수량, 매도가능수량에 관한 정보입니다.">
																		<colgroup>
																			<col width="50%">
																			<col width="50%">
																		</colgroup>
																		<thead>
																			<tr>
																				<th scope="col" class="first">종목명</th>
																				<th scope="col">잔고수량</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td title="종목명" class="first">${stockName }</td>
																				<td title="잔고수량">${myStockQu }</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
															<!--// conSection-->
															<a href="#none" class="popClose">매도가능 닫기</a>
														</div>
													</div> <input type="hidden" for="nOrdUnpr" name="sName"
													value="${stockName}" />
												</span>
											</div>
											<div class="detail unit-price">
												<label for="nOrdUnpr">수량</label> <input type="text"
													class="alignR" id="selling_qu" name="sellingQu" numberOnly>
												주
											</div>
										</div>
										<div class="sumArea">
											<span class="text"> <em>총주문금액 :</em> <strong
												id="selling_result" class="sum">0</strong> <strong>
													<span>원</span>
											</strong> (수수료 미포함)
											</span>
										</div>
									</div>
									<button type="submit">매도주문</button>
								</form>
							</div>
							<div class="tab-pane fade" id="pills-contact" role="tabpanel"
								aria-labelledby="pills-contact-tab">
								<form id="trad_frm" action="/modify" method="post">
									<div class="stock-buying">
										<div class="choice">
											<strong>주문구분</strong> <input type="radio" id="input-modify"
												name="cancleModify" value="modify" onchange="setDisplay();">정정
											<input type="radio" id="input-cancel" name="cancleModify"
												value="cancle" onchange="setDisplay();">취소
											<script>
											function setDisplay(){
											    if($('input:radio[id=input-modify]').is(':checked')){
											        $('.btn-modify').show();
											        $('.btn-cancel').hide();
											        $('.alignA').show();
											        $('.alignB').hide();
											        //document.getElementById("mySelect").disabled = false;
											    }else{
											        $('.btn-cancel').show();
											        $('.btn-modify').hide();
											        $('.alignB').show();
											        $('.alignA').hide();
											        //document.getElementById("mySelect").disabled = true;
											    }
											}
											document.getElementById('input-modify').checked = true;
											
											</script>
										</div>
										<div class="input-area">
											<div class="detail unit-price">
												<label for="nOrdUnpr" style="margin: -2px 6px 0 0;">주문번호</label>
												<input type="text" class="alignR" name="uno"> <span
													class="buying-check"> <a onclick="#"
													class="buying-check-btn btnStyle btnS buying-cancel">미체결잔량</a>
													<div class="layerPopup-buying-cancel">
														<div class="layerBox layerStock"
															id="poplayer_un_conclusion" style="display: block;">
															<h1>미체결잔량</h1>
															<!-- conSection -->
															<div class="conSection">
																<!-- tableWrap -->
																<div class="tableWrap tableDataWrap">
																	<table class="tableDefault tableCol tableSmall"
																		summary="미체결잔량에 관한 주문번호, 종목명, 주문구분, 주문단가, 미체결잔량에 관한 정보입니다.">
																		<colgroup>


																			<col width="20%">
																			<col width="20%">
																			<col width="20%">


																			<col width="20%">
																			<col width="20%">
																		</colgroup>
																		<thead>
																			<tr>
																				<th scope="col" class="first">주문번호</th>
																				<th scope="col">종목명</th>
																				<th scope="col">구분</th>


																				<th scope="col">주문단가</th>
																				<th scope="col">미체결잔량</th>
																			</tr>
																		</thead>
																		<tbody>
																			<c:forEach items="${unsettled}" var="list">
																				<tr>
																					<td class="first" title="주문번호"><c:out
																							value="${list.uno}" /></td>
																					<td title="종목명"><c:out
																							value="${list.stockName}" /></td>
																					<td title="구분"><c:out value="${list.category}" /></td>
																					<td title="주문단가"><c:out value="${list.rPrice}" /></td>
																					<td title="미체결잔량"><c:out
																							value="${list.quantity}" /></td>
																				</tr>
																			</c:forEach>

																		</tbody>
																	</table>
																</div>
															</div>
															<!--// conSection-->
															<a href="#none" class="popClose">미체결잔량 닫기</a>
														</div>
													</div>
												</span>
											</div>
											<div class="detail unit-price">
												<label for="nOrdUnpr" style="margin-right: 39px;"
													class="btn-cc">단가</label><span data-tooltip-text="호가 클릭 시 단가가 입력 됩니다."><input type="text" class="alignA"
													id="mySelect" name="modifyPrice" readonly></span> <input
													type="text" class="alignB" id="mySelect" value="0"
													style="display: none;" disabled> 원
											</div>
											<div class="detail unit-price">
												<label for="nOrdUnpr" style="margin-right: 34px;">수량</label>
												<input type="text" class="alignR" name="modifyQu" numberOnly>
												주

											</div>
										</div>
										<div class="sumArea">
											<span class="text"> <em>총주문금액 :</em> <strong
												class="sum">0</strong> <strong> <span>원</span>
											</strong> (수수료 미포함)
											</span>
										</div>
									</div>
									<button class="btn-modify"
										type="submit">정정주문</button>
									<button style="width: 100%; height: auto; display: none;"
										class="btn-cancel" type="submit">취소주문</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="stock-price-chart">
						<table class="stock-chart-table	">
							<colgroup>
								<col width="25%">
								<col width="30%">
								<col width="45%">
							</colgroup>
<%-- 							<thead>
								<tr>
									<th scope="col" colspan="3" id="stockName">${stockName}</th>
								</tr>
							</thead> --%>
							<tbody>
								<tr>
									<td scope="col" class="table-border"></td>
									<td scope="col" class="table-border">호가</td>
									<td scope="col" class="table-border"></td>
								</tr>
								<tr>
									<td scope="col" class="upper-text">상한가</td>
									<td scope="col"  class="upper-text" id="maximum"></td>
									<td scope="col"></td>
								</tr>
							</tbody>

							<tbody id="up">
								<!-- ajax 로 호가 + 주입 -->
							</tbody>

							<tbody>
								<tr id="upDownColor">
									<td scope="col" class="now-text">현재가</td>
									<td scope="col" class="now-text" id="price"></td>
									<td scope="col" class="now-text" id="beforeAndUpdown"></td>
								</tr>
							</tbody>

							<tbody id="down">
								<!-- ajax 로 호가 - 주입 -->
							</tbody>
							<tbody>
								<tr>
									<td scope="col" class="Lower-text">하한가</td>
									<td scope="col" class="Lower-text" id="minimum"></td>
									<td scope="col"></td>
								</tr>
							</tbody>
						</table>
					</div>
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

	<%@include file="mainfooter.jsp" %>
	<script src="/resources/js/jsrender.js" type="text/javascript"></script>

	<script>
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
		var pageUrl = "삼성전자";
		var pageTitle = "http://localhost:8080/trade";
		timer = setInterval( function () {
			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}/trade/search?stockName='+stockName,
			 	/* data : JSON.stringify(jsonData),  */
				datatype : "JSON",
				success : function(data) {
						console.log(data)
						$('#element').css('margin', '5px');
						$('#price').text(data.currentPrice);
						
						
						var nowStock = "";
						var before = "";						
						
						if(data.before.indexOf("+") != -1){
							before = data.before.replace("+","");
							nowStock += '<tr class="mainup">'
						}
						         
						if(data.before.indexOf("+") == -1){
							before = data.before.replace("-","");
							nowStock += '<tr class="maindown">'
						}
						else{
							nowStock += '<tr class="mainsame">'
						}
						         
						nowStock += '<td>'+data.currentPrice+'</td>'
						           
						if(data.before.indexOf("+") != -1){
							nowStock += '<td class="mainup-num"><em><span>▲</span></em>'
							nowStock += 	'<span class="tah p11 red02">'+ before + " ("+data.updown+")"+'</span></td>'
						}
						               
						else if(data.before.indexOf("+") == -1){
							nowStock +=   '<td class="maindown-num"><em><span>▼</span></em>'
							nowStock +=     '<span class="tah p11 nv01">'+ before + " ("+data.updown+")"+'</span></td>'
						}
						else{
							nowStock += '<td><span class="tah p11"> 0 </span></td>'
						}
						nowStock += '</tr>'
													
						$('#nowStock').html(nowStock);
						
						
						// 어제 대비 현재가가 오른경우
						if(data.before.indexOf("+") != -1){	
							before = data.before.replace("+", "");
							console.log(before)
							$('#upDownColor').css("color", "rgb(255, 0, 0)");
							$('#beforeAndUpdown').html(before + " , " + data.updown);

						} 
						// 내린경우
						else if (data.before.indexOf("+") == -1){
							before = data.before.replace("-", "");
							$('#upDownColor').css("color", "rgb(91, 90, 255)");
							$('#beforeAndUpdown').html(before + " , " + data.updown);

						}
						
						
						$('#maximum').html(data.maximum);
						$('#minimum').html(data.minimum);
						var templ = $.templates("#upPrice");
						var str = templ.render(data.up);
						$("#up").html(str);
						var templ2 = $.templates("#downPrice");
						var str2 = templ2.render(data.down);
						$("#down").html(str2);
						$("#stockName").html(data.stockName);
						
						
						
						// top 종목(상한가) 5개
						var topRank = "";
						var a = 1;
						
						for(var i=0; i<data.topName.length-1; i++){

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
						$("#topRank").html(topRank);

						
						
						// 인기검색종목 5개
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
						

					//$('#price').text(data.currentPrice);
					
				},
				error : function(error) {
					console.log("error");
				}
			}); 
		}, 1000); // SET INTERVAL5
	});
	
	$('#price').click( function(){
		$('#buying_price').val($(this).text());
		$('#selling_price').val($(this).text());
		var buy_result = parseInt($('#buying_price').val().replace(/,/g, '')) * $('#buying_qu').val()
		$('#buying_result').text(buy_result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
		var sell_result = parseInt($('#selling_price').val().replace(/,/g,'')) * $('#selling_qu').val()
		$('#selling_result').text(sell_result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
	})
	
	var day_d = [${day_d[0]}, ${day_d[1]}, ${day_d[2]}, ${day_d[3]}, ${day_d[4]}, ${day_d[5]}, ${day_d[6]}, ${day_d[7]}, ${day_d[8]}, ${day_d[9]}, ${day_d[10]}, ${day_d[11]}, ${day_d[12]}, ${day_d[13]}, ${day_d[14]}, ${day_d[15]}, ${day_d[16]}, ${day_d[17]}, ${day_d[18]}, ${day_d[19]}, ${day_d[20]}, ${day_d[21]}, ${day_d[22]}, ${day_d[23]}, ${day_d[24]}, ${day_d[25]}, ${day_d[26]}, ${day_d[27]}, ${day_d[28]}, ${day_d[29]}, ${day_d[30]}, ${day_d[31]}, ${day_d[32]}, ${day_d[33]}, ${day_d[34]}, ${day_d[35]}, ${day_d[36]}, ${day_d[37]}, ${day_d[38]}, ${day_d[39]}, ${day_d[40]}, ${day_d[41]}, ${day_d[42]}, ${day_d[43]}, ${day_d[44]}, ${day_d[45]}, ${day_d[46]}, ${day_d[47]}, ${day_d[48]}, ${day_d[49]}, ${day_d[50]}, ${day_d[51]}, ${day_d[52]}, ${day_d[53]}, ${day_d[54]}, ${day_d[55]}, ${day_d[56]}, ${day_d[57]}, ${day_d[58]}, ${day_d[59]}]; 
	   var day_startprice = [${day_startprice[0]}, ${day_startprice[1]}, ${day_startprice[2]}, ${day_startprice[3]}, ${day_startprice[4]}, ${day_startprice[5]}, ${day_startprice[6]}, ${day_startprice[7]}, ${day_startprice[8]}, ${day_startprice[9]}, ${day_startprice[10]}, ${day_startprice[11]}, ${day_startprice[12]}, ${day_startprice[13]}, ${day_startprice[14]}, ${day_startprice[15]}, ${day_startprice[16]}, ${day_startprice[17]}, ${day_startprice[18]}, ${day_startprice[19]}, ${day_startprice[20]}, ${day_startprice[21]}, ${day_startprice[22]}, ${day_startprice[23]}, ${day_startprice[24]}, ${day_startprice[25]}, ${day_startprice[26]}, ${day_startprice[27]}, ${day_startprice[28]}, ${day_startprice[29]}, ${day_startprice[30]}, ${day_startprice[31]}, ${day_startprice[32]}, ${day_startprice[33]}, ${day_startprice[34]}, ${day_startprice[35]}, ${day_startprice[36]}, ${day_startprice[37]}, ${day_startprice[38]}, ${day_startprice[39]}, ${day_startprice[40]}, ${day_startprice[41]}, ${day_startprice[42]}, ${day_startprice[43]}, ${day_startprice[44]}, ${day_startprice[45]}, ${day_startprice[46]}, ${day_startprice[47]}, ${day_startprice[48]}, ${day_startprice[49]}, ${day_startprice[50]}, ${day_startprice[51]}, ${day_startprice[52]}, ${day_startprice[53]}, ${day_startprice[54]}, ${day_startprice[55]}, ${day_startprice[56]}, ${day_startprice[57]}, ${day_startprice[58]}, ${day_startprice[59]}];
	   var day_highprice = [${day_highprice[0]}, ${day_highprice[1]}, ${day_highprice[2]}, ${day_highprice[3]}, ${day_highprice[4]}, ${day_highprice[5]}, ${day_highprice[6]}, ${day_highprice[7]}, ${day_highprice[8]}, ${day_highprice[9]}, ${day_highprice[10]}, ${day_highprice[11]}, ${day_highprice[12]}, ${day_highprice[13]}, ${day_highprice[14]}, ${day_highprice[15]}, ${day_highprice[16]}, ${day_highprice[17]}, ${day_highprice[18]}, ${day_highprice[19]}, ${day_highprice[20]}, ${day_highprice[21]}, ${day_highprice[22]}, ${day_highprice[23]}, ${day_highprice[24]}, ${day_highprice[25]}, ${day_highprice[26]}, ${day_highprice[27]}, ${day_highprice[28]}, ${day_highprice[29]}, ${day_highprice[30]}, ${day_highprice[31]}, ${day_highprice[32]}, ${day_highprice[33]}, ${day_highprice[34]}, ${day_highprice[35]}, ${day_highprice[36]}, ${day_highprice[37]}, ${day_highprice[38]}, ${day_highprice[39]}, ${day_highprice[40]}, ${day_highprice[41]}, ${day_highprice[42]}, ${day_highprice[43]}, ${day_highprice[44]}, ${day_highprice[45]}, ${day_highprice[46]}, ${day_highprice[47]}, ${day_highprice[48]}, ${day_highprice[49]}, ${day_highprice[50]}, ${day_highprice[51]}, ${day_highprice[52]}, ${day_highprice[53]}, ${day_highprice[54]}, ${day_highprice[55]}, ${day_highprice[56]}, ${day_highprice[57]}, ${day_highprice[58]}, ${day_highprice[59]}];
	   var day_lowprice = [${day_lowprice[0]}, ${day_lowprice[1]}, ${day_lowprice[2]}, ${day_lowprice[3]}, ${day_lowprice[4]}, ${day_lowprice[5]}, ${day_lowprice[6]}, ${day_lowprice[7]}, ${day_lowprice[8]}, ${day_lowprice[9]}, ${day_lowprice[10]}, ${day_lowprice[11]}, ${day_lowprice[12]}, ${day_lowprice[13]}, ${day_lowprice[14]}, ${day_lowprice[15]}, ${day_lowprice[16]}, ${day_lowprice[17]}, ${day_lowprice[18]}, ${day_lowprice[19]}, ${day_lowprice[20]}, ${day_lowprice[21]}, ${day_lowprice[22]}, ${day_lowprice[23]}, ${day_lowprice[24]}, ${day_lowprice[25]}, ${day_lowprice[26]}, ${day_lowprice[27]}, ${day_lowprice[28]}, ${day_lowprice[29]}, ${day_lowprice[30]}, ${day_lowprice[31]}, ${day_lowprice[32]}, ${day_lowprice[33]}, ${day_lowprice[34]}, ${day_lowprice[35]}, ${day_lowprice[36]}, ${day_lowprice[37]}, ${day_lowprice[38]}, ${day_lowprice[39]}, ${day_lowprice[40]}, ${day_lowprice[41]}, ${day_lowprice[42]}, ${day_lowprice[43]}, ${day_lowprice[44]}, ${day_lowprice[45]}, ${day_lowprice[46]}, ${day_lowprice[47]}, ${day_lowprice[48]}, ${day_lowprice[49]}, ${day_lowprice[50]}, ${day_lowprice[51]}, ${day_lowprice[52]}, ${day_lowprice[53]}, ${day_lowprice[54]}, ${day_lowprice[55]}, ${day_lowprice[56]}, ${day_lowprice[57]}, ${day_lowprice[58]}, ${day_lowprice[59]}];
	   var day_lastprice = [${day_lastprice[0]}, ${day_lastprice[1]}, ${day_lastprice[2]}, ${day_lastprice[3]}, ${day_lastprice[4]}, ${day_lastprice[5]}, ${day_lastprice[6]}, ${day_lastprice[7]}, ${day_lastprice[8]}, ${day_lastprice[9]}, ${day_lastprice[10]}, ${day_lastprice[11]}, ${day_lastprice[12]}, ${day_lastprice[13]}, ${day_lastprice[14]}, ${day_lastprice[15]}, ${day_lastprice[16]}, ${day_lastprice[17]}, ${day_lastprice[18]}, ${day_lastprice[19]}, ${day_lastprice[20]}, ${day_lastprice[21]}, ${day_lastprice[22]}, ${day_lastprice[23]}, ${day_lastprice[24]}, ${day_lastprice[25]}, ${day_lastprice[26]}, ${day_lastprice[27]}, ${day_lastprice[28]}, ${day_lastprice[29]}, ${day_lastprice[30]}, ${day_lastprice[31]}, ${day_lastprice[32]}, ${day_lastprice[33]}, ${day_lastprice[34]}, ${day_lastprice[35]}, ${day_lastprice[36]}, ${day_lastprice[37]}, ${day_lastprice[38]}, ${day_lastprice[39]}, ${day_lastprice[40]}, ${day_lastprice[41]}, ${day_lastprice[42]}, ${day_lastprice[43]}, ${day_lastprice[44]}, ${day_lastprice[45]}, ${day_lastprice[46]}, ${day_lastprice[47]}, ${day_lastprice[48]}, ${day_lastprice[49]}, ${day_lastprice[50]}, ${day_lastprice[51]}, ${day_lastprice[52]}, ${day_lastprice[53]}, ${day_lastprice[54]}, ${day_lastprice[55]}, ${day_lastprice[56]}, ${day_lastprice[57]}, ${day_lastprice[58]}, ${day_lastprice[59]}];
	
	   var min_d = [${min_d[0]}, ${min_d[1]}, ${min_d[2]}, ${min_d[3]}, ${min_d[4]}, ${min_d[5]}, ${min_d[6]}, ${min_d[7]}, ${min_d[8]}, ${min_d[9]}, ${min_d[10]}, ${min_d[11]}, ${min_d[12]}, ${min_d[13]}, ${min_d[14]}, ${min_d[15]}, ${min_d[16]}, ${min_d[17]}, ${min_d[18]}, ${min_d[19]}, ${min_d[20]}, ${min_d[21]}, ${min_d[22]}, ${min_d[23]}, ${min_d[24]}, ${min_d[25]}, ${min_d[26]}, ${min_d[27]}, ${min_d[28]}, ${min_d[29]}, ${min_d[30]}, ${min_d[31]}, ${min_d[32]}, ${min_d[33]}, ${min_d[34]}, ${min_d[35]}, ${min_d[36]}, ${min_d[37]}, ${min_d[38]}, ${min_d[39]}, ${min_d[40]}, ${min_d[41]}, ${min_d[42]}, ${min_d[43]}, ${min_d[44]}, ${min_d[45]}, ${min_d[46]}, ${min_d[47]}, ${min_d[48]}, ${min_d[49]}, ${min_d[50]}, ${min_d[51]}, ${min_d[52]}, ${min_d[53]}, ${min_d[54]}, ${min_d[55]}, ${min_d[56]}, ${min_d[57]}, ${min_d[58]}, ${min_d[59]}] 
	   var min_hr = [${min_hr[0]}, ${min_hr[1]}, ${min_hr[2]}, ${min_hr[3]}, ${min_hr[4]}, ${min_hr[5]}, ${min_hr[6]}, ${min_hr[7]}, ${min_hr[8]}, ${min_hr[9]}, ${min_hr[10]}, ${min_hr[11]}, ${min_hr[12]}, ${min_hr[13]}, ${min_hr[14]}, ${min_hr[15]}, ${min_hr[16]}, ${min_hr[17]}, ${min_hr[18]}, ${min_hr[19]}, ${min_hr[20]}, ${min_hr[21]}, ${min_hr[22]}, ${min_hr[23]}, ${min_hr[24]}, ${min_hr[25]}, ${min_hr[26]}, ${min_hr[27]}, ${min_hr[28]}, ${min_hr[29]}, ${min_hr[30]}, ${min_hr[31]}, ${min_hr[32]}, ${min_hr[33]}, ${min_hr[34]}, ${min_hr[35]}, ${min_hr[36]}, ${min_hr[37]}, ${min_hr[38]}, ${min_hr[39]}, ${min_hr[40]}, ${min_hr[41]}, ${min_hr[42]}, ${min_hr[43]}, ${min_hr[44]}, ${min_hr[45]}, ${min_hr[46]}, ${min_hr[47]}, ${min_hr[48]}, ${min_hr[49]}, ${min_hr[50]}, ${min_hr[51]}, ${min_hr[52]}, ${min_hr[53]}, ${min_hr[54]}, ${min_hr[55]}, ${min_hr[56]}, ${min_hr[57]}, ${min_hr[58]}, ${min_hr[59]}]
	   var min_startprice = [${min_startprice[0]}, ${min_startprice[1]}, ${min_startprice[2]}, ${min_startprice[3]}, ${min_startprice[4]}, ${min_startprice[5]}, ${min_startprice[6]}, ${min_startprice[7]}, ${min_startprice[8]}, ${min_startprice[9]}, ${min_startprice[10]}, ${min_startprice[11]}, ${min_startprice[12]}, ${min_startprice[13]}, ${min_startprice[14]}, ${min_startprice[15]}, ${min_startprice[16]}, ${min_startprice[17]}, ${min_startprice[18]}, ${min_startprice[19]}, ${min_startprice[20]}, ${min_startprice[21]}, ${min_startprice[22]}, ${min_startprice[23]}, ${min_startprice[24]}, ${min_startprice[25]}, ${min_startprice[26]}, ${min_startprice[27]}, ${min_startprice[28]}, ${min_startprice[29]}, ${min_startprice[30]}, ${min_startprice[31]}, ${min_startprice[32]}, ${min_startprice[33]}, ${min_startprice[34]}, ${min_startprice[35]}, ${min_startprice[36]}, ${min_startprice[37]}, ${min_startprice[38]}, ${min_startprice[39]}, ${min_startprice[40]}, ${min_startprice[41]}, ${min_startprice[42]}, ${min_startprice[43]}, ${min_startprice[44]}, ${min_startprice[45]}, ${min_startprice[46]}, ${min_startprice[47]}, ${min_startprice[48]}, ${min_startprice[49]}, ${min_startprice[50]}, ${min_startprice[51]}, ${min_startprice[52]}, ${min_startprice[53]}, ${min_startprice[54]}, ${min_startprice[55]}, ${min_startprice[56]}, ${min_startprice[57]}, ${min_startprice[58]}, ${min_startprice[59]}]
	   var min_highprice = [${min_highprice[0]}, ${min_highprice[1]}, ${min_highprice[2]}, ${min_highprice[3]}, ${min_highprice[4]}, ${min_highprice[5]}, ${min_highprice[6]}, ${min_highprice[7]}, ${min_highprice[8]}, ${min_highprice[9]}, ${min_highprice[10]}, ${min_highprice[11]}, ${min_highprice[12]}, ${min_highprice[13]}, ${min_highprice[14]}, ${min_highprice[15]}, ${min_highprice[16]}, ${min_highprice[17]}, ${min_highprice[18]}, ${min_highprice[19]}, ${min_highprice[20]}, ${min_highprice[21]}, ${min_highprice[22]}, ${min_highprice[23]}, ${min_highprice[24]}, ${min_highprice[25]}, ${min_highprice[26]}, ${min_highprice[27]}, ${min_highprice[28]}, ${min_highprice[29]}, ${min_highprice[30]}, ${min_highprice[31]}, ${min_highprice[32]}, ${min_highprice[33]}, ${min_highprice[34]}, ${min_highprice[35]}, ${min_highprice[36]}, ${min_highprice[37]}, ${min_highprice[38]}, ${min_highprice[39]}, ${min_highprice[40]}, ${min_highprice[41]}, ${min_highprice[42]}, ${min_highprice[43]}, ${min_highprice[44]}, ${min_highprice[45]}, ${min_highprice[46]}, ${min_highprice[47]}, ${min_highprice[48]}, ${min_highprice[49]}, ${min_highprice[50]}, ${min_highprice[51]}, ${min_highprice[52]}, ${min_highprice[53]}, ${min_highprice[54]}, ${min_highprice[55]}, ${min_highprice[56]}, ${min_highprice[57]}, ${min_highprice[58]}, ${min_highprice[59]}]
	   var min_lowprice = [${min_lowprice[0]}, ${min_lowprice[1]}, ${min_lowprice[2]}, ${min_lowprice[3]}, ${min_lowprice[4]}, ${min_lowprice[5]}, ${min_lowprice[6]}, ${min_lowprice[7]}, ${min_lowprice[8]}, ${min_lowprice[9]}, ${min_lowprice[10]}, ${min_lowprice[11]}, ${min_lowprice[12]}, ${min_lowprice[13]}, ${min_lowprice[14]}, ${min_lowprice[15]}, ${min_lowprice[16]}, ${min_lowprice[17]}, ${min_lowprice[18]}, ${min_lowprice[19]}, ${min_lowprice[20]}, ${min_lowprice[21]}, ${min_lowprice[22]}, ${min_lowprice[23]}, ${min_lowprice[24]}, ${min_lowprice[25]}, ${min_lowprice[26]}, ${min_lowprice[27]}, ${min_lowprice[28]}, ${min_lowprice[29]}, ${min_lowprice[30]}, ${min_lowprice[31]}, ${min_lowprice[32]}, ${min_lowprice[33]}, ${min_lowprice[34]}, ${min_lowprice[35]}, ${min_lowprice[36]}, ${min_lowprice[37]}, ${min_lowprice[38]}, ${min_lowprice[39]}, ${min_lowprice[40]}, ${min_lowprice[41]}, ${min_lowprice[42]}, ${min_lowprice[43]}, ${min_lowprice[44]}, ${min_lowprice[45]}, ${min_lowprice[46]}, ${min_lowprice[47]}, ${min_lowprice[48]}, ${min_lowprice[49]}, ${min_lowprice[50]}, ${min_lowprice[51]}, ${min_lowprice[52]}, ${min_lowprice[53]}, ${min_lowprice[54]}, ${min_lowprice[55]}, ${min_lowprice[56]}, ${min_lowprice[57]}, ${min_lowprice[58]}, ${min_lowprice[59]}]
	   var min_lastprice = [${min_lastprice[0]}, ${min_lastprice[1]}, ${min_lastprice[2]}, ${min_lastprice[3]}, ${min_lastprice[4]}, ${min_lastprice[5]}, ${min_lastprice[6]}, ${min_lastprice[7]}, ${min_lastprice[8]}, ${min_lastprice[9]}, ${min_lastprice[10]}, ${min_lastprice[11]}, ${min_lastprice[12]}, ${min_lastprice[13]}, ${min_lastprice[14]}, ${min_lastprice[15]}, ${min_lastprice[16]}, ${min_lastprice[17]}, ${min_lastprice[18]}, ${min_lastprice[19]}, ${min_lastprice[20]}, ${min_lastprice[21]}, ${min_lastprice[22]}, ${min_lastprice[23]}, ${min_lastprice[24]}, ${min_lastprice[25]}, ${min_lastprice[26]}, ${min_lastprice[27]}, ${min_lastprice[28]}, ${min_lastprice[29]}, ${min_lastprice[30]}, ${min_lastprice[31]}, ${min_lastprice[32]}, ${min_lastprice[33]}, ${min_lastprice[34]}, ${min_lastprice[35]}, ${min_lastprice[36]}, ${min_lastprice[37]}, ${min_lastprice[38]}, ${min_lastprice[39]}, ${min_lastprice[40]}, ${min_lastprice[41]}, ${min_lastprice[42]}, ${min_lastprice[43]}, ${min_lastprice[44]}, ${min_lastprice[45]}, ${min_lastprice[46]}, ${min_lastprice[47]}, ${min_lastprice[48]}, ${min_lastprice[49]}, ${min_lastprice[50]}, ${min_lastprice[51]}, ${min_lastprice[52]}, ${min_lastprice[53]}, ${min_lastprice[54]}, ${min_lastprice[55]}, ${min_lastprice[56]}, ${min_lastprice[57]}, ${min_lastprice[58]}, ${min_lastprice[59]}]
	   
	   
	
	
	//window.onload = function () {
	
 	$("#minute").click(function(){
 		$("#chartcontainer").empty();
 		var minData = [];
 		for (var i = 0; i < 60; i++) {
 			if(min_hr[i] > min_hr[0]) break;
 			minData.push({
				 x : new Date(parseInt(min_d[i]/10000),
	                        parseInt(min_d[i]%10000/100),
	                        min_d[i]%100,
	                        parseInt(min_hr[i]/100),
	                        min_hr[i]%100

	                  ),
		         y:  [ parseFloat(min_startprice[i]), parseFloat(min_highprice[i]),
	                 parseFloat(min_lowprice[i]),
	                 parseFloat(min_lastprice[i]) ]
		     });
		 }
	     
	     var options = {
	    		
	         series: [{
	             data: minData
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
	            	 formatter: function(val, opts) {
		                   var st = new Date(val);
		                   var hour = st.getHours();
		                   var min = st.getMinutes();
		                   if(min<10) min = "0"+min;
		                   var text = hour + ":" +min;
		                   return text
		                 }
	             },
	             tooltip: {
	                 formatter: function(val, opts) {
	                   var st = new Date(val);
	                   var hour = st.getHours();
	                   var min = st.getMinutes();
	                   if(min<10) min = "0"+min;
	                   var text = hour + ":" +min;
	                   return text
	                 }
	               }
	         },
	         yaxis: {
	        	 labels: {
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
			  }
	     };

	     var minchart = new ApexCharts(document.querySelector("#chartcontainer"), options);
	     minchart.render();	
 	
	});
		
	
	$("#day").click(function(){
		$("#chartcontainer").empty();
		
		var dayData = [];
		for (var i = 0; i < 60; i++) {
			dayData.push({
		         x: new Date(
		        		 parseInt(day_d[i]/10000),
		                  parseInt(day_d[i]%10000/100)-1,
		                  day_d[i]%100+1
		                  ),
		         y:  [ parseFloat(day_startprice[i]), parseFloat(day_highprice[i]),
	                 parseFloat(day_lowprice[i]),
	                 parseFloat(day_lastprice[i]) ]
		     });
		 }
	     
	     var options = {
	    		
	         series: [{
	             data: dayData
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
			  }
	     };

	     var daychart = new ApexCharts(document.querySelector("#chartcontainer"), options);
	     daychart.render();
	}); 
	
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
                parseFloat(day_lastprice[i]) ]
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

    var chart = new ApexCharts(document.querySelector("#chartcontainer"), options);
    chart.render();
	</script>

	<script id="upPrice" type="text/x-jsrender">
			<tr>
				<td scope="col" class="inside-text"></td>
				<td scope="col" class="inside-up-text"><button onClick="(function(){
							$('#buying_price').val('{{:up}}');
							$('#selling_price').val('{{:up}}');
							var buy_result = parseInt($('#buying_price').val().replace(/,/g, '')) * $('#buying_qu').val()
        					$('#buying_result').text(buy_result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
							var sell_result = parseInt($('#selling_price').val().replace(/,/g,'')) * $('#selling_qu').val()
							$('#selling_result').text(sell_result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
							})()">
				{{:up}}</td>
				<td scope="col"></td>
			</tr>
	</script>
	<script id="downPrice" type="text/x-jsrender">
			<tr>
				<td scope="col" class="inside-text"></td>
				<td scope="col" class="inside-down-text"><button onClick="(function(){
							$('#buying_price').val('{{:down}}');
							$('#selling_price').val('{{:down}}');
							var buy_result = parseInt($('#buying_price').val().replace(/,/g, '')) * $('#buying_qu').val()
        					$('#buying_result').text(buy_result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
							var sell_result = parseInt($('#selling_price').val().replace(/,/g,'')) * $('#selling_qu').val()
							$('#selling_result').text(sell_result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
							})()">
				{{:down}}</td>
				<td scope="col"></td>
			</tr>
	</script>




</body>
</html>