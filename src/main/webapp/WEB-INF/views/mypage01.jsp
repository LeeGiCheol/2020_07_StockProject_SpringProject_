<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<%-- <article class="bg-light container">
        <div class="allBody">
      <div class="row">
        <div class="sideBar col-md-4 order-md-2 mb-4">
          <ul class="list-group mb-3">
            <li class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed"onclick="location.href='/myPage01'">
              <div> 
                <h6 class="my-0">내정보</h6>
              </div>
            </li>
            <c:set var="socialId" value="${loginUser.id}"/>
			<c:choose>
				<c:when test="${fn:contains(socialId,'_')}">
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
                <input type="text" class="form-control" id="userTel" name="tel" value="${loginUser.tel}"></input>
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
    </article> --%>
    <div class="containerNew"> 

		<!-- contents -->
		<div class="contents member" id="contents">
			<div class="row">
				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu" style="position: relative; top: initial;">
						<ul>
							<li><a href="/myPage01"><span>내 정보 관리</span></a></li>
							<li class="mid"><a href="/mypageUpdatePassword"><span>비밀번호 변경</span></a></li>
							<li class="last"><a href="/myPage02"><span>계좌정보</span></a></li>
							<li class="mid"><a href="/myPage03"><span>작성 글 | 댓글</span></a></li>
							<li class="last"><a href="/myPage04"><span>알림</span></a></li>
						</ul>
					</div>
				</div>
			
				<div class="col-md-10">
			<!-- cont-area -->	
					<div class="cont-area"> 
						<div class="drop-nav">
							<h1 class="tit-h1 line">내 정보 관리</h1>
						</div>
						<div class="m-drop-nav">
							<h1 class="m-drop-tit-title line" style="cursor:pointer;">내 정보 관리 ▼</h1>
						</div>
						<div class="m-drop-down">
							<h1 class="m-drop-tit-body first line" style="cursor:pointer;"><a href="/myPage01">내 정보 관리</a></h1>
							<h1 class="m-drop-tit-body line" style="cursor:pointer;"><a href="/myPage02">계좌정보</a></h1>
							<h1 class="m-drop-tit-body line" style="cursor:pointer;"><a href="/myPage03">작성 글 | 댓글</a></h1>
							<h1 class="m-drop-tit-body last line" style="cursor:pointer;"><a href="/myPage04">알림</a></h1>
						</div>
				  
				<div class="modify-mem">   
					<form action="./updateUserInfo" method="post" name="frm" id="frm">
						<input type="hidden" name="ar_concern" id="ar_concern" value="">
						<input type="hidden" name="sns_cust" id="sns_cust" value="">
						<input type="hidden" name="sns_id" id="sns_id" value="">
						<input type="hidden" name="naver_link" id="naver_link" value="">
						<input type="hidden" name="facebook_link" id="facebook_link" value="">
						<input type="hidden" name="google_link" id="google_link" value="">
						<input type="hidden" name="kakao_link" id="kakao_link" value="">
						<input type="hidden" name="linkUrl" value="">
						<h2 class="tit-h2">기본정보</h2>
						<div class="form-table">
							<table>
								<caption>기본정보 : 아이디,성명,생년월일,이메일,휴대폰인증,필명 정보 입력 및 선택</caption> 
								<tbody> 
									<tr>
										<th scope="row"><label for="cust_Id">아이디</label></th>
										<td>
											<span class="input-style-case02">
												<input type="text" id="cust_Id" placeholder="ekek3002" readonly="" name="custId" value="ekek3002"> 
											</span>	
											<div class="text-wrap" id="sIdGuide" style="display: none;">
												<p class="td-text color-red">소셜로그인 자동부여 아이디는 로그인 및 이용이 불가 합니다.</p>
											</div>
											
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="email">이메일</label></th>
										<td>
											<span class="input-style-case02">
												<input type="text" id="email" name="email" value="ekek3002@naver.com">
												<button type="button" class="delete">삭제</button>
											</span>	 
										</td>
									</tr> 
									<tr>
										<th scope="row"><label for="mobile_no">휴대전화</label></th>
										<td>  <!-- 2017.04.13 국가번호 삭제-->
											<span class="input-style-case02">
												<input type="text" id="mobile_no" name="mobile_no" placeholder="휴대폰 번호는 대시(-)없이 숫자만 입력해주세요." value="01031429485" class="_onlyNumber" maxlength="11">
												<button type="button" class="delete">삭제</button> 
											</span> 
											<div class="text-wrap">
												<p class="td-text color-black">이메일과 휴대폰은 아이디/비밀번호찾기 시 본인확인을 위해 사용됩니다.</p>
												<p class="td-text">본인의 정보가 타인에게 전달되지 않도록 정확하게 입력 해 주시기 바랍니다.</p> 
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="nick_nm">필명</label></th>
										<td>  
											<div class="sell-wrap">
										
											
												<span class="input-style-nick">
													<input type="text" id="nick_nm" placeholder="필명을 입력하세요" title="필명을 입력하세요" name="nick_nm" value="나다이시키야">
													<button type="button" class="delete">삭제</button>
													<span class="byte"><b id="maxText">12</b>/12byte</span>
												</span>
												<button type="button" class="btn-t gray" onclick="checkNickName();">중복확인</button>
											
											
										

											</div>
											<div class="text-wrap">
												<p class="td-text">최종변경일자 <span class="color-red">
													
														
														
														2020.06.04
														
													
													</span></p>
												<p class="td-text">필명은 게시판 등 사이트 내에서 실명 대신 사용하는 이름으로 <span class="color-black">180일</span>에 <span class="break">한 번만 변경가능합니다.</span></p> 
											</div>
										</td>
									</tr> 
								</tbody>
							</table>
						</div>
						
						<h2 class="tit-h2">선택정보</h2>
						<div class="form-table">
							<table>
								<caption>선택정보 : 관심분야,지역,유선전화,주소 정보입력</caption> 
								<tbody> 
									<tr>
										<th scope="row"><label for="addr_post_no">주소</label></th>
										<td class="address">
											<p class="tit-mob">주소</p>
											<div class="sell-wrap">
												<span class="input-style-address">
													<input type="text" id="addr_post_no" name="addr_post_no" value="" placeholder="우편번호" readonly="">
													<button type="button" class="delete">삭제</button>
												</span>	 
												<button type="button" class="btn-t gray" onclick="searchAddrPopup('setAddr');">검색</button>
											</div>
										</td>
									</tr>  
								</tbody>
							</table>
						</div>					
					</form>	
				</div> 
				<div class="bt-area"> 
					<button class="btn-b" onclick="goCancel();">취소</button>
					<button class="btn-b red" onclick="formSubmit();">확인</button> 
				</div>
				<div class="find-info1">
					<span class="txt">팍스넷 서비스 이용을 더 이상 원치 않으시면 클릭해주세요.</span>
					<span class="bt-area">
						<a href="/rpan/member/withdrawal" class="btn-s bodrb">회원탈퇴</a> 
					</span>
				</div>  
			</div><!-- //cont-area -->
		</div><!-- //contents -->  
	</div>
<script language="javascript">

$(document).ready(function(){
	setInputEvent({onlyNumber:true,deleteBtn:true});
	//글자수 체크
	textLenCheck("nick_nm","필명",{max:12,currentLenId:"maxText"});
	
	//소셜로그인 회원일 경우 자동 부여 아이디 안내 텍스트 출력
	if ($("#sns_cust").val() == 'Y') {
		$("#sIdGuide").show();
	}
	else {
		$("#sIdGuide").hide();
	}
});
//닉네임 체크 변수
var AUTH_NICK_NAME_YN = false;
//필명확인 함수
function checkNickName(){
	if($("#nick_nm").val()==''){
		alert("필명을 확인하세요");
		$("#nick_nm").focus();
		return;
	}
	if(nick_nm_ck($("#nick_nm").val())){
		alert('필명에는 특수문자를 사용할수 없습니다.');
		$("#nick_nm").focus();
		return;
	}

	$.ajax({
 		type: "POST",
 		url: "/rpan/member/join/checkNickNm",
 		dataType: "json",
 		data: {
 			cust_id:$("#cust_id").val(),
 			nick_nm:$("#nick_nm").val()
 		},
 		success: function(json) {
			if(json.resultCode=='0000'){
				alert('사용가능한 닉네임입니다.');
				AUTH_NICK_NAME_YN = true;
			}else{
				alert('사용할 수 없는 닉네임입니다.');
				AUTH_NICK_NAME_YN = false;
			}
 		},
 		error: function(e) {
 			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
 		}
 	});
}

//닉네임 문자 체크
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

//주소 설정
function setAddr(obj){
	$("#addr_post_no").val(obj.addrPostId);
	$("#addr_basic").val(obj.addrBasic);
	$("#addr_detail").val(obj.addrDetail);
}


//회원정보 수정하기
function formSubmit(){
	//필수값 체크
	
	if($("#mobile_no").val()==""){
		alert("휴대폰번호를 입력하세요");
		$("#mobile_no").focus();
		return;
	}
	if(!checkPhone($("#mobile_no").val())){
		alert("잘못된 휴대폰 번호입니다.");
		$("#mobile_no").focus();
		return;
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
	
	var telNo = $("#tel_no1").val()+"-"+$("#tel_no2").val()+"-"+$("#tel_no3").val();
	var regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	
	if("--"!=telNo){
		if ( !regExp.test( telNo) ) {
			alert("유선전화를 확인하세요.");
			$("#tel_no1").focus();
			return;
		}	
	}
	
	
	//필명 필수값 체크
	if($("#nick_nm").val().trim()==""){
		alert("필명은 필수값입니다.");
		$("#nick_nm").focus();
		return;
	}
		
	
	if(!confirm("저장하시겠습니까?")){
		return;
	}
	
	var ar_concern = "";
	$("input[name='concern']:checked").each(function (){
		if(ar_concern!=""){
			ar_concern+=",";
		}
		ar_concern+=$(this).val();
	});
	$("#ar_concern").val(ar_concern);
	$(window).unbind('beforeunload');
	$("#frm").submit();
}

//휴대전화 체크
function checkPhone(num){
	var regExp = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	if ( !regExp.test( num ) ) {
		return false
	}
	return true;
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

//그냥 이동할 경우 세션 종료
$(window).bind('beforeunload', function(){
	//페이지 변경이 있었는지 체크..
	$.ajax({
 		type: "POST",
 		url: "./initSession",
 		dataType: "html",
 		success: function(html) {},
 		error: function(e) {}
 	});
});

var linkLoading = false;

function setNaverLink() {
	if (linkLoading) {
		alert("소셜 로그인 연동 및 해제가 진행중입니다. \n잠시 후에 다시 시도 해주시기 바랍니다.");
		return;
	}
	else {
		linkLoading = true;
	}
	
	var sns_cust = $("#sns_cust").val();
	var naver_link = $("#naver_link").val();
	var facebook_link = $("#facebook_link").val();
	var google_link = $("#google_link").val();
	var kakao_link = $("#kakao_link").val();
	
	if (naver_link == "Y") {	//연동 해제
		//소셜로그인 회원가입자는 적어도 하나의 소셜계정과 연동되어 있어야 한다.
		if (sns_cust == "Y" && facebook_link != "Y" && google_link != "Y" && kakao_link != "Y") {
			alert("연동을 해제할 수 없습니다.\n소셜로그인 회원 가입자는 적어도 하나의 소셜계정과 연동되어 있어야 합니다.");
		}
		else {
	        $.ajax({
	            type: "POST",
	            url: "/rpan/member/info/removeSnsLink",
	            dataType: "json",
	            data: {
	                sns_type: "n"
	            },
	            success: function(json) {
	    			if(json.resultCode=='0000'){
	    				//연동 날짜 텍스트 출력
	    				$("#naver_link").val("N");
	    				$("#set_nlink_btn").attr("class", "btn-s red");
	    				$("#set_nlink_btn").text("연동하기");
	    				$("#nlink_date").text(json.linkDate);
	    			}else{
	    				alert(json.resultMsg);
	    			}
	     		},
	     		error: function(e) {
	     			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
	     		}
	        });
		}
	}
	else {	//연동하기
		linkLoading = false;
		snsLogin("nl");
	}
	linkLoading = false;
}

//페이스북 SDK 초기화
window.fbAsyncInit = function () {
    FB.init({
        appId: '308834189616454'
        , status: true
        , cookie: true
        , xfbml: true
        //,oauth: true
    });
};

// 페이스북 SDK(js) 로딩 (페이지 로딩 속도 향상을 위해 사용)
(function (d) {
    var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
    if (d.getElementById(id)) {
        return;
    }
    js = d.createElement('script');
    js.id = id;
    js.async = true;
    js.src = "https://connect.facebook.net/ko_KR/all.js";
    ref.parentNode.insertBefore(js, ref);
}(document));

//페이스북 연동하기
function setFacebookLink() {
	if (linkLoading) {
		alert("소셜 로그인 연동 및 해제가 진행중입니다. \n잠시 후에 다시 시도 해주시기 바랍니다.");
		return;
	}
	else {
		linkLoading = true;
	}
	
	var sns_cust = $("#sns_cust").val();
	var naver_link = $("#naver_link").val();
	var facebook_link = $("#facebook_link").val();
	var google_link = $("#google_link").val();
	var kakao_link = $("#kakao_link").val();
	
	if (facebook_link == "Y") {	//연동 해제
		//소셜로그인 회원가입자는 적어도 하나의 소셜계정과 연동되어 있어야 한다.
		if (sns_cust == "Y" && naver_link != "Y" && google_link != "Y" && kakao_link != "Y") {
			alert("연동을 해제할 수 없습니다.\n소셜로그인 회원 가입자는 적어도 하나의 소셜계정과 연동되어 있어야 합니다.");
			return;
		}
		else {
	        $.ajax({
	            type: "POST",
	            url: "/rpan/member/info/removeSnsLink",
	            dataType: "json",
	            data: {
	                sns_type: "f"
	            },
	            success: function(json) {
	    			if(json.resultCode=='0000'){
	    				$("#facebook_link").val("N");
	    				$("#set_flink_btn").attr("class", "btn-s red");
	    				$("#set_flink_btn").text("연동하기");
	    				$("#flink_date").text(json.linkDate);
	    				
	    			}else{
	    				alert(json.resultMsg);
	    			}
	     		},
	     		error: function(e) {
	     			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
	     		}
	        });
		}
	}
	else {	//연동
		var protocol = document.location.protocol;
		if (protocol.indexOf("https") < 0) {
			alert("보안 연결(HTTPS)이 사용되지 않은 곳에서는 페이스북 계정 연동을 할 수 없습니다. HTTPS 로 접속해 주세요");
		}
		FB.getLoginStatus(function (response) {

	        if (response.status == "connected") {
	            // 페이스북 로그인 YES! and 앱 허가 YES!
	            handleFacebookRegist(response);
	        } else if (response.status == "not_authorized") {
	            // 페이스북 로그인 YES! but 앱 허가 NO!
	            FB.login(function (response) {
	                        handleFacebookRegist(response);
	                    },
	                    {scope: 'email'});
	        } else {    // 페이스북 로그아웃 상태.
	            FB.login(function (response) {
	                        handleFacebookRegist(response);
	                    },
	                    {scope: 'email'});
	        }
	    });
	}
	linkLoading = false;
    
}

// 회원가입 핸들러
function handleFacebookRegist(response) {
    var accessToken = response.authResponse.accessToken;

    FB.api('/me', function (user) {
        $("#sns_id").val(user.id);
        $('input[name=fbAccessToken]').val(accessToken);
    
        $.ajax({
            type: "POST",
            url: "/rpan/member/info/setSnsLink",
            dataType: "json",
            data: {
                sns_id: $("#sns_id").val(),
                sns_type: "f"
            },
            success: function(json) {
    			if(json.resultCode=='0000'){
    				$("#facebook_link").val("Y");
    				$("#set_flink_btn").attr("class", "btn-s bodr");
    				$("#set_flink_btn").text("연동해제");
    				$("#flink_date").text(json.linkDate+" 연동완료");
    			}else{
    				alert(json.resultMsg);
    			}
     		},
     		error: function(e) {
     			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
     		}
        });
    });
}

//구글 연동하기
function setGoogleLink() {
	if (linkLoading) {
		alert("소셜 로그인 연동 및 해제가 진행중입니다. \n잠시 후에 다시 시도 해주시기 바랍니다.");
		return;
	}
	else {
		linkLoading = true;
	}
	
	var sns_cust = $("#sns_cust").val();
	var naver_link = $("#naver_link").val();
	var facebook_link = $("#facebook_link").val();
	var google_link = $("#google_link").val();
	var kakao_link = $("#kakao_link").val();
	
	if (google_link == "Y") {	//연동 해제
		//소셜로그인 회원가입자는 적어도 하나의 소셜계정과 연동되어 있어야 한다.
		if (sns_cust == "Y" && facebook_link != "Y" && naver_link != "Y" && kakao_link != "Y") {
			alert("연동을 해제할 수 없습니다.\n소셜로그인 회원 가입자는 적어도 하나의 소셜계정과 연동되어 있어야 합니다.");
		}
		else {
	        $.ajax({
	            type: "POST",
	            url: "/rpan/member/info/removeSnsLink",
	            dataType: "json",
	            data: {
	                sns_type: "g"
	            },
	            success: function(json) {
	    			if(json.resultCode=='0000'){
	    				//연동 날짜 텍스트 출력
	    				$("#google_link").val("N");
	    				$("#set_glink_btn").attr("class", "btn-s red");
	    				$("#set_glink_btn").text("연동하기");
	    				$("#glink_date").text(json.linkDate);
	    			}else{
	    				alert(json.resultMsg);
	    			}
	     		},
	     		error: function(e) {
	     			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
	     		}
	        });
		}
	}
	else {	//연동하기
		linkLoading = false;
		snsLogin("gl");
	}
	linkLoading = false;
}

//카카오 연동하기
function setKakaoLink() {
	if (linkLoading) {
		alert("소셜 로그인 연동 및 해제가 진행중입니다. \n잠시 후에 다시 시도 해주시기 바랍니다.");
		return;
	}
	else {
		linkLoading = true;
	}
	
	var sns_cust = $("#sns_cust").val();
	var naver_link = $("#naver_link").val();
	var facebook_link = $("#facebook_link").val();
	var google_link = $("#google_link").val();
	var kakao_link = $("#kakao_link").val();
	
	if (kakao_link == "Y") {	//연동 해제
		//소셜로그인 회원가입자는 적어도 하나의 소셜계정과 연동되어 있어야 한다.
		if (sns_cust == "Y" && facebook_link != "Y" && naver_link != "Y" && google_link != "Y") {
			alert("연동을 해제할 수 없습니다.\n소셜로그인 회원 가입자는 적어도 하나의 소셜계정과 연동되어 있어야 합니다.");
		}
		else {
	        $.ajax({
	            type: "POST",
	            url: "/rpan/member/info/removeSnsLink",
	            dataType: "json",
	            data: {
	                sns_type: "k"
	            },
	            success: function(json) {
	    			if(json.resultCode=='0000'){
	    				//연동 날짜 텍스트 출력
	    				$("#kakao_link").val("N");
	    				$("#set_klink_btn").attr("class", "btn-s red");
	    				$("#set_klink_btn").text("연동하기");
	    				$("#klink_date").text(json.linkDate);
	    			}else{
	    				alert(json.resultMsg);
	    			}
	     		},
	     		error: function(e) {
	     			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
	     		}
	        });
		}
	}
	else {	//연동하기
		linkLoading = false;
		snsLogin("kl");
	}
	linkLoading = false;
}

function goSnsLink(snsType) {
	$.ajax({
        type: "POST",
        url: "/rpan/member/info/setSnsLink",
        dataType: "json",
        data: {
            sns_id: $("#sns_link_id").val(),
            sns_type: snsType
        },
        success: function(json) {
			if(json.resultCode=='0000'){
				if (json.snsType == 'n') {
					$("#naver_link").val("Y");
					$("#set_nlink_btn").attr("class", "btn-s bodr");
					$("#set_nlink_btn").text("연동해제");
					$("#nlink_date").text(json.linkDate+" 연동완료");
				}
				else if (json.snsType == 'g') {
					$("#google_link").val("Y");
					$("#set_glink_btn").attr("class", "btn-s bodr");
					$("#set_glink_btn").text("연동해제");
					$("#glink_date").text(json.linkDate+" 연동완료");
				}
				else if (json.snsType == 'k') {
					$("#kakao_link").val("Y");
					$("#set_klink_btn").attr("class", "btn-s bodr");
					$("#set_klink_btn").text("연동해제");
					$("#klink_date").text(json.linkDate+" 연동완료");
				}
			}else{
				alert(json.resultMsg);
			}
 		},
 		error: function(e) {
 			alert('접근 오류가 발생했습니다 관리자에게 문의하세요.');
 		}
    });
	linkLoading = false;
}    

//수정 취소 
function goCancel() {
	var linkUrl = "";
	
	if (linkUrl == '') {
		location.href = "http://www.paxnet.co.kr";
	}
	else {
		location.href = linkUrl;
	}
}

</script>
</div>
</div>
    <%@include file="mainfooter.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
<script>window.jQuery || document.write('<script src="/docs/4.4/assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$( document ).ready(function() {
	  var $sticky = $('.sticky');
	  var $stickyrStopper = $('.footer_info');
	  if (!!$sticky.offset()) { // make sure ".sticky" element exists

	    var generalSidebarHeight = $sticky.innerHeight();
	    var stickyTop = $sticky.offset().top;
	    var stickOffset = 0;
	    var stickyStopperPosition = $stickyrStopper.offset().top;
	    var stopPoint = stickyStopperPosition - generalSidebarHeight - stickOffset;
	    var diff = stopPoint + stickOffset;

	    $(window).scroll(function(){ // scroll event
	      var windowTop = $(window).scrollTop(); // returns number

	      if (stopPoint < windowTop) {
	          $sticky.css({ position: 'relative', top: diff });
	      } else if (stickyTop < windowTop+stickOffset) {
	          $sticky.css({ position: 'fixed', top: stickOffset });
	      } else {
	          $sticky.css({position: 'relative', top: 'initial'});
	      }
	    });

	  }
  });
	  $(".m-drop-nav").click(function(){
		    $(".m-drop-down").slideToggle("slow");
		  });
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