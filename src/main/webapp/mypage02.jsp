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
});
</script>
</head>
<body>
    <!-- header start -->
    <header>
        <!-- 상단  nav -->
        <ul class="nav justify-content-end top-nav">
            <li class="breadcrumb-item"><a id="top-nav-font" href="#">로그인</a></li>
            <li class="breadcrumb-item"><a id="top-nav-font" href="#">회원가입</a></li>
        </ul>
        <!-- 상단  nav end -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-custom">
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
    </header>
    <!-- header end -->
    <!-- section start -->
    <div class="sideBar col-md-4 order-md-2 mb-4" id="menu-bar">
      <ul class="list-group mb-3">
        <!-- java에서 온클릭 위치 바꾸기!!!!!!!!!!!!!!!!!!!-->
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed mypage01" onclick="location.href='mypage01.jsp'">
          <div> 
            <h6 class="my-0">내정보</h6>
          </div>
        </li>
        <li class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed mypage02" onclick="location.href='mypage02.jsp'">
          <div>
            <h6 class="my-0">계좌정보</h6>
          </div>
        </li>
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed mypage03" onclick="location.href='mypage03.jsp'" >
          <div>
            <h6 class="my-0">작성 글, 댓글</h6>
          </div>
        </li>
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed mypage04" onclick="location.href='mypage04.jsp'">
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
         <div class="chart-div" style="border:1px solid #dee2e6; margin-bottom: 60px;">
         		<%@include file="Chart_minSC.jsp" %>
         </div>
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
            <tr> 
              <td>1033</td>
              <td>세틀뱅크</td>
              <td>25,920</td>
              <td>27,130</td>
              <td>3</td>
              <td>28,300</td>
              <td>+ 7,300</td>
            </tr>
            <tr>
              <th></th>
              <td>뮤직뱅크</td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <th></th>
              <td>인기가요</td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <th></th>
              <td>쇼음악중심</td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
          </tbody>
        </table>
          <form class="form-inline my-2 my-lg-0 underSearchForm">
            <div>
              <div class="search-box">
                <input class="form-control mr-sm-2" type="search" placeholder="search" aria-label="Search">
                <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">
                    <i class="fas fa-search"></i></button>
              </div>   
              <nav aria-label="..." class="pagination">
                <ul class="pagination">
                  <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">◀</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item active" aria-current="page"><a class="page-link" href="#">2 <span class="sr-only">(current)</span></a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">4</a></li>
                  <li class="page-item"><a class="page-link" href="#">5</a></li>
                  <li class="page-item disabled"><a class="page-link" href="#" tabindex="+1" aria-disabled="true">▶</a></li>
                </ul>
              </nav>
            </div>      
          </form>
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
              <table class="table table-date-bordered">
                <thead>
                  <!-- 달력 시작 -->
                  <tr class="category-search-article">
                    <div class="calendar">
                      <div class='col-md-3 col-xs-4'>
                        <div class="form-group">
                            <div class="input-group date" id="datetimepicker1" data-target-input="nearest">
                                  <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" value="05/25/2020">
                                <div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker">
                                    <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                                </div>
                            </div>
                        </div>
                      </div>
                    <div class='col-md-3 col-xs-4'>
                        <div class="form-group">
                            <div class="input-group date" id="datetimepicker2" data-target-input="nearest">
                                  <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2" value="05/30/2020">
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
                  <tr>
                    <td>2020.05.25</td>
                    <td>1030</td>
                    <td>3</td>
                    <td>3,000</td>
                    <td>1,000</td>
                    <td>50</td>
                  </tr>
                  <tr>
                    <td>2020.05.25</td>
                    <td>1030</td>
                    <td>3</td>
                    <td>3,000</td>
                    <td>1,000</td>
                    <td>50</td>
                  </tr>
                  <tr>
                    <td>2020.05.25</td>
                    <td>1030</td>
                    <td>3</td>
                    <td>3,000</td>
                    <td>1,000</td>
                    <td>50</td>
                  </tr>
                </thead>
              </table>
            </div>
              <!-- 날짜별 검색 끝 -->
              <!-- 종목별 검색 시작 -->
            <div class="tab-pane fade show" id="pills-category" role="second-tabpane2" aria-labelledby="pills-category-tab">
                <table class="table table-date-bordered">
                  <thead>
                    <tr class="category-search-article">
                      <div class="category-search">
                      <input class="form-control mr-sm-2 category-search-box" type="search" placeholder="종목검색" aria-label="Search">
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
                    <tr>
                      <td>2020.05.25</td>
                      <td>1030</td>
                      <td>3</td>
                      <td>3,000</td>
                      <td>1,000</td>
                      <td>50</td>
                    </tr>
                    <tr>
                      <td>2020.05.25</td>
                      <td>1030</td>
                      <td>3</td>
                      <td>3,000</td>
                      <td>1,000</td>
                      <td>50</td>
                    </tr>
                    <tr>
                      <td>2020.05.25</td>
                      <td>1030</td>
                      <td>3</td>
                      <td>3,000</td>
                      <td>1,000</td>
                      <td>50</td>
                    </tr>
                  </thead>
                </table>
            </div>
            <!-- 종목별 검색 끝 -->
          </div>
      </div>
      <!-- 거래내역 끝 -->
    </div>  
  </article>
<!-- article end -->
<!-- footer start -->
    <div class=footer_div>
        <footer class="footer_info">
              <p><a href="https://www.naver.com">회사소개</a>  |  <a href="https://www.google.co.kr">광고안내</a>  |  <a href="https://www.naver.com">이용약관</a>  |  <a href="https://www.google.co.kr"><b>개인정보처리방침</b></a></p>
              <p>Copyright ⓒ 2020 - 2020 stock gallery. All rights reserved.</p>
        </footer>
    </div>
<!-- footer end --> 
</body>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
</html>