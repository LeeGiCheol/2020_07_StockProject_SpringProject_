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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script>
	$(document).ready(function(){ 
		function checkPw() {
			var password = $('#password').val();
			console.log(password);
			var passwordAgain = $('#passwordAgain').val();
			console.log(passwordAgain);
			
			/* 비밀번호와 비밀번호 확인이 다르면 */
			if (password != passwordAgain){
				$('#pwResult').empty();
				var html="<tr><td colspan='3' style='color: red'>비밀번호를 확인해주세요</td></tr>"; 
				$('#pwResult').append(html);
			}
			/* 비밀번호 길이 제한 */
			else if($('#password').val().length < 8 || $('#password').val().length > 13){
				var html="<tr><td colspan='3' style='color: red'>비밀번호는 8자리 이상 13자리 이하만 가능합니다.</td></tr>"; 
				$('#pwResult').empty();
				$('#pwResult').append(html);
			}
			/* 둘다 맞을떄  */
			else if(password == passwordAgain){
				var html="<tr><td colspan='3' style='color: green' id='passwordCheck'>비밀번호 사용가능합니다.</td></tr>"; 
				$('#pwResult').empty();
				$('#pwResult').append(html);
			}
		}
	});
	</script> 
<style>
.gray{width: 172px; height:44px; margin-left: 214px; margin-top: 30px;}
</style>
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
						<p class="txt">새로운 비밀번호를 등록해 주세요.</p>
					</div>
					<div class="form-table pass-reset">
					<form action="/updatePassword" method="post" id="frm" name="frm">
						<table>
							<tbody>
								<tr>
									<th scope="row"><label for="custId">아이디</label></th>
									<td>
										<span class="input-style-case02">${findUser.id}</span>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="password">새 비밀번호</label></th>
									<td>
										<span class="input-style-case02">
											<input type="password" id="password" name="password" class="pw"
											placeholder="새 비밀번호를 입력해주세요." oninput="checkPw()">
										</span>	 
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="passwordAgain">새비밀번호 확인</label></th>
									<td>
										<span class="input-style-case02">
											<input type="password" id="passwordAgain" name="passwordAgain" class="pw" 
												placeholder="새 비밀번호를 한 번 더 입력해주세요." oninput="checkPw()">
											<ul><li style="list-style:none;" id="pwResult"></li></ul>
										</span>	 
									</td>
								</tr>
							</tbody>
						</table>
						<button type="submit" id="show-answer" class="btn-t gray">비밀번호 저장</button>
					</form>
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
