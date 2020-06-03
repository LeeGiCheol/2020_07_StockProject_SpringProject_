<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- CSS파일 -->
<link href="resources/css/mypage03.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
    $("#jb-checkboxAll-commnet").click(function(){
        if($("#jb-checkboxAll-commnet").prop("checked")){
            $(".custom-control-input").prop("checked",true);
        }else{
            $("").prop("checked",false);
        }
    })
    $("#jb-checkboxAll").click(function(){
        if($("#jb-checkboxAll").prop("checked")){
            $(".custom-control-input").prop("checked",true);
        }else{
            $(".custom-control-input").prop("checked",false);
        }
    })

})



</script>
</head>
<body>
    <!-- header start -->
    <header>
        <!-- 상단  nav start -->
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
        <li class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed mypage03" onclick="location.href='mypage03.jsp'" >
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
          <h4 class="mb-3">작성 글, 댓글</h4>
        </div>
    </div>
    </div>
    <!-- 게시판 -->
    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
      <li class="nav-item" role="presentation">
        <a class="nav-link active" id="pills-write-tab" data-toggle="pill" href="#pills-write" role="tab" aria-controls="pills-write" aria-selected="true">작성한 글</a>
      </li>
      <li class="nav-item" role="presentation">
        <a class="nav-link" id="pills-commnet-tab" data-toggle="pill" href="#pills-commnet" role="tab" aria-controls="pills-commnet" aria-selected="false">작성한 댓글</a>
      </li>
    </ul>
    <div class="tab-content" id="pills-tabContent">
      <div class="tab-pane fade show active" id="pills-write" role="tabpanel" aria-labelledby="pills-write-tab" style="margin-bottom: 300px;">
        <!-- 내가 작성한 글 -->
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
          	<c:forEach items="${myBoard}" var="board">
               <tr> 
                 <td><div class="custom-control custom-checkbox">
                   <input type="checkbox" id="jb-checkbox${board.pno}" class="custom-control-input" name="${board.pno}"><label class="custom-control-label" for="jb-checkbox${board.pno}"></label></div></td>
                 <th scope="row">${board.pno}</th>
                 <td>${board.title}</td>
                 <td>${board.nickname}</td>
                 <td>${board.bdateTime}</td>
                 <td>${board.views}</td>
                 <td>${board.likes}</td>
               </tr>
         	</c:forEach>
         	<!-- 
            <tr> 
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox1" class="custom-control-input"><label class="custom-control-label" for="jb-checkbox1"></label></div></td>
              <th scope="row">5</th>
              <td>이 글은 테스트용 글쓰기입니다.</td>
              <td>글쓴이</td>
              <td>2020.05.21</td>>
              <td>270</td>
              <td>30</td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox2" class="custom-control-input"><label class="custom-control-label" for="jb-checkbox2"></label></div></td>
              <th scope="row">4</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox3" class="custom-control-input"><label class="custom-control-label" for="jb-checkbox3"></label></div></td>
              <th scope="row">3</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox4" class="custom-control-input"><label class="custom-control-label" for="jb-checkbox4"></label></div></td>
              <th scope="row">2</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox5" class="custom-control-input"><label class="custom-control-label" for="jb-checkbox5"></label></div></td>
              <th scope="row">1</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
             -->
          </tbody>
        </table>
        <br>
       <form class="form-inline my-2 my-lg-0 underSearchForm">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="#">제목</a>
          <a class="dropdown-item" href="#">내용</a>
          <a class="dropdown-item" href="#">글쓴이</a>
        </div>
          <input class="form-control mr-sm-2" type="search" placeholder="search" aria-label="Search">
          <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">
              <i class="fas fa-search"></i></button>
          <div><button class="btn btn-primary btn-lg btn-block remove" type="submit">삭제</button></div>
          <nav aria-label="..." class="pagination">
          
          	<ul class="pagination">
			<c:if test="${boardPage.startPage != 1 }">
				<!-- <a href="/myPage03?nowPage=${boardPage.startPage - 1 }">◀</a> -->
				<li>
					<a class="page-link" href="/myPage03?bnowPage=${boardPage.startPage - 1 }"tabindex="-1" aria-disabled="true">◀</a>
				</li>
			</c:if>
			<c:forEach begin="${boardPage.startPage }" end="${boardPage.endPage }" var="p">
				<c:choose>
					<c:when test="${p == boardPage.nowPage}">
						<!-- <b>${p }</b> -->
						<li class="page-item active" aria-current="page">
							<a class="page-link" href="#">${p}<span class="sr-only">(current)</span></a>
						</li>
					</c:when>
					<c:when test="${p != boardPage.nowPage}">
						<!-- <a href="/myPage03?nowPage=${p }">${p}</a> -->
						<li class="page-item">
							<a class="page-link" href="/myPage03?bnowPage=${p}">${p}</a>
						</li>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${boardPage.endPage != boardPage.lastPage}">
				<!-- <a href="/myPage03?nowPage=${boardPage.endPage+1 }">▶</a> -->
				<li>
					<a class="page-link" href="/myPage03?bnowPage=${boardPage.endPage+1}" tabindex="+1" aria-disabled="true">▶</a>
				</li>
			</c:if>
			</ul>
			<!-- 
            <ul class="pagination">
              <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true">◀</a></li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item active" aria-current="page"><a class="page-link" href="#">2 <span class="sr-only">(current)</span></a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item disabled"><a class="page-link" href="#" tabindex="+1" aria-disabled="true">▶</a></li>
            </ul> -->
          </nav>
        </form>
      </div>
      <div class="tab-pane fade" id="pills-commnet" role="tabpanel" aria-labelledby="pills-commnet-tab" style="margin-bottom: 300px;">
        <!-- 내가 작성한 댓글 -->
        <table class="table table-bordered">
          <thead>
            <tr>
              <td class="checkno"><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkboxAll-commnet" class="custom-control-input"><label class="custom-control-label" for="jb-checkboxAll-commnet"></label></div></td>
              <th class="no" scope="col">번호</th>
              <th class="title" scope="col">글제목</th>
              <th class="writer" scope="col">글쓴이</th>
              <th class="date" scope="col">작성일</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${myComment}" var="comment">
               <tr> 
                 <td><div class="custom-control custom-checkbox">
                   <input type="checkbox" id="jb-checkbox${comment.cno}-comment" class="custom-control-input" name="${comment.cno}"><label class="custom-control-label" for="jb-checkbox${comment.cno}-comment"></label></div></td>
                 <th scope="row">${comment.cno}</th>
                 <td>${comment.ccontent}</td>
                 <td>${comment.nickname}</td>
                 <td>${comment.cdateTime}</td>
               </tr>
         	</c:forEach>
         	<!-- 
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox1-commnet" class="custom-control-input"><label class="custom-control-label" for="jb-checkbox1-commnet"></label></div></td>
              <th scope="row">5</th>
              <td>이 글은 테스트용 댓글쓰기입니다.</td>
              <td>글쓴이</td>
              <td>2020.05.21</td>
              <td>270</td>
              <td>30</td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox2-commnet" class="custom-control-input"><label class="custom-control-label" for="jb-checkbox2-commnet"></label></div></td>
              <th scope="row">4</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox3-commnet" class="custom-control-input"><label class="custom-control-label" for="jb-checkbox3-commnet"></label></div></td>
              <th scope="row">3</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox4-commnet" class="custom-control-input"><label class="custom-control-label" for="jb-checkbox4-commnet"></label></div></td>
              <th scope="row">2</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
            <tr>
              <td><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkbox5-commnet" class="custom-control-input"><label class="custom-control-label" for="jb-checkbox5-commnet"></label></div></td>
              <th scope="row">1</th>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
              <td></td>
            </tr>
             -->
          </tbody>
        </table>
        <br>
        <form class="form-inline my-2 my-lg-0 underSearchForm">
          <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a>
          <div class="dropdown-menu" aria-labelledby="dropdown01">
            <a class="dropdown-item" href="#">제목</a>
            <a class="dropdown-item" href="#">내용</a>
            <a class="dropdown-item" href="#">글쓴이</a>
          </div>
            <input class="form-control mr-sm-2" type="search" placeholder="search" aria-label="Search">
            <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">
                <i class="fas fa-search"></i></button>
            <div><button class="btn btn-primary btn-lg btn-block remove" type="submit">삭제</button></div>
            <nav aria-label="..." class="pagination">
                        	<ul class="pagination">
			<c:if test="${commentPage.startPage != 1 }">
				<!-- <a href="/myPage03?nowPage=${boardPage.startPage - 1 }">◀</a> -->
				<li>
					<a class="page-link" href="/myPage03?cnowPage=${commentPage.startPage - 1 }"tabindex="-1" aria-disabled="true">◀</a>
				</li>
			</c:if>
			<c:forEach begin="${commentPage.startPage }" end="${commentPage.endPage }" var="p">
				<c:choose>
					<c:when test="${p == commentPage.nowPage}">
						<!-- <b>${p }</b> -->
						<li class="page-item active" aria-current="page">
							<a class="page-link" href="#">${p}<span class="sr-only">(current)</span></a>
						</li>
					</c:when>
					<c:when test="${p != commentPage.nowPage}">
						<!-- <a href="/myPage03?nowPage=${p }">${p}</a> -->
						<li class="page-item">
							<a class="page-link" href="/myPage03?cnowPage=${p}">${p}</a>
						</li>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${commentPage.endPage != commentPage.lastPage}">
				<!-- <a href="/myPage03?nowPage=${boardPage.endPage+1 }">▶</a> -->
				<li>
					<a class="page-link" href="/myPage03?cnowPage=${comment.endPage+1}" tabindex="+1" aria-disabled="true">▶</a>
				</li>
			</c:if>
			</ul>
            </nav>
          </form>
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