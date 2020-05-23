<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>로그인</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" 	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- CSS파일 -->
<link rel="stylesheet" href="/resources/css/login.css">

<style>

</style>
</head>
<body>
<header>
<!-- header start -->
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
<!-- header end -->
</header>
<article>
    <form class="form-signin">
        <img class="mb-4" src="/docs/4.5/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        <label for="inputEmail" class="sr-only">아이디</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="아이디" required autofocus>
        <label for="inputPassword" class="sr-only">비밀번호</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="비밀번호" required>
          <label>
            <input type="checkbox" value="remember-me"> 이메일 저장
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="button">로그인</button>
        <div class="otherbutton"><button class="idbox btn btn-lg btn-primary btn-block " onclick="location.href='#'" type="button">아이디찾기</button><button class="passwordbox btn btn-lg btn-primary btn-block " onclick="location.href='#'" type="button">비밀번호 찾기</button></div>
        <button class="signup btn btn-lg btn-primary btn-block" onclick="location.href='#'" type="button">회원가입</button>
        <div class="otherbutton"><button class="naverlogin btn btn-lg btn-primary btn-block " onclick="location.href='#'" type="button">네이버로그인</button><button class="kakaologin btn btn-lg btn-primary btn-block " onclick="location.href='#'" type="button">카카오톡로그인</button></div>
        <p class="mt-5 mb-3 text-muted">&copy; 2020-2020</p>
      </form>
</article>
<!-- footer start -->   
      <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2017-2019 Company Name</p>
        <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
      </footer>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
          <script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
          <script src="/docs/4.4/dist/js/bootstrap.bundle.min.js" integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm" crossorigin="anonymous"></script>
            <script src="form-validation.js"></script></body>
</footer>
<!-- footer end -->    
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</html>