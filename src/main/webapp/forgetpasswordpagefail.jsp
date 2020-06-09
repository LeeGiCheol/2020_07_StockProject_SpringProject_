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
<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">
<link rel="stylesheet" href="/resources/css/forgetpage.css">
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
						<p class="big-text">입력하신 정보와 <span class="color-red">일치하는 회원정보</span>가 없습니다.<br>다른 방법으로 다시 시도해 보세요.</p>
					</div>

					<div class="bt-area"><a href=/forgetPassword	class="btn-b gray">다시 시도하기</a></div>
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

	<%@include file="mainfooter.jsp"%>

	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>