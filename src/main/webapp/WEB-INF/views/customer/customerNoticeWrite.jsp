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
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8" ></script>
<link href="/resources/css/writeForm.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/sidebar.css">
<script>
function btnSave(){
	// bcontent에 내용 삽입
	oEditors.getById["bcontent"].exec("UPDATE_CONTENTS_FIELD", []);
	// 글제목
	var title = $("#title").val();
	// 글내용 있는지 확인용 
	var content = document.getElementsByTagName('p');
	
			

	var contentValue = $('#bcontent').val();
	var checkBlankOnly = contentValue;
	while(checkBlankOnly.indexOf("&nbsp;") != -1){
		checkBlankOnly = checkBlankOnly.replace("&nbsp;", "");
	}
	while(checkBlankOnly.indexOf("<p>") != -1){
		checkBlankOnly = checkBlankOnly.replace("<p>", "");
	}
	while(checkBlankOnly.indexOf("</p>") != -1){
		checkBlankOnly = checkBlankOnly.replace("</p>", "");
	}
	checkBlankOnly = checkBlankOnly.trim();
	if(title.trim() == ""){
		swal({text:"제목을 입력해주세요.", icon:"error"});			
		$("#title").focus();
	}
	else{
		if(checkBlankOnly.length == 0){
			swal({text:"내용을 입력해주세요.", icon:"error"});
		}
		else{
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
#noticeTitle{
border-left: 4px solid #1e78ff !important;
    color: black !important;
    font-weight: 600 !important;
    background: #f6f6f6 !important;
}
#noticeTitle a, #noticeTitle a:visited, #noticeTitle a:link{
	    color: black!important;
  font-weight: 600 !important;
 
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
							<li class="selected mid"><a href="/customerNotice"><span>공지사항</span></a></li>
							<li class="mid"><a href="/customerQna"><span>도움말</span></a></li>
							<li class="mid"><a href="/customerClaim/write"><span>1:1문의</span></a></li>
							<li><a href="/customerClaim/list"><span>Q&amp;A</span></a></li>
						</ul>
					</div>
						
						
						
					</div>
					<div class="col-md-10">
						<div class="free-board" >
 							<div class="drop-nav">
								<h1 class="tit-h1 line">공지사항</h1>
							</div>
							<div class="m-drop-nav">
								<h1 class="m-drop-tit-title line" style="cursor: pointer;">공지사항 <i class="fas fa-angle-down"></i></h1>
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
							
							<form name="form" id="form" role="form" method="POST" action="/customerNotice/write">
								<div class="form-table">
									<table>
										<tbody>
											<tr>
												<th scope="row"><label for="title">제목</label></th>
												<td>
													<span class="input-style-case02">
														<input type="text" id="title" name="title" placeholder="제목을 입력하세요" value="" maxlength="250">
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
								                    <input type="hidden" name="id" value="${loginUser.id}">
							               		</td>
							               </tr>
								            <tr>
												<th scope="row">내용</th>
												<td>
													<textarea class="form-control" rows="5" name="bcontent" id="bcontent" placeholder="내용을 입력해 주세요" rows="30" style="width:100%;"></textarea>
												</td>
											</tr>
<%-- 							               <div class="mb-3 title">
							                    <label for="writer"><b>작성자</b></label>
							                    <input type="text" class="form-control" name="nickname" id="writer" value="${loginUser.nickname}" readonly>
							                    <input type="hidden" name="id" value="${loginUser.id}">
							               </div> --%>
	<!-- 									   <div class="mb-3">
												<label for="content"><b>내용</b></label>
												<textarea class="form-control" rows="5" name="bcontent" id="content" placeholder="내용을 입력해 주세요"></textarea>
										   </div> -->
<!-- 											<div>
												<button type="button" class="btn btn-sm btn-primary" onclick="btnSave()" 
												style="width: 66px; height: 35px; margin-bottom: 59px;">저장</button>
								                <button type="button" class="btn btn-sm btn-primary" id="btnCancle" onclick="window.location.href='/board/free'">취소</button>
											</div> -->
										</tbody>
									</table>
								</div>
								<div class="bt-area">
									<a href="/customerNotice"  class="btn-m">취소</a>
									<span><a href="javascript:btnSave();"  class="btn-m fantasy" id="addBtn">작성</a></span>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	
<%--   <article>
		<div class="container" role="main">
			<h2 class="main">글작성</h2>
			<br>
			<br>
			<br>
			<form name="form" id="form" role="form" method="POST" action="/board/free/write">
               <div class="mb-3 title">
                    <label for="title"><b>제목</b></label>
                    <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요" required>
               </div>
               <div class="mb-3 title">
                    <label for="writer"><b>작성자</b></label>
                    <input type="text" class="form-control" name="nickname" id="writer" value="${loginUser.nickname}" readonly>
                    <input type="hidden" name="id" value="${loginUser.id}">
               </div>
			   <div class="mb-3">
					<label for="content"><b>내용</b></label>
					<textarea class="form-control" rows="5" name="bcontent" id="content" placeholder="내용을 입력해 주세요"></textarea>
			   </div>
			<div>
				<button type="button" class="btn btn-sm btn-primary" onclick="btnSave()" 
				style="width: 66px; height: 35px; margin-bottom: 59px;">저장</button>
                <button type="button" class="btn btn-sm btn-primary" id="btnCancle" onclick="window.location.href='/board/free'">취소</button>
			</div>
			</form>
		</div>
	</article>   --%>
	<%@include file="../mainfooter2.jsp" %>
		<script type="text/javascript">
			$(document).ready(
					function() {
						console.log("document ready!");

						var $sticky = $('.sticky');
						var $stickyrStopper = $('.footer_content	');
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
  $( document ).ready(function() {
     console.log( "document ready!" );

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
     $(".m-drop-nav").click(function(){
          $(".m-drop-down").slideToggle("slow");
        });
  });
  


 
  </script>
	
</body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</html>