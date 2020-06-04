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
	min-height: 600px;
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

@media only screen and (max-width: 979px) {
	.find-desc {
		padding: 0 15px;
		text-align: left;
		margin: 0;
	}
}

.find-desc {
	margin: 50px 0 0 0;
	text-align: center;
}

@media only screen and (max-width: 979px) {
	.find-desc .tit {
		display: none;
	}
}

@media only screen and (max-width: 979px) {
	.find-desc {
		padding: 0 15px;
		text-align: left;
		margin: 0;
	}
}

.find-desc .tit {
	font-size: 32px;
}

@media only screen and (max-width: 979px) {
	.find-desc .txt {
		color: #888;
		margin: 0;
	}
}

.find-desc .txt {
	margin: 20px 0 0 0;
	color: #444;
}

@media only screen and (max-width: 979px) {
	.find-desc {
		padding: 0 15px;
		text-align: left;
		margin: 0;
	}
}

.find-list {
    margin: 30px 0 0 0;
}

.find-list li.selected {
	position: relative;
}

@media only screen and (max-width: 979px) {
	.find-list {
		margin: 15px 0 0 0;
	}
}

.find-list li {
	border-left: 0;
	border-right: 0;
}

.find-list li {
	position: relative;
	margin: -1px 0 0 0;
	border: 1px solid #ccc;
}

.find-list li.selected:after {
	content: "";
	z-index: 1;
	position: absolute;
	top: -1px;
	left: -1px;
	right: -1px;
	bottom: 1px;
	width: 100%;
	height: 100%;
	border: 1px solid #ff545b;
}

.find-list li a {
	display: block;
	height: auto;
	padding: 25px 49px 25px 55px;
	line-height: normal;
	color: #444;
	font-size: 16px;
}

@media only screen and (max-width: 979px) {
	.find-list li a {
		padding: 25px 20px 25px 15px;
		font-size: 16px;
	}
}
/*
@media only screen and (max-width: 979px) {
	.find-list li a:before {
		content: "";
		left: 15px;
		top: 25px;
		width: 20px;
		height: 20px;
		background: url(/rpan/common/images/icon_big_sprite.png?update=20180329) no-repeat -230px -95px;
		background-size: 250px 250px;
	}
}

.find-list li a:before {
	content: "";
	position: absolute;
	top: 23px;
	left: 20px;
	width: 25px;
	height: 25px;
	background: url(/rpan/common/images/bg_form.png?update=20180329) no-repeat 0 -866px;
	vertical-align: middle;
}

.find-list li a:before {
	background-position: 0 -806px;
}
*/
.find-list li .fint-list-cont {
	display: block;
	padding: 0 49px 30px 55px;
}

@media only screen and (max-width: 979px) {
	.find-list li.selected a:before {
		background-position: -230px -65px;
	}
}

@media only screen and (max-width: 979px) {
	.find-list li .fint-list-cont {
		padding: 0 15px 20px;
	}
}

.find-list li .find-box {
	position: relative;
	z-index: 2;
}

.find-list .form-list {
	margin: 15px 0 0 0;
}

.find-list .form-list li:first-child {
	margin: 0;
}

.find-list .form-list li {
	margin: 8px 0 0 0;
	border: 0;
}

.find-list .form-list li .tit {
	position: absolute;
	top: -99999em;
	left: -99999em;
	width: 0;
	height: 0;
	text-indent: -99999em;
}

@media only screen and (max-width: 979px) {
	.find-list li {
		border-left: 0;
		border-right: 0;
	}
}

.find-list .form-list li .input-style {
	width: 100%;
}

[class*="input-style"] {
	display: inline-block;
	position: relative;
}

@media only screen and (max-width: 979px) {
	input[type="text"], input[type="password"], input[type="tel"] {
		padding: 9px 35px 10px 10px;
		height: 36px;
	}
}

input[type="text"], input[type="password"], input[type="tel"] {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	line-height: 1;
	width: 100%;
	padding: 5px 35px 6px 10px;
	border: 1px solid #ccc;
	background: #fff;
	color: #000;
	vertical-align: middle;
	box-sizing: border-box;
	border-radius: 0;
}

.member [class*="input-style"] button {
	top: 0;
	margin-top: 0;
}

@media only screen and (max-width: 979px) {
	[class*="input-style"] .delete {
		background-position: 10px -295px;
		background-size: 20px 450px;
	}
}

[class*="input-style"] .delete {
	background-position: 10px -500px;
	display: none;
}

@media only screen and (max-width: 979px) {
	[class*="input-style"] button {
		height: 36px;
		margin-top: -17px;
	}
}

[class*="input-style"] button {
	position: absolute;
	right: 1px;
	top: 50%;
	margin-top: -13px;
	width: 30px;
	height: 27px;
	text-indent: -9999px;
	background-image: url(/rpan/common/images/bg_form.png?update=20180329);
	background-repeat: no-repeat;
}

input[type="button"], button {
	margin: 0;
	padding: 0;
	border: 0;
	cursor: pointer;
	background: none;
}

.find-list .form-list li.input-type {
	padding-right: 82px;
}

.find-list .form-list li.input-type .btn-t {
	position: absolute;
	top: 0;
	right: 0;
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
	.find-list+.bt-area {
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
				<h1 class="tit-h1 line">아이디 찾기</h1>
				<div class="id-result">
					<div class="find-desc">
						<strong class="tit">아이디 찾기</strong>
						<p class="txt">아이디가 생각나지 않으세요? 아이디 찾는 방법을 선택해주세요.</p>
					</div>
					<form action="/forGetId" method="post" id="frm" name="frm">
						<input name="certType" class="certType" type="hidden" value="1">
						<input name="custNm" id="custNm" type="hidden" value=""> <input
							name="di" id="di" type="hidden" value="">

						<ul class="find-list step_toggle">

							<li><a href="#">본인 확인 이메일 인증</a>
								<div class="fint-list-cont">
									<div class="find-box">
										<p>
											회원가입 시 입력한 <span class="color-red">이메일 주소와 동일한 주소</span>를
											입력하셔야 해당 메일로 인증번호를 받을 수 있습니다.
										</p>
										<ul class="form-list">
<!-- 											<li><strong class="tit">성명</strong> <span
												class="input-style"> <input type="text"
													placeholder="성명을 입력해주세요." id="custNm2" name="custNm2">
													<button type="button" class="delete">삭제</button>
											</span></li> -->
											<!-- <li class="input-type"><strong class="tit">이메일
													주소</strong> <span class="input-style"> <input type="text"
													placeholder="이메일 주소를 입력해주세요." id="email" name="email">
													<button type="button" class="delete">삭제</button>
											</span>
												<button type="button" class="btn-t gray"
													onclick="emailAjax();">인증번호</button></li> -->
											<li class="input-type" id="_liCert2">
											<strong class="tit">인증번호입력</strong> <span class="input-style"> 
											<input type="text" placeholder="휴대폰번호를 입력해주세요." id="certificationNo2" name="tel" maxlength="11">
													<button type="button" class="delete">삭제</button>
											</span>
												<button type="submit" class="btn-t gray" onclick="emailCertAjax();">아이디 조회</button></li>
										</ul>
									</div>
								</div></li>
						</ul>
						<!-- // 2014.04.21 마크업 수정 -->

						<div class="bt-area">
							<a href="javascript:formSubmit();" class="btn-b gray">다음</a>
						</div>
						<div class="find-info">
							<span class="txt">비밀번호 찾기와 회원가입을 원하시나요?</span> <span
								class="bt-area"> <a
								href="https://member.paxnet.co.kr/rpan/member/join/step1"
								class="btn-t">회원가입</a> <a
								href="https://member.paxnet.co.kr/rpan/member/searchPwd"
								class="btn-t">비밀번호 찾기</a>
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
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>