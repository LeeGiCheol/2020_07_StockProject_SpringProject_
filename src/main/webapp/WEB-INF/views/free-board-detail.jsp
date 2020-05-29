<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>글 상세조회</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
 <!-- CSS파일 -->
 <link href="/resources/css/free-board-detail.css" rel="stylesheet">
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script>
 $(document).ready(function(){
   $("#btnDelete").click(function(){
         if(confirm("정말로 삭제하시겠습니까?")){
           alert("jS구성하기");
         }else{
           alert("취소하셨습니다.");
       };
	 });
 });
 </script>
<style>
div > ul > li {width:380px;}
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
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
          <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="통합검색" aria-label="Search">
            <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">
              <i class="fas fa-search"></i>
            </button>
          </form>
        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 커뮤니티 </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">자유게시판</a> <a class="dropdown-item" href="#">포트폴리오</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">뉴스</a>
            </div>
          </li>
          <li class="nav-item"><a class="nav-link" href="#">거래</a></li>
          <li class="nav-item"><a class="nav-link" href="#">고객센터<span class="sr-only">(current)</span></a></li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- header end -->
  <!-- article start -->
  <!-- 상단메뉴 -->
    <div class="sideBar col-md-4 order-md-2 mb-4" id="menu-bar">
      <ul class="list-group mb-3">
        <!-- java에서 온클릭 위치 바꾸기!!!!!!!!!!!!!!!!!!!-->
        <li class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed free-board" onclick="location.href='free-board.jsp'">
          <div> 
            <h6 class="my-0">자유 게시판</h6>
          </div>
        </li>
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed news-borad" onclick="location.href='newsboard.jsp'">
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
  <!-- 상단메뉴 끝 -->
  <article class="bg-light container">
    <div class="allBody">
      <div class="row">
        <div class="sideBar col-md-4 order-md-2 mb-4">
          <div class="col-md-8 order-md-1"></div>
          <hr>
          <div>
            <div>
              <div class="notice-header">
                <div class="title-wrap">
                  <p class="category-info"><a href="/notice">자유게시판</a></p>
                  <h2 id="" class="notice-title">#게시물제목</h2>
                </div>
                <div class="info-wrap">
                  <ul class="notice-info">
                    <li class="author"><i class="fa fa-user-circle"></i>#작성자 이름</li>
                    <li class="date"><i class="far fa-clock"></i>#2020.05.27</li>
                  </ul>
                </div>
                <div class="article">
                  예정된 기록 관련 변경사항
                  곧 번역 기록을 로그인된 상태에서만 확인할 수 있으며 내 활동에서 함께 관리하도록 변경됩니다. 이번 업그레이드 과정에서 이전 기록이 모두 삭제되므로, 필요한 번역을 저장하여 나중에 편리하게 액세스하세요.
                </div>
              </div>
              <hr>
            </div>
          </div>
        </div>
      </div>
    </div>
  <div>
      <!-- 댓글 -->
      <h2 id="commentBody" class="comment-title">댓글</h2>
      <div class="commentBody">
      <i class="fa fa-user-circle"></i> <b> # 댓글 작성자 1</b><br>
      <i class="far fa-clock"></i> # 2020.05.27 17:05<br>
      <br>
       안맛있는게 뭘까싶네 ㄱ공감 ㅠㅠ
      <br>
      <hr class="comment-hr"> 
      <!-- 1set -->
      <i class="fa fa-user-circle"></i> <b># 댓글 작성자 2</b><br><i class="far fa-clock"></i> # 2020.05.28 20:05<br>
      <br>
       다이어트란 글씨 보자마자 아 이 글 당장 안보면 휴게소에서 알감자 안먹는거랑 같다고 생각해서 알감자 먹으러 왔는데 이 시간에 본 내가 미쳤지.....아 와플 미추어버리겠다 아 화
        려한 크림이 날 감싸는 깡 어쩌지요.....
      <br>
      <hr class="comment-hr"> 
      <!-- 1set 끝 -->
    </div> 
    
    <hr>
    <div class="comment-wrap">
        <div>
            <div class="comment-form">
                <fieldset>
                    <div>
                        <div>
                            <dl class="comment-guest">
                                <dt><label for="[##_comment_input_name_##]">이름</label></dt>
                                <dd><input type="text" name="[##_comment_input_name_##]" id="[##_comment_input_name_##]" placeholder="이름" title="이름 입력"> </dd>
                                <dt><label for="[##_comment_input_password_##]">비밀번호</label></dt>
                                <dd><input type="password" name="[##_comment_input_password_##]" id="[##_comment_input_password_##]" placeholder="비밀번호" title="비밀번호 입력"> </dd>
                            </dl>
                          </div>
                      </div>
                    <dl class="comment-write">
                        <dt><label for="[##_comment_input_comment_##]">내용</label></dt>
                        <dd><textarea name="[##_comment_input_comment_##]" id="[##_comment_input_comment_##]" placeholder="여러분의 소중한 댓글을 입력해주세요"></textarea></dd>
                    </dl>
                    <button type="submit" class="reply-btn" onclick="">댓글 남기기</button>
                </fieldset>
            </div>
          </div>
        <div class="buttons" >
          <button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="window.location.href='free-board.jsp'">목록</button>
          <button type="button" class="btn btn-sm btn-primary" id="btnMyList" onclick="window.location.href='mypage03.jsp'">내가 쓴글</button>
          <button type="button" class="btn btn-sm btn-primary" id="btnDelete" onclick="">삭제</button>
        </div>
      </div>
  </div>
<!-- 댓글 끝 -->
  </article>
  
  <!-- article end -->
  <!-- footer start -->
  <div class=footer_div>
    <footer class="footer_info">
      <p><a href="https://www.naver.com">회사소개</a> | <a href="https://www.google.co.kr">광고안내</a> | <a
          href="https://www.naver.com">이용약관</a> | <a href="https://www.google.co.kr"><strong>개인정보처리방침</strong></a></p>
      <p>Copyright ⓒ 2020 - 2020 stock gallery. All rights reserved.</p>
    </footer>
  </div>
  <!-- footer end -->
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>