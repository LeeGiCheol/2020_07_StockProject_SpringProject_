<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- <link href="/resources/css/signup03.css" rel="stylesheet"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/resources/css/mainheader2.css">
<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link href="/resources/css/signup01_02.css" rel="stylesheet">
</head>
<style>


em, i {
    font-style: normal;
}
.mem-withdrawal {
    padding: 30px 0;
}
.mem-withdrawal [class*="mem-message"] {
    padding-bottom: 50px;
    text-align: center;
    position: relative;
    padding-top: 110px;
}
.mem-withdrawal [class*="mem-message-02"]:after {
    background-position: -1464px 0;
}
.mem-withdrawal [class*="mem-message"]:after {
    content: "";
    position: absolute;
    top: 0;
    left: 50%;
    margin-left: -65px;
    width: 130px;
    height: 130px;
    background: url(/resources/img/icon_message.png) no-repeat -1330px 0;
}
.mem-withdrawal [class*="mem-message"] .big-text {
    font-size: 32px;
    color: #000;
    margin-bottom: 10px;
    line-height: 140%;
}
.mem-withdrawal [class*="mem-message"] p {
    font-size: 18px;
    color: #666;
}
.big-text {
    font-size: 16px;
    line-height: 170%;
    color: #222;
}
.mem-withdrawal [class*="mem-message-02"] .big-text:after {
    background: url(/resources/img/icon_message.png) no-repeat -390px 0;
}
.mem-withdrawal [class*="mem-message"] .big-text:after {
    background: url(/resources/img/icon_message.png) no-repeat -1340px 0;
}
.color-red {
    color: #ff545b !important;
}
.mem-withdrawal [class*="mem-message-02"]:after {
    background-position: -1464px 0;
}
.mem-withdrawal [class*="mem-message"]:after {
    content: "";
    position: absolute;
    top: 0;
    left: 50%;
    margin-left: -65px;
    width: 130px;
    height: 130px;
    background: url(/resources/img/icon_message.png) no-repeat -1330px 0;
}
.mem-withdrawal .mem {
    border: #eaeaea 1px solid;
    padding: 30px;
    overflow: hidden;
    margin-bottom: 40px;
    margin-top: -10px;
}
.mem-withdrawal .mem .id {
    width: 50%;
    float: left;
    border-right: #eaeaea 1px solid;
}
.mem-withdrawal .mem p {
    height: 30px;
    line-height: 30px;
    text-align: center;
    font-size: 16px;
    color: #000;
}
.mem-withdrawal .mem p::before {
    content: "";
    display: inline-block;
    width: 25px;
    height: 25px;
    vertical-align: middle;
    background: url(/resources/img/ico_member.png) no-repeat -6px 0;
    background-size: 36px 750px;
    padding-right: 5px;
}

.mem-withdrawal .mem .id span {
    color: #ff545b;
}
.mem-withdrawal .mem p span {
    padding-left: 15px;
}
.mem-withdrawal .mem .name {
    width: 50%;
    float: right;
}
.mem-withdrawal .mem-down {
    padding: 20px;
    overflow: hidden;
    border: #eaeaea 1px solid;
    border-top-color: #f9f9f9;
    margin-top: -41px;
    background: #f9f9f9;
}
.mem-withdrawal .mem-down p {
    float: left;
    color: #888;
    line-height: 150%;
}
.mem-withdrawal .mem-down span {
    float: right;
}
.mem-withdrawal .mem-down span .btn-t {
    border-color: #ccc;
}
[class*="btn-t"] {
    padding: 6px 10px;
    min-width: 60px;
    font-size: 14px;
}
[class*="btn-"] {
    position: relative;
    background: #fff;
    border: 1px solid #444;
    line-height: 100%;
    display: inline-block;
    color: #000;
    vertical-align: middle;
    box-sizing: border-box;
    text-align: center;
}
.member .bt-area {
    overflow: hidden;
    padding: 20px 0;
    text-align: center;
}
.member .bt-area .btn-b {
    min-width: 142px;
}
[class*="btn-b"] {
    padding: 13px 25px;
    min-width: 90px;
    font-size: 16px;
}
[class*="btn-"].red {
    background: #ff545b;
    border: 1px solid #ff545b;
    color: #fff;
}
.mem-withdrawal [class*="mem-message-02"]:after {
    background-position: -1464px 0;
}





@media only screen and (max-width: 979px){
.mem-withdrawal [class*="mem-message"] {
    padding-bottom: 30px;
    padding-left: 15px;
    padding-right: 15px;
}
.mem-withdrawal [class*="mem-message"] .big-text {
    font-size: 16px;
    color: #000;
}
.mem-withdrawal [class*="mem-message"] p {
    font-size: 13px;
    color: #666;
}
.mem-withdrawal .mem.case02 {
    border-bottom: 0;
    margin-bottom: 0;
}
.mem-withdrawal .mem {
    border: none;
    border-top: #eaeaea 1px solid;
    border-bottom: #eff3f6 10px solid;
    padding: 20px 0;
    margin-bottom: 20px;
    margin-top: 0;
}
.mem-withdrawal .mem .id {
    width: 100%;
    float: none;
    border: none;
    margin-bottom: 5px;
}
.mem-withdrawal .mem p i {
    display: inline-block;
    width: 50px;
    text-align: left;
}
.mem-withdrawal .mem .name {
    width: 100%;
    float: none;
}
.mem-withdrawal .mem-down {
    text-align: center;
    margin-top: 0;
}
.mem-withdrawal .mem-down p {
    float: none;
    padding-bottom: 10px;
}
.mem-withdrawal .mem-down span {
    float: none;
}
[class*="btn-t"] {
    padding: 10px 10px;
    min-width: 70px;
    font-size: 14px;
    height: 36px;
}
.member .bt-area {
    padding: 20px 0;
}
.bt-area {
    clear: both;
    overflow: hidden;
    padding: 0 15px 40px;
}
}
</style>

<body>

<%@include file="mainheader.jsp" %>



<!--     <article>
        <div class="allbody2">
            <div class="allbody">
                <i class="fas fa-user-alt"></i>　회원가입을 축하드립니다
            </div>
            <div><button type="button" onclick="location.href='/signInPage'" class="loginbutton" data-text-content="true">로그인</button></div>
        </div>
    </article> -->

<div class="containerNew"> 

		<!-- contents -->
		<div class="contents member" id="contents">
		
			<!-- cont-area -->	
			<div class="cont-area"> 
				<div class="step-mem">
					<ul>
						<li><div><span><i>Step1</i></span><em>약관동의</em></div></li> 
						<li><div><span><i>Step2</i></span><em>기본정보입력</em></div></li>
						<li class="selected"><div><span><i>Step3</i></span><em>가입완료</em></div></li>
					</ul>
				</div>

				<div class="mem-withdrawal">
					<div class="mem-message-02">
						<p class="big-text">
							<span class="color-red">팍스넷</span>에 오신 것을 환영합니다!
						</p>
						<p><mark>굴리트트님</mark> 팍스넷 회원가입을 축하합니다.</p>
						<p><mark>ekek3002@naver.com </mark>으로 회원가입 안내 메일이 발송되었습니다.</p>
						 
					</div>
					<!-- //message-st-01 --> 
					<div class="mem case02">
						<p class="id"><i>아이디</i> <span>fkfk3002</span></p>
						<p class="name"><i>필명</i> <span>굴리트트</span></p>
					</div>
					<div class="mem-down">
						<p>본인확인과 필명 변경을 원하시면 버튼을 클릭해주세요.</p>
						<span>
							<a href="javascript:goUserInfo();" class="btn-t">본인확인</a>
							<a href="javascript:goUserInfo();" class="btn-t">필명변경</a>
						</span>
					</div>
					<div class="bt-area">  
						<a href="http://www.moneta.co.kr/" class="btn-b">모네타 홈</a>
						<a href="http://www.paxnet.co.kr" class="btn-b red">팍스넷 홈</a> 
					</div>
				</div>
				<!-- //info-modify -->

			</div><!-- //cont-area -->
		</div><!-- //contents -->  
	</div>
	
<%@include file="mainfooter2.jsp"%>>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>