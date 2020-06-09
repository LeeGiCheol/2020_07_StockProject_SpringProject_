<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>forgetidpage</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">
<link rel="stylesheet" href="/resources/css/forgetpage.css">

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
                  <p class="txt" style="display: none;">아이디가 생각나지 않으세요? 아이디 찾는 방법을 선택해주세요.</p>
               </div>
               <form action="/forGetId" method="post" id="frm" name="frm">
                  <input name="certType" class="certType" type="hidden" value="1">
                  <input name="custNm" id="custNm" type="hidden" value=""> 
                  <input name="di" id="di" type="hidden" value="">
                  <ul class="find-list step_toggle">
                     <li><a>회원가입 시 등록한 휴대전화 번호로 인증</a>
                        <div class="fint-list-cont">
                           <div class="find-box">
                              <p> 회원가입 시 입력한 <span class="color-red">휴대전화 번호와 동일한 번호</span>를 입력하셔야 인증번호를 받을 수 있습니다.
                              </p>
                              <ul class="form-list">
                                 <li class="input-type"><strong class="tit"></strong> <span class="input-style"> 
                                 <input type="text" placeholder="휴대폰 번호는 대시(-)없이 숫자만 입력해주세요." id="tel" name="tel">
                                 </span>
                                    <button type="submit" class="btn-t gray">인증번호전송</button></li>
                              </ul>
                           </div>
                        </div>
                      </li>
                  </ul>
				  <br>
                  <br>
                  <div class="find-info">
                     <span class="txt">비밀번호 찾기와 회원가입을 원하시나요?</span> <span class="bt-area">
	                     <a href="/signUpPage/1" class="btn-t">회원가입</a>
	                     <a href="#" class="btn-t">비밀번호 찾기</a>
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
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>