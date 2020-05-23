<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>회원가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- 자바에서 -->
<link href="assets/css/custom.css" rel="stylesheet">	
<!-- vsc에서 -->
<link href="/resources/css/signup01_02.css" rel="stylesheet">
<style>
body {margin: 0px;}
</style>
</head>
<body>
	<!-- header 시작 -->
	<ul class="nav justify-content-end top-nav">
		<li class="breadcrumb-item"><a id="top-nav-font" href="#">로그인</a></li>
		<li class="breadcrumb-item"><a id="top-nav-font" href="#">회원가입</a></li>
	</ul>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
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
	<!-- body start -->
	<div class="signup01_allBody">
	<div class="signup01_terms1"><strong>약관동의</strong></div>
	<div class="signup01_middleLine1"></div>
	<div class="signup01_terms2"><strong>사용자약관동의</strong></div>
	<div class="signup01_box1" >제1조
		(목적) 본 약관은 Stock gallery (이하 "회사"라 합니다)가 제공하는Stock gallery 및 Stock
		gallery 관련 제반 서비스(이하 "서비스"라 합니다)의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타
		필요한 사항을 규정함을 목적으로 합니다. 제2조 (회원의 정의) ① 회원이란 회사가 제공하는 서비스에 접속하여 본 약관에 따라
		회사의 이용절차에 동의하고 회사가 제공하는 서비스를 이용하는 이용자를 말합니다. 제3조 (회원 가입) ① 회원이 되고자 하는
		자는 회사가 정한 가입 양식에 따라 회원정보를 기입하고 "동의", "확인" 등의 버튼을 누르는 방법으로 회원 가입을
		신청합니다. ② 회사는 제1항과 같이 회원으로 가입할 것을 신청한 자가 다음 각 호에 해당하지 않는 한 신청한 자를 회원으로
		등록합니다.</div>
	<label><input class="signup01_check1" type="checkbox" name="agree" value="Y"> 내용을 확인하였으며, 동의합니다.</label>
	<div class="signup01_middleLine2"></div>
	<div class="signup01_policy"><strong>개인정보처리방침</strong></div>
	<div class="signup01_box2">Stock
		gallery(이하 "회사"라 함)는 이용자의 개인정보보호를 매우 중요시하며, 이용자가 회사의 Stock gallery 및
		관련 서비스(이하 "서비스"라 함)를 이용함과 동시에 온라인상에서 회사에 제공한 개인정보가 보호 받을 수 있도록 최선을 다하고
		있습니다. 이에 회사는 정보통신서비스제공자가 준수하여야 하는 대한민국의 관계 법령 및 개인정보보호, 정보보호에 관한 규정을
		준수하고 있습니다. 회사는 개인정보처리방침을 통하여 이용자들이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며
		개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다</div>
	<label><input class="signup01_check2" type="checkbox" name="agree" value="Y"/> 내용을 확인하였으며, 동의합니다.</label>
	<div><button class="signup01_nextButton" data-text-content="true">다음</button></div>
</div>
<!-- body end -->
<!-- footer start -->
<div class=footer_div>
	<footer class="footer_info">
  		<p><a href="https://www.naver.com">회사소개</a>  |  <a href="https://www.google.co.kr">광고안내</a>  |  <a href="https://www.naver.com">이용약관</a>  |  <a href="https://www.google.co.kr"><strong>개인정보처리방침</strong></a></p>
  		<p>Copyright ⓒ 2020 - 2020 stock gallery. All rights reserved.</p>
	</footer>
</div>
<!-- footer end -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>