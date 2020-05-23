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
	<form action="signUp" method="POST">
		<div class="container">
			<div class="allBody">
				<label for="inputEmail">이메일</</label> 
				<div class="form-group col-md-6" style="display: -webkit-box;">
					<input type="email"	class="form-control" id="inputEmail" name="id">
				<button type="button" class="btn btn-secondary" id="idCheck">　중복확인　</button>
				<ul><li style="list-style:none;" id="check"></li></ul>
				</div>
			<div class="password">
				<label for="inputPassword">비밀번호</label>
				<div class="form-group col-md-6" >
					 <input type="password" class="form-control" id="inputPassword" placeholder="8~13자 입력하세요" name="pw">
				</div>
				<label for="inputPasswordAgain">비밀번호확인</label>
				<div class="form-group col-md-6">
					 <input	type="password" class="form-control" id="inputPasswordAgain"
						placeholder="비밀번호를 입력하세요 ">
				</div>
				
            </div>
				<label for="inputnickname col-md-6">닉네임</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text"	class="form-control" id="inputNickname" name="nickname">
				<button type="button" class="btn btn-secondary">　중복확인　</button>		
				</div>
				<label for="inputAddress col-md-6">추천인</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text"	class="form-control" id="inputFriend" placeholder="추천인 닉네임을 입력하세요">
				<button type="button" class="btn btn-secondary">　추천하기　</button>		
				</div>
				<label for="inputAddress col-md-6">주소</label>
				<div class="form-group" style="display: -webkit-box;">
					 <input type="text"	class="form-control" id="inputAddress" name="address">
				<button type="button" class="btn btn-secondary">우편번호찾기</button>		
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
                <div><button type="submit" class="nextButton" data-text-content="true">회원가입</button></div>
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


	$(document).ready(function(e){ 
		
		
		
		$('#idCheck').on('click', function(){ 
			$.ajax({ 
				type: 'GET', 
				url: '${pageContext.request.contextPath}/idCheck', 
				data: { "id" : $('#inputEmail').val() }, 
				success: function(data){ 
					if(data == 0 && $.trim($('#inputEmail').val()) != ''){
						idx= true;
						$('#inputEmail').attr("readonly", true);
						
 						var html="<tr><td colspan='3' style='color: green'>사용가능</td></tr>"; 
						
						$('#check').empty();
						$('#check').append(html);
					}else{
						var html="<tr><td colspan='3' style='color: red'>사용불가능</td></tr>";
						
						$('#check').empty();
						$('#check').append(html);
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