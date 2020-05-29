<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- CSS파일 -->
<link href="/resources/css/free-board.css" rel="stylesheet">
<style>
.buttons{display: -webkit-box;margin-left: -30px; font-size: 1px;}
.add{width: 75px; height: 40px; font-size: 16px; margin-left: 233px;}
.remove{margin-top: 0rem; margin-left:10px;}
.btn-block+.btn-block{margin-top:0rem;}
</style>
<script>
  $(document).ready(function(){
      $("#jb-checkboxAll-best").click(function(){
          if($("#jb-checkboxAll-best").prop("checked")){
              $(".check-best").prop("checked",true);
          }else{
              $(".check-best").prop("checked",false);
          }
      })
      $("#jb-checkboxAll").click(function(){	
          if($("#jb-checkboxAll").prop("checked")){
            $(".check").prop("checked",true);
          }else{  
            $(".check").prop("checked",false);
          }
      })
      $(".remove").click(function(){
          if(confirm("정말로 삭제하시겠습니까?")){
            alert('JS구성하기');
          }else{
            alert("취소하셨습니다.");
          }
        })
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
        <li class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed free-board" onclick="location.href='free_board.jsp'">
          <div> 
            <h6 class="my-0">자유 게시판</h6>
          </div>
        </li>
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed news-borad" onclick="location.href='#'">
          <div>
            <h6 class="my-0">뉴스 게시판</h6>
          </div>
        </li>
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed protfolio-board" onclick="location.href='#'" >
          <div>
            <h6 class="my-0">포트폴리오 게시판</h6>
          </div>
        </li>
      </ul>
    </div>
    <!-- article start -->
    <article class="bg-light container">
    <div class="allBody">
    <div class="row">
        <div class="sidebar-header col-md-4 order-md-2 mb-4">
          <div class="col-md-8 order-md-1"></div>
          <h4 class="mb-3">자유게시판</h4>
        </div>
    </div>
    <!-- 게시판 -->
    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
      <li class="nav-item" role="presentation">
        <a class="nav-link active" id="pills-board-all-tab" data-toggle="pill" href="#pills-board-all" role="tab" aria-controls="pills-board-all" aria-selected="true">전체글</a>
      </li>
      <li class="nav-item" role="presentation">
        <a class="nav-link" id="pills-board-best-tab" data-toggle="pill" href="#pills-board-best" role="tab" aria-controls="pills-board-best" aria-selected="false">인기글</a>
      </li>
    </ul>
    <div class="tab-content" id="pills-tabContent">
      <div class="tab-pane fade show active" id="pills-board-all" role="tabpanel" aria-labelledby="pills-board-all-tab" style="margin-bottom: 300px;">
        <!-- 전체글 -->
        <table class="table table-bordered">
          <thead>
            <tr>
              <td class="checkno"><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkboxAll" class="custom-control-input"><label class="custom-control-label" for="jb-checkboxAll"></label></div></td>
              <th class="no" scope="col">번호</th>
              <th class="title" scope="col">글제목</th>
              <th class="writer" scope="col">글쓴이</th>
              <th class="date" scope="col">작성일</th>
              <th class="views" scope="col">조회</th>
              <th class="likes" scope="col">추천</th>
            </tr>
          </thead>
          <tbody>
	          <c:forEach var="board" items="${board}">
	            <tr> 
	              <td><div class="custom-control custom-checkbox">
	                <input type="checkbox" id="jb-checkbox1" class="custom-control-input check"><label class="custom-control-label" for="jb-checkbox1"></label></div></td>
	              <th scope="row">${board.pno}</th> <!-- 글번호 -->
	              <td><a onclick="window.location.href='free-board-detail.jsp'">${board.title}</a></td> <!-- 글 제목 -->
	              <td>${board.nickname}</td> 	  <!-- 글쓴이 -->
	              <td>${board.bdatetime}</td> 	  <!-- 날짜 --> 
	              <td>${board.views}</td>		  <!-- 조회수 -->
	              <td>${board.likes}</td>		  <!-- 추천수 -->
	            </tr>
	           </c:forEach>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox2" class="custom-control-input check"><label class="custom-control-label" for="jb-checkbox2"></label></div></td>
              <th scope="row">4</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox3" class="custom-control-input check"><label class="custom-control-label" for="jb-checkbox3"></label></div></td>
              <th scope="row">3</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox4" class="custom-control-input check"><label class="custom-control-label" for="jb-checkbox4"></label></div></td>
              <th scope="row">2</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox5" class="custom-control-input check"><label class="custom-control-label" for="jb-checkbox5"></label></div></td>
              <th scope="row">1</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
          </tbody>
        </table>
        <br>
       <form class="form-inline my-2 my-lg-0 underSearchForm">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="#">제목</a>
          <a class="dropdown-item" href="#">내용</a>
          <a class="dropdown-item" href="#">제목 + 내용</a>
          <a class="dropdown-item" href="#">글쓴이</a>
        </div>
          <input class="form-control mr-sm-2" type="search" placeholder="search" aria-label="Search">
          <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit"><i class="fas fa-search"></i></button>
          <div class="buttons">
            <button class="btn btn-primary btn-lg btn-block add" type="button" onclick="location.href='writeForm.jsp'">작성</button>
            <button class="btn btn-primary btn-lg btn-block remove" type="button">삭제</button>
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
        </form>
      </div>
      <!-- 인기글 -->
      <div class="tab-pane fade" id="pills-board-best" role="tabpanel" aria-labelledby="pills-board-best-tab" style="margin-bottom: 300px;">
        <table class="table table-bordered">
          <thead>
            <tr>
              <td class="checkno"><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkboxAll-best" class="custom-control-input"><label class="custom-control-label" for="jb-checkboxAll-best"></label></div></td>
              <th class="no" scope="col">번호</th>
              <th class="title" scope="col">글제목</th>
              <th class="writer" scope="col">글쓴이</th>
              <th class="date" scope="col">작성일</th>
              <th class="views" scope="col">조회</th>
              <th class="likes" scope="col">추천</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox1-best" class="custom-control-input check-best"><label class="custom-control-label" for="jb-checkbox1-best"></label></div></td>
              <th scope="row">5</th>
              <td><a onclick="window.location.href='free-board-detail.jsp'">이 글은 테스트용 인기글입니다.</a></td>
              <td>글쓴이</td>
              <td>2020.05.21</td>
              <td>270</td>
              <td>30</td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox2-best" class="custom-control-input check-best"><label class="custom-control-label" for="jb-checkbox2-best"></label></div></td>
              <th scope="row">4</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox3-best" class="custom-control-input check-best"><label class="custom-control-label" for="jb-checkbox3-best"></label></div></td>
              <th scope="row">3</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox4-best" class="custom-control-input check-best"><label class="custom-control-label" for="jb-checkbox4-best"></label></div></td>
              <th scope="row">2</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox5-best" class="custom-control-input check-best"><label class="custom-control-label" for="jb-checkbox5-best"></label></div></td>
              <th scope="row">1</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
          </tbody>
        </table>
        <br>
        <form class="form-inline my-2 my-lg-0 underSearchForm">
          <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a>
          <div class="dropdown-menu" aria-labelledby="dropdown01">
            <a class="dropdown-item" href="#">제목</a>
            <a class="dropdown-item" href="#">내용</a>
            <a class="dropdown-item" href="#">제목 + 내용</a>
            <a class="dropdown-item" href="#">글쓴이</a>
          </div>
            <input class="form-control mr-sm-2" type="search" placeholder="search" aria-label="Search">
            <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">
                <i class="fas fa-search"></i></button>
                <div class="buttons">
                </div>
            <nav aria-label="..." class="best-pagination">
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
          </form>
      </div>
    </div>
   </div>
    </article>
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
</html>