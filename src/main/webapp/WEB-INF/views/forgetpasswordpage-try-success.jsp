<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호찾기</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">
<link rel="stylesheet" href="/resources/css/forgetpage.css">
<script >
function numkeyCheck(e) { var keyValue = event.keyCode; if( ((keyValue >= 48) && (keyValue <= 57)) ) return true; else return false; }
function msg(){alert("인증번호를 이미 전송하였습니다.")}
</script>
</head>
<body class="member">
	<%@include file="mainheader.jsp"%>
	<div class="containerNew">
		<div class="contents member">
			<div class="cont-area">
				<h1 class="tit-h1 line">비밀번호 찾기</h1>
				<div class="id-result">
					<div class="find-desc">
						<strong class="tit">비밀번호 찾기</strong>
						<p class="txt" style="display: none;">비밀번호가 생각나지 않으세요? 비밀번호 찾는 방법을 선택해주세요.</p>
					</div>
					<form action="/forgetPasswordTry" method="post" id="frm" name="frm">

						<ul class="find-list step_toggle">
							<li><a href="#">본인 확인 이메일 인증</a>
								<div class="fint-list-cont">
									<div class="find-box">
										<p>
											회원가입 시 입력한 <span class="color-red">이메일 주소와 동일한 주소</span>를
											입력하셔야 해당 메일로 인증번호를 받을 수 있습니다.
										</p>
										<ul class="form-list">
											<li class="input-type">
											<input type="text"	placeholder="${findUser.id}" id="id" name="id" readonly>
											<button type="button" class="btn-t gray" onclick="msg()">인증번호전송</button></li>
													
											<li class="input-type" id="_liCert2"> 
											<input type="password" placeholder="인증번호를 입력해주세요." id="email_answer" 
											name="email_answer" onKeyPress="return numkeyCheck(event)">
											<button type="submit" class="btn-t gray">인증번호입력</button></li>
													 
										</ul>
									</div>
								</div></li>
						</ul>
	   				    <br>
                 		<br>
						<div class="find-info">
							<span class="txt">비밀번호 찾기와 회원가입을 원하시나요?</span> 
							<span class="bt-area">
						    <a href="/signUpPage/1" class="btn-t">회원가입</a>
						    <a href="/forgetId" class="btn-t">아이디 찾기</a>
							</span>
						</div>
					</form>
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