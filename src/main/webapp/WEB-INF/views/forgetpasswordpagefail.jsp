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
<style type="text/css">
html, body, div, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote,
	pre, abbr, address, cite, code, del, dfn, img, ins, kbd, q, samp, small,
	var, i, dl, dt, dd, ol, ul, li, fieldset, form, legend, table, caption,
	tbody, tfoot, thead, tr, article, aside, canvas, details, figcaption,
	figure, footer, header, hgroup, menu, nav, section, summary, time,
	audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	vertical-align: baseline;
	font-size: 14px;
	background: transparent;
	list-style: none;
	box-sizing: border-box;
	word-break: break-all;
}

body {
	line-height: 1;
	-webkit-text-size-adjust: none;
	background: #eff3f6;
	color: #000;
}

span, em, mark, strong, b, label {
	margin: 0;
	padding: 0;
	border: 0;
	vertical-align: baseline;
	background: transparent;
	list-style: none;
	box-sizing: border-box;
}

p {
	line-height: 160%;
}

ol, ul {
	list-style: none;
}

a, a:link, a:visited, a:active, a:hover {
	text-decoration: none;
}

body.member {
	background: #fff;
}

.color-red {
	color: #ff545b !important;
}

@media ( max-width : 979px) {
	body .containerNew {
		padding-top: 0;
	}
}

@media ( max-width : 979px) {
	.containerNew {
		padding-top: 104px;
	}
}

@media only screen and (max-width: 979px) {
	.containerNew {
		padding: 0;
		padding-bottom: 170px;
	}
}

.containerNew {
	position: relative;
	max-width: 1260px;
	height: 100%;
	padding: 20px 0 0 0;
	margin: 0 auto;
}



.contents.member {
	margin-right: 0;
	min-height: 400px;
}



@media only screen and (max-width: 1599px) {
	.contents.member {
		margin: 0 auto 100px;
	}
}

@media only screen and (max-width: 979px) {
	.contents.member {
		margin-bottom: 0;
	}
}

@media only screen and (max-width: 979px) {
	.contents {
		position: inherit;
		min-height: initial;
	}
}

@media only screen and (max-width: 1599px) {
	.contents {
		margin: 0 auto;
		max-width: 1260px;
	}
}

.contents {
	position: relative;
	z-index: 1;
	min-height: 920px;
}

.cont-area {
	margin-right: 310px;
	padding: /*20px 30px 60px 30px*/ 20px 30px 0 30px;
	margin-bottom: /*70px*/ 40px;
	background: #fff;
	position: relative;
}

@media only screen and (max-width: 979px) {
	.contents.member .cont-area {
		padding-bottom: 60px;
	}
}

@media only screen and (max-width: 1599px) {
	.contents.member .cont-area {
		width: 100%;
		float: none;
	}
}

.contents.member .cont-area {
	margin: 0 auto 0;
	max-width: 630px;
}

@media only screen and (max-width: 979px) {
	.cont-area {
		min-height: auto;
		margin-right: 0;
		padding: 20px 0 120px;
		/* border-top: 10px solid #eff3f6; */
		max-width: none !important;
		width: 100% !important;
	}
}

@media only screen and (max-width: 1160px) {
	.cont-area {
		margin: 0 auto;
		max-width: 950px;
		width: 100%;
		float: none;
	}
}

@media only screen and (max-width: 1599px) {
	.cont-area {
		margin-right: 0;
		float: left;
		width: calc(100% - 310px);
	}
}

.tit-h1.line {
	margin: 0 -30px 30px;
	border-bottom: 1px solid #eaeaea;
	padding: 0 30px 20px;
}

@media only screen and (max-width: 979px) {
	.contents.member .cont-area h1 {
		display: block !important;
		padding-left: 15px;
	}
}

@media only screen and (max-width: 979px) {
	.tit-h1.line {
		margin: 0 0 20px;
	}
}

@media only screen and (max-width: 979px) {
	.cont-area h1 {
		display: none;
	}
}

.tit-h1 {
	font-size: 20px;
	margin-bottom: 30px;
	font-weight: bold;
	line-height: 100%;
}

[class*="message-st"] {
    max-width: 460px;
    margin: 0 auto;
    text-align: center;
    line-height: 150%;
}
.id-result [class*="message-st"] {
    margin-top: 0;
}
@media only screen and (max-width: 979px){
.id-result [class*="message-st"] {
    margin-top: 20px;
}
}
[class*="message-st"] .big-text {
    position: relative;
    font-size: 20px;
    line-height: 150%;
    /*padding-top: 100px;*/
}
.big-text {
    font-size: 16px;
    line-height: 170%;
    color: #222;
}
[class*="message-st"] {
    max-width: 460px;
    margin: 0 auto;
    text-align: center;
    line-height: 150%;
}
/*
[class*="message-st"] .big-text:after {
    content: "";
    position: absolute;
    top: 0;
    left: 50%;
    margin-left: -65px;
    width: 130px;
    height: 130px;
    background: url(/resources/img/icon.png) no-repeat 0 0;
}
*/
[class*="message-st"] span {
    display: inline-block;
    font-size: inherit;
}
#idfail{
height: 150px;
width: 150px;
}
@media only screen and (max-width: 979px){
[class*="message-st"] .big-text {
    font-size: 16px;
}
}

[class*="btn-"].gray {
	background: #444;
	border: 1px solid #444;
	color: #fff;
}

@media only screen and (max-width: 979px) {
	[class*="btn-t"] {
		padding: 10px 10px;
		min-width: 70px;
		font-size: 14px;
		height: 36px;
	}
}

[class*="btn-t"] {
	padding: 6px 10px;
	min-width: 60px;
	font-size: 14px;
	bottom: 0;
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

.bt-area {
	overflow: hidden;
	padding: 20px 0 40px;
}

.member .bt-area {
	overflow: hidden;
	padding: 20px 0;
	text-align: center;
}

.member .bt-area .btn-b {
	min-width: 142px;
}

[class*="btn-"].red {
	background: #ff545b;
	border: 1px solid #ff545b;
	color: #fff;
}

[class*="btn-"].gray-hg {
	background: #979797;
	border: 1px solid #c6c6c6;
	color: #fff;
}

[class*="btn-b"] {
	padding: 13px 25px;
	min-width: 90px;
	font-size: 16px;
}

@media only screen and (max-width: 979px) {
.message-st-no + .bt-area {
		margin-top: 20px;
	}
}

@media only screen and (max-width: 979px) {
	.id-result .bt-area {
		padding: 0 15px !important;
	}
}

@media only screen and (max-width: 979px) {
	.member .bt-area {
		padding: 20px 0;
	}
}

@media only screen and (max-width: 979px) {
	.bt-area {
		clear: both;
		overflow: hidden;
		padding: 0 15px 40px;
	}
}

@media only screen and (max-width: 979px) {
	.id-result .bt-area .btn-b {
		width: 100%;
	}
}

.find-info {
	position: relative;
	margin: 0 0 20px 0;
	padding: 18px 18px 23px 24px;
	background: #f9f9f9;
	color: #888;
	text-align: right;
}

.find-info .txt {
	float: left;
	margin: 10px 0 0 0;
	text-align: left;
}

.find-info .bt-area {
	display: inline-block;
	margin: 5px 0 0 0;
	padding: 0;
}

@media only screen and (max-width: 979px) {
	.find-info {
		margin: 10px 0 0 0;
		padding: 0;
		background: none;
	}
}

@media only screen and (max-width: 979px) {
	.find-info .txt {
		display: none;
	}
}

@media only screen and (max-width: 979px) {
	.id-result .bt-area {
		padding: 0 15px !important;
	}
}

@media only screen and (max-width: 979px) {
	.find-info .bt-area {
		display: block;
		margin-bottom: 20px;
		overflow: hidden;
	}
}

@media only screen and (max-width: 979px) {
	.member .bt-area {
		padding: 20px 0;
	}
}

@media only screen and (max-width: 979px) {
	.find-info .bt-area .btn-t:first-child {
		margin-left: 0;
	}
}

@media only screen and (max-width: 979px) {
	.find-info .bt-area .btn-t {
		float: left;
		width: 49%;
		margin: 0 0.5%;
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
							<p class="big-text">입력하신 정보와 <span class="color-red">일치하는 회원정보</span>가 없습니다.<br>다른 방법으로 다시 시도해 보세요.</p>
						</div>

						<div class="bt-area">
							<a href="javascript:formSubmit();" class="btn-b gray">다시 시도하기</a>
						</div>
						<div class="find-info">
							<span class="txt">비밀번호 찾기와 회원가입을 원하시나요?</span> <span
								class="bt-area"> <a
								href="#"
								class="btn-t">회원가입</a> <a
								href="#"
								class="btn-t">비밀번호 찾기</a>
							</span>
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