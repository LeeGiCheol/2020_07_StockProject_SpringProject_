<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>회원가입</title>
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link href="/resources/css/signup01_02.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">
<script src="//image.paxnet.co.kr/rpan/common/js/validation/validation.custom.js"></script>
<script src="//image.paxnet.co.kr/rpan/common/js/validation/validation.methods.js"></script>
<script src="//image.paxnet.co.kr/rpan/common/js/validation/validation.messages.js"></script>
<script>
function numkeyCheck(e) { var keyValue = event.keyCode; if( ((keyValue >= 48) && (keyValue <= 57)) ) return true; else return false; }
function spaceCheck(e) { var keyValue = event.keyCode; if( (keyValue > 31) && (keyValue < 33) ) return false; else return true; }
</script>
</head>
<body>
<div class="wrap">
<%@include file="mainheader.jsp" %>
	
<%-- <div class="containerNew"> 

		contents
		<div class="contents member" id="contents">
		
			cont-area	
			<div class="cont-area">  
				<div class="step-mem">
					<ul>
						<li><div><span><i>Step1</i></span><em>약관동의</em></div></li> 
						<li class="selected"><div><span><i>Step2</i></span><em>기본정보입력</em></div></li>
						<li><div><span><i>Step3</i></span><em>가입완료</em></div></li>
					</ul>
				</div> 
				<div class="pad-area men-step">
					<h1>기본정보입력</h1>
					<form action="./step3Prc" method="post" name="frm" id="frm" novalidate="novalidate">
						<input type="hidden" name="cust_type" id="cust_type" value="P">
						<input type="hidden" name="outside_agree_fg" value="">
						<input type="hidden" name="receipt_fg_sms" value="Y">
						<input type="hidden" name="receipt_fg_mail" value="Y">
						<input type="hidden" name="app_push_fg" value="Y">
						<input type="hidden" name="birthCheckYn" value="Y">

						<fieldset>
							<legend>기본정보입력</legend>  
							<ul>
								<li>
									<span class="input-style-id">
										<label for="cust_id">아이디를 입력해주세요</label>
										<input type="text" id="cust_id" name="cust_id" maxlength="12" onkeyup="initCustId();">
										<button type="button" class="delete">삭제</button> 
									</span>
									<p id="err_cust_id" class="ok-text" style="display: none;">사용가능한 아이디입니다.</p>
									<button type="button" class="btn-s gray" onclick="checkId();">중복확인</button>
								</li>
								<li>
									<span class="input-style-pass">
										<label for="pswd">비밀번호를 입력해주세요</label>
										<input type="password" name="pswd" id="pswd" maxlength="14" autocomplete="OFF">
										<button type="button" class="delete" onclick="initBeforInput();">삭제</button>
									</span>
								</li>
								<li>
									<span class="input-style-pass01">
										<label for="pswdc">한번 더 입력해주세요</label>
										<input type="password" name="pswdc" id="pswdc" onkeyup="SameCheck(this);" maxlength="14" autocomplete="OFF">
										<button type="button" class="delete">삭제</button>
									</span>>
								</li>
							</ul> 
							<ul>

								<li>
									<span class="input-style-mail">
										<label for="email">이메일을 입력해주세요</label>
										<input type="text" name="email" id="email">
										<button type="button" class="delete">삭제</button>
									</span>
								</li>
								<li>
									<span class="input-style-phone">
										<label for="mobile_no">휴대폰번호('-'없이)</label>
										<input type="text" name="mobile_no" id="mobile_no" class="_onlyNumber" maxlength="11" onkeyup="initMobileNo();">
										<button type="button" class="delete">삭제</button>
									</span>
									<button type="button" class="btn-s" onclick="checkUserPhone();">인증받기</button>
								</li>
								<li id="_liPhoneNum" style="display: none;">
									<span class="input-style-certif">
										<label for="chk_Phone">인증번호를 입력해주세요</label>
										<input type="text" name="chk_Phone" id="chk_Phone">
									</span>
									<mark id="markTm">15:00</mark>
									<button type="button" class="btn-s" onclick="authPhone();">인증확인</button>
								</li>
	


							</ul> 
							<ul>
								<li>
									<span class="input-style-nick">
										<label for="nick_nm">닉네임을 입력해주세요</label>
										<input type="text" name="nick_nm" id="nick_nm" maxlength="24" onkeyup="initNickNm();">
										<button type="button" class="delete">삭제</button> 
									</span>  
									<span class="byte"><b id="maxText">0</b>/12byte</span>
									<button type="button" class="btn-s gray" onclick="checkNickName();">중복확인</button>
								</li> 
							</ul>
						
						

													
						</fieldset>
					</form>
					<div class="bt-area"> 
						
						<button class="btn-b" onclick="location.href='http://www.paxnet.co.kr';">취소</button>
						<button class="btn-b red" onclick="$('#frm').submit();">가입하기</button> 
					</div>
				
				
				
					<dl class="guide-text03">
						<dt>이용안내</dt>
						<dd>
							<ul>
								<li>성명, 성별, 생년월일은 아이디찾기, 비밀번호찾기 , 휴면계정 본인확인 등 가입자 정보 확인 시 본인확인을 위한 정보로 사용합니다.</li>
								<li>입력된 내용은 내정보 관리에서 변경 할 수 있습니다.</li>
								<li>허위정보는 본인확인에 대한 도움을 드릴 수 없습니다.</li>
							</ul>
						</dd>
					</dl> 
				
				</div> 
			</div>
		</div>
	</div> --%>
<div class="containerNew"> 

		<!-- contents -->
		<div class="contents member" id="contents">
		
			<!-- cont-area -->	
			<div class="cont-area">  
				<div class="step-mem">
					<ul>
						<li><div><span><i>Step1</i></span><em>약관동의</em></div></li> 
						<li class="selected"><div><span><i>Step2</i></span><em>기본정보입력</em></div></li>
						<li><div><span><i>Step3</i></span><em>가입완료</em></div></li>
					</ul>
				</div> 
				<div class="pad-area men-step">
					<h1>기본정보입력</h1>
					<!-- <form action="./step3Prc" method="post" name="frm" id="frm" novalidate="novalidate"> -->
					<form action="/signUp" name="form" id="form" method="POST">
					
						<input type="hidden" name="cust_type" id="cust_type" value="P">
						<input type="hidden" name="outside_agree_fg" value="">
						<input type="hidden" name="receipt_fg_sms" value="Y">
						<input type="hidden" name="receipt_fg_mail" value="Y">
						<input type="hidden" name="app_push_fg" value="Y">
						<input type="hidden" name="birthCheckYn" value="Y">
						
						<fieldset>
							<legend>기본정보입력</legend>  
							<ul>
								<li>
									<span class="input-style-mail">
										<label for="inputEmail">이메일을 입력해주세요</label>
										<input type="text" id="inputEmail" name="id">
										<button type="button" class="delete">삭제</button>
									</span>
									<div id="error-txt"></div>
									<button type="button" class="btn-s" id="idCheck">인증받기</button>
								</li>
								<li id="_liPhoneNum" style="display: none;">
									<span class="input-style-certif">
										<label for="inputEmail">인증번호를 입력해주세요</label>
										<input type="text" id="inputCemail" name="cEmail">
									</span>
									<div id="success-txt"></div>
									<button type="button" class="btn-s" id="cEmailCheck">인증확인</button>
								</li>
								<li>
									<span class="input-style-pass">
										<label for="pswd">비밀번호를 입력해주세요</label>
										<input type="password" name="pswd" id="pswd" maxlength="14" autocomplete="OFF">
										<button type="button" class="delete" onclick="initBeforInput();">삭제</button>
									</span>
								</li>
								<li>
									<span class="input-style-pass01">
										<label for="pswdc">한번 더 입력해주세요</label>
										<input type="password" name="pswdc" id="pswdc" onkeyup="SameCheck(this);" maxlength="14" autocomplete="OFF">
										<button type="button" class="delete">삭제</button>
									</span>
								</li>
							</ul> 
							<ul>
								<li>
									<span class="input-style-nick">
										<label for="nick_nm">닉네임을 입력해주세요</label>
										<input type="text" name="nick_nm" id="nick_nm" maxlength="24" onkeyup="initNickNm();">
										<button type="button" class="delete">삭제</button> 
									</span>  
									<p class="error-text" style="display: none	;" id="err_nick_nm">이미 사용중인 닉네임입니다.</p>
									<span class="byte"><b id="maxText">0</b>/12byte</span>
									<button type="button" class="btn-s gray" onclick="checkNickName();">중복확인</button>
								</li> 
								<li>
									<span class="input-style-nick">
										<label for="nick_nm">추천인을 입력해주세요</label>
										<input type="text" name="nick_nm" id="nick_nm" maxlength="24" onkeyup="initNickNm();">
										<button type="button" class="delete">삭제</button> 
									</span>  
									<p class="error-text" style="display: none	;" id="err_nick_nm">이미 사용중인 닉네임입니다.</p>
									<span class="byte"><b id="maxText">0</b>/12byte</span>
									<button type="button" class="btn-s gray" onclick="checkNickName();">추천하기</button>
								</li> 
							</ul>
							<ul>
								<li>
									<span class="input-style-address">
										<label for="mobile_no">주소를 입력해주세요</label>
										<input type="text" name="address" id="inputAddress" class="_onlyNumber" maxlength="11" onkeyup="initMobileNo();">
										<button type="button" class="delete">삭제</button>
									</span>
									<button type="button" class="btn-s" onclick="goPopup();">우편번호 찾기</button>
								</li>
								<li id="_liPhoneNum" style="display: none;">
									<span class="input-style-certif">
										<label for="chk_Phone">인증번호를 입력해주세요</label>
										<input type="text" name="chk_Phone" id="chk_Phone">
									</span>
									<p id="err_mobile_no" class="ok-text" style="display: none;">인증이 완료되었습니다.</p>
									<mark id="markTm">15:00</mark>
									<button type="button" class="btn-s" onclick="authPhone();">인증확인</button>
								</li>
								<li>
									<span class="input-style-phone">
										<label for="mobile_no">휴대폰번호('-'없이)</label>
										<input type="text" name="mobile_no" id="mobile_no" class="_onlyNumber" maxlength="11" onkeyup="initMobileNo();">
										<button type="button" class="delete">삭제</button>
									</span>
									<button type="button" class="btn-s" onclick="checkUserPhone();">인증받기</button>
								</li>
								<li id="_liPhoneNum" style="display: none;">
									<span class="input-style-certif">
										<label for="chk_Phone">인증번호를 입력해주세요</label>
										<input type="text" name="chk_Phone" id="chk_Phone">
									</span>
									<p id="err_mobile_no" class="ok-text" style="display: none;">인증이 완료되었습니다.</p>
									<mark id="markTm">15:00</mark>
									<button type="button" class="btn-s" onclick="authPhone();">인증확인</button>
								</li>
	


							</ul> 

						
						

													
						</fieldset>
					</form>
					<div class="bt-area"> 
						
						<button class="btn-b" onclick="location.href='http://www.paxnet.co.kr';">취소</button>
						<button class="btn-b red" onclick="$('#frm').submit();">가입하기</button> 
					</div>
				
				
				
					<dl class="guide-text03">
						<dt>이용안내</dt>
						<dd>
							<ul>
								<li>성명, 성별, 생년월일은 아이디찾기, 비밀번호찾기 , 휴면계정 본인확인 등 가입자 정보 확인 시 본인확인을 위한 정보로 사용합니다.</li>
								<li>입력된 내용은 내정보 관리에서 변경 할 수 있습니다.</li>
								<li>허위정보는 본인확인에 대한 도움을 드릴 수 없습니다.</li>
							</ul>
						</dd>
					</dl> 
				
				</div> 
			</div>
		</div>
	</div>
		<%@include file="mainfooter.jsp" %>
</div>

<%-- <%@include file="mainheader.jsp" %>
 	<form action="/signUp" name="form" method="POST">
		<div class="container">
			<div class="allBody">
				<label for="inputEmail">이메일</</label> 
				<div class="form-group col-md-6" style="display: -webkit-box;">
					<input type="email"	class="form-control" id="inputEmail" name="id" placeholder="인증받을 이메일을 입력해주세요." onKeyPress="return spaceCheck(event)">
					<button type="button" class="btn btn-secondary" id="idCheck">인증번호전송</button>
					<ul><li style="list-style:none;" id="idResult"></li></ul>
				</div>
				<label for="inputEmail col-md-6">인증번호확인</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text" class="form-control" id="inputCemail" name="cEmail" placeholder="인증번호를 입력해주세요." onKeyPress="return numkeyCheck(event)"> 
                	 <button type="button" class="btn btn-secondary" id="cEmailCheck">인증번호확인</button>
              		 <ul><li style="list-style:none;" id="cEmailResult"></li></ul>	 
				</div>
			<div class="password">
				<label for="inputPassword">비밀번호</label>
				<div class="form-group col-md-6" >
					 <input type="password" class="form-control" id="inputPassword" placeholder="8자 ~ 13자 입력해주세요." name="pw" oninput="checkPw()" onKeyPress="return spaceCheck(event)">
				</div>
				<label for="inputPasswordAgain">비밀번호확인</label>
				<div class="form-group col-md-6" style="display: -webkit-box;">
					 <input	type="password" class="form-control" id="inputPasswordAgain" placeholder="한 번 더 입력해주세요. " oninput="checkPw()" onKeyPress="return spaceCheck(event)">
					 <ul><li style="list-style:none;" id="pwResult"></li></ul>
				</div>
				
            </div>
				<label for="inputnickname col-md-6">닉네임</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text"	class="form-control" id="inputNickname" name="nickname" onKeyPress="return spaceCheck(event)">
					 <button type="button" class="btn btn-secondary" id="nickCheck">　중복확인　</button>	
					 <ul><li style="list-style:none;" id="nickNameResult"></li></ul>
				</div>
				<label for="inputAddress col-md-6">추천인</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text"	class="form-control" id="inputFriend" name="friend" placeholder="" onKeyPress="return spaceCheck(event)">
					 <button type="button" class="btn btn-secondary" id="friendCheck">　추천하기　</button>	
					 <ul><li style="list-style:none;" id="friendResult"></li></ul>
				</div>
				
				<label for="inputAddress col-md-6">주소</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text"	class="form-control" id="inputAddress" name="address" required="true" readonly>
					 <button type="button" class="btn btn-secondary" onclick="goPopup();">우편번호찾기</button>		
				</div>
				
				<label for="inputPhone col-md-6" >휴대폰</label>
				<div class="form-group" style="display: -webkit-box;">
					<input placeholder="휴대폰번호롤 입력해주세요." type="text"	class="form-control" id="inputPhone" name="tel" onKeyPress="return numkeyCheck(event)" maxlength="11">
					<button type="button" class="btn btn-secondary" id="telCheck">인증번호전송</button>
					<ul><li style="list-style:none;" id="telResult"></li></ul>		
				</div>
				
				<label for="inputPhone col-md-6">인증번호확인</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text" class="form-control" id="inputCtel" name="cTel" placeholder="인증번호를 입력해주세요." onKeyPress="return numkeyCheck(event)"> 
                	 <button type="button" class="btn btn-secondary" id="cTelCheck">인증번호확인</button>
              		 <ul><li style="list-style:none;" id="cTelResult"></li></ul>	 
				</div>
           </div>
                
                노출 수정
            <div style="margin-left:294px; margin-top: 30px; margin-bottom: 10px; display: -webkit-box;">
               <small class="text-muted">다른 사용자에게 보유 자산 및 수익률과 거래내역을 노출 하시겠습니까?</small>
               <br>
               <br>
               <div class="ask-form">
                  <div class="custom-control custom-radio">
                  <input type="radio" name="showEsetSetting" id="ask-radio-1" class="custom-control-input" value="1">
                  <label class="custom-control-label" id="ask-radio-1-answer" for="ask-radio-1">예</label>
                  </div>
                  <div class="custom-control custom-radio">
                  <input type="radio" name="showEsetSetting" id="ask-radio-2" class="custom-control-input" value="0" checked="checked">
                  <label class="custom-control-label" for="ask-radio-2">아니오</label>
                  </div>
               </div>
               <br>
            </div>
            노출 수정
                
            </div>
            <div style="text-align:center">
                <div><button type="submit" class="nextButton" data-text-content="true" id="submit" >회원가입</button></div> disabled="disabled" 
            </div>
	</form>
<%@include file="mainfooter.jsp" %> --%>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>

	
	function goPopup(){
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		
		// 가운데 띄우기
		var width = "570"; 
		var height = "420"; 
		var top = (window.screen.height-height)/2; 
		var left = (window.screen.width-width)/2; 
		var url = "/signUpPage/jusoPopup"; 
		var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width="+width+",height="+height+",top="+top+",left="+left; 
		var pop = window.open(url , "pop", status);
		
		// 왼쪽 상단에 띄우기		
		//var pop = window.open("/signUpPage/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	    
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	//}
	/** API 서비스 제공항목 확대 (2017.02) **/
	function jusoCallBack(roadFullAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		console.log(roadFullAddr);
		document.form.inputAddress.value = roadFullAddr;
	}


	
	$(document).ready(function(e){ 
		var checkflag = 0;
	
		$("#submit").on("click", function(){
			if($("#inputEmail").val()==""){
				swal({text:"이메일을 입력해주세요.", icon:"error"})
				$("#inputEmail").focus();
				return false;
			}
			if($("#inputCemail").val()==""){
				swal({text:"이메일 인증번호를 입력해주세요.", icon:"error"})
				$("#inputCemail").focus();
				return false;
			}
			if($("#inputPassword").val()==""){
				swal({text:"패스워드를 입력해주세요.", icon:"error"})
				$("#inputPassword").focus();
				return false;
			}
			if($("#inputNickname").val()==""){
				swal({text:"닉네임을 입력해주세요.", icon:"error"})
				$("#inputNickname").focus();
				return false;
			}
			if($("#inputPhone").val()==""){
				swal({text:"휴대폰번호를 입력해주세요.", icon:"error"})
				$("#inputPhone").focus();
				return false;
			}
			if($("#cTel").val()==""){
				swal({text:"휴대폰번호 인증번호를 입력해주세요.", icon:"error"})
				$("#cTel").focus();
				return false;
			}

			
			var checked =  $('#passwordCheck').val();
			// 비밀번호 확인 체크가 안되면 value는 undefiend 되면 value에 값이 들어와 로그인 된다  
			if(checked == undefined){
				swal({text:"비밀번호를 확인해주세요.", icon:"error"})
				return false;
			}
		});
		
		// 이메일 형식검사 및 이메일 전송
		$('#idCheck').on('click', function(){ 
			$.ajax({ 
				type: 'GET', 
				url: '${pageContext.request.contextPath}/idCheck', 
				data: { "id" : $('#inputEmail').val() }, 
				success: function(data){ 
					var atSign = $.trim($('#inputEmail').val().indexOf("@"));
					var com = $.trim($('#inputEmail').val().indexOf("."));
					// @ 와 .이 없으면 이메일 형식이 안맞는다고 띄우기 
					if(data == 0 && $.trim($('#inputEmail').val()) != '' && atSign != -1 && com != -1){
						$("#_liPhoneNum").css('display',"block");
						idx= true;
						$('#inputEmail').attr("readonly", true);
 						/* var html="<tr><td colspan='3' style='color: green'>이메일에 인증 번호를 확인해주세요.</td></tr>";  */
 						var html="<p id='cust_id-error' class='error-text'>이메일에 인증 번호를 확인해주세요.</p>";
						$('#error-txt').empty();
						$('#cEmailResult').empty();
						$('#error-txt').append(html);
						$("#submit").removeAttr("disabled");$("#submit").removeAttr("style");
							$.ajax({ 
								type: 'GET', 
								url: '${pageContext.request.contextPath}/user/signUp/mail', 
								data: { "id" : $('#inputEmail').val() } 
							});  
					}else if(atSign == -1 || com == -1){
						var html="<p id='cust_id-error' class='error-text'>이메일 형식을 맞춰주세요.</p>";
						
						$('#idResult').empty();
						$('#idResult').append(html);
						document.getElementById("inputEmail").value="";
						$("#submit").attr("disabled", "disabled");$("#submit").attr("style", "opacity:20%");
					}
					else{
						var html="p id='cust_id-error' class='error-text'>중복된 이메일입니다.</p>";
						
						$('#idResult').empty();
						$('#idResult').append(html);
						document.getElementById("inputEmail").value="";
						$("#submit").attr("disabled", "disabled");$("#submit").attr("style", "opacity:20%");
					}
				},
				error: function(){
					alert("에러");
				}
			});  
		});  
		//이메일 인증번호 확인
		$('#cEmailCheck').on('click', function(){ 
			$.ajax({ 
					type: 'GET', 
					url: '${pageContext.request.contextPath}/cEmailCheck', 
					data: { "cMail" : $('#inputCemail').val() }, 
					success: function(data){ 
						if(data == 0 && $('#inputCemail').val() != ''){
							$('#inputCemail').attr("readonly", true);
								var html="<tr><td colspan='3' style='color: green'>인증성공</td></tr>"; 
							$('#cEmailResult').empty();
							$('#cEmailResult').append(html);
							$("#submit").removeAttr("disabled");$("#submit").removeAttr("style");
						}
						/* else if($('#inputEmail').val() == ''){
							var html="<tr><td colspan='3' style='color: red'>이메일 전송을해주세요</td></tr>";
							$('#cEmailResult').empty();
							$('#cEmailResult').append(html);
							document.getElementById("inputCemail").value="";
							$("#submit").attr("disabled", "disabled");$("#submit").attr("style", "opacity:20%");
							$("#inputEmail").focus();
						} */
						else{
							var html="<tr><td colspan='3' style='color: red'>인증실패(인증번호를 확인해주세요)</td></tr>";
							$('#cEmailResult').empty();
							$('#cEmailResult').append(html);
							document.getElementById("inputCemail").value="";
							$("#submit").attr("disabled", "disabled");$("#submit").attr("style", "opacity:20%");
						}
					},
					error: function(){
						alert("에러");
					}
			});
		});
		
		// 휴대폰 중복확인
		$('#telCheck').on('click', function(){ 
			$.ajax({ 
				type: 'GET', 
				url: '${pageContext.request.contextPath}/telCheck', 
				data: { "tel" : $('#inputPhone').val() }, 
				success: function(data){ 
					if(data == 0 && $.trim($('#inputPhone').val()) != ''){
						idx= true;
						$('#inputPhone').attr("readonly", true);
						
 						var html="<tr><td colspan='3' style='color: green'>문자메세지를 확인해주세요.</td></tr>"; 
						$('#telResult').empty();
						$('#telResult').append(html);
						$("#submit").attr("disabled", "disabled");$("#submit").attr("style", "opacity:20%");
					}else if(data == 2 || $.trim($('#inputPhone').val()) == ""){
						var html="<tr><td colspan='3' style='color: red'>11자리를 입력해주세요.[ ex)01012345678 ]</td></tr>";
						$('#telResult').empty();
						$('#telResult').append(html);
						document.getElementById("inputPhone").value="";
						$("#submit").attr("disabled", "disabled");$("#submit").attr("style", "opacity:20%");
					}
					else{
						var html="<tr><td colspan='3' style='color: red'>이미 등록된 번호입니다.</td></tr>";
						$('#telResult').empty();
						$('#telResult').append(html);
						document.getElementById("inputPhone").value="";
						$("#submit").attr("disabled", "disabled");$("#submit").attr("style", "opacity:20%");
					}
				},
				error: function(){
					alert("서버에러");
				}
				
			});  
		});  
		
		// 휴대폰 인증번호확인
		$('#cTelCheck').on('click', function(){ 
			$.ajax({ 
				type: 'GET', 
				url: '${pageContext.request.contextPath}/cTelCheck', 
				data: { "cTel" : $('#inputCtel').val() }, 
				success: function(data){ 
					if(data == 0 && $.trim($('#inputCtel').val()) != ''){
						idx= true;
						$('#inputCtel').attr("readonly", true);
						
 						var html="<tr><td colspan='3' style='color: green'>인증성공</td></tr>"; 
						$('#cTelResult').empty();
						$('#cTelResult').append(html);
						$("#submit").removeAttr("disabled");$("#submit").removeAttr("style");
					}else{
						var html="<tr><td colspan='3' style='color: red'>인증실패(인증번호를 확인해주세요)</td></tr>";
						$('#cTelResult').empty();
						$('#cTelResult').append(html);
						document.getElementById("inputCtel").value="";
						$("#submit").attr("disabled", "disabled");$("#submit").attr("style", "opacity:20%");
					}
				},
				error: function(){
					alert("서버에러");
				}
				
			});  
		});  		
		
		
		
		$('#nickCheck').on('click', function(){ 
			$.ajax({ 
				type: 'GET', 
				url: '${pageContext.request.contextPath}/nickCheck', 
				data: { "nickname" : $('#inputNickname').val() }, 
				success: function(data){ 
					if($.trim($('#inputNickname').val()) == ""){
						var html="<tr><td colspan='3' style='color: red'>공백은 불가능합니다.</td></tr>";
						
						$('#nickNameResult').empty();
						$('#nickNameResult').append(html);
						document.getElementById("inputNickname").value="";
						// 중복체크 실패 시 회원가입 버튼 비활성화
						$("#submit").attr("disabled", "disabled");$("#submit").attr("style", "opacity:20%");
					}else if(data == 0 && $.trim($('#inputNickname').val()) != ""){
						idx= true;
						$('#inputNickname').attr("readonly", true);
 						var html="<tr><td colspan='3' style='color: green'>사용 가능합니다.</td></tr>"; 
						$('#nickNameResult').empty();
						$('#nickNameResult').append(html);
						$("#submit").removeAttr("disabled");$("#submit").removeAttr("style");
					}else{
						var html="<tr><td colspan='3' style='color: red'>중복된 닉네임입니다.</td></tr>";
						$('#nickNameResult').empty();
						$('#nickNameResult').append(html);
						document.getElementById("inputNickname").value="";
						// 중복체크 실패 시 회원가입 버튼 비활성화
						$("#submit").attr("disabled", "disabled");$("#submit").attr("style", "opacity:20%");
					}
				},
				error: function(){
					alert("서버에러");
				}
				
			});  
		});  
		
		
	
		$('#friendCheck').on('click', function(){ 
			$.ajax({ 
				type: 'GET', 
				url: '${pageContext.request.contextPath}/friendCheck', 
				data: { "nickname" : $('#inputFriend').val() }, 
				success: function(data){
					if($.trim($('#inputFriend').val()) == ""){
						var html="<tr><td colspan='3' style='color: blue'>공백은 불가능합니다.</td></tr>";
						$('#friendResult').empty();
						$('#friendResult').append(html);
						document.getElementById("inputFriend").value="";
					}else if(data == 0 && $.trim($('#inputFriend').val()) != ''){
						var html="<tr><td colspan='3' style='color: blue'>존재하지않은 닉네임입니다.</td></tr>";
						$('#friendResult').empty();
						$('#friendResult').append(html);
						document.getElementById("inputFriend").value="";
						/* $("#submit").attr("disabled", "disabled");$("#submit").attr("style", "opacity:20%"); */
					}else{
						idx= true;
						$('#inputFriend').attr("readonly", true);
						var html="<tr><td colspan='3' style='color: green'>사용 가능합니다.</td></tr>"; 
						$('#friendResult').empty();
						$('#friendResult').append(html);
						$("#submit").removeAttr("disabled");$("#submit").removeAttr("style");
					}
				},
				error: function(){
					alert("서버에러");
				}
			});  
		});  
	});
	
		
	function checkPw() {
		var password = $('#inputPassword').val();
		var passwordLength = $('#inputPassword');
		var passwordAgain = $('#inputPasswordAgain').val();
	    // 비밀번호, 비밀번호 확인이 다른 경우
		if (password != passwordAgain) {
			$("#inputPasswordAgain").css("background-color", "#FFCECE");
			
			$('#pwResult').empty();
			var html="<tr><td colspan='3' style='color: red'>비밀번호를 확인해주세요.</td></tr>"; 
			$('#pwResult').append(html);
			$("#submit").attr("disabled", "disabled");$("#submit").attr("style", "opacity:20%");
		}
		// 비밀번호 길이 제한
		else if($('#inputPassword').val().length < 8 || $('#inputPassword').val().length > 13){
		
			var html="<tr><td colspan='3' style='color: red'>비밀번호는 8자리 이상 \n13자리 이하만 가능합니다.</td></tr>"; 
			$('#pwResult').empty();
			$('#pwResult').append(html);
			$("#submit").attr("disabled", "disabled");$("#submit").attr("style", "opacity:20%");
		} 
	    // 맞는 경우
		else if(password == passwordAgain){
			$("#inputPasswordAgain").css("background-color", "#B0F6AC");
			var html="<tr><td colspan='3' style='color: green' id='passwordCheck'>사용 가능합니다.</td></tr>"; 
			$('#pwResult').empty();
			$('#pwResult').append(html);
			$("#submit").removeAttr("disabled");$("#submit").removeAttr("style");
		}
	}
	
	$(document).on('focusin focusout', 'input[type=text], input[type=password]', function (e) {
		var _this = $(this);
		var lb = _this.prev('label');
		var btnDel = _this.parent().find('.delete');
		if(e.type == 'focusin') {
			lb.css('text-indent', '-3000px');
			_this.siblings('.delete').hide();
		}else{
			if(_this.val().length == 0) {
				lb.css('text-indent', '0');
				_this.siblings('.delete').hide();
			} else {
				btnDel.show();
				_this.siblings('.delete').show();
			}
		}
	});
	$(document).on('click', 'button.delete', function (e) {
		var _this = $(this);
		var ipt = _this.parent().find('input');
		ipt.val('').focus();
		_this.hide();
	});
</script>
</body>
</html>