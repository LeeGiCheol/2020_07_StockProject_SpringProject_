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


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" 	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- CSS파일 -->
<link href="/resources/css/signup01_02.css" rel="stylesheet">






</head>
<body>
<!-- 상단  nav -->
	<ul class="nav justify-content-end top-nav">
		<li class="breadcrumb-item"><a id="top-nav-font" href="#">로그인</a></li>
		<li class="breadcrumb-item"><a id="top-nav-font" href="#">회원가입</a></li>
	</ul>
<!-- 상단  nav end -->
<!-- header start -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-custom">
		<a class="navbar-brand" href="#"><i class="fas fa-users"></i>Stock
			gallery</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">	
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search"
						placeholder="통합검색" aria-label="Search">
					<button class="btn btn-outline-secondary my-2 my-sm-0"
						type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> 커뮤니티 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">자유게시판</a> <a
							class="dropdown-item" href="#">포트폴리오</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">뉴스</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#">거래</a></li>
				<li class="nav-item"><a class="nav-link" href="#">고객센터<span
						class="sr-only">(current)</span></a></li>
			</ul>
		</div>
	</nav>
<!-- header end -->
<!-- body start -->
	<form action="signUp" name="form" method="POST">
		<div class="container">
			<div class="allBody">
				<label for="inputEmail">이메일</</label> 
				<div class="form-group col-md-6" style="display: -webkit-box;">
					<input type="email"	class="form-control" id="inputEmail" name="id">
				<button type="button" class="btn btn-secondary" id="idCheck">　중복확인　</button>
				<ul><li style="list-style:none;" id="idResult"></li></ul>
				</div>
			<div class="password">
				<label for="inputPassword">비밀번호</label>
				<div class="form-group col-md-6" >
					 <input type="password" class="form-control" id="inputPassword" placeholder="8~13자 입력하세요" name="pw" oninput="checkPw()">
				</div>
				<label for="inputPasswordAgain">비밀번호확인</label>
				<div class="form-group col-md-6">
					 <input	type="password" class="form-control" id="inputPasswordAgain"
						placeholder="비밀번호를 입력하세요 " oninput="checkPw()">
					<ul><li style="list-style:none;" id="pwResult"></li></ul>
						
				</div>
				
            </div>
				<label for="inputnickname col-md-6">닉네임</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text"	class="form-control" id="inputNickname" name="nickname">
				<button type="button" class="btn btn-secondary" id="nickCheck">　중복확인　</button>	
				<ul><li style="list-style:none;" id="nickNameResult"></li></ul>
					
				</div>
				<label for="inputAddress col-md-6">추천인</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text"	class="form-control" id="inputFriend" name="friend" placeholder="추천인 닉네임을 입력하세요">
				<button type="button" class="btn btn-secondary" id="friendCheck">　추천하기　</button>	
				<ul><li style="list-style:none;" id="friendResult"></li></ul>
					
				</div>
				<label for="inputAddress col-md-6">주소</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text"	class="form-control" id="inputAddress" name="address" required="true" >
				<button type="button" class="btn btn-secondary" onclick="goPopup();">우편번호찾기</button>		
				</div>
				<label for="inputPhone col-md-6" >휴대폰</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text"	class="form-control" id="inputPhone" name="tel">
				<button type="button" class="btn btn-secondary">인증번호받기</button>		
				</div>
				<label for="inputPhone col-md-6">인증번호확인</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text" class="form-control" id="inputPhone" placeholder="인증번호를 입력하세요">
                <button type="submit" class="btn btn-secondary">인증번호확인</button>	 
              
				</div>
                </div>
            </div>
            <div>
                <div><button type="submit" class="nextButton" data-text-content="true" id="submit" >회원가입</button></div> <!--disabled="disabled"  -->
            </div>
        
	</form>
<!-- body end -->
<!-- footer start -->
<div class=footer_div>
	<footer class="footer_info">
  		<p><a href="https://www.naver.com">회사소개</a>  |  <a href="https://www.google.co.kr">광고안내</a>  |  <a href="https://www.naver.com">이용약관</a>  |  <a href="https://www.google.co.kr"><strong>개인정보처리방침</strong></a></p>
  		<p>Copyright ⓒ 2020 - 2020 stock gallery. All rights reserved.</p>
	</footer>
</div>
<!-- footer end -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"crossorigin="anonymous"></script>
 --><script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>



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
		
		
	
		
		/* $(".cancle").on("click", function(){
			
			location.href = "/login";
					    
		}) */
	
		$("#submit").on("click", function(){
			if($("#inputEmail").val()==""){
				alert("아이디를 입력해주세요.");
				$("#inputEmail").focus();
				return false;
			}
			if($("#inputPassword").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#inputPassword").focus();
				return false;
			}
			if($("#inputNickname").val()==""){
				alert("닉네임을 입력해주세요.");
				$("#inputNickname").focus();
				return false;
			}
			
			var checked =  $('#passwordCheck').val();
			
			// 중복확인 성공 시 checkflag가 1씩 증가 id, nickname용 (두개 다 성공할 시 checkflag는 2가 된다)
			if(checkflag != 2){
				alert("중복확인을 해주세요");
				return false;
			}
			
			// 비밀번호 확인 체크가 안되면 value는 undefiend 되면 value에 값이 들어와 로그인 된다  
			if(checked == undefined){
				alert("비밀번호를 확인해주세요");
				return false;
			}
		});
		
		
		
		
		
		
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
						
 						var html="<tr><td colspan='3' style='color: green'>사용가능</td></tr>"; 
						$('#idResult').empty();
						$('#idResult').append(html);
						// 중복체크를 성공한 경우에만 회원가입 버튼 활성화
						//$("#submit").removeAttr("disabled");
						
						checkflag +=1;
						
					}else if(atSign == -1 || com == -1){
						var html="<tr><td colspan='3' style='color: red'>이메일 형식을 맞춰주세요</td></tr>";
						
						$('#idResult').empty();
						$('#idResult').append(html);
						// 중복체크 실패 시 회원가입 버튼 비활성화
						//$("#submit").attr("disabled", "disabled");
						// 지우기
						document.getElementById("inputEmail").value="";
						
					
					}
					else{
						var html="<tr><td colspan='3' style='color: red'>사용불가능</td></tr>";
						
						$('#idResult').empty();
						$('#idResult').append(html);
						// 중복체크 실패 시 회원가입 버튼 비활성화
						//$("#submit").attr("disabled", "disabled");
						// 지우기
						document.getElementById("inputEmail").value="";

					}
				},
				error: function(){
					alert("에러");
				}
				
			});  
		});  
		
		
		
		
		$('#nickCheck').on('click', function(){ 
			$.ajax({ 
				type: 'GET', 
				url: '${pageContext.request.contextPath}/nickCheck', 
				data: { "nickname" : $('#inputNickname').val() }, 
				success: function(data){ 
					if(data == 0 && $.trim($('#inputNickname').val()) != ''){
						idx= true;
						$('#inputNickname').attr("readonly", true);
						
 						var html="<tr><td colspan='3' style='color: green'>사용가능</td></tr>"; 
						$('#nickNameResult').empty();
						$('#nickNameResult').append(html);
						// 중복체크를 성공한 경우에만 회원가입 버튼 활성화
						//$("#submit").removeAttr("disabled");
						
						checkflag +=1;
					}else{
						var html="<tr><td colspan='3' style='color: red'>사용불가능</td></tr>";
						
						$('#nickNameResult').empty();
						$('#nickNameResult').append(html);
						document.getElementById("inputNickname").value="";
						// 중복체크 실패 시 회원가입 버튼 비활성화
						//$("#submit").attr("disabled", "disabled");
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
				data: { "id" : $('#inputFriend').val() }, 
				success: function(data){ 
					if(data == 0 && $.trim($('#inputFriend').val()) != ''){
						var html="<tr><td colspan='3' style='color: red'>사용불가능</td></tr>";
						
						$('#friendResult').empty();
						$('#friendResult').append(html);
						document.getElementById("inputFriend").value="";
					}else{
						
						idx= true;
						$('#inputFriend').attr("readonly", true);
						
 						var html="<tr><td colspan='3' style='color: green'>사용가능</td></tr>"; 
						
						$('#friendResult').empty();
						$('#friendResult').append(html);
						
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
	    	   
	/* 	if(passwordAgain=="" && (password != passwordAgain)){
			$("#inputPasswordAgain").css("background-color", "#FFCECE");
	
			var html="<tr><td colspan='3' style='color: red'>비밀번호를 확인해주세요</td></tr>"; 
			
			$('#pwResult').empty();
			$('#pwResult').append(html);
		}
	      */
		
	    // 비밀번호, 비밀번호 확인이 다른 경우
		if (password != passwordAgain) {
			$("#inputPasswordAgain").css("background-color", "#FFCECE");
			
			$('#pwResult').empty();
			var html="<tr><td colspan='3' style='color: red'>비밀번호를 확인해주세요</td></tr>"; 
			
			$('#pwResult').append(html);
		}
	      
	      
		// 비밀번호 길이 제한
		else if($('#inputPassword').val().length < 8 || $('#inputPassword').val().length > 13){
		
			var html="<tr><td colspan='3' style='color: red'>비밀번호는 8자리 이상 13자리 이하만 가능합니다.</td></tr>"; 
			$('#pwResult').empty();
			
			$('#pwResult').append(html);
			
		} 
		       
	    // 맞는 경우
		else if(password == passwordAgain){
			$("#inputPasswordAgain").css("background-color", "#B0F6AC");
			
			var html="<tr><td colspan='3' style='color: green' id='passwordCheck'>사용가능</td></tr>"; 
			
			$('#pwResult').empty();
			
			$('#pwResult').append(html);
		}
	}

  
</script>

</body>
</html>