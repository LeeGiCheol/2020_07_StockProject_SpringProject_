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
<%-- <div class="wrap">
<%@include file="mainheader.jsp" %> --%>
	
<!-- <div class="containerNew"> 

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
									<p id="pswd-error" class="error-text" style="display: none;">최소 6글자이상이어야 합니다</p>
									<p id="pswd-error" class="error-text" style="display: none;">필수 항목입니다.</p>
									<p id="pswd-error" class="error-text" style="display: none;">영문, 숫자 조합 6~14자 이내로 입력해주세요.</p>
								</li>
								<li>
									<span class="input-style-pass01">
										<label for="pswdc">한번 더 입력해주세요</label>
										<input type="password" name="pswdc" id="pswdc" onkeyup="SameCheck(this);" maxlength="14" autocomplete="OFF">
										<button type="button" class="delete">삭제</button>
									</span>
									<p id="pswd-error" class="error-text" style="display: none;">최소 6글자이상이어야 합니다</p>
									<p id="pswdc-error" class="error-text">비밀번호가 일치하지 않습니다.</p>
								</li>
							</ul> 
							<ul>

	기업, 일반회원
								<li>
									<span class="input-style-mail">
										<label for="email">이메일을 입력해주세요</label>
										<input type="text" name="email" id="email">
										<button type="button" class="delete">삭제</button>
									</span>
									<p id="email-error" class="error-text">필수 항목입니다.</p>
									<p id="email-error" class="error-text">메일규칙에 어긋납니다.</p>
								</li>
								<li>
									<span class="input-style-phone">
										<label for="mobile_no">휴대폰번호('-'없이)</label>
										<input type="text" name="mobile_no" id="mobile_no" class="_onlyNumber" maxlength="11" onkeyup="initMobileNo();">
										<button type="button" class="delete">삭제</button>
									</span>
									<p id="mobile_no-error" class="error-text">형식에 맞춰 입력해주세요.</p>
									<p id="err_mobile_limit" class="error-text" style="display: none;">문자 발송 가능 건수를 초과했습니다. 잠시 후 다시 시도해 주십시오.</p>
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
	</div> -->
<%-- 	<div class="containerNew"> 

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
					<form action="/signUp" name="form" method="POST">
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
										<label for="email">이메일을 입력해주세요</label>
										<input type="text" name="email" id="email">
										<button type="button" class="delete">삭제</button>
									</span>
									<button type="button" class="btn-s" id="idCheck">인증받기</button>
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
</div> --%>
<!-- <script language="javascript">
$(document).ready(function(){
	/* setInputEvent({onlyNumber:true,deleteBtn:true}); */
	//글자수 체크
	/* textLenCheck("nick_nm","필명",{max:12,currentLenId:"maxText"}); */
	
	scriptValidation();
	//ajax 로딩
/* 	setLoadingBar();	 */
});

function scriptValidation(){
	$('.ok-text, .error-text').hide();
	jQuery.validator.setDefaults({
		debug: true,
		success: "valid"
	});
	
	$.validator.addMethod('pwdChkChar', function (value) {
		var len = value.length;
		for(var i=0;i<len;i++){
			if(pw_comp.indexOf(value.charAt(i)) == -1){
				return false;
			}
		}
		return true;
	}, "허용된 문자가 아닙니다. 다시 입력해 주십시오");
	
	$.validator.addMethod('chkAge14', function (value) {
		
		var now = new Date();
		var year = now.getFullYear();
		var month = now.getMonth()+1;
		var day = now.getDate();
		if(month < 10) month = "0"+month;
		if(day < 10) day = "0"+day;
		var today = year+''+month+''+day;

		
		var result = today - parseInt(value) - 140000;
		if(result < 0){
			return false;
		}else{
			return true;
		}
	}, "만 14세 이상 가입할 수 있습니다.");
	
	$.validator.addMethod('paxId', function (value){
		var len = value.length;
		if(!(len > 4 && len < 13)){
			return false;
		}

		return true;
	}, "아이디는 영문자 또는 숫자 5~12자 이어야 합니다.");
	
	$.validator.addMethod('paxIdSmall', function (value){
		var len = value.length;

		for(i=0;i<len;i++){
			if(compLAlpha.indexOf(value.charAt(i)) > -1){
				return false;
			}
		}

		return true;
	}, "아이디는 소문자 영문만 입력 가능합니다.");
	
	
	$.validator.addMethod('pwdChkNumChar', function (value) {
		var len = value.length;
		var numCheck = false;
		for(i=0;i<len;i++){
			if(english.indexOf(value.charAt(i)) != -1){	// 영문자가 있으면 true
				numCheck = true;
			}
		}
		if(numCheck){	//만약 영문자가 있으면
			numCheck = false;
			for(i=0;i<len;i++){	//숫자가 포함되어있는지 검사
				if(num.indexOf(value.charAt(i)) != -1){	// 숫자가 있으면 true
					numCheck = true;
				}
			}
		}
		
		if(!numCheck) {// 숫자도 있고 영문자도 있어야 하는데 그렇지 않다면
			return false;
		}
		return true;
	}, "영문, 숫자 조합 6~14자 이내로 입력해주세요.");


	$.validator.addMethod('checkDate', function (value) {
		return checkDate(value);
	}, "날짜를 확인하세요.");
	
	$.validator.addMethod('checkDateErr', function (value) {
		return checkDateErr(value);
	}, "날짜를 확인하세요.");
	
	$.validator.addMethod('checkSaupVal', function (value) {
		return checkSaupNo(value);
	}, "사업자 등록번호가 잘못 입력되었습니다.");
	
	$.validator.addMethod('checkName', function (value) {
		return checkNicknameNonChar(value);
	}, "이름은 한글이나 영문, 숫자만 가능 합니다.");
	
	

	jQuery.validator.addMethod('remoteCheckId', function(value) {
		var result = false;
		if(value == "admin" || value=="pax"
				|| value=="paxnet" || value=="moneta"
			){
			return result;
		}

		var msgEl = $("#err_cust_id");
		msgEl.css('display',"none");
		msgEl.removeClass('ok-text');
		msgEl.removeClass('error-text');
		$.ajax({
			type: "POST",
			url: "./checkID",
			dataType: "json",
			async:false,
			cache:false,
			data: {cust_id:value},
			success: function(json) {
				if(json.resultCode=='0000'){
					AUTH_CUST_ID = true;
					
					msgEl.addClass('ok-text');
					msgEl.html('사용가능한 아이디입니다.');
					msgEl.css('display',"block");
				}else{
					AUTH_CUST_ID = false;
				}
			}
		});
		return AUTH_CUST_ID;
	}, '이미 사용중이거나 탈퇴한 아이디입니다.');


	
// 	$.validator.addMethod('remoteNickNm', function (value) {
// 		return AUTH_NICK_NAME_YN;
// 	}, "필명 중복확인을 해주세요.");
	
	$('#frm').validate({
		//validation이 끝난 이후의 submit 직전 추가 작업할 부분
		submitHandler: function() {
			memberJoin();
			return false;
		},
		//규칙
		rules: {
			cust_id: {
				required : true,
				minlength : 5,
				paxIdSmall : true,
				paxId : true,
				remoteCheckId : true
			},
			pswd: {
				required : true,
				minlength : 6,
				pwdChkChar : true,
				pwdChkNumChar : true,
			},
			pswdc: {
				required : true,
				minlength : 6,
				equalTo : "#pswd"
			},
			cust_nm: {
				required: true,
				checkName:true,
				minlength: 2
			},
		
			birthday: {
				required: true,
				number:true,
				birth:true,
				checkDate:true,
				chkAge14 : true
			},
		
			mobile_no: {
				required: true,
				number:true,
				mobile:true
			},
			age: {
				digits : true
			},
			email: {
				required : true,
				email : true
			},
			drmn_pd_cd: {
				required : true
			},
			nick_nm:{

			}
		
		},
		//규칙체크 실패시 출력될 메시지
		messages : {
			cust_id: {
				required : "필수 항목입니다.",
				minlength : "최소 {0}글자이상이어야 합니다"
				
			},
			pswd: {
				required : "필수 항목입니다."
				,minlength : "최소 {0}글자이상이어야 합니다"
			},
			pswdc: {
				required : "필수 항목입니다.",
				minlength : "최소 {0}글자이상이어야 합니다",
				equalTo : "비밀번호가 일치하지 않습니다."
			},
			cust_nm: {
				required : "필수 항목입니다.",
				checkName: "이름은 한글이나 영문, 숫자만 가능 합니다.",
				minlength : "최소 {0}글자이상이어야 합니다"
			},
			birthday: {
				rquired : "필수 항목입니다.",
				number: "숫자로 입력해주세요.",
				birth : "형식에 맞춰 입력해주세요.(예 : 19900101)"
			},
			mobile_no: {
				required: "필수 항목입니다.",
				number: "숫자로 입력해주세요.",
				mobile:"형식에 맞춰 입력해주세요."
			},
			age: {
				digits : "숫자만입력하세요"
			},
			email: {
				required : "필수 항목입니다.",
				email : "메일규칙에 어긋납니다."
			},
			drmn_pd_cd: {
				required : "휴면계정으로 전환되는 기간을 선택해 주세요"
			},
			corp_nm: {
				rquired : "필수 항목입니다."
			},
			ceo_nm: {
				rquired : "필수 항목입니다."
			},
			cust_check_no: {
				required: "필수 항목입니다.",
				minlength : "사업자번호는 10자리입니다.(예 : 1234567890)"
// 				required: true,
// 				number:true,
// 				minlength: 10,
// 				checkSaupVal:true
			},
			open_dt: {
				rquired : "필수 항목입니다.",
				number: "숫자로 입력해주세요.",
				birth : "형식에 맞춰 입력해주세요.(예 : 20170101)"
			}
			
		}
	});


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
}


//비밀번호 체크
function SameCheck(){
	
	if($("#pswd").val() == $("#pswdc").val()){
		$("#pswdc_ok").show();
		$("#pswdc_err").hide();
	}else{
		$("#pswdc_ok").hide();
		$("#pswdc_err").show();
	}
}

function initCustId(){
	AUTH_CUST_ID = false;
	var msgEl = $("#err_cust_id");
	msgEl.css('display',"none");
}

//이름저장
function checkNicknameNonChar(id_text){
	var nonchar = '~`!@#$%^&*()-_=+\|<>?,./;:"\'\\';

	var i ;
	for ( i=0; i < id_text.length; i++ )  {
		if( nonchar.indexOf(id_text.substring(i,i+1)) > 0) {
			break ;
		}
	}
	if( i != id_text.length ) {
		return false ;
	}else{
		return true ;
	}
}

//사용자 아이디 체크
var AUTH_CUST_ID = false;

function checkId(){
	AUTH_CUST_ID = false;
	if(!id_ck($("#cust_id").val())){
		$("#cust_id").focus();
		return;
	}
	
	 $.ajax({
		type: "POST",
		url: "./checkID",
		dataType: "json",
		data: {
			cust_id:$("#cust_id").val()
		},
		success: function(json) {
// 			var msgEl = $("#err_cust_id");
// 			msgEl.removeClass('ok-text');
// 			msgEl.removeClass('error-text');
			if(json.resultCode=='0000'){
// 				msgEl.addClass('ok-text');
// 				msgEl.html('사용가능한 아이디입니다.');
// 				msgEl.css('display',"block");
				alert("사용가능한 아이디입니다.");
				AUTH_CUST_ID = true;
			}else{
// 				msgEl.addClass('error-text');
// 				msgEl.html('이미 사용중이거나 탈퇴한 아이디입니다.');
// 				msgEl.css('display',"block");
				alert("이미 사용중이거나 탈퇴한 아이디입니다.");
				AUTH_CUST_ID = false;
			}
		},
		error: function(e) {
			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
		}
	});
}


function initNickNm(){
	AUTH_NICK_NAME_YN = false;
	var msgEl = $("#err_nick_nm");
	msgEl.css('display',"none");
}

//닉네임 체크
var AUTH_NICK_NAME_YN = false;
//닉네임체크
function checkNickName(){
	if($("#nick_nm").val()==''){
		var msgEl = $("#err_nick_nm");
		msgEl.removeClass('ok-text');
		msgEl.removeClass('error-text');
		msgEl.addClass('error-text');
		msgEl.html('필수 항목입니다.');
		msgEl.css('display',"block");
		$("#nick_nm").focus();
		return;
	}
	if(nick_nm_ck($("#nick_nm").val())){
		var msgEl = $("#err_nick_nm");
		msgEl.removeClass('ok-text');
		msgEl.removeClass('error-text');
		msgEl.addClass('error-text');
		msgEl.html('필명에는 특수문자를 사용할수 없습니다.');
		msgEl.css('display',"block");
		$("#nick_nm").focus();
		return;
	}
	if(!(getTextLength($("#nick_nm").val()) <=12)){
		var msgEl = $("#err_nick_nm");
		msgEl.removeClass('ok-text');
		msgEl.removeClass('error-text');
		msgEl.addClass('error-text');
		msgEl.html('필명은 영문 숫자 12자 한글 6자 이하여야 합니다.');
		msgEl.css('display',"block");
		$("#nick_nm").focus();
		return;
	}
	
	 $.ajax({
 		type: "POST",
 		url: "./checkNickNm",
 		dataType: "json",
 		data: {
 			cust_id:$("#cust_id").val(),
 			nick_nm:$("#nick_nm").val()
 		},
 		success: function(json) {
 			var msgEl = $("#err_nick_nm");
 			msgEl.removeClass('ok-text');
 			msgEl.removeClass('error-text');
			if(json.resultCode=='0000'){
				msgEl.addClass('ok-text');
				msgEl.html('사용가능한 닉네임입니다.');
				msgEl.css('display',"block");
				AUTH_NICK_NAME_YN = true;
			}else{
				msgEl.addClass('error-text');
				msgEl.html('이미 사용중인 닉네임입니다.');
				msgEl.css('display',"block");
				AUTH_NICK_NAME_YN = false;
			}
		},
		error: function(e) {
			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
		}
	});
}

//인증체크
var CHECK_NO = "";

//사용자 이메일 인증
function checkUserMail(){
	var email = $("#email").val();
	if(email==""){
// 		alert("휴대폰번호를 입력하세요");
		$("#email").focus();
		return;
	}
	if(email.length < 10){
		$("#email").focus();
		return;
	}
	
	//이메일 인증번호 발송 횟수 초과 여부 체크
	var checkCntResult = fCheckUserAuthReqCnt($("#email").val());
	if (checkCntResult == 'Y') {
		$("#err_email_limit").show();
		return;
	} else {
		$("#err_email_limit").hide();
	}
	
	var checkNo = randomVal();	//보안체크용 랜덤값
	
	 $.ajax({
		type: "POST",
		url: "./checkUserMail",
		dataType: "json",
		data: {
			email:email,
			checkNo:checkNo
		},
		success: function(json) {
			
			if(json.resultCode=='0000'){
				//인증번호 발송 횟수 증가
				$.ajax({
					type: "POST",
					url: "/rpan/member/addUserAuthReqCnt",
					dataType: "json",
					data: {
						reqLoc:"JOIN",
						reqValue:$("#email").val()
					},
					success: function(json) {
						if(json.resultCode != '0000'){
							alert('오류가 발생했습니다 관리자에게 문의하세요.');
						}
					},
					error: function(e) {
						alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
					}
				});				
				
				$("#_liEmail").css('display',"block");
				$("#chk_email").val("");
				CHECK_NO = checkNo;
				//타이머 가동
				if(timerId!=0){
					clearInterval(timerId); 
				}
				runTimer();
				
				var msgEl = $("#err_email");
				msgEl.removeClass('ok-text');
				msgEl.removeClass('error-text');				
				msgEl.addClass('error-text');
				msgEl.html("인증번호를 발송했습니다.<br>인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주십시오");
				msgEl.css('display',"block");
				
			}else{
				alert("메일 발송에 실패하였습니다.");
			}
		},
		error: function(e) {
			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
		}
	});
}
//사용자 휴대폰 인증
function checkUserPhone(){
	if($("#mobile_no").val()==""){
// 		alert("휴대폰번호를 입력하세요");
		$("#mobile_no").focus();
		return;
	}
	if($("#mobile_no").val().length < 10){
// 		alert("휴대폰번호가 잘못되었습니다.");
		$("#mobile_no").focus();
		return;
	}
	
	//휴대폰 인증번호 발송 횟수 초과 여부 체크
	var checkCntResult = fCheckUserAuthReqCnt($("#mobile_no").val());
	if (checkCntResult == 'Y') {
		$("#err_mobile_limit").show();
		return;
	} else {
		$("#err_mobile_limit").hide();
	}
	
	var checkNo = randomVal();	//보안체크용 랜덤값
	
	 $.ajax({
		type: "POST",
		url: "./checkUserPhone",
		dataType: "json",
		data: {
			mobile_no:$("#mobile_no").val(),
			mobile_country:$("#mobile_country").val(),
			checkNo:checkNo
		},
		success: function(json) {
			
			if(json.resultCode=='0000'){
				//인증번호 발송 횟수 증가
				$.ajax({
					type: "POST",
					url: "/rpan/member/addUserAuthReqCnt",
					dataType: "json",
					data: {
						reqLoc:"JOIN",
						reqValue:$("#mobile_no").val()
					},
					success: function(json) {
						if(json.resultCode != '0000'){
							alert('오류가 발생했습니다 관리자에게 문의하세요.');
						}
					},
					error: function(e) {
						alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
					}
				});				
				
				$("#_liPhoneNum").css('display',"block");
				$("#chk_Phone").val("");
				CHECK_NO = checkNo;
				//타이머 가동
				if(timerId!=0){
					clearInterval(timerId); 
				}
				runTimer();
				
				var msgEl = $("#err_mobile_no");
				msgEl.removeClass('ok-text');
				msgEl.removeClass('error-text');				
				msgEl.addClass('error-text');
				msgEl.html("인증번호를 발송했습니다.<br>인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주십시오");
				msgEl.css('display',"block");
				
			}else{
				alert("sms 발송에 실패하였습니다.");
			}
		},
		error: function(e) {
			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
		}
	});
}

//휴대폰/이메일 인증번호 전송 후 타이머 세팅
var AUTH_PHONE_YN = false;
var AUTH_MAIL_YN = false;
var timerYn = true;
var timerId = 0;
var timerTm = 180;
function runTimer(){
	timerYn = true;
	timerTm = 900;
	timerId = setInterval(function() {
		timerTm--;
		
		var minute = Math.floor(timerTm/60);
		var second = timerTm % 60;
		
		
		var sTime = minute+":"+(second<10?"0"+second:second);
		$("#markTm").html(sTime);
// 		markTm = timerTm;
		if(timerTm < 1){
			clearInterval(timerId); 
			timerId =0;
			timerYn =false;
		}
	}, 1000);
}
//메일 초기화
function initMail(){
	AUTH_MAIL_YN = false;
	var msgEl = $("#err_email");
	msgEl.css('display',"none");
}

//휴대폰 인증 초기화
function initMobileNo(){
	AUTH_PHONE_YN = false;
	var msgEl = $("#err_mobile_no");
	msgEl.css('display',"none");
}

//메일 인증체크
function authMail(){
	if(!timerYn){
		var msgEl = $("#err_email");
		msgEl.removeClass('ok-text');
		msgEl.removeClass('error-text');
		msgEl.addClass('error-text');
		msgEl.html('인증시간이 지났습니다. 다시 인증받기를 선택하세요.');
		msgEl.css('display',"block");
		AUTH_MAIL_YN = false;
		return;
	}
	 $.ajax({
		type: "POST",
		url: "./checkUserMailAuth",
		dataType: "json",
		data: {
			chk_email:$("#chk_email").val()
		},
		success: function(json) {
			var msgEl = $("#err_email");
 			msgEl.removeClass('ok-text');
 			msgEl.removeClass('error-text');

			if(json.resultCode=='0000' && json.resultMsg == CHECK_NO){
				msgEl.addClass('ok-text');
				msgEl.html('인증이 완료되었습니다.');
				msgEl.css('display',"block");
				clearInterval(timerId);
				AUTH_MAIL_YN = true;
			}else{
				AUTH_MAIL_YN = false;
				msgEl.addClass('error-text');
				var msg = "올바른 형식이 아닙니다.";
				if(json.resultCode=='9001'){
					msg = "인증시간이 지났습니다. 다시 인증받기를 선택하세요.";
				}else if(json.resultCode=='9002'){
					msg = "전송된 메일을 다시 확인하세요.";
					$("#chk_Phone").val("");
				}
				
				msgEl.html(msg);
				msgEl.css('display',"block");
			}
		},
		error: function(e) {
			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
		}
	});
}

//휴대폰 인증체크
function authPhone(){
	if(!timerYn){
		alert("인증시간이 지났습니다. 다시 인증받기를 선택하세요.");
		return;
	}
	 $.ajax({
		type: "POST",
		url: "./checkUserPhoneAuth",
		dataType: "json",
		data: {
			chk_Phone:$("#chk_Phone").val()
		},
		success: function(json) {
			var msgEl = $("#err_mobile_no");
			msgEl.removeClass('ok-text');
			msgEl.removeClass('error-text');

			if(json.resultCode=='0000' && json.resultMsg == CHECK_NO){
				msgEl.addClass('ok-text');
				msgEl.html('인증이 완료되었습니다.');
				msgEl.css('display',"block");
				clearInterval(timerId);
				AUTH_PHONE_YN = true;
			}else{
				AUTH_PHONE_YN = false;
				msgEl.addClass('error-text');
				var msg = "올바른 형식이 아닙니다.";
				if(json.resultCode=='9001'){
					msg = "인증 시간 오류.";
				}else if(json.resultCode=='9002'){
					msg = "전송된 문자를 다시 확인하세요.";
					$("#chk_Phone").val("");
				}
				
				msgEl.html(msg);
				msgEl.css('display',"block");
			}
		},
		error: function(e) {
			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
		}
	});
}

//랜덤값 생성
function randomVal() {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 6; i++ ) {
    	text += possible.charAt(Math.floor(Math.random() * possible.length));
    }
    return text;
}

var processYn=false;
//회원가입
function memberJoin(){
	var birthCheckYn = "Y";
	
	if(processYn){
		alert("회원가입 진행중입니다.");
		return;
	}
	if(!id_ck($("#cust_id").val())){
		$("#cust_id").focus();
		return;
	}
	if(!AUTH_CUST_ID){
		$("#cust_id").focus();
		return;
	}
	
	var pwd = $("#pswd").val();
	var pswdc = $("#pswdc").val();
	if(!pw_ck( pwd)){
		$("#pswd").focus();
		return;
	}
	if(!pw_ck(pswdc)){
		$("#pswdc").focus();
		return;
	}

	if(pwd.length  < 6 || pwd.length > 14){
		alert("비밀번호가 6자 이상 14자 이하여야 합니다");
		$("#pswd").focus();
		return;	
	}else if(pswdc.length < 6 || pswdc.length >14){
		alert("비밀번호확인이 6자 이상 14자 이하여야 합니다");
		$("#pswdc").focus();
		return;	
	}

	if(pwd != pswdc) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#pswdc").focus();
		return false;
	}

	if(""==$("#cust_nm").val()){
		alert("성명을 확인하세요.");
		$("#cust_nm").focus();
		return false;
	}
	
	//생년월일 체크
	if(birthCheckYn == "Y" && !checkDate($("#birthday").val())){
		alert("생년월일을 확인하세요.");
		$("#birthday").focus();
		return false;
	}
	//생년월일 미래 날자입력 체크
	if(birthCheckYn == "Y" && !checkDateErr($("#birthday").val())){
		alert("생년월일을 확인하세요.");
		$("#birthday").focus();
		return false;
	}
	
	var email = $("#email").val();
	if(email==""){
		alert("E-mail 주소를 입력하세요.");
		$("#email").focus();
		return;
	} else {
		if(!email_pattern(email)) {
			alert("E-mail 주소 형식이 틀립니다");
			$("#email").focus();
			return;
		}
		if(!email_domain(email)) {
			$("#email").focus();
			return;
		}
		if(!email_ck(email)){ // false가 리턴되는 경우
			$("#email").focus();
			return;
		}
	}
	
	if(!NullCheck(frm.mobile_no, '휴대전화번호')) {
		if(frm.mobile_no.value.length < 10){
			alert("휴대전화번호가 잘못되었습니다.");
			frm.mobile_no.focus();
			return;
		}
	} else {
		return;
	}
	
	if(!isInteger($("#mobile_no").val())){
		alert("휴대전화번호가 숫자형식이 아닙니다.");
		$("#mobile_no").focus();
		return;
	}
	
	if("F"==$("#cust_type").val()){
		if(!AUTH_MAIL_YN){
			alert("메일 인증은 필수 항목입니다.");
			$("#email").focus();
			return;
		}
	}else{
		if(!AUTH_PHONE_YN){
			alert("휴대폰 인증은 필수 항목입니다.");
			$("#mobile_no").focus();
			return;
		}
	}
	
	if($("#nick_nm").val()!=""){
		if(!AUTH_NICK_NAME_YN){
			alert("필명 중복확인은 필수 항목입니다.");
			$("#nick_nm").focus();
			return;
		}
		if(nick_nm_ck($("#nick_nm").val())){
			alert("필명에는 특수문자를 사용할수 없습니다.");
			$("#nick_nm").focus();
			return;
		}	
	}
	
	//법인회원 체크
	if("C"==$("#cust_type").val()){
		if($("#corp_nm").val()==""){
			alert("회사명을 입력하세요.");
			$("#corp_nm").focus();
			return;
		}
		if($("#cust_check_no").val()==""){
			alert("사업자번호를 입력하세요.");
			$("#cust_check_no").focus();
			return;
		}
		if($("#open_dt").val()==""){
			alert("설립일자를 입력하세요.");
			$("#open_dt").focus();
			return;
		}
		if($("#ceo_nm").val()==""){
			alert("대표자 성명을 입력하세요.");
			$("#ceo_nm").focus();
			return;
		}
		if($("#biz_kind_cd > option:selected").val()==""){
			alert("업종을 선택하세요.");
			$("#biz_kind_cd").focus();
			return;
		}
	}
	processYn = true;
	 $.ajax({
		type: "POST",
		url: "./step3Prc",
		dataType: "json",
		data: $("#frm").serialize(),
		success: function(json){
			processYn = false;
			if('0000' == json.resultCode){
				if("C"==$("#cust_type").val()){
					location.href="./step3?nick_nm="+json.nickNm+"&cust_id="+$("#cust_id").val();
				}else{
					//가입완료 페이지
					location.href="./step3-1?nick_nm="+json.nickNm+"&cust_id="+$("#cust_id").val()+"&email="+$("#email").val();
				}
			}else{
				alert(json.resultMsg);
			}
		},
		error: function(e) {
			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
			processYn = false;
		}
	});
// 	$("#frm").submit();
}

//아이디 체크 로직
function id_ck(value){
	var len = value.length;
	if(!(len > 4 && len < 13)){
//		alert("id는 4자 이상 12자 이하여야 합니다.");
		return false;
	}

	for(i=0;i<len;i++){
		if(comp.indexOf(value.charAt(i)) == -1){
// 			alert("허용된 문자가 아닙니다. 다시 입력해 주십시오");
			return false;
		}
	}
	if(value == "admin"){
	    alert("허용된 문자가 아닙니다. 다시 입력해 주십시오");
	}
	if(value == "pax"){
	    alert("혀용된 문자가 아닙니다. 다시 입력해 주십시오");
	}
	return true;
}

//비밀번호 체크로직
function pw_ck(value){
	var len = value.length;
	if(!(len > 5 && len < 15)){
		alert("비밀번호는 6자 이상 14자 이하여야 합니다.");
		return false;
	}
	for(i=0;i<len;i++){
		if(pw_comp.indexOf(value.charAt(i)) == -1){
			alert("허용된 문자가 아닙니다. 다시 입력해 주십시오");
			return false;
		}
	}
	var numCheck = false;
	for(i=0;i<len;i++){
		if(english.indexOf(value.charAt(i)) != -1){			// 영문자가 있으면 true
			numCheck = true;
		}
	}
	if(numCheck){	//만약 영문자가 있으면
		numCheck = false;
		for(i=0;i<len;i++){	//숫자가 포함되어있는지 검사
			if(num.indexOf(value.charAt(i)) != -1){			// 숫자가 있으면 true
				numCheck = true;
			}
		}
	}
	
	if(!numCheck) {								// 숫자도 있고 영문자도 있어야 하는데 그렇지 않다면
		alert("영문+숫자로 혼합하여 사용해 주십시오.");
		return false;
	}
	
	return true;
}

/////////////////////
//허용문자 목록
var comp    =	"0123456789abcdefghijklmnopqrstuvwxyz";
var pw_comp =	"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
var english =	"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
var num = 		"1234567890";
var compLAlpha=	"ABCDEFGHIJKLMNOPQRSTUVWXYZ";

function isInteger(st){
	if (!isEmpty(st)){
		for (j=0; j<st.length; j++){
		if (((st.substring(j, j+1) < "0") || (st.substring(j, j+1) > "9")))
			return false;
		}
	}else{
		return false;
	}
	return true ;
}

function ReplaceNull(obj) {
	str = obj.value;
	newstr = str.replace(/ /gi, "");
	obj.value = newstr;
}

function NullCheck(obj, objName) {
	ReplaceNull(obj);
	str = obj.value;
	if(str == "") {
		alert(objName+"를(을) 입력하십시요.");
		obj.focus();
		return 1;
	}
	return 0;
}

function isEmpty(toCheck){
	var chkstr = toCheck + "";
	var is_Space = true;
	
	if ( ( chkstr == "") || ( chkstr == null ) )
		return( true );
	for ( j = 0 ; is_Space && ( j < chkstr.length ) ; j++){
		if( chkstr.substring( j , j+1 ) != " " )
			is_Space = false ;
	}
	return ( is_Space );
}

function strLeng(strIn){
	var strOut = 0;
	for ( i = 0 ; i < strIn.length ; i++){
		ch = strIn.charAt(i);
		if ((ch == "\n") || ((ch >= "ㅏ") && (ch <= "히")) || ((ch >="ㄱ") && (ch <="ㅎ")))
			strOut += 2;
		else
			strOut += 1;
	}
	return (strOut);
}


function nick_nm_ck(str){
	var i, len;
	len = str.length;
	for(i = 0; i < len; i++){
		if(str.charCodeAt(i) >= 0x30 && str.charCodeAt(i) <= 0x39){ // 숫자이면
			continue;
		}else if(str.charCodeAt(i) >= 0x41 && str.charCodeAt(i) <= 0x5a){ // 영 대문자이면
			continue;
		}else if(str.charCodeAt(i) >= 0x61 && str.charCodeAt(i) <= 0x7a){ // 영 소문자이면
			continue;
		}else if(str.charCodeAt(i) >= 44032 && str.charCodeAt(i) <= 55203){ // 완성형 한글이면
			continue;
		}else if(str.charCodeAt(i) >= 0xf900 && str.charCodeAt(i) <= 0xffdf){ //한자
			continue;
		}else if(str.charCodeAt(i) >= 0x4e00 && str.charCodeAt(i) <= 0x9fa5){ //한자 호환
			continue;
		}else return true;
	}
	return false;
}

function email_pattern(address) {
	var regExp = /[._a-z0-9-]{2,}@[-a-z0-9]{2,}\.[-a-z0-9]{2,}/i;
	if(regExp.test(address))
		return true;
	else
		return false;
}

function email_domain(emailStr) {

	var checkTLD=1;
	var knownDomsPat=/^(com|net|org|edu|int|mil|gov|arpa|biz|aero|name|coop|info|pro|museum)$/;
	var knownDoms2Pat=/^(ac|ad|ae|af|ag|ai|al|am|an|ao|aq|ar|as|at|au|aw|az|ba|bb|bd|be|bf|bg|bh|bi|bj|bm|bn|bo|br|bs|bt|bv|bw|by|bz|ca|cc|cd|cf|cg|ch|ci|ck|cl|cm|cn|co|cr|cu|cv|cx|cy|cz|de|dj|dk|dm|do|dz|ec|ee|eg|eh|er|es|et|fi|fj|fk|fm|fo|fr|ga|gb|gd|ge|gf|gg|gh|gi|gl|gm|gn|gp|gq|gr|gs|gt|gu|gw|gy|hk|hm|hn|hr|ht|hu|id|ie|il|im|in|io|iq|ir|is|it|je|jm|jo|jp|ke|kg|kh|ki|km|kn|kp|kr|kw|ky|kz|la|lb|lc|li|lk|lr|ls|lt|lu|lv|ly|ma|mc|md|mg|mh|mk|ml|mm|mn|mo|mp|mq|mr|ms|mt|mu|mv|mw|mx|my|mz|na|nc|ne|nf|ng|ni|nl|no|np|nr|nu|nz|om|pa|pe|pf|pg|ph|pk|pl|pm|pn|pr|ps|pt|pw|py|qa|re|ro|ru|rw|sa|sb|sc|sd|se|sg|sh|si|sj|sk|sl|sm|sn|so|sr|st|sv|sy|sz|tc|td|tf|tg|th|tj|tk|tm|tn|to|tp|tr|tt|tv|tw|tz|ua|ug|uk|um|us|uy|uz|va|vc|ve|vg|vi|vn|vu|wf|ws|ye|yt|yu|za|zm|zr|zw)$/;
	
	var emailPat=/^(.+)@(.+)$/;
	
	var quotedUser="(\"[^\"]*\")";
	var ipDomainPat=/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/;
	
	var specialChars="\\(\\)><@,;:\\\\\\\"\\.\\[\\]";
	var validChars="\[^\\s" + specialChars + "\]";
	var atom=validChars + '+';
	var word="(" + atom + "|" + quotedUser + ")";
	var userPat=new RegExp("^" + word + "(\\." + word + ")*$");
	var domainPat=new RegExp("^" + atom + "(\\." + atom +")*$");

    // 이메일 사용자와 도메인을 분리
    var matchArray=emailStr.match(emailPat);
    if (matchArray==null) {
        alert("이메일 주소에는 '@'와 '.'이 포함되어야 합니다.");
        return false;
    }
    var user=matchArray[1];
    var domain=matchArray[2];
    for (i=0; i<user.length; i++) {
        if (user.charCodeAt(i)>127) {
            alert("이메일 주소에 특수문자가 포함되어 있습니다.");
            return false;
        }
    }
    for (i=0; i<domain.length; i++) {
        if (domain.charCodeAt(i)>127) {
            alert("이메일 주소에 특수문자가 포함되어 있습니다.");
            return false;
        }
    }
    // 이메일 사용자 체크
    if (user.match(userPat)==null) {
        alert("이메일 사용자가 올바르지 않습니다.");
        return false;
    }
    // 이메일 도메인 체크
    var IPArray=domain.match(ipDomainPat);
    if (IPArray!=null) {
        for (var i=1;i<=4;i++) {
            if (IPArray[i]>255) {
                alert("이메일 도메인 IP가 올바르지 않습니다.");
                return false;
            }
        }
        return true;
    }
    
    var atomPat=new RegExp("^" + atom + "$");
    var domArr=domain.split(".");
    var len=domArr.length;
    for (i=0;i<len;i++) {
        if (domArr[i].search(atomPat)==-1) {
            alert("이메일 도메인 형식이 올바르지 않습니다.");
            return false;
        }
    }
    
//    if (checkTLD && domArr[domArr.length-1].length!=2 &&
    if (checkTLD && domArr[domArr.length-1].search(knownDoms2Pat)==-1 &&  
        domArr[domArr.length-1].search(knownDomsPat)==-1) {
        alert("존재하지 않는 도메인 이름입니다.");
        return false;
    }
    
    if (len<2) {
        alert("도메인 이름이 올바르지 않습니다.");
        return false;
    }
    
    return true;
}

function email_ck(value){//null 체크는 하지 않는다. 필수값이 아니므로 null체크는 각각의 jsp에서 할것
	var ind=value.indexOf('@');
	var beforeAt=value.substring(0,ind);
	var afterAt=value.substring(ind);
	if(ind==-1){
		alert("메일주소를 정확하게 입력해 주세요.");
		return false;
	}else if(beforeAt.length==0){
		alert("메일주소를 정확하게 입력해 주세요.");
		return false;
	}else{
		var dotind=afterAt.indexOf('.');
		if(dotind==-1){
			alert("메일주소를 정확하게 입력해 주세요.");
			return false;
		}else{
			var beforeDot = afterAt.substring(1,dotind);
			var afterDot = afterAt.substring(dotind+1);
			if(beforeDot.length==0){
				alert("메일주소를 정확하게 입력해 주세요.");
				return false;
			}else if(afterDot.length==0){
				alert("메일주소를 정확하게 입력해 주세요.");
				return false;
			}
		}
	}
	return true;
}

//사업자 번호 체크
function checkSaupNo(value){
	
	if(value.length!=10){
		return false;
	}
	var num1=value.substr(0,3);
	var num2=value.substr(3,2);
	var num3=value.substr(5,5);
	
	if((num1=="")||(num2=="")||(num3=="")){
		return false;
	}
	li_value = new Array(10);
	if ( strLeng(num1) == 3 && strLeng(num2) == 2 && strLeng(num3) == 5){
		if ( ( isInteger(num1)) && ( isInteger(num2)) && ( isInteger(num3))){
			li_value[0] = ( parseFloat(num1.substring(0 ,1))  * 1 ) % 10;
			li_value[1] = ( parseFloat(num1.substring(1 ,2))  * 3 ) % 10;
			li_value[2] = ( parseFloat(num1.substring(2 ,3))  * 7 ) % 10;
			li_value[3] = ( parseFloat(num2.substring(0 ,1))  * 1 ) % 10;
			li_value[4] = ( parseFloat(num2.substring(1 ,2))  * 3 ) % 10;
			li_value[5] = ( parseFloat(num3.substring(0 ,1))  * 7 ) % 10;
			li_value[6] = ( parseFloat(num3.substring(1 ,2))  * 1 ) % 10;
			li_value[7] = ( parseFloat(num3.substring(2 ,3))  * 3 ) % 10;
			li_temp = parseFloat(num3.substring(3,4))  * 5 + "0";
			li_value[8] = parseFloat(li_temp.substring(0,1)) + parseFloat(li_temp.substring(1,2));
			li_value[9] =  parseFloat(num3.substring(4,5));
			li_lastid = (10 - ( ( li_value[0] + li_value[1] + li_value[2] + li_value[3] + li_value[4] + li_value[5] + li_value[6] + li_value[7] + li_value[8] ) % 10 ) ) % 10;
			if (li_value[9] != li_lastid){
				return false;
			}else{
				return true;
			}
		}else{
			return false;
		}
	}else {
		return false;
	} 
	return true;
}

//사업자 등록번호 체크
// function saup_ck(obj1,obj2,obj3){
// 	if((obj1.value=="")||(obj2.value=="")||!(obj3.value=="")){
// // 		alert("사업자등록번호를 입력해 주세요.");
// // 		obj1.focus();
// 		return false;
// 	}
// 	li_value = new Array(10);          
// 	if ( strLeng(obj1.value) == 3 && strLeng(obj2.value) == 2 && strLeng(obj3.value) == 5){
//    		if ( ( isInteger(obj1.value)) && ( isInteger(obj2.value)) && ( isInteger(obj3.value))){
//           li_value[0] = ( parseFloat(obj1.value.substring(0 ,1))  * 1 ) % 10;
//           li_value[1] = ( parseFloat(obj1.value.substring(1 ,2))  * 3 ) % 10;
//           li_value[2] = ( parseFloat(obj1.value.substring(2 ,3))  * 7 ) % 10;
//           li_value[3] = ( parseFloat(obj2.value.substring(0 ,1))  * 1 ) % 10;
//           li_value[4] = ( parseFloat(obj2.value.substring(1 ,2))  * 3 ) % 10;
//           li_value[5] = ( parseFloat(obj3.value.substring(0 ,1))  * 7 ) % 10;
//           li_value[6] = ( parseFloat(obj3.value.substring(1 ,2))  * 1 ) % 10;
//           li_value[7] = ( parseFloat(obj3.value.substring(2 ,3))  * 3 ) % 10;
//           li_temp = parseFloat(obj3.value.substring(3,4))  * 5 + "0";
//           li_value[8] = parseFloat(li_temp.substring(0,1)) + parseFloat(li_temp.substring(1,2));          
//           li_value[9] =  parseFloat(obj3.value.substring(4,5));          
//           li_lastid = (10 - ( ( li_value[0] + li_value[1] + li_value[2] + li_value[3] + li_value[4] + li_value[5] + li_value[6] + li_value[7] + li_value[8] ) % 10 ) ) % 10;          
//           if (li_value[9] != li_lastid){          
// //             alert("\n사업자등록번호가 잘못 입력되었습니다.");          
// //             obj1.select();          
// //             obj1.focus();          
//             return false;          
//           }else          
//             return true;
//         }else          
//              alert("사업자등록번호는 123-45-56789의 형태로 입력하십시오.");          
//              obj1.focus();          
//              obj1.select();          
//              return false;          
//     }else {          
// 		alert("사업자등록번호는 123-45-56789의 형태로 입력하십시오.");          
// 		obj1.focus();          
// 		obj1.select();          
// 		return false;          
//     } 

// 	return true;    	             
// }

// function saup_val_ck(val1,val2,val3)          
// {          
// 	if(!(val1)||!(val2)||!(val3)){
// 		alert("사업자등록번호를 입력해 주세요.");
// 		return false;
// 	}
// 	li_value = new Array(10);          
// 	if ( strLeng(val1) == 3 && strLeng(val2) == 2 && strLeng(val3) == 5){          
//    		if ( ( isInteger(val1)) && ( isInteger(val2)) && ( isInteger(val3))){          
//           li_value[0] = ( parseFloat(val1.substring(0 ,1))  * 1 ) % 10;          
//           li_value[1] = ( parseFloat(val1.substring(1 ,2))  * 3 ) % 10;          
//           li_value[2] = ( parseFloat(val1.substring(2 ,3))  * 7 ) % 10;          
//           li_value[3] = ( parseFloat(val2.substring(0 ,1))  * 1 ) % 10;          
//           li_value[4] = ( parseFloat(val2.substring(1 ,2))  * 3 ) % 10;          
//           li_value[5] = ( parseFloat(val3.substring(0 ,1))  * 7 ) % 10;          
//           li_value[6] = ( parseFloat(val3.substring(1 ,2))  * 1 ) % 10;          
//           li_value[7] = ( parseFloat(val3.substring(2 ,3))  * 3 ) % 10;          
//           li_temp = parseFloat(val3.substring(3,4))  * 5 + "0";          
//           li_value[8] = parseFloat(li_temp.substring(0,1)) + parseFloat(li_temp.substring(1,2));          
//           li_value[9] =  parseFloat(val3.substring(4,5));          
//           li_lastid = (10 - ( ( li_value[0] + li_value[1] + li_value[2] + li_value[3] + li_value[4] + li_value[5] + li_value[6] + li_value[7] + li_value[8] ) % 10 ) ) % 10;          
//           if (li_value[9] != li_lastid){          
//             alert("\n사업자등록번호가 잘못 입력되었습니다.");          
//             return false;          
//           }else          
//             return true;
//         }else          
//              alert("사업자등록번호는 123-45-56789의 형태로 입력하십시오.");          
//              return false;          
//     }else {          
//              alert("사업자등록번호는 123-45-56789의 형태로 입력하십시오.");          
//   		return false;          
//     } 

// 	return true;
// }

/*
 * 날짜포맷에 맞는지 검사
 */
function isDateFormat(d) {
	var df = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
	return d.match(df);
}

/*
 * 윤년여부 검사
 */
function isLeaf(year) {
	var leaf = false;
	
	if(year % 4 == 0) {
		leaf = true;
	
		if(year % 100 == 0) {
			leaf = false;
		}
	
		if(year % 400 == 0) {
			leaf = true;
		}
	}
	
	return leaf;
}

/*
 * 날짜가 유효한지 검사
 */
function isValidDate(d) {
	// 포맷에 안맞으면 false리턴
	if(!isDateFormat(d)) {
		return false;
	}
	
	var month_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	
	var dateToken = d.split('-');
	var year = Number(dateToken[0]);
	var month = Number(dateToken[1]);
	var day = Number(dateToken[2]);
	
	// 날짜가 0이면 false
	if(day == 0) {
		return false;
	}
	
	var isValid = false;
	
	// 윤년일때
	if(isLeaf(year)) {
		if(month == 2) {
			if(day <= month_day[month-1] + 1) {
				isValid = true;
			}
		} else {
			if(day <= month_day[month-1]) {
				isValid = true;
			}
		}
	} else {
		if(day <= month_day[month-1]) {
			isValid = true;
		}
	}
	
	return isValid;
}
//날짜체크
function checkDate(dt){
	if(dt.length!=8){
		return false;
	}
	var date = dt.substring(0,4)+"-"+dt.substring(4,6)+"-"+ dt.substring(6,8)
	return isValidDate(date);
}
//미래날짜 입력 체크
function checkDateErr(dt){
	var date = new Date();
	
	var year  = date.getFullYear();
	var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
	var day   = date.getDate();
	
	if (("" + month).length == 1) { month = "0" + month; }
	if (("" + day).length   == 1) { day   = "0" + day;   }
	
	var userYmd = Number(dt);
	var ymd = Number(""+year + month + day);
	if(userYmd > ymd){
		return false;
	}else{
		return true;
	}
}

//인증번호 발송 횟수 초과 여부 체크(Y:초과, N:초과아님.)
function fCheckUserAuthReqCnt(value) {
	var checkResult = "N";
	
	$.ajax({
		type: "POST",
		url: "/rpan/member/checkUserAuthReqCnt",
		dataType: "json",
		async: false,
		data: {
			reqLoc:"JOIN",
			reqValue:value
		},
		success: function(json) {
			if(json.resultCode == '0000'){
				checkResult = json.checkResult;
			}
			else {
				alert("인증번호 발송 횟수 Count 체크 도중 에러 발생");
			}
		},
		error: function(e) {
			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
		}
	});	
	
	return checkResult;
}


</script> -->
<%@include file="mainheader.jsp" %>
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
<%@include file="mainfooter.jsp" %>
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
						idx= true;
						$('#inputEmail').attr("readonly", true);
 						var html="<tr><td colspan='3' style='color: green'>이메일에 인증 번호를 확인해주세요.</td></tr>"; 
						$('#idResult').empty();
						$('#cEmailResult').empty();
						$('#idResult').append(html);
						$("#submit").removeAttr("disabled");$("#submit").removeAttr("style");
							$.ajax({ 
								type: 'GET', 
								url: '${pageContext.request.contextPath}/user/signUp/mail', 
								data: { "id" : $('#inputEmail').val() } 
							});  
					}else if(atSign == -1 || com == -1){
						var html="<tr><td colspan='3' style='color: red'>이메일 형식을 맞춰주세요.</td></tr>";
						
						$('#idResult').empty();
						$('#idResult').append(html);
						document.getElementById("inputEmail").value="";
						$("#submit").attr("disabled", "disabled");$("#submit").attr("style", "opacity:20%");
					}
					else{
						var html="<tr><td colspan='3' style='color: red'>중복된 이메일입니다.</td></tr>";
						
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