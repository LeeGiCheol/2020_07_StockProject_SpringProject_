<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="/resources/css/forgetpage.css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.gray{width: 172px; height:44px; margin-left: 214px; margin-top: 30px;}
</style>
<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">
<script>
function spaceCheck(e) { var keyValue = event.keyCode; if( (keyValue > 31) && (keyValue < 33) ) return false; else return true; }
</script>
</head>
<body class="member">
<%@include file="mainheader.jsp" %>
	<div class="containerNew">
		<div class="contents member" style="margin-top: 200px; margin-bottom: 200px;" >
			<div class="cont-area">
				<h1 align="center" class="tit-h1 line">비밀번호 확인</h1>
				<div class="id-result">
					<div class="find-desc h1-top-m">
					</div>
					<div class="form-table pass-reset">
					<form action="/myPagePwCheck" method="post" id="frm" name="frm">
						<table>
							<tbody>
								<tr>
									<th scope="row"><label for="password">현재 비밀번호</label></th>
									<td><span class="input-style-case02">
									<input type="password" id="password" name="password" class="pw" 
									placeholder="비밀번호를 입력해주세요." onKeyPress="return spaceCheck(event)" maxlength="13"></span>
									</td>
								</tr>
							</tbody>
						</table>
						<button style="margin-left: 198px;" id="submit" type="button" class="btn-t gray" >비밀번호 확인</button>
					</form>
				</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="mainfooter.jsp" %>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
	<script type="text/javascript"> 
	
	
	$('#frm').keypress(function(event){
	     if ( event.which == 13 ) {
	         $('#submit').click();
	         return false;
	     }
	});
	$(document).ready(function() {
		$("#submit").click(function(){
			$.ajax({ 
				type: 'POST', 
				url: '${pageContext.request.contextPath}/myPagePwCheck',
				data: {"password" : $('#password').val()}, 
				success: function(data){ 
				console.log(data)
						if(data == 1){
							swal({text:"마이페이지로 이동합니다.", icon:"success"}).then(function(){
								location.href = '/myPage01'
								self.close();
							});
							
						}else{
							swal({text:"현재비밀번호가 일치하지않습니다.", icon:"error"}).then(function(){
								location.href = '/myPagePwCheck'
							});
							$('#nowPassword').empty();
					 	}
				},
				error: function(){
					alert("에러");
				}
			});  
		});  
	});
	
	
	</script>
</body>
</html>