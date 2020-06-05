<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>forgetidpage</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">
<link rel="stylesheet" href="/resources/css/forgetpage.css">
</head>
<body class="member">

	<%@include file="mainheader.jsp"%>

	<div class="containerNew">
		<div class="contents member">
			<div class="cont-area">
				<h1 class="tit-h1 line">비밀번호 재설정</h1>
				<div class="id-result">
					<div class="find-desc h1-top-m">
						<strong class="tit">비밀번호 재설정</strong>
						<p class="txt">기존 비밀번호는 사용이 불가능하니, 새로운 비밀번호를 등록해 주세요.<br>비밀번호 변경 후 기존 계정은 로그아웃됩니다.</p>
					</div>
					<div class="form-table pass-reset">
					<form action="/rpan/member/searchPwd/resultPwd" method="post" id="frm" name="frm">
					<!-- 
					<input type="hidden" name="custNm1" value="">
					<input type="hidden" name="custNm2" value="이형균">
					<input type="hidden" name="certificationNo1" value="">
					<input type="hidden" name="certificationNo2" value="437099">
					<input type="hidden" name="mobileNo" value="">
					<input type="hidden" name="authValue" value="ekek3002@naver.com">
					<input type="hidden" name="custNm" value="이형균">
					<input type="hidden" name="di" value="">
					<input type="hidden" name="custId" value="ekek3002">
					<input type="hidden" name="certType" value="2">
					<input type="hidden" name="email" value="ekek3002@naver.com">
					<input type="hidden" name="custType" value="">
					 -->
						<table>
							<caption>비밀번호 재설정 : 아이디, 새 비밀번호, 새 비밀번호 확인, 자동 입력방지 문자에 대한 정보</caption> 
							<tbody>
								<tr>
									<th scope="row"><label for="custId">아이디</label></th>
									<td>
										<span class="input-style-case02">
<!-- 											<input type="text" id="custId" name="custId"> -->
											
<!-- 											<button type="button" class="delete">삭제</button> -->
											ekek3002
										</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="pswd">새 비밀번호</label></th>
									<td>
										<span class="input-style-case02">
											<input type="password" id="pswd" name="pswd" placeholder="영문, 숫자 조합 6~14자 이하" autocomplete="OFF">
											<button type="button" class="delete">삭제</button>
										</span>	 
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="pswd2">새비밀번호 확인</label></th>
									<td>
										<span class="input-style-case02">
											<input type="password" id="pswdc" name="pswdc" placeholder="새 비밀번호를 한 번 더 입력해주세요." autocomplete="OFF">
											<button type="button" class="delete">삭제</button>
										</span>
									</td>
								</tr>
								<!-- 
								<tr>
									<th scope="row"><label for="captchaInput">자동 입력방지</label></th>
									<td>
										<div class="auto-box">
											<span class="auto-prevention"><img src="/rpan/simpleCaptcha?cn=captchaPwd&amp;tm=1591267893.095" alt="자동 가입 방지" id="captchaImg"></span>
											<button type="button" class="btn-s" onclick="changeCaptcha();"><span class="initial">새로고침</span></button>
										</div>
										<span class="input-style-case02">
											<input type="text" id="captchaInput" name="captchaInput" placeholder="자동 입력방지 문자" maxlength="6">
											<button type="button" class="delete">삭제</button>
										</span>
									</td>
								</tr>
								 -->
							</tbody>
						</table>
					</form>
				</div>
					<div class="bt-area">
						<a href="javascript:formSubmit();" class="btn-b gray">확인</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="mainfooter.jsp"%>

	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>