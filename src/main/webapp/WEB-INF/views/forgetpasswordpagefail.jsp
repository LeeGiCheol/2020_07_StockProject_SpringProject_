<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호찾기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="/resources/css/mainfooter3.css">
<link rel="stylesheet" href="/resources/css/mainheader2.css">
<link rel="stylesheet" href="/resources/css/forgetpage.css">
<style>
.social-login {
    padding: 30px 0 14px 0;
    border-top: 1px solid #eaeaea;
}
.social-login .btn-b.naver {
    background-color: #00c73c;
    background-position: 0 -104px;
}
.social-login .btn-b {
    width: 100%;
    height: 60px;
    margin-bottom: 10px;
    line-height: 100%;
    font-size: 20px;
    color: #fff;
    text-align: center;
    border: none;
    background: url(/resources/img/social_type.png) no-repeat;
}
.social-login * {
    display: block;
}
.social-login .btn-b.kakaotalk {
    color: #3c1e1e;
    background-color: #ffeb00;
    background-position: 0 -166px;
}
.social-login .btn-b {
    width: 100%;
    height: 60px;
    margin-bottom: 10px;
    line-height: 100%;
    font-size: 20px;
    color: #fff;
    text-align: center;
    border: none;
    background: url(/resources/img/social_type.png) no-repeat;
}
.social-login .btn-b.google {
    background-color: #4285f4;
    background-position: 0 -290px;
}
.social-login .btn-b {
    width: 100%;
    height: 60px;
    margin-bottom: 10px;
    line-height: 100%;
    font-size: 20px;
    color: #fff;
    text-align: center;
    border: none;
    background: url(/resources/img/social_type.png) no-repeat;
}
.social-login .btn-b.naver {
    background-color: #00c73c;
    background-position: 0 -388px;
}
.social-login .btn-b {
    height: 54px;
    background-size: 250px 700px;
}
.social-login .btn-b.kakaotalk {
    color: #3c1e1e;
    background-color: #ffeb00;
    background-position: 0 -443px;
}
.social-login .btn-b.google {
    background-color: #4285f4;
    background-position: 0 -553px;
}
.social-login .btn-b {
    height: 54px;
    background-size: 250px 700px;
}
}
@media only screen and (max-width: 480px){
.social-login .btn-b {
    padding-left: 23%;
    font-size: 15px;
}
}
</style>
</head>
<body class="member">

	<%@include file="mainheader.jsp"%>

	<div class="containerNew">
		<div class="contents member">
			<div class="cont-area">
				<h1 class="tit-h1 line">비밀번호 찾기</h1>
				<div class="id-result">
					<div class="message-st-no"> 
						<img class="" id="idfail" src="/resources/img/icon.png">
						<p class="big-text">입력하신 이메일을 <span class="color-fantasy">존재하지 않습니다.</span><br>다시 시도해주세요.</p>
					</div>

					<div class="social-login">
						<button type="button" class="naverlogin btn-b naver" onclick="location.href='/naverLogin'">네이버 아이디로 로그인</button>
						<button type="button" class="kakaologin btn-b kakaotalk" >카카오톡 아이디로 로그인</button>
					</div>
					<div class="bt-area"><a href="/forgetPassword" class="btn-b fantasy">다시 시도하기</a></div>
					<div class="find-info">
						<span class="txt">비밀번호 찾기와 회원가입을 원하시나요?</span> 
						<span class="bt-area"> 
						<a href="/signUpPage/1" class="btn-t">회원가입</a>
  					    <a href="/forgetId" class="btn-t">아이디 찾기</a>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="mainfooter2.jsp"%>

	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>