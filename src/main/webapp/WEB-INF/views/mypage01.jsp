<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link href="/resources/css/mypage01.css" rel="stylesheet">
<link href="resources/css/mainheader.css" rel="stylesheet">
<link href="resources/css/mainfooter.css" rel="stylesheet">
</head>
<body>
	<%@include file="mainheader.jsp" %>
    <!-- article start -->
    <article class="bg-light container">
        <div class="allBody">
      <div class="row">
        <div class="sideBar col-md-4 order-md-2 mb-4">
          <ul class="list-group mb-3">
            <li class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed"onclick="location.href='/myPage01'">
              <div> 
                <h6 class="my-0">내정보</h6>
              </div>
            </li>
            <c:choose>
				<c:when test="${naverLoginUser ne null}">
					<li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed" onclick="notLocal();" >
		              <div>
		                <h6 class="my-0">비밀번호변경</h6>
		              </div>
		            </li>
				</c:when>
				<c:otherwise>
					<li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed" onclick="location.href='/mypageUpdatePassword'">
		              <div>
		                <h6 class="my-0">비밀번호변경</h6>
		              </div>
		            </li>
				</c:otherwise>
			</c:choose>
            <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed" onclick="location.href='/myPage02'">
              <div>
                <h6 class="my-0">계좌정보</h6>
              </div>
            </li>
            <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed" onclick="location.href='/myPage03'" >
              <div>
                <h6 class="my-0">작성 글, 댓글</h6>
              </div>
            </li>
            <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed" onclick="location.href='/myPage04'">
              <div >
                <h6 class="my-0">알림</h6>
              </div>
            </li>
          </ul>
    
        </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">내정보</h4>
          <form action="/updateUser" class="needs-validation" method="POST" novalidate>
            <div class="mb-3">
              <label for="userEmail">이메일</label>
              <div>
                <div class="input-group-prepend">
                  <span class="input-group-text">@</span>
                <div class="form-control" id="userEmail" >${loginUser.id}</div>
                </div>
              </div>
            </div>
            <br>
            <div class="mb-3">
              <label for="userNickname">닉네임</label>
              <div>
                <input type="text" class="form-control" id="userNickname" name="nickname" value="${loginUser.nickname}"></input>
              </div>
            </div>
    		<br>
            <div class="mb-3">
              <label for="address">주소</label>
	             <div style="display: -webkit-box;">
		             <input style="width: 575px;" type="text" class="form-control" id="userAddress" name="address" value="${loginUser.address}" readonly>
		             <button style="margin-left: 30px;" type="button" class="btn btn-secondary" onclick="goPopup();">우편번호찾기</button>
             </div>
            </div>
            <br>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-name">연락처</label>
                <div class="form-control" id="userTel">${loginUser.tel}</div>
                <%-- <input type="text" class="form-control" id="userTel" name="tel" value="${loginUser.tel}"></input> --%>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">포인트</label>
                <div class="form-control" id="userPoint">${loginUser.point} 점</div>
              </div>
            </div>
            <br>
            <hr class="mb-4">
            <br>
            <small class="text-muted">다른 사용자에게 보유 자산 및 수익률과 거래내역을 노출 하시겠습니까?</small>
            <br>
            <div class="ask-form">
                <div class="custom-control custom-radio">
                  <input type="radio" name="showEsetSetting" id="ask-radio-1" class="custom-control-input" value="1">
                  <label class="custom-control-label" id="ask-radio-1-answer" for="ask-radio-1">예</label>
                </div>
                <div class="custom-control custom-radio">
                  <input type="radio" name="showEsetSetting" id="ask-radio-2" class="custom-control-input" value="0">
                  <label class="custom-control-label" for="ask-radio-2">아니오</label>
                </div>
            </div>
            <br>
            <div class="buttons">
            <button class="btn btn-primary btn-lg btn-block save" id="formsave" type="submit">저장</button>
            <button class="btn btn-primary btn-lg btn-block remove" type="submit">회원탈퇴</button>
			<br><br><br><br>
          </div>
         </form>
       </div>
     </div>
   </div>
    </article>
    <%@include file="mainfooter.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
<script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
function notLocal(){
	swal({text:"접속하신 해당 홈페이지에서 변경가능합니다.", icon:"warning"})
}
function jusoCallBack(roadFullAddr){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	console.log(roadFullAddr);
	document.getElementById("userAddress").value = null;
	document.getElementById("userAddress").value = roadFullAddr;
}
if(${loginUser.showEsetSetting} === 0)
	$("#ask-radio-2").prop("checked", true);
else
	$("#ask-radio-1").prop("checked", true);
</script>
</html>