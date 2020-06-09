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
<link href="/resources/css/mypage04.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
  $(document).ready(function(){
    $("#jb-checkboxAll").click(function(){
        if($("#jb-checkboxAll").prop("checked")){
            $(".check").prop("checked",true);
        }else{
            $(".check").prop("checked",false);
        }
    })
    $(".remove").click(function(){
          if(confirm("정말로 삭제하시겠습니까?")){
            alert("jS구성하기");
          }else{
            alert("취소하셨습니다.");
          }
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
  	$(function() {
  		window.pagObj = $('#pagination2').twbsPagination({
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
.paging-body{margin-left:300px; margin-bottom: 300px;}
td > a{cursor:pointer}
</style>
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
            <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed mypage02" onclick="location.href='mypage02.jsp'">
              <div>
                <h6 class="my-0">계좌정보</h6>
              </div>
            </li>
            <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed mypage03" onclick="location.href='mypage03.jsp'" >
              <div>
                <h6 class="my-0">작성 글, 댓글</h6>
              </div>
            </li>
            <li class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed mypage04" onclick="location.href='mypage04.jsp'">
              <div>
                <h6 class="my-0">알림</h6>
              </div>
            </li>
          </ul>
        </div>
        <!-- section end -->
<!-- section start -->
<!-- section end -->
<!-- article start -->
	<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
      <li class="nav-item" role="presentation">
        <a class="nav-link active" id="pills-trade-success-tab" data-toggle="pill" href="#pills-trade-success" 
        role="tab" aria-controls="pills-trade-success" aria-selected="true">거래 체결</a>
      </li>
      <li class="nav-item" role="presentation">
        <a class="nav-link" id="pills-board-notice-tab" data-toggle="pill" href="#pills-board-notice" 
        role="tab" aria-controls="pills-board-notice" aria-selected="false">게시판 알림</a>
      </li>
    </ul>
    <!-- 거래체결  -->
    <div class="tab-content" id="pills-tabContent">
      <div class="tab-pane fade show active" id="pills-trade-success" role="tabpanel" aria-labelledby="pills-trade-success-tab" style="margin-bottom: 300px;">
      	<article class="bg-light container">
         <div class="allBody">
        	<div class="row">
          		 <div class="sideBar col-md-4 order-md-2 mb-4">
            		<div class="col-md-8 order-md-1"></div>
          			  <h4 class="mb-3">알림</h4>
         		 </div>
      		</div>
     	 </div>
        <table class="table table-bordered">
          <thead>
            <tr>
              <td class="checkno"><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkboxAll" class="custom-control-input"><label class="custom-control-label" for="jb-checkboxAll"></label></div></td>
              <th class="no" scope="col">번호</th>
              <th class="title" scope="col">알림제목</th>
            </tr>
          </thead>
          <tbody>
            <tr> 
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox1" class="custom-control-input check"><label class="custom-control-label" for="jb-checkbox1"></label></div></td>
              <th scope="row">7</th>
              <td><a onclick="window.location.href='alarm-detail.jsp'">거래 체결</a></td>
            </tr>
       	</table>
          <form class="form-inline my-2 my-lg-0 underSearchForm">
              <div><button class="btn btn-primary btn-lg btn-block remove" type="submit">삭제</button></div>
          </form>
        <div class="paging">
			<div class="paging-body">
				<ul class="pagination" id="pagination2"></ul>
			</div>
    	</div>
       </article>
      </div>
    <!-- 거래체결 end -->
    <!-- 게시판 알림  -->
      <div class="tab-pane fade show active" id="pills-board-notice" role="tabpanel" aria-labelledby="pills-board-notice-tab" style="margin-bottom: 300px;">
      	<article class="bg-light container">
         <div class="allBody">
        	<div class="row">
          		 <div class="sideBar col-md-4 order-md-2 mb-4">
            		<div class="col-md-8 order-md-1"></div>
          			  <h4 class="mb-3">알림</h4>
         		 </div>
      		</div>
     	 </div>
        <table class="table table-bordered">
          <thead>
            <tr>
              <td class="checkno"><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkboxAll" class="custom-control-input"><label class="custom-control-label" for="jb-checkboxAll"></label></div></td>
              <th class="no" scope="col">번호</th>
              <th class="title" scope="col">알림제목</th>
            </tr>
          </thead>
          <tbody>
            <tr> 
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox1" class="custom-control-input check"><label class="custom-control-label" for="jb-checkbox1"></label></div></td>
              <th scope="row">7</th>
              <td><a onclick="window.location.href='alarm-detail.jsp'">게시판 알림</a></td>
            </tr>
       	</table>
          <form class="form-inline my-2 my-lg-0 underSearchForm">
              <div><button class="btn btn-primary btn-lg btn-block remove" type="submit">삭제</button></div>
          </form>
        <div class="paging">
			<div class="paging-body">
				<ul class="pagination" id="pagination"></ul>
			</div>
    	</div>
       </article>
      </div>
    </div>
    <!-- 게시판 알림 end -->
      
<!-- article end -->
<!-- footer start -->
    <div class=footer_div>
        <footer class="footer_info">
              <p><a href="https://www.naver.com">회사소개</a>  |  <a href="https://www.google.co.kr">광고안내</a>  |  <a href="https://www.naver.com">이용약관</a>  |  <a href="https://www.google.co.kr"><strong>개인정보처리방침</strong></a></p>
              <p>Copyright ⓒ 2020 - 2020 stock gallery. All rights reserved.</p>
        </footer>
    </div>
<!-- footer end --> 
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- paginate -->
<script src="/resources/jpaginate/jquery.twbsPagination.js" type="text/javascript"></script>
</html>