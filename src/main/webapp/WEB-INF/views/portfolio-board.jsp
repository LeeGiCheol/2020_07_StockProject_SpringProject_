<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>포트폴리오 게시판</title>
  <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/album/">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <!-- css file -->
  <link href="/resources/css/portfolio-board.css" rel="stylesheet">
  <!-- 폰트어썸 cdn -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">

<script>
$(document).ready(function(){
	$(function() {
		window.pagObj = $('#pagination-all').twbsPagination({
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
		window.pagObj = $('#pagination-best').twbsPagination({
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
</head>
<body>

<%@include file="mainheader.jsp" %> 

  <!-- 상단 메뉴 -->
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
    <div class="sideBar col-md-4 order-md-2 mb-4" id="menu-bar">
      <ul class="list-group mb-3">
        <!-- java에서 온클릭 위치 바꾸기!!!!!!!!!!!!!!!!!!!-->
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed free-board" onclick="location.href='free-board.jsp'">
          <div> 
            <h6 class="my-0">자유 게시판</h6>
          </div>
        </li>
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed news-borad" onclick="location.href='newboard.jsp'">
          <div>
            <h6 class="my-0">뉴스 게시판</h6>
          </div>
        </li>
        <li class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed protfolio-board" onclick="location.href='portfolio-board.jsp'" >
          <div>
            <h6 class="my-0">포트폴리오 게시판</h6>
          </div>
        </li>
      </ul>
    </div>
   <!-- 상단 메뉴 끝 --> 
  <!-- article -->
  <article class="bg-light container">
    <main role="main">
        <div class="allbody">
           <div class="row" style="margin-top:-40px;">
	        <div class="sidebar-header col-md-4 order-md-2 mb-4">
	            <div class="col-md-8 order-md-1"></div>
		          <h4 class="mb-3">포트폴리오 게시판</h4>
		        </div>
	 	    </div>	
          <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <li class="nav-item" role="presentation">
              <a class="nav-link active" id="pills-all-tab" data-toggle="pill" href="#pills-all" role="tab" aria-controls="pills-all" aria-selected="true">전체글</a>
            </li>
            <li class="nav-item" role="presentation">
              <a class="nav-link" id="pills-best-tab" data-toggle="pill" href="#pills-best" role="tab" aria-controls="pills-best" aria-selected="false">인기글</a>
            </li>
          </ul>
          <!-- Tab Menu -->
          <div class="tab-content" id="pills-tabContent">
            <!-- 전체글 -->
            <div class="tab-pane fade show active" id="pills-all" role="tabpanel" aria-labelledby="pills-all-tab" style="margin-bottom: 300px;">
            <!-- 1row -->
              <div class="row" style="margin-bottom: 30px;">
                <!-- 1set -->
                <div class="col-md-4">
                  <div class="card mb-4 shadow-sm">
                    <img src="/resources/img/portfolio2.png" style="width:337px; height:auto; border-bottom: 1px dotted #5a6268;"><!-- 사진 -->
                    <div class="card-body">
                      <p class="card-text"></p>
                      <div class="d-flex justify-content-between align-items-center">
                        <ul class="notice-info">
                            <li class="author"><i class="fa fa-user-circle"></i> #홍길동</li>
                		    <li class="date"><i class="fas fa-stopwatch"></i> #2020.05.27</li>
                		    <li class="likes"><i class="fas fa-thumbs-up"></i> #3</li>
                		    <li class="views"><i class="fas fa-eye"></i> #27</li>
                		    <button type="button" class="btn btn-sm btn-outline-secondary like-button">좋아요</button>
                		</ul>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- 1set end --><!-- 1개씩 더 추가할시 set별로 추가 -->
                         <!-- 1set -->
                <div class="col-md-4">
                  <div class="card mb-4 shadow-sm">
                    <img src="/resources/img/portfolio1.jpg" style="width:337px; height:auto; border-bottom: 1px dotted #5a6268;"><!-- 사진 -->
                    <div class="card-body">
                      <p class="card-text"></p>
                      <div class="d-flex justify-content-between align-items-center">
                        <ul class="notice-info">
                            <li class="author"><i class="fa fa-user-circle"></i> #홍길동</li>
                		    <li class="date"><i class="fas fa-stopwatch"></i> #2020.05.27</li>
                		    <li class="likes"><i class="fas fa-thumbs-up"></i> #3</li>
                		    <li class="views"><i class="fas fa-eye"></i> #27</li>
                		    <button type="button" class="btn btn-sm btn-outline-secondary like-button">좋아요</button>
                		</ul>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- 1set end --><!-- 1개씩 더 추가할시 set별로 추가 -->
              </div>
              <!-- 1row end -->
              <!-- searchForm -->
 		 <form class="form-inline my-2 my-lg-0 underSearchForm">
	          <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a>
		          <div class="dropdown-menu" aria-labelledby="dropdown01">
		            <a class="dropdown-item" href="#">제목</a>
		            <a class="dropdown-item" href="#">내용</a>
		            <a class="dropdown-item" href="#">제목 + 내용</a>
		            <a class="dropdown-item" href="#">글쓴이</a>
		          </div>
             <input class="form-control mr-sm-2" type="search" placeholder="search" aria-label="Search">
             <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit"> <i class="fas fa-search"></i></button>
            <div class="buttons">
	            <button class="btn btn-primary btn-lg btn-block add" type="button" onclick="location.href='portfolio-writeForm.jsp'">작성</button>
          	</div>             
          </form>
             <!-- searchForm end -->
              <!-- paging -->
	            <div class="paging">
					<div class="paging-body">
						<ul class="pagination" id="pagination-all"></ul>
					</div>
	    		</div>
	    	  <!-- paging end-->	
            </div>
            <!-- 전체글 end-->
            <!-- 인기글 -->
            <div class="tab-pane fade" id="pills-best" role="tabpanel" aria-labelledby="pills-best-tab" style="margin-bottom: 300px;">
               <!-- 1row -->
               <div class="row" style="margin-bottom: 30px;">
                <!-- 1set -->
                <div class="col-md-4">
                  <div class="card mb-4 shadow-sm">
                    <img src="/resources/img/portfolio1.jpg" style="width:337px; height:auto; border-bottom: 1px dotted #5a6268;"><!-- 사진 -->
                    <div class="card-body">
                      <p class="card-text"></p>s
                      <div class="d-flex justify-content-between align-items-center">
                        <ul class="notice-info">
                            <li class="author"><i class="fa fa-user-circle"></i> #홍길동</li>
                		    <li class="date"><i class="fas fa-stopwatch"></i> #2020.05.27</li>
                		    <li class="likes"><i class="fas fa-thumbs-up"></i> #3</li>
                		    <li class="views"><i class="fas fa-eye"></i> #27</li>
                		    <button type="button" class="btn btn-sm btn-outline-secondary like-button">좋아요</button>
                		</ul>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- 1set end --><!-- 1개씩 더 추가할시 set별로 추가 -->
              </div>
              <!-- 1row end -->
          <form class="form-inline my-2 my-lg-0 underSearchForm">
	          <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a>
		          <div class="dropdown-menu" aria-labelledby="dropdown01">
		            <a class="dropdown-item" href="#">제목</a>
		            <a class="dropdown-item" href="#">내용</a>
		            <a class="dropdown-item" href="#">제목 + 내용</a>
		            <a class="dropdown-item" href="#">글쓴이</a>
		          </div>
             <input class="form-control mr-sm-2" type="search" placeholder="search" aria-label="Search">
             <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit"> <i class="fas fa-search"></i></button>
          </form>
              <!-- paging -->
	            <div class="paging">
					<div class="paging-body">
						<ul class="pagination" id="pagination-best"></ul>
					</div>
	    		</div>
	    	  <!-- paging end-->	
            </div>
            <!-- 인기글 end -->
          </div>
        <!-- Tab Menu end -->
       </div>
  </main>
</article>  
<!-- article end -->

<%@include file="mainfooter.jsp" %>	

</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- paginate -->
<script src="/resources/jpaginate/jquery.twbsPagination.js" type="text/javascript"></script>
</html>