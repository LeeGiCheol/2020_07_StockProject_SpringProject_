<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- CSS파일 -->
<link href="/resources/css/mypage02.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 달력JS/CSS -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />

<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">

<script>
$(document).ready(function(){
    $(".refresh").click(function(){
    	if(confirm("하루 2회 무료로 100만원 머니 재지급 가능합니다. \n재지급 받으시겠습니까?(남은횟수 2/2회)")){
            alert("JS구성하기");
          }else{
            alert("취소하셨습니다.");
          }
      $('#datetimepicker1').datetimepicker({ format: 'L'});
      $('#datetimepicker2').datetimepicker({ format: 'L', useCurrent: false});
      $("#datetimepicker1").on("change.datetimepicker", function (e) {$('#datetimepicker2').datetimepicker('minDate', e.date);});
      $("#datetimepicker2").on("change.datetimepicker", function (e) {$('#datetimepicker1').datetimepicker('maxDate', e.date);});
    });

    // pagination 추가  
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
<style>
.paging-body{margin-left:355px; margin-bottom: 300px;}
</style>
</head>
<body>

	<%@include file="mainheader.jsp" %> 	
	
    <!-- section start -->
    <div class="sideBar col-md-4 order-md-2 mb-4" id="menu-bar">
      <ul class="list-group mb-3">
        <!-- java에서 온클릭 위치 바꾸기!!!!!!!!!!!!!!!!!!!-->
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed mypage01" onclick="location.href='/myPage01'">
          <div> 
            <h6 class="my-0">내정보</h6>
          </div>
        </li>
        <li class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed mypage02" onclick="location.href='/myPage02'">
          <div>
            <h6 class="my-0">계좌정보</h6>
          </div>
        </li>
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed mypage03" onclick="location.href='/myPage03'" >
          <div>
            <h6 class="my-0">작성 글, 댓글</h6>
          </div>
        </li>
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed mypage04" onclick="location.href='/myPage04'">
          <div >
            <h6 class="my-0">알림</h6>
          </div>
        </li>
      </ul>
    </div>
    <!-- section end -->
    <!-- article start -->
    <article class="bg-light container">
        <div class="allBody">
          <div class="row">
            <div class="sideBar col-md-4 order-md-2 mb-4">
              <div class="col-md-8 order-md-1"></div>
               <h4 class="mb-3">계좌정보</h4>
                <div>보유금액 : 97,000원 <button type="button" class="btn btn-primary refresh">머니 재지급</button></div>
            </div>
          </div>
        </div>
    <!-- 게시판 -->
    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
      <li class="nav-item" role="presentation">
        <a class="nav-link" id="pills-rate-tab" data-toggle="pill" href="#pills-rate" role="tab" aria-controls="pills-rate" aria-selected="true">수익률</a>
      </li>
      <li class="nav-item" role="presentation">
        <a class="nav-link" id="pills-account-tab" data-toggle="pill" href="#pills-account" role="tab" aria-controls="pills-account" aria-selected="false">계좌</a>
      </li>
      <li class="nav-item" role="presentation">
        <a class="nav-link" id="pills-trade-history-tab" data-toggle="pill" href="#pills-trade-history" role="tab" aria-controls="pills-trade-history" aria-selected="false">거래내역</a>
      </li>
    </ul>
    <div class="tab-content" id="pills-tabContent">
      <!-- 수익률 시작-->
      <div class="tab-pane fade" id="pills-rate" role="tabpanel" aria-labelledby="pills-rate-tab">
        <b>user.Nickname</b> 님의 수익률
        <br>
        <br>
        <br>
        <table class="table table-bordered">
          <tbody>
            <tr class=tr-class>
              <th scope="row">누적순위</th>
              <td scope="row">13등</td>
            </tr>
            <tr class=tr-class>
              <th scope="row">누적수익률</th>
              <td scope="row">11.93%</td>
            </tr>
            <tr class=tr-class>
              <th scope="row">손익금액</th>
              <td scope="row">+ 1,300,000원</td>
            </tr>
            <tr class=tr-class>
              <th scope="row">투자원금</th>
              <td scope="row">10,000,000원</td>
            </tr>
          </tbody>
        </table>
      </div> 
      <!-- 수익률 끝 -->
      <!-- 계좌 시작-->
      <div class="tab-pane fade" id="pills-account" role="tabpane1" aria-labelledby="pills-account-tab">
        <b>user.Nickname</b> 님의 계좌
        <br>
        <br>
        <br>
        <table class="table table-bordered">
          <thead>
            <tr>
              <!-- th class 추후 수정 -->
              <th class="account1" scope="col">종목코드</th>
              <th class="account2" scope="col">종목명</th>
              <th class="account3" scope="col">평균매입가</th>
              <th class="account4" scope="col">현재가</th>
              <th class="account5" scope="col">보유주</th>
              <th class="account6" scope="col">평가금액</th>
              <th class="account7" scope="col">평가손익</th>
            </tr>
          </thead>
          <tbody>
	          <c:forEach items="${holdingStockList}" var="stock">
	            <tr> 
	              <td>${stock.stockCode}</td>
	              <td>${stock.stockName}</td>
	              <td>${stock.avgPrice}</td>
	              <td>27,130</td>
	              <td>${stock.quantity}</td>
	              <td>${stock.quantity*10}</td>
	              <td>+ 7,300</td>
	            </tr>
	          </c:forEach>
          </tbody>
        </table>
          <form class="form-inline my-2 my-lg-0 underSearchForm" action="/myPage02">
            <div>
              <div class="search-box">
                <input class="form-control mr-sm-2" type="search" name="accountSearch" placeholder="search" aria-label="Search" value="${accountSearch}">
                <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">
                    <i class="fas fa-search"></i></button>
              </div>   
            </div>      
          </form>
          
          <div class="paging">	
			<div class="paging-body">				
			<nav aria-label="..." class="pagination">
			    <ul class="pagination">
			
			<c:if test="${pv1.nowPage != 1}">
			      <!-- << 버튼 -->
			      <li>
			        <a class="page-link"
			          href="/myPage02?nowPage1=1&accountSearch=${accountSearch}"
			          tabindex="-1" aria-disabled="true">
			          <i class="fas fa-angle-double-left"></i>
			        </a>
			      </li>
			      <!-- 1페이지에서 < 버튼 눌렀을 때 -->
			      <c:if test="${pv1.nowPage == 1}">
			        <li>
			          <a class="page-link"
			            href="/myPage02?nowPage1=${pv1.nowPage}&accountSearch=${accountSearch}"
			            tabindex="-1" aria-disabled="true">
			            <i class="fas fa-angle-left"></i>
			          </a>
			        </li>
			      </c:if>
			</c:if>
			      
			      <!-- 1페이지가 아닌 페이지에서 < 버튼 눌렀을 때 -->
			      <c:if test="${pv1.nowPage != 1}">
			        <li>
			          <a class="page-link"
			            href="/myPage02?nowPage1=${pv1.nowPage-1}&accountSearch=${accountSearch}"
			            tabindex="-1" aria-disabled="true">
			            <i class="fas fa-angle-left"></i>
			          </a>
			        </li>
			      </c:if>
			      
			      <!-- 한번에 5개 페이지 보여줌 -->
			       <c:forEach begin="${pv1.startPage }"
			        end="${pv1.endPage }" var="p">
			        <c:choose>
			          <c:when test="${p == pv1.nowPage}">
			            <li class="page-item active" aria-current="page">
			              <a class="page-link" href="#">${p}
			                <span class="sr-only">(current)</span>
			              </a>
			            </li>
			          </c:when>
			          <c:when test="${p != pv1.nowPage}">
			            <li class="page-item">
			              <a class="page-link" href="/myPage02?nowPage1=${p}&accountSearch=${accountSearch}">${p}</a>
			            </li>
			          </c:when>
			        </c:choose>
			      </c:forEach> 
			      
			      
			      
			 	 <c:if test="${pv1.nowPage != pv1.lastPage}">    
			      <!-- 현재 페이지가 마지막 페이지일 경우 > 버튼을 눌렀을 때 -->
			      <c:if test="${pv1.nowPage == pv1.lastPage}">
			        <li>
			          <a class="page-link"
			            href="myPage02?nowPage1=${pv1.nowPage}&accountSearch=${accountSearch}"
			            tabindex="+1" aria-disabled="true">
			            <i class="fas fa-angle-right"></i>
			          </a>
			        </li>
			      </c:if>
			      
			      <!-- 현재 페이지가 마지막 페이지가 아닐 경우에 > 버튼을 눌렀을 때 -->					
			      <c:if test="${pv1.nowPage != pv1.lastPage}">
			        <li>
			          <a class="page-link"
			            href="/myPage02?nowPage1=${pv1.nowPage+1}&accountSearch=${accountSearch}"
			            tabindex="+1" aria-disabled="true" data-ajax="false">
			            <i class="fas fa-angle-right"></i>
			          </a>
			        </li>
			      </c:if> 
			
			      <!-- >> 버튼 -->
			      <li>
			        <a class="page-link"
			        href="/myPage02?nowPage1=${pv1.lastPage}&accountSearch=${accountSearch}"
			        tabindex="-1" aria-disabled="true">
			          <i class="fas fa-angle-double-right"></i>
			        </a>
			      </li>
			      
			      </c:if>
			    </ul>
			  </nav>
			 </div>
			<!-- 
   			<div class="paging">
				<div class="paging-body">
					<ul class="pagination" id="pagination"></ul>
				</div>
			</div>
			 -->
      </div>
      </div>
      <!-- 계좌 끝 -->
      <!-- 거래내역 시작 -->
      <div class="tab-pane fade" id="pills-trade-history" role="tabpane" aria-labelledby="pills-trade-history-tab">
        <b>user.Nickname</b> 님의 거래내역
        <br>
        <br>
        <br>
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
          <li class="nav-item" role="presentation">
            <a class="nav-link active" id="pills-date-tab" data-toggle="pill" href="#pills-date" role="tab" aria-controls="pills-date" aria-selected="true">날짜별</a>
          </li>
          <li class="nav-item" role="presentation">
            <a class="nav-link" id="pills-category-tab" data-toggle="pill" href="#pills-category" role="tab" aria-controls="pills-category" aria-selected="false">종목별</a>
          </li>
        </ul>
          <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-date" role="second-tabpanel" aria-labelledby="pills-dete-tab">
              <!-- 날짜별 검색 시작 -->
              <form action="/myPage02">
              <table class="table table-date-bordered">
                <thead>
                  <!-- 달력 시작 -->
                  <tr class="category-search-article">
                    <div class="calendar">
                      <div class='col-md-3 col-xs-4'>
                        <div class="form-group">
                            <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
                                  <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" name="startDate" value="${startDate}">
                                <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>
                      </div>
                    <div class='col-md-3 col-xs-4'>
                        <div class="form-group">
                            <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
                                  <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2" name="endDate" value="${endDate}">
                                <div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
                    </div>
                  </tr>
                  <!-- 달력 끝 -->
                  <tr>
                    <!-- th class 추후 수정 -->
                    <th class="date-search-date1" scope="col">거래일자</th>
                    <th class="date-search-date2" scope="col">종목번호</th>
                    <th class="date-search-date3" scope="col">수량</th>
                    <th class="date-search-date4" scope="col">거래금액</th>
                    <th class="date-search-date5" scope="col">단가</th>
                    <th class="date-search-date6" scope="col">세금</th>
                  </tr>
                  <c:forEach items="${stockHistoryListByDate}" var="stock">
                  <tr>
                    <td>${stock.tdatetime}</td>
                    <td>${stock.stockName}</td>
                    <td>${stock.quantity}</td>
                    <td>${stock.tprice*stock.quantity}</td>
                    <td>${stock.tprice}</td>
                    <td>${stock.tprice*stock.quantity*0.0025}</td>
                  </tr>
                  </c:forEach>
                </thead>
              </table>
              </form>
              <div class="paging">	
			<div class="paging-body">				
			<nav aria-label="..." class="pagination">
			    <ul class="pagination">
			
			<c:if test="${pv2.nowPage != 1}">
			      <!-- << 버튼 -->
			      <li>
			        <a class="page-link"
			          href="/myPage02?nowPage2=1&startDate=${startDate}&endDate=${endDate}"
			          tabindex="-1" aria-disabled="true">
			          <i class="fas fa-angle-double-left"></i>
			        </a>
			      </li>
			      <!-- 1페이지에서 < 버튼 눌렀을 때 -->
			      <c:if test="${pv2.nowPage == 1}">
			        <li>
			          <a class="page-link"
			            href="/myPage02?nowPage2=${pv2.nowPage}&startDate=${startDate}&endDate=${endDate}"
			            tabindex="-1" aria-disabled="true">
			            <i class="fas fa-angle-left"></i>
			          </a>
			        </li>
			      </c:if>
			</c:if>
			      
			      <!-- 1페이지가 아닌 페이지에서 < 버튼 눌렀을 때 -->
			      <c:if test="${pv2.nowPage != 1}">
			        <li>
			          <a class="page-link"
			            href="/myPage02?nowPage2=${pv2.nowPage-1}&startDate=${startDate}&endDate=${endDate}"
			            tabindex="-1" aria-disabled="true">
			            <i class="fas fa-angle-left"></i>
			          </a>
			        </li>
			      </c:if>
			      
			      <!-- 한번에 5개 페이지 보여줌 -->
			       <c:forEach begin="${pv2.startPage }"
			        end="${pv2.endPage }" var="p">
			        <c:choose>
			          <c:when test="${p == pv2.nowPage}">
			            <li class="page-item active" aria-current="page">
			              <a class="page-link" href="#">${p}
			                <span class="sr-only">(current)</span>
			              </a>
			            </li>
			          </c:when>
			          <c:when test="${p != pv2.nowPage}">
			            <li class="page-item">
			              <a class="page-link" href="/myPage02?nowPage2=${p}&startDate=${startDate}&endDate=${endDate}">${p}</a>
			            </li>
			          </c:when>
			        </c:choose>
			      </c:forEach> 
			      
			      
			      
			 	 <c:if test="${pv2.nowPage != pv2.lastPage}">    
			      <!-- 현재 페이지가 마지막 페이지일 경우 > 버튼을 눌렀을 때 -->
			      <c:if test="${pv2.nowPage == pv2.lastPage}">
			        <li>
			          <a class="page-link"
			            href="myPage02?nowPage2=${pv2.nowPage}&startDate=${startDate}&endDate=${endDate}"
			            tabindex="+1" aria-disabled="true">
			            <i class="fas fa-angle-right"></i>
			          </a>
			        </li>
			      </c:if>
			      
			      <!-- 현재 페이지가 마지막 페이지가 아닐 경우에 > 버튼을 눌렀을 때 -->					
			      <c:if test="${pv2.nowPage != pv2.lastPage}">
			        <li>
			          <a class="page-link"
			            href="/myPage02?nowPage2=${pv2.nowPage+1}&startDate=${startDate}&endDate=${endDate}"
			            tabindex="+1" aria-disabled="true" data-ajax="false">
			            <i class="fas fa-angle-right"></i>
			          </a>
			        </li>
			      </c:if> 
			
			      <!-- >> 버튼 -->
			      <li>
			        <a class="page-link"
			        href="/myPage02?nowPage2=${pv2.lastPage}&startDate=${startDate}&endDate=${endDate}"
			        tabindex="-1" aria-disabled="true">
			          <i class="fas fa-angle-double-right"></i>
			        </a>
			      </li>
			      
			      </c:if>
			    </ul>
			  </nav>
			 </div>
			 </div>
            </div>
              <!-- 날짜별 검색 끝 -->
              <!-- 종목별 검색 시작 -->
            <div class="tab-pane fade show" id="pills-category" role="second-tabpane2" aria-labelledby="pills-category-tab">
               <form action="/myPage02">
                <table class="table table-date-bordered">
                  <thead>
                    <tr class="category-search-article">
                      <div class="category-search">
                      <input class="form-control mr-sm-2 category-search-box" type="search" placeholder="종목검색" name="tradeSearch" aria-label="Search" value="${tradeSearch}">
                        <button class="btn btn-outline-secondary my-2 my-sm-0 " type="submit"><i class="fas fa-search"></i></button>
                      </div> 
                    </tr>
                    <tr>
                      <!-- th class 추후 수정 -->
                      <th class="date-search-category1" scope="col">거래일자</th>
                      <th class="date-search-category2" scope="col">종목번호</th>
                      <th class="date-search-category3" scope="col">수량</th>
                      <th class="date-search-category4" scope="col">거래금액</th>
                      <th class="date-search-category5" scope="col">단가</th>
                      <th class="date-search-category6" scope="col">세금</th>
                    </tr>
                  <c:forEach items="${stockHistoryListByStock}" var="stock">
   		            <tr>
        	            <td>${stock.tdatetime}</td>
            	        <td>${stock.stockName}</td>
                	    <td>${stock.quantity}</td>
                    	<td>${stock.tprice*stock.quantity}</td>
                    	<td>${stock.tprice}</td>
                    	<td>${stock.tprice*stock.quantity*0.0025}</td>
                  	</tr>
                  </c:forEach>
                  </thead>
                </table>
                </form>
           <div class="paging">	
			<div class="paging-body">				
			<nav aria-label="..." class="pagination">
			    <ul class="pagination">
			
			<c:if test="${pv3.nowPage != 1}">
			      <!-- << 버튼 -->
			      <li>
			        <a class="page-link"
			          href="/myPage02?nowPage3=1&tradeSearch=${tradeSearch}"
			          tabindex="-1" aria-disabled="true">
			          <i class="fas fa-angle-double-left"></i>
			        </a>
			      </li>
			      <!-- 1페이지에서 < 버튼 눌렀을 때 -->
			      <c:if test="${pv3.nowPage == 1}">
			        <li>
			          <a class="page-link"
			            href="/myPage02?nowPage3=${pv3.nowPage}&tradeSearch=${tradeSearch}"
			            tabindex="-1" aria-disabled="true">
			            <i class="fas fa-angle-left"></i>
			          </a>
			        </li>
			      </c:if>
			</c:if>
			      
			      <!-- 1페이지가 아닌 페이지에서 < 버튼 눌렀을 때 -->
			      <c:if test="${pv3.nowPage != 1}">
			        <li>
			          <a class="page-link"
			            href="/myPage02?nowPage3=${pv3.nowPage-1}&tradeSearch=${tradeSearch}"
			            tabindex="-1" aria-disabled="true">
			            <i class="fas fa-angle-left"></i>
			          </a>
			        </li>
			      </c:if>
			      
			      <!-- 한번에 5개 페이지 보여줌 -->
			       <c:forEach begin="${pv3.startPage }"
			        end="${pv3.endPage }" var="p">
			        <c:choose>
			          <c:when test="${p == pv3.nowPage}">
			            <li class="page-item active" aria-current="page">
			              <a class="page-link" href="#">${p}
			                <span class="sr-only">(current)</span>
			              </a>
			            </li>
			          </c:when>
			          <c:when test="${p != pv3.nowPage}">
			            <li class="page-item">
			              <a class="page-link" href="/myPage02?nowPage3=${p}&tradeSearch=${tradeSearch}">${p}</a>
			            </li>
			          </c:when>
			        </c:choose>
			      </c:forEach> 
			      
			      
			      
			 	 <c:if test="${pv3.nowPage != pv3.lastPage}">    
			      <!-- 현재 페이지가 마지막 페이지일 경우 > 버튼을 눌렀을 때 -->
			      <c:if test="${pv3.nowPage == pv3.lastPage}">
			        <li>
			          <a class="page-link"
			            href="myPage02?nowPage3=${pv3.nowPage}&tradeSearch=${tradeSearch}"
			            tabindex="+1" aria-disabled="true">
			            <i class="fas fa-angle-right"></i>
			          </a>
			        </li>
			      </c:if>
			      
			      <!-- 현재 페이지가 마지막 페이지가 아닐 경우에 > 버튼을 눌렀을 때 -->					
			      <c:if test="${pv3.nowPage != pv3.lastPage}">
			        <li>
			          <a class="page-link"
			            href="/myPage02?nowPage3=${pv3.nowPage+1}&tradeSearch=${tradeSearch}"
			            tabindex="+1" aria-disabled="true" data-ajax="false">
			            <i class="fas fa-angle-right"></i>
			          </a>
			        </li>
			      </c:if> 
			
			      <!-- >> 버튼 -->
			      <li>
			        <a class="page-link"
			        href="/myPage02?nowPage3=${pv3.lastPage}&tradeSearch=${tradeSearch}"
			        tabindex="-1" aria-disabled="true">
			          <i class="fas fa-angle-double-right"></i>
			        </a>
			      </li>
			      
			      </c:if>
			    </ul>
			  </nav>
			 </div>
			 </div>
            </div>
            <!-- 종목별 검색 끝 -->
          </div>
      </div>
      <!-- 거래내역 끝 -->
    </div> 
  </article>
<!-- article end -->

	<%@include file="mainfooter.jsp" %>

</body>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
<script src="/resources/jpaginate/jquery.twbsPagination.js" type="text/javascript"></script>
</html>