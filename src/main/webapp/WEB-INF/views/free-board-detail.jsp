<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 상세조회</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link href="/resources/css/free-board-detail.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script src="/resources/jpaginate/jQuery.paginate.js"></script>
<script src="https://www.jsviews.com/download/jsrender.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">
<style type="text/css">
td, th {
    word-break: break-all;
    margin: 0;
    padding: 0;
    font-size: 14px;
    box-sizing: border-box;
}
legend, caption {
    font-size: 0;
    overflow: hidden;
    text-indent: -9999999px;
    height: 0;
    width: 0;
    line-height: 0;
}
.pop-layer {
    display: table;
    position: fixed;
    left: 0;
    top: 0;
    bottom: 0;
    height: 100%;
    right: 0;
    width: 100%;
    background-color: rgba(0,0,0, 0.3);
    z-index: 999;
    table-layout: fixed;
}
.pop-layer .pop-inner {
    display: table-cell;
    vertical-align: middle;
}
.pop-layer .popup-wrap {
    position: relative;
    top: 50%;
    left: 50%;
    width: 624px;
    padding-bottom: 35px;
    margin-left: -312px;
    box-shadow: 1px 2px 3px 2px rgba(0,0,0,0.1);
}
.popup-wrap {
    position: relative;
    width: 100%;
    background: #fff;
}
.pop-layer .popup-wrap:after {
    content: "";
    display: block;
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 36px;
    background: #f9f9f9 url(/rpan/common/images/logo.png?update=20180329) no-repeat 15px 10px;
    background-size: 60px 18px;
}
.popup-wrap .pop-tit {
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    z-index: 2;
    height: 50px;
    line-height: 50px;
    background: #ff545c url(/rpan/common/images/bg_pop.png?update=20180329) no-repeat 0 0;
    background-size: 122px 50px;
    text-indent: 10px;
}
.popup-wrap .pop-tit span {
    font-size: 16px;
    color: #fff;
}
.pop-layer .popup-wrap .pop-cont {
    padding: 70px 20px 20px 20px;
}
.pop-clean {
    padding-bottom: 5px;
}
.pop-clean table {
    border-top: #444 1px solid;
    width: 100%;
    margin-bottom: 20px;
}
.pop-clean table th {
    background-color: #f9f9f9;
    padding: 10px 15px;
    text-align: left;
    border-bottom: #eaeaea 1px solid;
    vertical-align: middle;
    font-weight: bold;
}
.pop-clean table td {
    padding: 10px;
    border-bottom: #eaeaea 1px solid;
}
.tit-h2 {
    font-size: 16px;
    margin-bottom: 10px;
    font-weight: bold;
}
.pop-clean .notify {
    margin-bottom: 20px;
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
.caret {
    display: inline-block;
    width: 0;
    height: 0;
    margin-left: 2px;
    vertical-align: middle;
    border-top: 4px dashed;
    border-right: 4px solid transparent;
    border-left: 4px solid transparent;
}
.bootstrap-select.btn-group .dropdown-menu {
    min-width: 100%;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
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
.pop-clean .notify textarea {
    display: block;
    margin-top: 5px;
    border: #ccc 1px solid;
}
textarea {
    padding: 1%;
    width: 100%;
    border: 1px solid #ccc;
    color: #4d4d4d;
    resize: none;
    box-sizing: border-box;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border-radius: 0;
}
.pop-clean .pop-clean-info {
    background-color: #f9f9f9;
    color: #888;
    padding: 20px;
    overflow: hidden;
    margin-bottom: 10px;
}
</style>
</head>
<body>

<%@include file="mainheader.jsp" %> 
	<div class="all-dim"></div>
	<div class="containerNew">
		<div class="board-page">
			<div class="row">
				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu">
						<ul>
							<li><a href="/board/free"><span>자유게시판</span></a></li>
							<li class="mid"><a href="#"><span>포트폴리오</span></a></li>
							<li class="last"><a href="/news"><span>뉴스</span></a></li>
						</ul>
					</div>
				</div>
	  <div class="col-md-10">
		<div class="free-board">
		<div class="drop-nav">
			<h1 class="tit-h1 line">자유게시판</h1>
		</div>
		<div class="m-drop-nav">
			<h1 class="m-drop-tit-title line" style="cursor:pointer;">자유게시판 ▼</h1>
		</div>
		<div class="m-drop-down">
			<h1 class="m-drop-tit-body first line" style="cursor:pointer;"><a href="/board/free">자유게시판</a></h1>
			<h1 class="m-drop-tit-body line" style="cursor:pointer;"><a href="#">포트폴리오</a></h1>
			<h1 class="m-drop-tit-body last line" style="cursor:pointer;"><a href="/news">뉴스</a></h1>
		</div>
		<div class="board-detail">
			<div id="boardList"></div>
		</div>
		<div class="board-view">
		</div>	
		
		<div class="comment-cont anonymity">

	<!-- 실명인증 -->
	
	<form action="/board/writeComment" method="POST" id="commentForm">
	<div class="cmt-write">
	<input type="hidden" name="pno" value="${boardDetail.pno}">
	<c:if test="${loginUser != null}">
		<textarea id="commentContent" name="ccontent" class="commentCentent byte-count e-login" data-byte-limit="1000" rows="2" cols="10" placeholder="따뜻한 댓글은 글쓴이에게 큰 힘이 됩니다. 욕설/비방이 담긴 댓글은 삭제될 수 있습니다."></textarea>
	</c:if>
	<c:if test="${loginUser == null}">
		<textarea name="ccon
		tent" class="commentCentent byte-count e-login" data-byte-limit="1000" rows="2" cols="10" placeholder="댓글을 작성하시려면 로그인을 해주세요" onclick="location.href='/signInPage'"></textarea>
	</c:if>	
		<p class="text-byte">0/1000 byte</p>
		<script type="text/javascript">
		//글자의 바이트를 계산해주는 이벤트
		jQuery(document).on(
				'input',
				'.byte-count',
				function() {
					var $this = jQuery(this);
					var content = $this.val();
					var limiteSize = $this.data('byteLimit');
					var byteSize = getByteLength(content);
					if (byteSize > limiteSize) {
						alert("사이즈를 벗어 났습니다. " + limiteSize + "byte까지 입력가능합니다.");
						content = cutByteLength(content, limiteSize);
						$this.val(content);
						byteSize = getByteLength(content);
					}
					$this.next().html(
							jQuery('<p>').attr('class', 'text-byte').text(
									byteSize + '/' + limiteSize + ' byte'));
				});
		function getByteLength(s) {
			if (s == null || s.length == 0) {
				return 0;
			}
			var size = 0;
			for (var i = 0; i < s.length; i++) {
				size += this.charByteSize(s.charAt(i));
			}
			return size;
		}
		function charByteSize(ch) {
			if (ch == null || ch.length == 0) {
				return 0;
			}
			var charCode = ch.charCodeAt(0);
			if (charCode <= 0x00007F) {
				return 1;
			} else if (charCode <= 0x0007FF) {
				return 2;
			} else if (charCode <= 0x00FFFF) {
				return 3;
			} else {
				return 4;
			}
		}
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
		  });
			  $(".m-drop-nav").click(function(){
				    $(".m-drop-down").slideToggle("slow");
				  });
		</script>
		<div class="support-button">

			<span class="insert"><a href="javascript:commentInsertConfirm('${boardDetail.pno }');" class="btn-s gray">등록</a></span>

		</div> 
		</div>
	</form>
	<!-- //cmt-write -->
	
	<div class="cmt-list" id="cmt-list" style="">
		<p>
			댓글 보기 <span id="commentCnt"></span>
		</p>
		
		<ul id="commentList" class="replyArea">
		</ul>
	
	</div>
</div>
		
				<!-- 댓글 페이징 -->
	<div class="paging">
		<div id="commentPaging">
		</div>
	</div>
		<p class="bt-area view-bt-area">
        <span>
            <a href="/board/free" class="btn-s bodrb">목록</a>
			<a href="/board/free/write" class="btn-s red">글쓰기</a>
		</span>
    	</p>
    	<div class="prev-next" id="prev-next">
	      
	    </div>
		</div>
		</div>
		</div>
		</div>
	</div>

<div id="reportPopup" class="pop-layer" style="display: none;">
		<div class="pop-inner">
			<div class="popup-wrap">
				<div class="pop-tit"><span>게시물 신고하기</span></div>
				<div class="pop-cont">
					<div class="pop-clean">
						<table>
							<caption>게시물 신고하기</caption>
							<colgroup>
								<col style="width: 100px;">
								<col style="">
							</colgroup>
							<tbody>
							<tr>
								<th scope="col">제목</th>
								<td>치타 초근접 짤.gif</td>
							</tr>
							<tr>
								<th scope="col">작성자</th>
								<td>안녕하세용용</td>
							</tr>
							</tbody>
						</table>

						<h2 class="tit-h2">신고사항</h2>
						<p class="notify">
					<span class="select-style">
						<div class="btn-group bootstrap-select"><button type="button" class="btn dropdown-toggle bs-placeholder btn-default" data-toggle="dropdown" role="button" data-id="rprtCode" title="신고항목선택"><span class="filter-option pull-left">신고항목선택</span>&nbsp;<span class="bs-caret"><span class="caret"></span></span></button><div class="dropdown-menu open" role="combobox"><ul class="dropdown-menu inner" role="listbox" aria-expanded="false"><li data-original-index="1"><a tabindex="0" class="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">선택</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="2"><a tabindex="0" class="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">광고</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="3"><a tabindex="0" class="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">욕설</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="4"><a tabindex="0" class="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">허위루머</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="5"><a tabindex="0" class="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">타종목추천</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="6"><a tabindex="0" class="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">도배</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="7"><a tabindex="0" class="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">명예훼손</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="8"><a tabindex="0" class="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">주제무관</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="9"><a tabindex="0" class="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">위조/변조</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="10"><a tabindex="0" class="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">음란</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="11"><a tabindex="0" class="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">지역감정</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li><li data-original-index="12"><a tabindex="0" class="" data-tokens="null" role="option" aria-disabled="false" aria-selected="false"><span class="text">기타</span><span class="glyphicon glyphicon-ok check-mark"></span></a></li></ul></div><select title="신고항목선택" id="rprtCode" name="rprtCode" class="selectpicker" tabindex="-98"><option class="bs-title-option" value="">신고항목선택</option>
							<option value="">선택</option>
							<option value="RP001">광고</option>
							<option value="RP002">욕설</option>
							<option value="RP003">허위루머</option>
							<option value="RP004">타종목추천</option>
							<option value="RP005">도배</option>
							<option value="RP006">명예훼손</option>
							<option value="RP007">주제무관</option>
							<option value="RP008">위조/변조</option>
							<option value="RP009">음란</option>
							<option value="RP010">지역감정</option>
							<option value="RP011">기타</option>
						</select></div>
					</span>
							<textarea cols="10" rows="3" class="byte-count" id="rprtResn" name="rprtResn" title="내용입력" data-byte-limit="2000" placeholder="내용을 입력해주세요."></textarea>
						</p>
						<dl class="pop-clean-info">
							<dt>이용안내</dt>
							<dd>
								신고된 내용은 판타지스탁 게시물 운영정책에 따라 삭제 되거나, 게시물 작성자는 서비스 이용의 제한을 받을 수도 있습니다.
								<span>신고 해 주신 내용은 확인 후 처리 하도록 하겠습니다. 회원님의 소중한 신고에 감사를 드립니다.</span>
							</dd>
						</dl>
						<p class="pop-clean-call">신고사항 외의 기타문의 사항이 있으시면 고객센터로 문의해주세요. <a href="#">고객센터 문의</a></p>

					</div>
					<div class="pop-btn">
						<button type="button" class="btn-m e-reportPopupClose">취소</button>
						<button type="button" id="submitReport" class="btn-m red">신고하기</button>
					</div>
				</div>
				<button class="cla-close e-reportPopupClose">닫기</button>
			</div>
		</div>
	</div>

<%@include file="mainfooter.jsp" %>


<script>

		
		$(function(){
	    	list()

	    })
	    
	    // 목록 뿌리기
	    
	    var like = "좋아요";
	    
	    function list(){
	    
	    
		var pno = ${boardDetail.pno}
		var page = "&bnowPage="+${commentPage.nowPage}
		
			console.log(page)
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/board/free/detail/ajax?pno='+pno + page,
				dataType : 'json',
				contentType : "application/x-www-form-urlencoded;chartset=UTF-8",
				success : function(data){ 
					console.log(data)
					// 게시판상세보기
					var board = "";
					
					var boardTitle = data.boardDetail.title
					var boardNickname = data.boardDetail.nickname
					var boardDatetime = data.boardDetail.bdateTime
					var boardContent = data.boardDetail.bcontent

					
					board +=	'<div class="board-view-tit">'
					board +=		'<h1>'+boardTitle+'</h1>'
					board +=		'<div class="writer">'
					board +=			'<p class="img"><img class="pax_f2_proimg" cust_id="ciaws94" src="https://www.paxnet.co.kr/my/files/proimg/di/pi_08.png"></p>'
					board +=			'<p class="text">'
					board +=			'<span class="nickname" style="cursor:pointer;" onclick="#;">'+boardNickname+'</span>'
					board +=			'<span class="time">'+changeDate(boardDatetime)+'</span>'
					board +=			'<span class="viewer"><i>조회</i>'+data.boardDetail.views+'</span>'
					board +=			'</p>'
					board +=		'</div>'
					board +=		'<c:if test="${loginUser.nickname eq boardDetail.nickname}">'
					board +=			'<div id="" class="share-more">'
					board +=				'<a href="/board/free/update?pno=${boardDetail.pno}" id="editBtn" class="modify"><span>수정</span></a>'
					board +=				'<a href="javascript:void(0)" onclick="delBoard()" id="btnDelete" class="del"><span>삭제</span></a>'
					board +=			'</div>'
					board +=		'</c:if>'
					board +=	'</div>'
					board +=	'<div id="bbsWrtCntn" class="board-view-cont" style="word-break:break-word;">'+boardContent+'</div>'
					board +=	'<div class="sns-area board-sns">'
					board +=		'<p class="notify-box">'
					board +=			'<button type="button" id="reportPopupBtn" class="btn-s notify clean-popup-button e-login"><span>신고</span></button>'
					board +=		'</p>'
					board +=		'<p class="like-box" id="actBtn" style="">'
					board +=			'<button class="btn-m like" id="recmBtn" onclick="updateLikes('+data.boardDetail.pno+');"><i>추천</i><span id="recommendCount">'+data.boardDetail.likes+'</span></button>'
					board +=		'</p>'
					board +=	'</div>'
							
					
					$(".board-view").html(board)
	
					var commentCount = "";
					commentCount += data.boardDetail.commentCount
					$("#commentCnt").text(commentCount)
					
					
					
					// 댓글
					var comment= "";
					
					
				if(data.commentList.length != 0){
					for(var i=0; i<data.commentList.length; i++){
						
						
 						comment += 	"<li class='list' id= 'comment"+ data.commentList[i].cno + "'>"
						comment += 	"<p class='img'><img class='pax_f2_proimg' cust_id='angelina0416' src='/resources/img/pi_08.png'></p>"
						comment += 	"<div class='text'>"
						comment += 	"<p class='writer'>"
						comment +=	"<span id='writer_45219165' onclick='#' style='cursor:pointer;'>"+data.commentList[i].nickname+"</span>"
						comment +=	"<span class='data-date-format'>"+changeDate(data.commentList[i].cdateTime)+"</span>"
						comment += 	"</p>"
						comment += 	"<p class='cont' id='com" + data.commentList[i].cno + "'>" +data.commentList[i].ccontent+"</p>"
						comment += 	"</div>"
						comment += 	"<div class='share-more'>"
						comment += 	"<a class='notify e-login e-report-comt-popup' href='#'><span>신고</span></a>"	
						comment += 	"</div>"

						
						
				

							
	/*  						comment += "<div class='commentBody' id= 'comment" + data.commentList[i].cno + "'>"
							comment += "<i class='fa fa-user-circle'></i> <b>"+data.commentList[i].nickname+"</b><br>"
							comment += "<i class='far fa-clock'></i>"+changeDate(data.commentList[i].cdateTime)+"<br> <br>"
							comment += "<div id='com" + data.commentList[i].cno + "'>" + data.commentList[i].ccontent + "</div>" */
							
							// 내 댓글에 수정/삭제 버튼 띄우기
							if("${loginUser.nickname}" == data.commentList[i].nickname){
								var test = data.commentList[i].ccontent
								console.log("${loginUser.nickname}")
								//console.log(data.commentList.nickname)
								$("#showhide-btn").hide()
	 							comment +=  	   '<div class="share-more">'
								comment += 		   '<a href="javascript:updateCommentView(' + data.commentList[i].cno + ', ' + "'" + data.commentList[i].ccontent + "'" + ');" class="modify"><span>수정</span></a>'
								comment += 	       '<a href="javascript:commentDelConfirm(' + data.commentList[i].cno + ', ' + "'" + data.commentList[i].pno + "'" + ');" class="del" id="commentDel"><span>삭제</span></a>'
								comment += 		   '</div>'
	
	/* 							comment +=  	   '<button type="button" class="btn btn-sm btn-primary"'
								comment += 		   'id="btnUpdate'+data.commentList[i].cno+'" onclick="updateCommentView(' + data.commentList[i].cno + ', ' + "'" + data.commentList[i].ccontent + "'" + ')">수정</button>'
								comment += 	       '<button type="button" class="btn btn-sm btn-primary"'
								comment += 		   'id="btnDelete" onclick="deleteComment(' + data.commentList[i].cno + ')">삭제</button>'  */
							}
								comment += '</li>'
								
		 
							
							$("#commentList").empty().html(comment)
						}	
						
						
						
						// 페이징처리
						var commentPaging = "";
						
						// 댓글이 4개 이상일 때 띄우기
		 				if(data.commentPage.total >= 4) {
		 					commentPaging += '<nav aria-label="..." class="pagination">' 
							commentPaging += '<ul class="pagination">' 
							
							
							// 1페이지가 아니면
		 					if(data.commentPage.nowPage != 1){
		 						
		 						// << 버튼 
		 						commentPaging +=	'<li>'
		 						commentPaging +=		'<a class="page-link"'
		 						commentPaging +=			'href="/board/free/detail?pno=${boardDetail.pno}&bnowPage=1"'
		 						commentPaging +=			'tabindex="-1" aria-disabled="true">'
		 						commentPaging +=			'<i class="fas fa-angle-double-left"></i>'
		 						commentPaging +=		'</a>'
		 						commentPaging +=	'</li>'
		 						
		 						// < 버튼
				 				commentPaging +=	'<li>'
			 					commentPaging +=		'<a class="page-link"'
								commentPaging +=			'href="/board/free/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.nowPage-1}"'
								commentPaging +=			'tabindex="-1" aria-disabled="true">'
								commentPaging +=			'<i class="fas fa-angle-left"></i>'
								commentPaging +=		'</a>'
								commentPaging +=	'</li>'
		 					}
							
							// 한번에 5개 페이지 보여줌
							for(var i=data.commentPage.startPage; i<=data.commentPage.endPage; i++){
								if(i == data.commentPage.nowPage){
									commentPaging +=	'<li class="page-item active" aria-current="page">'
									commentPaging +=			'<a class="page-link" href="#">'+i
									commentPaging +=				'<span class="sr-only">(current)</span>'
									commentPaging +=				'</a>'
									commentPaging +=		'</li>'
								}
								if(i != data.commentPage.nowPage){
									commentPaging +=	'<li class="page-item">'
									
									commentPaging +=	"<a class='page-link' href='/board/free/detail?pno="+data.boardDetail.pno+"&bnowPage="+i+"'>"+i+"</a>"
								
									commentPaging +=	'</li>'
								}
							}
							
							
							// 마지막페이지아닐때
							if(data.commentPage.nowPage != data.commentPage.lastPage){
								commentPaging += '<li>'
								commentPaging += 	'<a class="page-link"'
								commentPaging += 		"href='/board/free/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.nowPage+1}'"
								commentPaging += 		'tabindex="+1" aria-disabled="true" data-ajax="false">'
								commentPaging += 			'<i class="fas fa-angle-right"></i>'
								commentPaging += 	'</a>'
								commentPaging += '</li>'
								
								// >> 버튼
								commentPaging += '<li>'
								commentPaging += '<a class="page-link"'
								commentPaging += "href='/board/free/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.lastPage}'"						
								commentPaging += 'tabindex="-1" aria-disabled="true">'
								commentPaging += 		'<i class="fas fa-angle-double-right"></i>'
								commentPaging += 	'</a>'
								commentPaging += '</li>'
							}
							
		 					$("#commentPaging").empty().html(commentPaging)
		 					
		 					
		 					
		 					
		 					
		 				
	 					} 
						
					}else{
						$("#commentList").empty()
					}
					
					
	 				var prev_next = "";
					
					try{
						
						// 중간 글일때 (이전, 다음글 모두 있을 때)
						if(data.boardPrevNext[0].pno < data.boardDetail.pno && data.boardPrevNext[1].pno > data.boardDetail.pno){
		 					prev_next += '<div class="prev">'
							prev_next +=     '<dl>'
							prev_next +=          '<dt>이전글</dt>'
							prev_next +=           '<dd>'
							prev_next +=               '<a href="/board/free/detail?pno='+data.boardPrevNext[1].pno+'">'+data.boardPrevNext[1].title+'</a>'
							prev_next +=                    '</dd>'
							prev_next +=         '</dl>'
							prev_next +=    '</div>'
							prev_next +=     '<div class="next">'
							prev_next +=         '<dl>'
							prev_next +=           '<dt>다음글</dt>'
							prev_next +=          '<dd>'
							prev_next +=               '<a href="/board/free/detail?pno='+data.boardPrevNext[0].pno+'">'+data.boardPrevNext[0].title+'</a>'
							prev_next +=                     '</dd>'
							prev_next +=          '</dl>'
							prev_next +=         '</div>'
				
						}
					}
					catch(e){
						try{
							// 첫글일때
							if(data.boardPrevNext[0].pno < data.boardDetail.pno){
								prev_next +=     '<div class="next">'
								prev_next +=         '<dl>'
								prev_next +=           '<dt>다음글</dt>'
								prev_next +=          '<dd>'
								prev_next +=               '<a href="/board/free/detail?pno='+data.boardPrevNext[0].pno+'">'+data.boardPrevNext[0].title+'</a>'
								prev_next +=                     '</dd>'
								prev_next +=          '</dl>'
								prev_next +=     '</div>'
								
							}
						
						}
						
						// 글이 하나밖에 없을 때	
						catch(e){
							prev_next += 	'<div class="prev">'
							prev_next +=    	 '<dl>이전글이 존재하지 않습니다'
							prev_next +=         '</dl>'
							prev_next +=    '</div>'
						}
					}
					
					// 마지막 글일 때
					if(data.boardPrevNext[0].pno > data.boardDetail.pno){
						console.log(1)
	 					prev_next += 	'<div class="prev">'
						prev_next +=    	 '<dl>'
						prev_next +=          '<dt>이전글</dt>'
						prev_next +=           '<dd>'
						prev_next +=               '<a href="/board/free/detail?pno='+data.boardPrevNext[0].pno+'">'+data.boardPrevNext[0].title+'</a>'
						prev_next +=                    '</dd>'
						prev_next +=         '</dl>'
						prev_next +=    '</div>'
					}
					
						$("#prev-next").html(prev_next)
					
					
					
	 			},
				error : function(error, data){
					console.log(data)
					console.log(error)
					alert('error!!'); 
				}
			});
	    }
		
		// 등록할건지 alert
		function commentInsertConfirm(pno){
			swal({
				  text: "정말 등록하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willInsert) => {
				  if (willInsert) {
				    swal("성공적으로 등록되었습니다.", {
				      icon: "success",
				    }).then(function(){
				    	writeComment(pno);
				    });
				  } else {
				    swal("등록이 취소되었습니다.");
				  }		        		
	    	})
		}
	    
	    

	    // 댓글등록
		function writeComment(pno){
		    
		    $.ajax({
		        type:'POST',
		        url : "${pageContext.request.contextPath}/board/writeComment",
		        data:$("#commentForm").serialize(),
		        success : function(data){
		        	console.log(data);
		            if(data=="success"){
		            	$("#commentContent").val("")
		                list();
		            }
		        },
		        error:function(request,status,error){
		        	console.log(error)
		       }
		        
		    });
		}
	   

		

		//댓글 수정창 input
		function updateCommentView(cno, ccontent){
		    var comment ='';
		    
/* 		    comment += '<div class="input-group">';
		    comment += 		'<input type="text" name="ccontent'+cno+'" value="'+ccontent+'"/>';
		    comment += 		'<button class="btn btn-primary" type="button" onclick="updateComment('+cno+');">확인</button>';
		    comment += '</div>'; */
		  
		    comment +='<p class="cont">'+ccontent+'</p>';
 		    comment +='<div class="commentDiv">';
		    comment += 	'<div class="cmt-write">'; 
		    comment += 		'<textarea name="ccontent'+cno+'" class="commentCentent byte-count e-login" data-byte-limit="1000" rows="2" cols="10">'+ccontent+'</textarea>';
		    comment += 		'<p class="text-byte">0/1000 byte</p>';
		    comment += 		'<div class="support-button">';
		    comment += 			'<span class="insert">';
		    comment +=				'<a href="#" class="btn-s" style="min-width:60px;">취소</a>'
		    comment +=				'<a href="javascript:updateComment('+cno+');" class="btn-s gray">수정</a>'
		    comment += 			'</span>';
		    comment += 		'</div>';
		    comment += 	'</div>';
		    comment +='</div>'; 
		    
		    $("#btnUpdate"+cno+"").hide()
		    
		    $('#com'+cno).html(comment);
		    
		}
		
		// 댓글 수정
		function updateComment(cno){
		    var ccontent = $('[name=ccontent'+cno+']').val();
		    
		    $.ajax({
		        url : "${pageContext.request.contextPath}/board/updateComment",
		        type : 'POST',
		        data : { 'cno' : cno, 'ccontent' : ccontent },
		        success : function(data){
		        	console.log(data)
		            if(data=="success") 
		            	list(); 
		        }
		    });
		}
		
		// 삭제할건지 alert
		function commentDelConfirm(cno, pno){
			swal({
				  text: "정말삭제하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    swal("성공적으로 삭제되었습니다.", {
				      icon: "success",
				    }).then(function(){
				    	deleteComment(cno, pno);
				    });
				  } else {
				    swal("삭제가 취소되었습니다.");
				  }		        		
	    	})
		}
		
		
		 
		// 댓글 삭제
		function deleteComment(cno, pno){
			 $.ajax({
		        url : "${pageContext.request.contextPath}/board/deleteComment",
		        type : 'POST',
		        data : { 'cno' : cno, 'pno' : pno },
		        success : function(data){
		        	if(data=="success"){
		        
		  				    	list(); 
					}
			    }
			})
		}
		        
		
		
	    // datetime 변환
	    function changeDate(date){
	        var date = new Date(date);
	        year = date.getFullYear();
	        month = date.getMonth() + 1;
	        if(month < 10) {
	        	month = "0" + month
	        }
	        day = date.getDate();
	        hour = date.getHours() + 15;
	        if(hour < 10) {
	        	hour = "0"+hour;
	        }
	        if(hour > 24) {
	        	hour -= 24;
	        	if(hour < 10) {
	        	hour = "0"+hour
	        	}
	        }
	        if(hour == 24){
	        	hour = "00";
	        }
	        minute = date.getMinutes();
	        if(minute < 10) {
	        	minute = "0" + minute;
	        }
	        second = date.getSeconds();
	        strDate = year+"-"+month+"-"+day+" "+hour+":"+minute;
	        return strDate;
	    }
		
	    
	    function updateLikes(pno){
		    $.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/board/free/detail/likes/ajax',
				dataType : 'json',
				data : {"pno" : pno},
				contentType : "application/x-www-form-urlencoded;chartset=UTF-8",
				success : function(data){ 
					if(data == 0){
						swal("좋아요", "", "success");
					}
					else if(data == 1){
						swal("좋아요취소", "", "error");
					}
					else if(data == 2){
						swal("로그인을 해주세요", "", "error").then(function(){
							window.location = "/signInPage";
						});
					}
					
					
					list();
					
					    /* if (like=="좋아요") 
					    	like = "좋아요 취소"
					    
				    	else
					    	like = "좋아요" */
				},
			    error : function(error, data){
			    	
					console.log(data)
					console.log(error)
					alert('error!!'); 
			    }
		    })
		}
	    
	    
	    // 글삭제
		function delBoard() {
			/* sweetAlert */
			swal({
				  text: "정말삭제하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    swal("성공적으로 삭제되었습니다.", {
				      icon: "success",
				    }).then(function(){
					  location.href = '/board/free/delete?pno=${boardDetail.pno}';
				    });
				  } else {
				    swal("삭제가 취소되었습니다.");
				  }
			});
		}
	    
	    
	    
		
/* 		history.pushState(null, null, location.href);

		window.onpopstate = function(event) {
			console.log(event)
			location.href = "/board/free";

		}; */




	
</script>
<!--  
<script id="commnet" type="text/x-jsrender">
		<div class='commentBody'>
		<i class='fa fa-user-circle'></i> <b>{{:nickname}}</b><br>
		<i class='far fa-clock'></i>{{:cdataTime}}<br> <br>
		{{:ccontent}}
		</div>
</script>

-->

</body>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>