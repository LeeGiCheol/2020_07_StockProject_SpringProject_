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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link href="/resources/css/signup01_02.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">
<script>
function numkeyCheck(e) { var keyValue = event.keyCode; if( ((keyValue >= 48) && (keyValue <= 57)) ) return true; else return false; }
function spaceCheck(e) { var keyValue = event.keyCode; if( (keyValue > 31) && (keyValue < 33) ) return false; else return true; }

	$(document).ready(function(){
		swal({text:"가입을 위해 추가 정보 입력이 필요합니다", icon:"warning"})
	});
</script>
</head>
<body>
	<%@include file="mainheader.jsp" %>
	<form action="/signUp/kakao" name="form" method="POST">
		<div class="container">
			<div class="allBody">
				<div class="form-group col-md-6" style="display: -webkit-box;">
					<input type="email"	class="form-control" id="inputEmail" name="id" value="${naverId}" readonly style="display:none">
					<ul><li style="list-style:none;" id="idResult"></li></ul>
				</div>
            
				<label for="inputnickname col-md-6">닉네임</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text"	class="form-control" id="inputNickname" name="nickname" placeholder="추천 닉네임 : ${naverNickname}" onKeyPress="return spaceCheck(event)">
					 <button type="button" class="btn btn-secondary" id="nickCheck">　중복확인　</button>	
					 <ul><li style="list-style:none;" id="nickNameResult"></li></ul>
				</div>
				<label for="inputAddress col-md-6">추천인</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text"	class="form-control" id="inputFriend" name="friend" onKeyPress="return spaceCheck(event)">
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
					<input placeholder="휴대폰번호를 입력해주세요." type="text"	class="form-control" id="inputPhone" name="tel" onKeyPress="return numkeyCheck(event)" maxlength="11">
					<button type="button" class="btn btn-secondary" id="telCheck">인증번호받기</button>
					<ul><li style="list-style:none;" id="telResult"></li></ul>		
				</div>
				
				<label for="inputPhone col-md-6">인증번호확인</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text" class="form-control" id="inputCtel" name="cTel" placeholder="인증번호를 입력해주세요." onKeyPress="return numkeyCheck(event)"> 
                	 <button type="button" class="btn btn-secondary" id="cTelCheck">인증번호확인</button>
              		 <ul><li style="list-style:none;" id="cTelResult"></li></ul>	 
				</div>
           </div>
           
                
                <!-- 노출 수정 -->
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
            <!-- 노출 수정 -->
                
            </div>
            <div style="text-align:center">
                <div><button type="submit" class="nextButton" data-text-content="true" id="submit" >회원가입</button></div> <!--disabled="disabled"  -->
            </div>
	</form>
		<%@include file="mainfooter.jsp" %>
 --><script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
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
						var html="<tr><td colspan='3' style='color: red'>인증실패(인증번호를 확인해주세요.)</td></tr>";
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
		
</script>
</body>
</html>