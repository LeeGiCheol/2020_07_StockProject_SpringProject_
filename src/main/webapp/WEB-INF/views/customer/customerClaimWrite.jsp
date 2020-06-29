<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글쓰기페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- CSS파일 -->
<style>
.ck-blurred, .ck-focused{height: 500px;}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link href="/resources/css/writeForm.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/mainfooter2.css">
<link rel="stylesheet" href="/resources/css/mainheader2.css">
<link rel="stylesheet" href="/resources/css/sidebar.css">

	
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8" ></script>





<script>
	function btnSave(){
		// bcontent에 내용 삽입
		oEditors.getById["bcontent"].exec("UPDATE_CONTENTS_FIELD", []);
		// 글제목
		var title = $("#title").val();
		// 글내용 있는지 확인용 
		var contentValue = $('#bcontent').html();
		
		if(title.trim() == ""){
			swal({text:"제목을 입력해주세요.", icon:"error"});			
			$("#title").focus();
		}
		else{
			if(contentValue.trim() == ""){
				console.log("쳌포2");
				swal({text:"내용을 입력해주세요.", icon:"error"});
			}
			else{
				console.log("쳌포3");
				$("#form").submit();
			}					
		}
	};
</script> 
</head>
<style>
#sideTitle {
     border-left: 4px solid #d7d8da !important; 
    color: #848889 !important;
    font-weight: 300 !important;
    background: white !important;
}
#sideTitle a, #sideTitle a:visited, #sideTitle a:link{
	    color: #848889!important;
  font-weight: 300 !important;
 
}


#claimTitle{
border-left: 4px solid #1e78ff !important;
    color: black !important;
    font-weight: 600 !important;
    background: #f6f6f6 !important;
}
#claimTitle a, #claimTitle a:visited, #claimTitle a:link{
	    color: black!important;
  font-weight: 600 !important;
 
}



.select-style {
    position: relative;
}
.pop-clean .notify .select-style .bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn) {
    width: 240px;
}
.bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn) {
    width: 220px;
    min-width: 80px;
}
.bootstrap-select.btn-group:not(.input-group-btn), .bootstrap-select.btn-group[class*="col-"] {
    float: none;
    display: inline-block;
    margin-left: 0;
}
[class*="select-style"] .btn-group {
    border: #ccc 1px solid;
}
.bootstrap-select > .dropdown-toggle.bs-placeholder, .bootstrap-select > .dropdown-toggle.bs-placeholder:hover, .bootstrap-select > .dropdown-toggle.bs-placeholder:focus, .bootstrap-select > .dropdown-toggle.bs-placeholder:active {
    color: #888;
}
.btn-group > .btn:first-child {
    margin-left: 0;
}
[class*="select-style"] button.btn {
    color: #888;
    display: inline-block;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: normal;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    background-image: none;
    border: 1px solid transparent;
    min-width: 60px;
    height: 26px;
    box-sizing: border-box;
    background: #fff;
    border-radius: 0;
    padding-left: 10px;
}
.bootstrap-select > .dropdown-toggle {
    width: 100%;
    padding-right: 25px;
    z-index: 1;
}
.btn-group > .btn, .btn-group-vertical > .btn {
    position: relative;
    float: left;
}
.bootstrap-select.btn-group .dropdown-toggle .filter-option {
    display: inline-block;
    overflow: hidden;
    width: 100%;
    text-align: left;
}
.pull-left {
    float: left !important;
}
.bootstrap-select.btn-group .dropdown-toggle .caret {
    position: absolute;
    top: 50%;
    right: 12px;
    margin-top: -2px;
    vertical-align: middle;
}
.bootstrap-select.btn-group .dropdown-menu {
    min-width: 100%;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
        margin-top: 5px !important;
}
.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 160px;
    padding: 5px 0;
    margin: 2px 0 0;
    font-size: 14px;
    text-align: left;
    list-style: none;
    background-color: #fff;
    -webkit-background-clip: padding-box;
    background-clip: padding-box;
    border: 1px solid #ccc;
    border: 1px solid rgba(0, 0, 0, .15);
    border-radius: 0;
    -webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
    box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
}
.bootstrap-select.btn-group .dropdown-menu.inner {
    position: static;
    float: none;
    border: 0;
    padding: 0;
    margin: 0;
    border-radius: 0;
    -webkit-box-shadow: none;
    box-shadow: none;
    max-height: 300px;
    overflow-y: scroll;
}
.bootstrap-select.btn-group .dropdown-menu {
    min-width: 100%;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.open > .dropdown-menu {
    display: block;
}
.bootstrap-select.btn-group .dropdown-menu li {
    position: relative;
}
.bootstrap-select.btn-group .dropdown-menu li a {
    cursor: pointer;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
.dropdown-menu > li > a {
    display: block;
    padding: 3px 20px;
    clear: both;
    font-weight: normal;
    line-height: 1.42857143;
    color: #333;
    white-space: nowrap;
}
.bootstrap-select.btn-group .dropdown-menu li a span.text {
    display: inline-block;
}
.bootstrap-select.btn-group .dropdown-menu li a span.check-mark {
    display: none;
}
.glyphicon {
    position: relative;
    top: 1px;
    display: inline-block;
    font-family: 'Glyphicons Halflings';
    font-style: normal;
    font-weight: normal;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
.bootstrap-select > select {
    position: absolute !important;
    bottom: 0;
    left: 50%;
    display: block !important;
    width: 0.5px !important;
    height: 100% !important;
    padding: 0 !important;
    opacity: 0 !important;
    border: none;
}
select {
    min-width: 60px;
    height: 28px;
    border: 1px solid #ccc;
    vertical-align: middle;
    box-sizing: border-box;
    background: #fff;
    border-radius: 0;
}

.guide-text {
    font-size: 13px;
    color: #888;
    line-height: 150%;
    margin-bottom: 30px;
}

@media only screen and (max-width: 979px){
.guide-text {
display: none;
}
}
</style>
<body>

	<%@include file="../mainheader.jsp" %> 
	
	<div class="all-dim"></div>
		<div class="containerNew">
			<div class="board-page">
				<div class="row">
				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu" style="position: relative;">
						<ul>
							<li class="mid"><a href="/customer"><span>고객센터</span></a></li>
							<li class="mid"><a href="/customerNotice"><span>공지사항</span></a></li>
							<li class="mid"><a href="/customerQna"><span>도움말</span></a></li>
							<li class="selected mid"><a href="/customerClaim/write"><span>1:1문의</span></a></li>
							<li><a href="/customerClaim/list"><span>Q&amp;A</span></a></li>
						</ul>
					</div>
				</div>
					<div class="col-md-10">
						<div class="free-board" >

 							<div class="drop-nav">
								<h1 class="tit-h1 line">1:1문의</h1>
							</div>
							<div class="m-drop-nav">
								<h1 class="m-drop-tit-title line" style="cursor: pointer;">1:1문의 <i class="fas fa-angle-down"></i></h1>
							</div>
							<div class="m-drop-down">
								<h1 class="m-drop-tit-body first line" style="cursor: pointer;">
									<a href="/customer">고객센터</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerNotice">공지사항</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerQna">도움말</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerClaim/write">1:1문의</a>
								</h1>														
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerClaim/list">Q&amp;A</a>
								</h1>
							</div>	
							
							
							
							
							<div class="guide-text">궁금하신 사항을 상세히 적어주시면 상담원들이 상세한 답변을 해드립니다.</div>
							<form name="form" id="form" role="form" method="POST" action="/customerClaim/write">
								<div class="form-table">
									<table>
										<tbody>
											<tr>
												<th scope="row">종류</th>
												<td>


													<span class="select-style">
														<select title="상담 항목" id="rtype" name="qtype" class="selectpicker" tabindex="-98">
															<option class="bs-title-option" value="">상담 항목</option>
															<option value="회원">회원</option>
															<option value="커뮤니티">커뮤니티</option>
															<option value="거래">거래</option>
														</select>
													</span>												
												</td>
											</tr>										
											<tr>
												<th scope="row"><label for="title">제목</label></th>
												<td>
													<span class="input-style-case02">
														<input type="text" id="title" name="qtitle" placeholder="제목을 입력하세요" value="" maxlength="250">
														<!-- <button type="button" class="delete">삭제</button> -->
													</span>
												</td>
												
<!-- 								               <div class="mb-3 title">
								                    <label for="title"><b>제목</b></label>
								                    <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요" required>
								               </div> -->
								            </tr>
								            <tr class="writer-nickname" style="display: none;">
								            	<td>
								                    <label for="writer"><b>작성자</b></label>
								                    <input type="text" class="form-control" name="nickname" id="writer" value="${loginUser.nickname}" readonly>
								                   <%--  <input type="hidden" name="id" value="${loginUser.id}"> --%>
							               		</td>
							               </tr>
								            <tr>
												<th scope="row">내용</th>
												<td>
													<textarea class="form-control" rows="5" name="qcontent" id="bcontent" placeholder="내용을 입력해 주세요" rows="30" style="width:100%;"></textarea>
												</td>
											</tr>

										</tbody>
									</table>
								</div>
								<div class="bt-area">
									<a href="/customer"  class="btn-m">취소</a>
									<span><a href="javascript:btnSave();"  class="btn-m fantasy" id="addBtn">작성</a></span>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<%@include file="../mainfooter2.jsp" %>
	
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "bcontent",
 sSkinURI: "/resources/se2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});


</script>	
		<script type="text/javascript">
			$(document).ready(
					function() {
						console.log("document ready!");

						var $sticky = $('.sticky');
						var $stickyrStopper = $('.footer');
						if (!!$sticky.offset()) { // make sure ".sticky" element exists

							var generalSidebarHeight = $sticky.innerHeight();
							var stickyTop = $sticky.offset().top;
							var stickOffset = 0;
							var stickyStopperPosition = $stickyrStopper
									.offset().top;
							var stopPoint = stickyStopperPosition
									- generalSidebarHeight - stickOffset;
							var diff = stopPoint + stickOffset;

							$(window).scroll(
									function() { // scroll event
										var windowTop = $(window).scrollTop(); // returns number

										if (stopPoint < windowTop) {
											$sticky.css({
												position : 'relative',
												top : diff
											});
										} else if (stickyTop < windowTop
												+ stickOffset) {
											$sticky.css({
												position : 'fixed',
												top : stickOffset
											});
										} else {
											$sticky.css({
												position : 'relative',
												top : 'initial'
											});
										}
									});

						}
						$(".m-drop-nav").click(function() {
							$(".m-drop-down").slideToggle("slow");
						});
					});
		</script>
	<script>
$('.e-reportComtPopupClose').on('click',function(){	
	$(".wrap").show();
    $('#reportComtPopup').remove();
});

function submitReportComt(){
	if( $('#comtRprtCode').val() == "" ){
    	alert("신고항목을 선택하세요.");
    	return false;                	
    	
    } else if( $.trim($('#comtRprtResn').val()) == "" ){
    	alert("내용을 입력해주세요.");
    	return false;                	
    	
    } else{
        $("#rprtCode").val($('#comtRprtCode').val());
        $("#rprtResn").val($('#comtRprtResn').val());
        
        $("#comtRprtCd").val($('#comtRprtCode').val());
        $("#comtRprtRe").val($('#comtRprtResn').val());
        
        //console.log("comtRprtCd " + $("#comtRprtCd").val());
        //console.log("comtRprtRe " + $("#comtRprtRe").val());

        //console.log("jsonData : " + $("#rtrpFrm").serialize());
    }
}


		// 취소버튼 눌렀을 때 내용 초기화, 팝업 hide
		function hidePopup(){
        /* 	$(".wrap").show(); */
            jQuery('#reportPopup').hide();
            initInput()
		}

</script>
</body>
<script src="/resources/js/selectpicker.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</html>