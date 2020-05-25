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
<link href="/resources/css/mypage01.css" rel="stylesheet">
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

    <!-- section end -->
    <!-- article start -->
    <article class="bg-light container">
        <div class="allBody">
      <div class="row">
        <div class="sideBar col-md-4 order-md-2 mb-4">
          <ul class="list-group mb-3">
            <!-- java에서 온클릭 위치 바꾸기!!!!!!!!!!!!!!!!!!!-->
            <li class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed"onclick="location.href='mypage01.html'">
              <div> 
                <h6 class="my-0">내정보</h6>
              </div>
            </li>
            <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed" onclick="location.href='mypage02.html'">
              <div>
                <h6 class="my-0">계좌정보</h6>
              </div>
            </li>
            <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed" onclick="location.href='mypage03.html'" >
              <div>
                <h6 class="my-0">작성 글, 댓글</h6>
              </div>
            </li>
            <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed" onclick="location.href='mypage04.html'">
              <div >
                <h6 class="my-0">알림</h6>
              </div>
            </li>
          </ul>
    
        </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">내정보</h4>
          <form class="needs-validation" novalidate>
            <div class="mb-3">
              <label for="userEmail">이메일</label>
              <div>
                <div class="input-group-prepend">
                  <span class="input-group-text">@</span>
                <div class="form-control" id="userEmail" >${user.email}</div>
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label for="userNickname">닉네임</label>
              <div>
                <div class="form-control" id="userNickName" >${user.nickName}</div>
              </div>
            </div>
    
            <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="password">비밀번호</label>
                  <input type="text" class="form-control" id="userPassword">
                </div>

                <div class="col-md-6 mb-3">
                  <label for="passwordCheck">비밀번호확인</label>
                  <input type="text" class="form-control" id="userPasswordCheck" placeholder="비밀번호를 한 번 더 입력하세요" required>
                </div>
              </div>
    
            <div class="mb-3">
              <label for="address">주소</label>
              <div class="form-control" id="userAddress">${user.address}</div>
            </div>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-name">연락처</label>
                <div class="form-control" id="userPhone">${user.phone}</div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">포인트</label>
                <div class="form-control" id="userPoint">${user.point} 점</div>
              </div>
            </div>
            <hr class="mb-4">
            <small class="text-muted">다른 사용자에게 보유 자산 및 수익률과 거래내역을 노출 하시겠습니까?</small>
            <br>
            <br>
            <div class="ask-form">
                <div class="custom-control custom-radio">
                  <input type="radio" name="ask-radio" id="ask-radio-1" class="custom-control-input" >
                  <label class="custom-control-label" id="ask-radio-1-answer" for="ask-radio-1">예</label>
                </div>
                <div class="custom-control custom-radio">
                  <input type="radio" name="ask-radio" id="ask-radio-2" class="custom-control-input">
                  <label class="custom-control-label" for="ask-radio-2">아니오</label>
                </div>
            </div>
            <br>
            <div class="buttons">
            <button class="btn btn-primary btn-lg btn-block save" type="submit">저장</button>
            <button class="btn btn-primary btn-lg btn-block remove" type="submit">회원탈퇴</button>
          </div>
          </form>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
    <script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
    <script src="/docs/4.4/dist/js/bootstrap.bundle.min.js"></script>
    <script src="form-validation.js"></script>
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