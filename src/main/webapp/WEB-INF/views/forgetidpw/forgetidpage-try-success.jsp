<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이디찾기</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="/resources/css/mainfooter3.css">
<link rel="stylesheet" href="/resources/css/mainheader2.css">
<link rel="stylesheet" href="/resources/css/forgetpage.css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script> 
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
function numkeyCheck(e) { var keyValue = event.keyCode; if( ((keyValue >= 48) && (keyValue <= 57)) ) return true; else return false; }
function msg(){swal({text:"이미 인증번호를 전송하였습니다.", icon:"error"});}
</script>
</head>
<body class="member">

   <%@include file="../mainheader.jsp"%>

   <div class="containerNew">
      <div class="contents member">
         <div class="cont-area">
            <h1 class="tit-h1 line">아이디 찾기</h1>
            <div class="id-result">
               <div class="find-desc">
                  <strong class="tit">아이디 찾기</strong>
                  <p class="txt" style="display: none;">아이디가 생각나지 않으세요? 아이디 찾는 방법을 선택해주세요.</p>
               </div>
               <form method="post" id="frm" name="frm">
                  <input name="certType" class="certType" type="hidden" value="1">
                  <input name="custNm" id="custNm" type="hidden" value=""> 
                  <input name="di" id="di" type="hidden" value="">
                  <ul class="find-list step_toggle">
                     <li><a>회원가입 시 등록한 휴대전화 번호로 인증</a>
                        <div style="padding-bottom:50px;" class="fint-list-cont">
                           <div class="find-box">
                              <p> 회원가입 시 입력한 <span class="color-fantasy">휴대전화 번호와 동일한 번호</span>를 입력하셔야 인증번호를 받을 수 있습니다.
                              </p>
                              <ul class="form-list">
                                 <li class="input-type"><strong class="tit"></strong> <span class="input-style"> 
                                 <input type="text" placeholder="${findUser.tel}" readonly>
                                 <button type="button" class="delete" onclick="location.href='/forgetId'">삭제</button></span> 
                                 <button type="button" class="btn-t gray" onclick="msg()">인증번호전송</button></li>
                                 
                                 <li class="input-type"><strong class="tit"></strong><span class="input-style">
                                 <input type="password" placeholder="인증번호를 입력해주세요." id="answer" name="answer" maxlength="30" onKeyPress="return numkeyCheck(event)">
                                 </span><button type="submit" class="btn-t gray" onclick="javascript: form.action='/forgetIdTry';">인증번호입력</button></li>
                                 <li class="input-type"><strong class="tit"></strong><span class="input-style">
                                 </span><!-- <button style="padding-bottom: 20px;" type="button" class="btn-t gray" onclick="location.href='/forgetId'">번호다시입력</button> --></li>
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
	                     <a href="/forgetPassword" class="btn-t">비밀번호 찾기</a>
                     </span>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
   <%@include file="../mainfooter2.jsp"%>
   <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
   <script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>