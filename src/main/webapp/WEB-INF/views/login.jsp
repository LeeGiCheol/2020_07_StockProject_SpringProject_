<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>로그인</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">
<link rel="stylesheet" href="/resources/css/mainfooter.css">

</head>
<body>
<div class="wrap">
<%@include file="mainheader.jsp" %>
<div class="containerNew"> 

<!-- contents -->
<div class="contents member" id="contents">
	<!-- cont-area -->	
	<div class="cont-area log"> 
		<div class="login-wrap"> 
			<div class="logo-log">
				<a href="http://www.paxnet.co.kr"><img src="/resources/img/logo.png" alt="PAXNet"></a>
			</div>
			 <form action="/signIn" class="form-signin" method="post">
				<input type="hidden" name="returnURL" id="returnURL" value="http://www.paxnet.co.kr/tbbs/list?tbbsType=L&amp;id=N10982">
				<input type="hidden" name="adminType" value="">
				<input type="hidden" name="majority" id="majority" value="">
				
				<div class="on-area clearfix">
					<span class="stu">
					<input type="checkbox" id="idSaveCheck" class="big" value="remember-me"><label for="sID">아이디 저장</label>
					</span>
				</div>
				<fieldset class="login">
					<legend>로그인</legend> 
					<div>
						<span class="input-style">
							<input id="inputEmail" name="id" title="아이디 입력" placeholder="아이디 입력" type="email" value="" required autofocus>

						</span> 
						<span class="input-style">
							<input id="inputPassword" name="pw" title="비밀번호 입력" placeholder="비밀번호 입력" type="password" value="" autocomplete="OFF" required>
	
						</span>
					</div>
					<button class="btn-b red" type="submit" value="Submit">로그인</button>
				</fieldset>
			</form>
			<div class="bt-login">
				<a href="/forgetId">아이디 찾기</a>
				<a href="/forgetPassword">비밀번호 찾기</a>
				<a href="/signUpPage/1">회원가입</a>
			</div>
			
			<!-- 소셜 로그인 타입 추가 -->
			<div class="social-login">
				<button type="button" class="naverlogin btn-b naver" onclick="location.href='/naverLogin'">네이버 아이디로 로그인</button>
				<button type="button" class="kakaologin btn-b kakaotalk" >카카오톡 아이디로 로그인</button>
				<button type="button" class="btn-b google">구글 아이디로 로그인</button>
			</div>
		</div>
	</div><!-- //cont-area -->	 
</div><!-- //contents -->  

<!-- 소셜로그인 요청을 위해 필요한 form 입니다. -->
<form name="snsReqForm" id="snsReqForm" method="POST" target="popupChk">
	<input type="hidden" name="reqType" id="reqType" value="">
	<input type="hidden" name="snsReturnURL" id="snsReturnURL" value="">
	<input type="hidden" name="snsAutoLogin" id="snsAutoLogin" value="N">	<!-- 자동 로그인 여부 -->
</form>

<!-- 소셜로그인 완료 후 회원가입 화면으로 이동할 때 필요한 form 입니다. -->
<form name="snsResForm" id="snsResForm" method="POST">
	<input type="hidden" name="sns_type" id="sns_type" value="">
	<input type="hidden" name="sns_id" id="sns_id" value="">
	<input type="hidden" name="cust_nm" id="cust_nm" value="">
	<input type="hidden" name="email" id="email" value="">
	<input type="hidden" name="profile_image" id="profile_image" value="">
	<input type="hidden" name="nick_nm" id="nick_nm" value="">
	<input type="hidden" name="sns_returnURL" id="sns_returnURL" value=""> <!-- 회원가입 완료 후 이동할 URL -->
</form>
	</div>	
<!-- 	<article>
	    <form action="/signIn" class="form-signin" method="post">
	        <img class="mb-4" src="/docs/4.5/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
	        	<label for="inputEmail" class="sr-only">아이디</label>
	        	<input type="email" id="inputEmail" class="form-control" name="id" placeholder="아이디" required autofocus>
	        	<label for="inputPassword" class="sr-only">비밀번호</label>
	        	<input type="password" id="inputPassword" class="form-control" name="pw" placeholder="비밀번호" required>
	        	<label><input type="checkbox" value="remember-me" id="idSaveCheck"> 이메일 저장</label>
	        	<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
	        <div class="otherbutton">
	        	<button class="idbox btn btn-lg btn-primary btn-block " onclick="location.href='/forgetId'" type="button">아이디찾기</button>
	        	<button class="passwordbox btn btn-lg btn-primary btn-block " onclick="location.href='/forgetPassword'" type="button">비밀번호 찾기</button>
	        </div>
	        <button class="signup btn btn-lg btn-primary btn-block" onclick="location.href='/signUpPage/1'" type="button">회원가입</button>
	        <div class="otherbutton">
		        <a href="/naverLogin"><button class="naverlogin btn btn-lg btn-primary btn-block "type="button">네이버로그인</button></a>
		        <button style="margin-top: 8px;" class="kakaologin btn btn-lg btn-primary btn-block " onclick="location.href='#'" type="button">카카오톡로그인</button>
	        </div>
	        <p class="mt-5 mb-3 text-muted">&copy; 2020-2020</p>
	     </form>
	</article> -->
<%@include file="mainfooter.jsp" %>
</div>
<script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
<script src="/docs/4.4/dist/js/bootstrap.bundle.min.js" ></script>
<script src="form-validation.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
<script>
$(document).ready(function(){
 
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#inputEmail").val(key); 
     
    if($("#inputEmail").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#inputEmail").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#inputEmail").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#inputEmail").val(), 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
    
}
</script>
</html>