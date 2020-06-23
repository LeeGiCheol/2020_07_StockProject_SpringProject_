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
<link rel="stylesheet" href="/resources/css/mainfooter2.css">
<link rel="stylesheet" href="/resources/css/mainheader2.css">
<link rel="stylesheet" href="/resources/css/customers.css">
<link rel="stylesheet" href="/resources/css/sidebar.css">	
</head>
<body>
<div class="wrap">
<%@include file="mainheader.jsp" %> 
	<div class="all-dim"></div>
	<div class="containerNew">
		<div class="board-page">
			<div class="row">
				<div class="col-md-2">
				
				
					<div class="sidebar sticky" id="cssmenu" style="position: relative;">
						<ul>
							<li class="mid"><a href="/customer"><span>고객센터</span></a></li>
							<li class="selected mid"><a href="/customerNotice"><span>공지사항</span></a></li>
							<li class="mid"><a href="/customerqna"><span>도움말</span></a></li>
							<li class="mid"><a href="/customerClaim/write"><span>1:1문의</span></a></li>
							<li><a href="/customerClaim/list"><span>1:1문의 내역</span></a></li>
						</ul>
					</div>
				</div>
	  <div class="col-md-10">
		<div class="free-board "role="main">

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
									<a href="/customerqna">도움말</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerClaim/write">1:1문의</a>
								</h1>														
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerClaim/list">1:1문의 내역</a>
								</h1>
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
		</script>
		<div class="support-button">

			<span class="insert"><a href="javascript:commentInsertConfirm('${boardDetail.pno }');" class="moreBttn right blue">등록</a></span>

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
        	<c:if test="${loginUser.point le -1}">
        		<a href="/customNoticeWrite" class="moreBttn right blue">글쓰기</a>
        	</c:if>
            <a href="/customerNotice" class="moreBttn right norm">목록</a>

		</span>
    	</p>
    	<div class="prev-next" id="prev-next">
	      
	    </div>
		</div>
		</div>
		</div>
		</div>
	</div>
	<%@include file="mainfooter.jsp" %>
</div>
<div id="reportPopup" class="pop-layer" style="display:none">
		<div class="pop-inner">
			<div class="popup-wrap">
				<form id="reportBoard" action="/reportBoard" method="POST"> 
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
									<td>${boardDetail.title}</td>
								</tr>
								<tr>
									<th scope="col">작성자</th>
									<td>${boardDetail.nickname}</td>
								</tr>
								</tbody>
							</table>
	
							<h2 class="tit-h2">신고사항</h2>
							<p class="notify">
								<span class="select-style">
									<select title="신고항목선택" id="rtype" name="rtype" class="selectpicker" tabindex="-98">
										<option class="bs-title-option" value="">신고항목선택</option>
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
									</select>
	<script>
        /** 신고 기능들 모음 Report */
        var Report = (function($) {
            var root = this;
            var Module;
            if (typeof exports !== 'undefined') {
                Module = exports;
            } else {
                Module = root.Module = {};
            }
            Module.version = '1.0';
            Module.discript = '신고'

            Module.ajaxSubmitReport = function (bbsWrtRprtVO) {
                var bbsSuveInfoVO = Module.bbsSuveInfoVO;

                if(Module.vaildateSubmitReport(bbsWrtRprtVO)){
                    return;
                }                
                
                if(confirm("신고하시겠습니까?")){
                	
                }                
            }
            Module.vaildateSubmitReport = function (bbsWrtRprtVO) {
                return false;
            }
            return Module;
        }(jQuery));
        (function start() {
            var bbsWrtVO = {"seq":150357583578728,"id":"N10841","regDate":"2020-06-16 09:29:16.0","regmnId":"tsbaki22","regmnNicknm":"콰지콰지","regmnIp":"192.168.112.102","regmnImgPath":"//www.paxnet.co.kr/my/files/badge/like4S.png","title":"펌)첫 출근 후 울었습니다. ","wrtCntnSmry":null,"itemCode":null,"tabInfo":null,"hdwr":null,"wrtGrad":null,"wrtStat":null,"pstn":null,"ottpTarget":null,"wrtePath":"web","fileAttaYn":"N","recmUseYn":"Y","comtUseYn":"Y","orgnId":null,"pswd":null,"uusrId":null,"updtDate":null,"blidYn":"N","suveYn":"N","applyBbsName":null,"hitsNum":0,"recmNum":0,"comtNum":0,"totalCnt":0,"nextKey":null,"wrtNo":395965,"popYn":null,"bestYn":null,"bbsTypeId":null,"itemName":null,"orignBbsName":null,"realNmChk":"N","preSeq":0,"nextSeq":0,"preTitle":null,"nextTitle":null,"specWrtNo":null,"specRegDate":null,"keyId":null,"specId":null,"orgnSpecBbsId":null,"movebbsTypeId":null,"movePstn":null,"notices":[],"bbsVO":{"id":"N10841","ooId":null,"bbsName":null,"bbsTypeId":null,"bbsPstn":null,"expl":null,"mngrCode":null,"delYn":null,"note":null,"pstnName":null,"wrtRegCode":null,"bbsFunction":null,"viewType":null,"areas":null,"bbsInfos":null,"view":null,"bbsContentFunctionDetailMap":null,"paging":null,"bbsWrts":null,"bbsList":null,"fn002Yn":false,"fn003Yn":false,"fn004Yn":false,"fn005Yn":false,"fn006Yn":false,"fn011Yn":false,"fn012Yn":false,"fn015Yn":false,"fn018Yn":false,"fn021Yn":false,"fn022Yn":false,"fn023Yn":false,"fn024Yn":false,"fn025Yn":false,"fn028Yn":false,"fn029Yn":false,"fn030Yn":false,"fn031Yn":false,"fn032Yn":false,"fn033Yn":false,"fn034Yn":false,"fn035Yn":false,"fn036Yn":false,"fn037Yn":false,"fn038Yn":false,"fn039Yn":false,"fn040Yn":false,"fn041Yn":false,"fn042Yn":false,"adminFlag":null,"level":0,"wrtFlag":null,"listLabelList":null,"sortLabelList":null,"pageLabelList":null,"searchLabelList":null,"contheadLabelList":null,"classLabelList":null,"pstnLabelList":null,"adminLabelList":null,"viewLabelList":null,"wrtLabelList":null,"uptLabelList":null,"bbsWrtVO":null,"jsonBbsWrtVO":null,"preNextBbsWrtVOs":null,"bbsWrtRecentInfoVO":null,"loginCustVO":null,"bbsTypeAndViewKey":"null_null"},"orignBbsVO":null,"bbsWrtRecentInfoVO":{"seq":150357583578728,"id":null,"seeCount":24,"recommendCount":0,"commentCount":0},"bbsWrtCntnVO":{"seq":150357583578728,"cntn":"<p><img class=\"lazy\" style=\"max-width: 100%;\" alt=\"88dc1af2-62a1-423a-a20e-21fdd1c9ffa1.png\" src=\"http://www.paxnet.co.kr/tbbs/files/N10841/20200616/88dc1af2-62a1-423a-a20e-21fdd1c9ffa1.png\"><br></p>","regDate":null},"bbsSuveInfoVO":null,"bbsWrtAttaFileVOs":[],"bbsWrtBlidVO":null,"specBbsWrtVO":{"id":null,"seq":null,"orgnId":null,"regDate":null,"updtDate":null,"uusrId":null,"delYn":null,"delResnCode":null,"delDate":null,"dusrId":null,"wrtNo":0,"regmnId":"tsbaki22","regmnNicknm":"콰지콰지"},"editorPickBbsWrtVO":null,"fileList":null,"delFileList":null,"notiList":null,"delNotiList":null,"pageNo":0,"rn":0,"dealAmt":0,"ddSeq":0,"earnRate":0.0,"dealDt":null};
            var custId = "${loginUser.nickname}";
            
            var bbsTitle = '자유게시판';

            jQuery('.e-reportPopupClose').on('click',function(){
            	$(".wrap").show();
                jQuery('#reportPopup').hide();
                
                initInput();
            });

            if(custId !== '') { //로그인 로직
                jQuery(document).on('click', '#reportPopupBtn', function () {
                	$("#rprtResn").val("");
                	closeLayerPop();
                	
                	if("${loginUser.nickname}" != bbsWrtVO.regmnId){
                		if(checkWrtRprt(bbsWrtVO.seq)){
                            jQuery('#reportPopup').show();
                            
                            if($('html').hasClass('mobile-size')){
        						$('html, body').scrollTop(0);					
        						$(".wrap").hide();
        					}
                            //jQuery('#reportPopup').attr("style", "position:fixed;display:table;");
                    	}                		
                	}else{
                		alert("본인의 글은 신고 할 수 없습니다.");
                	}
                	
                });

            }
        }());
        
        function initInput(){
        	//초기화
            $(".selectpicker").val('');
            $(".selectpicker").selectpicker('refresh');
            $("#rtype").val("");
            $("#rprtResn").val("");
        }
        
        function checkWrtRprt(wrtSeq){
        	var result = true;
        	$.ajax({
				type : "POST",
				url : "checkWrtRprt.json",
				data : {wrtSeq : wrtSeq},
				dataType : "json",
				async : false,
				success : function(data) {
					if(data.result){
						alert("이미 신고하셨습니다.");
						result = false;
					}
				},beforeSend: function(){
				},
				complete: function(){
				},
				error : function(e, textStatus) {
				}
			});
        	return result;
        }
    	function closeLayerPop() {
    		$(".scrap-box").css("display", "none");
    		$(".sns").css("display", "none");
    		$(".layer_pop").remove();
    		$(".reply-area").remove();
    		$(".file-box").css("display", "none");
    		$("#zoom_layer").css("display", "none");
    	}
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
								</span>
								<textarea cols="10" rows="3" class="byte-count" id="rprtResn" name="rcontent" title="내용입력" data-byte-limit="2000" placeholder="내용을 입력해주세요."></textarea>
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
						
							<input type="hidden" name="pno" value="${boardDetail.pno}">
							<input type="hidden" name="title" value="${boardDetail.title}">
						
						<div class="pop-btn">

							<button type="button"  onclick="hidePopup()" class="btn-m e-reportPopupClose">취소</button>
							<button type="submit" id="submitReport" class="btn-m red">신고하기</button>
						</div>
					</div>
					<button type="button" onclick="hidePopup()" class="cla-close e-reportPopupClose">닫기</button>
				</form> 
			</div>
		</div>
	</div>

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
				url : '${pageContext.request.contextPath}/customerNotice/detail/ajax?pno='+pno + page,
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
					board +=				'<a href="/customerNotice/update?pno=${boardDetail.pno}" id="editBtn" class="modify"><span>수정</span></a>'
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
		 						commentPaging +=			'href="/customerNotice/detail?pno=${boardDetail.pno}&bnowPage=1"'
		 						commentPaging +=			'tabindex="-1" aria-disabled="true">'
		 						commentPaging +=			'<i class="fas fa-angle-double-left"></i>'
		 						commentPaging +=		'</a>'
		 						commentPaging +=	'</li>'
		 						
		 						// < 버튼
				 				commentPaging +=	'<li>'
			 					commentPaging +=		'<a class="page-link"'
								commentPaging +=			'href="/customerNotice/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.nowPage-1}"'
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
									
									commentPaging +=	"<a class='page-link' href='/customerNotice/detail?pno="+data.boardDetail.pno+"&bnowPage="+i+"'>"+i+"</a>"
								
									commentPaging +=	'</li>'
								}
							}
							
							
							// 마지막페이지아닐때
							if(data.commentPage.nowPage != data.commentPage.lastPage){
								commentPaging += '<li>'
								commentPaging += 	'<a class="page-link"'
								commentPaging += 		"href='/customerNotice/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.nowPage+1}'"
								commentPaging += 		'tabindex="+1" aria-disabled="true" data-ajax="false">'
								commentPaging += 			'<i class="fas fa-angle-right"></i>'
								commentPaging += 	'</a>'
								commentPaging += '</li>'
								
								// >> 버튼
								commentPaging += '<li>'
								commentPaging += '<a class="page-link"'
								commentPaging += "href='/customerNotice/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.lastPage}'"						
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
							prev_next +=               '<a href="/customerNotice/detail?pno='+data.boardPrevNext[1].pno+'">'+data.boardPrevNext[1].title+'</a>'
							prev_next +=                    '</dd>'
							prev_next +=         '</dl>'
							prev_next +=    '</div>'
							prev_next +=     '<div class="next">'
							prev_next +=         '<dl>'
							prev_next +=           '<dt>다음글</dt>'
							prev_next +=          '<dd>'
							prev_next +=               '<a href="/customerNotice/detail?pno='+data.boardPrevNext[0].pno+'">'+data.boardPrevNext[0].title+'</a>'
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
								prev_next +=               '<a href="/customerNotice/detail?pno='+data.boardPrevNext[0].pno+'">'+data.boardPrevNext[0].title+'</a>'
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
						prev_next +=               '<a href="/customerNotice/detail?pno='+data.boardPrevNext[0].pno+'">'+data.boardPrevNext[0].title+'</a>'
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
				url : '${pageContext.request.contextPath}/board/detail/likes/ajax',
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
					  location.href = '/customNotice/delete?pno=${boardDetail.pno}';
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
<script>
/*!
 * Bootstrap-select v1.12.2 (http://silviomoreto.github.io/bootstrap-select)
 *
 * Copyright 2013-2017 bootstrap-select
 * Licensed under MIT (https://github.com/silviomoreto/bootstrap-select/blob/master/LICENSE)
 */

(function (root, factory) {
    if (typeof define === 'function' && define.amd) {
        // AMD. Register as an anonymous module unless amdModuleId is set
        define(["jquery"], function (a0) {
            return (factory(a0));
        });
    } else if (typeof module === 'object' && module.exports) {
        // Node. Does not work with strict CommonJS, but
        // only CommonJS-like environments that support module.exports,
        // like Node.
        module.exports = factory(require("jquery"));
    } else {
        factory(root["jQuery"]);
    }
}(this, function (jQuery) {

    (function ($) {
        'use strict';

        //<editor-fold desc="Shims">
        if (!String.prototype.includes) {
            (function () {
                'use strict'; // needed to support `apply`/`call` with `undefined`/`null`
                var toString = {}.toString;
                var defineProperty = (function () {
                    // IE 8 only supports `Object.defineProperty` on DOM elements
                    try {
                        var object = {};
                        var $defineProperty = Object.defineProperty;
                        var result = $defineProperty(object, object, object) && $defineProperty;
                    } catch (error) {
                    }
                    return result;
                }());
                var indexOf = ''.indexOf;
                var includes = function (search) {
                    if (this == null) {
                        throw new TypeError();
                    }
                    var string = String(this);
                    if (search && toString.call(search) == '[object RegExp]') {
                        throw new TypeError();
                    }
                    var stringLength = string.length;
                    var searchString = String(search);
                    var searchLength = searchString.length;
                    var position = arguments.length > 1 ? arguments[1] : undefined;
                    // `ToInteger`
                    var pos = position ? Number(position) : 0;
                    if (pos != pos) { // better `isNaN`
                        pos = 0;
                    }
                    var start = Math.min(Math.max(pos, 0), stringLength);
                    // Avoid the `indexOf` call if no match is possible
                    if (searchLength + start > stringLength) {
                        return false;
                    }
                    return indexOf.call(string, searchString, pos) != -1;
                };
                if (defineProperty) {
                    defineProperty(String.prototype, 'includes', {
                        'value': includes,
                        'configurable': true,
                        'writable': true
                    });
                } else {
                    String.prototype.includes = includes;
                }
            }());
        }

        if (!String.prototype.startsWith) {
            (function () {
                'use strict'; // needed to support `apply`/`call` with `undefined`/`null`
                var defineProperty = (function () {
                    // IE 8 only supports `Object.defineProperty` on DOM elements
                    try {
                        var object = {};
                        var $defineProperty = Object.defineProperty;
                        var result = $defineProperty(object, object, object) && $defineProperty;
                    } catch (error) {
                    }
                    return result;
                }());
                var toString = {}.toString;
                var startsWith = function (search) {
                    if (this == null) {
                        throw new TypeError();
                    }
                    var string = String(this);
                    if (search && toString.call(search) == '[object RegExp]') {
                        throw new TypeError();
                    }
                    var stringLength = string.length;
                    var searchString = String(search);
                    var searchLength = searchString.length;
                    var position = arguments.length > 1 ? arguments[1] : undefined;
                    // `ToInteger`
                    var pos = position ? Number(position) : 0;
                    if (pos != pos) { // better `isNaN`
                        pos = 0;
                    }
                    var start = Math.min(Math.max(pos, 0), stringLength);
                    // Avoid the `indexOf` call if no match is possible
                    if (searchLength + start > stringLength) {
                        return false;
                    }
                    var index = -1;
                    while (++index < searchLength) {
                        if (string.charCodeAt(start + index) != searchString.charCodeAt(index)) {
                            return false;
                        }
                    }
                    return true;
                };
                if (defineProperty) {
                    defineProperty(String.prototype, 'startsWith', {
                        'value': startsWith,
                        'configurable': true,
                        'writable': true
                    });
                } else {
                    String.prototype.startsWith = startsWith;
                }
            }());
        }

        if (!Object.keys) {
            Object.keys = function (
                o, // object
                k, // key
                r  // result array
            ){
                // initialize object and result
                r=[];
                // iterate over object keys
                for (k in o)
                    // fill result array with non-prototypical keys
                    r.hasOwnProperty.call(o, k) && r.push(k);
                // return result
                return r;
            };
        }

        // set data-selected on select element if the value has been programmatically selected
        // prior to initialization of bootstrap-select
        // * consider removing or replacing an alternative method *
        var valHooks = {
            useDefault: false,
            _set: $.valHooks.select.set
        };

        $.valHooks.select.set = function(elem, value) {
            if (value && !valHooks.useDefault) $(elem).data('selected', true);

            return valHooks._set.apply(this, arguments);
        };

        var changed_arguments = null;
        $.fn.triggerNative = function (eventName) {
            var el = this[0],
                event;

            if (el.dispatchEvent) { // for modern browsers & IE9+
                if (typeof Event === 'function') {
                    // For modern browsers
                    event = new Event(eventName, {
                        bubbles: true
                    });
                } else {
                    // For IE since it doesn't support Event constructor
                    event = document.createEvent('Event');
                    event.initEvent(eventName, true, false);
                }

                el.dispatchEvent(event);
            } else if (el.fireEvent) { // for IE8
                event = document.createEventObject();
                event.eventType = eventName;
                el.fireEvent('on' + eventName, event);
            } else {
                // fall back to jQuery.trigger
                this.trigger(eventName);
            }
        };
        //</editor-fold>

        // Case insensitive contains search
        $.expr.pseudos.icontains = function (obj, index, meta) {
            var $obj = $(obj);
            var haystack = ($obj.data('tokens') || $obj.text()).toString().toUpperCase();
            return haystack.includes(meta[3].toUpperCase());
        };

        // Case insensitive begins search
        $.expr.pseudos.ibegins = function (obj, index, meta) {
            var $obj = $(obj);
            var haystack = ($obj.data('tokens') || $obj.text()).toString().toUpperCase();
            return haystack.startsWith(meta[3].toUpperCase());
        };

        // Case and accent insensitive contains search
        $.expr.pseudos.aicontains = function (obj, index, meta) {
            var $obj = $(obj);
            var haystack = ($obj.data('tokens') || $obj.data('normalizedText') || $obj.text()).toString().toUpperCase();
            return haystack.includes(meta[3].toUpperCase());
        };

        // Case and accent insensitive begins search
        $.expr.pseudos.aibegins = function (obj, index, meta) {
            var $obj = $(obj);
            var haystack = ($obj.data('tokens') || $obj.data('normalizedText') || $obj.text()).toString().toUpperCase();
            return haystack.startsWith(meta[3].toUpperCase());
        };

        /**
         * Remove all diatrics from the given text.
         * @access private
         * @param {String} text
         * @returns {String}
         */
        function normalizeToBase(text) {
            var rExps = [
                {re: /[\xC0-\xC6]/g, ch: "A"},
                {re: /[\xE0-\xE6]/g, ch: "a"},
                {re: /[\xC8-\xCB]/g, ch: "E"},
                {re: /[\xE8-\xEB]/g, ch: "e"},
                {re: /[\xCC-\xCF]/g, ch: "I"},
                {re: /[\xEC-\xEF]/g, ch: "i"},
                {re: /[\xD2-\xD6]/g, ch: "O"},
                {re: /[\xF2-\xF6]/g, ch: "o"},
                {re: /[\xD9-\xDC]/g, ch: "U"},
                {re: /[\xF9-\xFC]/g, ch: "u"},
                {re: /[\xC7-\xE7]/g, ch: "c"},
                {re: /[\xD1]/g, ch: "N"},
                {re: /[\xF1]/g, ch: "n"}
            ];
            $.each(rExps, function () {
                text = text ? text.replace(this.re, this.ch) : '';
            });
            return text;
        }


        // List of HTML entities for escaping.
        var escapeMap = {
            '&': '&amp;',
            '<': '&lt;',
            '>': '&gt;',
            '"': '&quot;',
            "'": '&#x27;',
            '`': '&#x60;'
        };

        var unescapeMap = {
            '&amp;': '&',
            '&lt;': '<',
            '&gt;': '>',
            '&quot;': '"',
            '&#x27;': "'",
            '&#x60;': '`'
        };

        // Functions for escaping and unescaping strings to/from HTML interpolation.
        var createEscaper = function(map) {
            var escaper = function(match) {
                return map[match];
            };
            // Regexes for identifying a key that needs to be escaped.
            var source = '(?:' + Object.keys(map).join('|') + ')';
            var testRegexp = RegExp(source);
            var replaceRegexp = RegExp(source, 'g');
            return function(string) {
                string = string == null ? '' : '' + string;
                return testRegexp.test(string) ? string.replace(replaceRegexp, escaper) : string;
            };
        };

        var htmlEscape = createEscaper(escapeMap);
        var htmlUnescape = createEscaper(unescapeMap);

        var Selectpicker = function (element, options) {
            // bootstrap-select has been initialized - revert valHooks.select.set back to its original function
            if (!valHooks.useDefault) {
                $.valHooks.select.set = valHooks._set;
                valHooks.useDefault = true;
            }

            this.$element = $(element);
            this.$newElement = null;
            this.$button = null;
            this.$menu = null;
            this.$lis = null;
            this.options = options;

            // If we have no title yet, try to pull it from the html title attribute (jQuery doesnt' pick it up as it's not a
            // data-attribute)
            if (this.options.title === null) {
                this.options.title = this.$element.attr('title');
            }

            // Format window padding
            var winPad = this.options.windowPadding;
            if (typeof winPad === 'number') {
                this.options.windowPadding = [winPad, winPad, winPad, winPad];
            }

            //Expose public methods
            this.val = Selectpicker.prototype.val;
            this.render = Selectpicker.prototype.render;
            this.refresh = Selectpicker.prototype.refresh;
            this.setStyle = Selectpicker.prototype.setStyle;
            this.selectAll = Selectpicker.prototype.selectAll;
            this.deselectAll = Selectpicker.prototype.deselectAll;
            this.destroy = Selectpicker.prototype.destroy;
            this.remove = Selectpicker.prototype.remove;
            this.show = Selectpicker.prototype.show;
            this.hide = Selectpicker.prototype.hide;

            this.init();
        };

        Selectpicker.VERSION = '1.12.2';

        // part of this is duplicated in i18n/defaults-en_US.js. Make sure to update both.
        Selectpicker.DEFAULTS = {
            noneSelectedText: 'Nothing selected',
            noneResultsText: 'No results matched {0}',
            countSelectedText: function (numSelected, numTotal) {
                return (numSelected == 1) ? "{0} item selected" : "{0} items selected";
            },
            maxOptionsText: function (numAll, numGroup) {
                return [
                    (numAll == 1) ? 'Limit reached ({n} item max)' : 'Limit reached ({n} items max)',
                    (numGroup == 1) ? 'Group limit reached ({n} item max)' : 'Group limit reached ({n} items max)'
                ];
            },
            selectAllText: 'Select All',
            deselectAllText: 'Deselect All',
            doneButton: false,
            doneButtonText: 'Close',
            multipleSeparator: ', ',
            styleBase: 'btn',
            style: 'btn-default',
            size: 'auto',
            title: null,
            selectedTextFormat: 'values',
            width: false,
            container: false,
            hideDisabled: false,
            showSubtext: false,
            showIcon: true,
            showContent: true,
            dropupAuto: true,
            header: false,
            liveSearch: false,
            liveSearchPlaceholder: null,
            liveSearchNormalize: false,
            liveSearchStyle: 'contains',
            actionsBox: false,
            iconBase: 'glyphicon',
            tickIcon: 'glyphicon-ok',
            showTick: false,
            template: {
                caret: '<span class="caret"></span>'
            },
            maxOptions: false,
            mobile: false,
            selectOnTab: false,
            dropdownAlignRight: false,
            windowPadding: 0
        };

        Selectpicker.prototype = {

            constructor: Selectpicker,

            init: function () {
                var that = this,
                    id = this.$element.attr('id');

                this.$element.addClass('bs-select-hidden');

                // store originalIndex (key) and newIndex (value) in this.liObj for fast accessibility
                // allows us to do this.$lis.eq(that.liObj[index]) instead of this.$lis.filter('[data-original-index="' + index + '"]')
                this.liObj = {};
                this.multiple = this.$element.prop('multiple');
                this.autofocus = this.$element.prop('autofocus');
                this.$newElement = this.createView();
                this.$element
                    .after(this.$newElement)
                    .appendTo(this.$newElement);
                this.$button = this.$newElement.children('button');
                this.$menu = this.$newElement.children('.dropdown-menu');
                this.$menuInner = this.$menu.children('.inner');
                this.$searchbox = this.$menu.find('input');

                this.$element.removeClass('bs-select-hidden');

                if (this.options.dropdownAlignRight === true) this.$menu.addClass('dropdown-menu-right');

                if (typeof id !== 'undefined') {
                    this.$button.attr('data-id', id);
                    $('label[for="' + id + '"]').click(function (e) {
                        e.preventDefault();
                        that.$button.focus();
                    });
                }

                this.checkDisabled();
                this.clickListener();
                if (this.options.liveSearch) this.liveSearchListener();
                this.render();
                this.setStyle();
                this.setWidth();
                if (this.options.container) this.selectPosition();
                this.$menu.data('this', this);
                this.$newElement.data('this', this);
                if (this.options.mobile) this.mobile();

                this.$newElement.on({
                    'hide.bs.dropdown': function (e) {
                        that.$menuInner.attr('aria-expanded', false);
                        that.$element.trigger('hide.bs.select', e);
                    },
                    'hidden.bs.dropdown': function (e) {
                        that.$element.trigger('hidden.bs.select', e);
                    },
                    'show.bs.dropdown': function (e) {
                        that.$menuInner.attr('aria-expanded', true);
                        that.$element.trigger('show.bs.select', e);
                    },
                    'shown.bs.dropdown': function (e) {
                        that.$element.trigger('shown.bs.select', e);
                    }
                });

                if (that.$element[0].hasAttribute('required')) {
                    this.$element.on('invalid', function () {
                        that.$button
                            .addClass('bs-invalid')
                            .focus();

                        that.$element.on({
                            'focus.bs.select': function () {
                                that.$button.focus();
                                that.$element.off('focus.bs.select');
                            },
                            'shown.bs.select': function () {
                                that.$element
                                    .val(that.$element.val()) // set the value to hide the validation message in Chrome when menu is opened
                                    .off('shown.bs.select');
                            },
                            'rendered.bs.select': function () {
                                // if select is no longer invalid, remove the bs-invalid class
                                if (this.validity.valid) that.$button.removeClass('bs-invalid');
                                that.$element.off('rendered.bs.select');
                            }
                        });
                    });
                }

                setTimeout(function () {
                    that.$element.trigger('loaded.bs.select');
                });
            },

            createDropdown: function () {
                // Options
                // If we are multiple or showTick option is set, then add the show-tick class
                var showTick = (this.multiple || this.options.showTick) ? ' show-tick' : '',
                    inputGroup = this.$element.parent().hasClass('input-group') ? ' input-group-btn' : '',
                    autofocus = this.autofocus ? ' autofocus' : '';
                // Elements
                var header = this.options.header ? '<div class="popover-title"><button type="button" class="close" aria-hidden="true">&times;</button>' + this.options.header + '</div>' : '';
                var searchbox = this.options.liveSearch ?
                '<div class="bs-searchbox">' +
                '<input type="text" class="form-control" autocomplete="off"' +
                (null === this.options.liveSearchPlaceholder ? '' : ' placeholder="' + htmlEscape(this.options.liveSearchPlaceholder) + '"') + ' role="textbox" aria-label="Search">' +
                '</div>'
                    : '';
                var actionsbox = this.multiple && this.options.actionsBox ?
                '<div class="bs-actionsbox">' +
                '<div class="btn-group btn-group-sm btn-block">' +
                '<button type="button" class="actions-btn bs-select-all btn btn-default">' +
                this.options.selectAllText +
                '</button>' +
                '<button type="button" class="actions-btn bs-deselect-all btn btn-default">' +
                this.options.deselectAllText +
                '</button>' +
                '</div>' +
                '</div>'
                    : '';
                var donebutton = this.multiple && this.options.doneButton ?
                '<div class="bs-donebutton">' +
                '<div class="btn-group btn-block">' +
                '<button type="button" class="btn btn-sm btn-default">' +
                this.options.doneButtonText +
                '</button>' +
                '</div>' +
                '</div>'
                    : '';
                var drop =
                    '<div class="btn-group bootstrap-select' + showTick + inputGroup + '">' +
                    '<button type="button" class="' + this.options.styleBase + ' dropdown-toggle" data-toggle="dropdown"' + autofocus + ' role="button">' +
                    '<span class="filter-option pull-left"></span>&nbsp;' +
                    '<span class="bs-caret">' +
                    this.options.template.caret +
                    '</span>' +
                    '</button>' +
                    '<div class="dropdown-menu open" role="combobox">' +
                    header +
                    searchbox +
                    actionsbox +
                    '<ul class="dropdown-menu inner" role="listbox" aria-expanded="false">' +
                    '</ul>' +
                    donebutton +
                    '</div>' +
                    '</div>';

                return $(drop);
            },

            createView: function () {
                var $drop = this.createDropdown(),
                    li = this.createLi();

                $drop.find('ul')[0].innerHTML = li;
                return $drop;
            },

            reloadLi: function () {
                // rebuild
                var li = this.createLi();
                this.$menuInner[0].innerHTML = li;
            },

            createLi: function () {
                var that = this,
                    _li = [],
                    optID = 0,
                    titleOption = document.createElement('option'),
                    liIndex = -1; // increment liIndex whenever a new <li> element is created to ensure liObj is correct

                // Helper functions
                /**
                 * @param content
                 * @param [index]
                 * @param [classes]
                 * @param [optgroup]
                 * @returns {string}
                 */
                var generateLI = function (content, index, classes, optgroup) {
                    return '<li' +
                        ((typeof classes !== 'undefined' & '' !== classes) ? ' class="' + classes + '"' : '') +
                        ((typeof index !== 'undefined' & null !== index) ? ' data-original-index="' + index + '"' : '') +
                        ((typeof optgroup !== 'undefined' & null !== optgroup) ? 'data-optgroup="' + optgroup + '"' : '') +
                        '>' + content + '</li>';
                };

                /**
                 * @param text
                 * @param [classes]
                 * @param [inline]
                 * @param [tokens]
                 * @returns {string}
                 */
                var generateA = function (text, classes, inline, tokens) {
                    return '<a tabindex="0"' +
                        (typeof classes !== 'undefined' ? ' class="' + classes + '"' : '') +
                        (inline ? ' style="' + inline + '"' : '') +
                        (that.options.liveSearchNormalize ? ' data-normalized-text="' + normalizeToBase(htmlEscape($(text).html())) + '"' : '') +
                        (typeof tokens !== 'undefined' || tokens !== null ? ' data-tokens="' + tokens + '"' : '') +
                        ' role="option">' + text +
                        '<span class="' + that.options.iconBase + ' ' + that.options.tickIcon + ' check-mark"></span>' +
                        '</a>';
                };

                if (this.options.title && !this.multiple) {
                    // this option doesn't create a new <li> element, but does add a new option, so liIndex is decreased
                    // since liObj is recalculated on every refresh, liIndex needs to be decreased even if the titleOption is already appended
                    liIndex--;

                    if (!this.$element.find('.bs-title-option').length) {
                        // Use native JS to prepend option (faster)
                        var element = this.$element[0];
                        titleOption.className = 'bs-title-option';
                        titleOption.innerHTML = this.options.title;
                        titleOption.value = '';
                        element.insertBefore(titleOption, element.firstChild);
                        // Check if selected or data-selected attribute is already set on an option. If not, select the titleOption option.
                        // the selected item may have been changed by user or programmatically before the bootstrap select plugin runs,
                        // if so, the select will have the data-selected attribute
                        var $opt = $(element.options[element.selectedIndex]);
                        if ($opt.attr('selected') === undefined && this.$element.data('selected') === undefined) {
                            titleOption.selected = true;
                        }
                    }
                }

                this.$element.find('option').each(function (index) {
                    var $this = $(this);

                    liIndex++;

                    if ($this.hasClass('bs-title-option')) return;

                    // Get the class and text for the option
                    var optionClass = this.className || '',
                        inline = this.style.cssText,
                        text = $this.data('content') ? $this.data('content') : $this.html(),
                        tokens = $this.data('tokens') ? $this.data('tokens') : null,
                        subtext = typeof $this.data('subtext') !== 'undefined' ? '<small class="text-muted">' + $this.data('subtext') + '</small>' : '',
                        icon = typeof $this.data('icon') !== 'undefined' ? '<span class="' + that.options.iconBase + ' ' + $this.data('icon') + '"></span> ' : '',
                        $parent = $this.parent(),
                        isOptgroup = $parent[0].tagName === 'OPTGROUP',
                        isOptgroupDisabled = isOptgroup && $parent[0].disabled,
                        isDisabled = this.disabled || isOptgroupDisabled;

                    if (icon !== '' && isDisabled) {
                        icon = '<span>' + icon + '</span>';
                    }

                    if (that.options.hideDisabled && (isDisabled && !isOptgroup || isOptgroupDisabled)) {
                        liIndex--;
                        return;
                    }

                    if (!$this.data('content')) {
                        // Prepend any icon and append any subtext to the main text.
                        text = icon + '<span class="text">' + text + subtext + '</span>';
                    }

                    if (isOptgroup && $this.data('divider') !== true) {
                        if (that.options.hideDisabled && isDisabled) {
                            if ($parent.data('allOptionsDisabled') === undefined) {
                                var $options = $parent.children();
                                $parent.data('allOptionsDisabled', $options.filter(':disabled').length === $options.length);
                            }

                            if ($parent.data('allOptionsDisabled')) {
                                liIndex--;
                                return;
                            }
                        }

                        var optGroupClass = ' ' + $parent[0].className || '';

                        if ($this.index() === 0) { // Is it the first option of the optgroup?
                            optID += 1;

                            // Get the opt group label
                            var label = $parent[0].label,
                                labelSubtext = typeof $parent.data('subtext') !== 'undefined' ? '<small class="text-muted">' + $parent.data('subtext') + '</small>' : '',
                                labelIcon = $parent.data('icon') ? '<span class="' + that.options.iconBase + ' ' + $parent.data('icon') + '"></span> ' : '';

                            label = labelIcon + '<span class="text">' + htmlEscape(label) + labelSubtext + '</span>';

                            if (index !== 0 && _li.length > 0) { // Is it NOT the first option of the select && are there elements in the dropdown?
                                liIndex++;
                                _li.push(generateLI('', null, 'divider', optID + 'div'));
                            }
                            liIndex++;
                            _li.push(generateLI(label, null, 'dropdown-header' + optGroupClass, optID));
                        }

                        if (that.options.hideDisabled && isDisabled) {
                            liIndex--;
                            return;
                        }

                        _li.push(generateLI(generateA(text, 'opt ' + optionClass + optGroupClass, inline, tokens), index, '', optID));
                    } else if ($this.data('divider') === true) {
                        _li.push(generateLI('', index, 'divider'));
                    } else if ($this.data('hidden') === true) {
                        _li.push(generateLI(generateA(text, optionClass, inline, tokens), index, 'hidden is-hidden'));
                    } else {
                        var showDivider = this.previousElementSibling && this.previousElementSibling.tagName === 'OPTGROUP';

                        // if previous element is not an optgroup and hideDisabled is true
                        if (!showDivider && that.options.hideDisabled) {
                            // get previous elements
                            var $prev = $(this).prevAll();

                            for (var i = 0; i < $prev.length; i++) {
                                // find the first element in the previous elements that is an optgroup
                                if ($prev[i].tagName === 'OPTGROUP') {
                                    var optGroupDistance = 0;

                                    // loop through the options in between the current option and the optgroup
                                    // and check if they are hidden or disabled
                                    for (var d = 0; d < i; d++) {
                                        var prevOption = $prev[d];
                                        if (prevOption.disabled || $(prevOption).data('hidden') === true) optGroupDistance++;
                                    }

                                    // if all of the options between the current option and the optgroup are hidden or disabled, show the divider
                                    if (optGroupDistance === i) showDivider = true;

                                    break;
                                }
                            }
                        }

                        if (showDivider) {
                            liIndex++;
                            _li.push(generateLI('', null, 'divider', optID + 'div'));
                        }
                        _li.push(generateLI(generateA(text, optionClass, inline, tokens), index));
                    }

                    that.liObj[index] = liIndex;
                });

                //If we are not multiple, we don't have a selected item, and we don't have a title, select the first element so something is set in the button
                if (!this.multiple && this.$element.find('option:selected').length === 0 && !this.options.title) {
                    this.$element.find('option').eq(0).prop('selected', true).attr('selected', 'selected');
                }

                return _li.join('');
            },

            findLis: function () {
                if (this.$lis == null) this.$lis = this.$menu.find('li');
                return this.$lis;
            },

            /**
             * @param [updateLi] defaults to true
             */
            render: function (updateLi) {
                var that = this,
                    notDisabled;

                //Update the LI to match the SELECT
                if (updateLi !== false) {
                    this.$element.find('option').each(function (index) {
                        var $lis = that.findLis().eq(that.liObj[index]);

                        that.setDisabled(index, this.disabled || this.parentNode.tagName === 'OPTGROUP' && this.parentNode.disabled, $lis);
                        that.setSelected(index, this.selected, $lis);
                    });
                }

                this.togglePlaceholder();

                this.tabIndex();

                var selectedItems = this.$element.find('option').map(function () {
                    if (this.selected) {
                        if (that.options.hideDisabled && (this.disabled || this.parentNode.tagName === 'OPTGROUP' && this.parentNode.disabled)) return;

                        var $this = $(this),
                            icon = $this.data('icon') && that.options.showIcon ? '<i class="' + that.options.iconBase + ' ' + $this.data('icon') + '"></i> ' : '',
                            subtext;

                        if (that.options.showSubtext && $this.data('subtext') && !that.multiple) {
                            subtext = ' <small class="text-muted">' + $this.data('subtext') + '</small>';
                        } else {
                            subtext = '';
                        }
                        if (typeof $this.attr('title') !== 'undefined') {
                            return $this.attr('title');
                        } else if ($this.data('content') && that.options.showContent) {
                            return $this.data('content').toString();
                        } else {
                            return icon + $this.html() + subtext;
                        }
                    }
                }).toArray();

                //Fixes issue in IE10 occurring when no default option is selected and at least one option is disabled
                //Convert all the values into a comma delimited string
                var title = !this.multiple ? selectedItems[0] : selectedItems.join(this.options.multipleSeparator);

                //If this is multi select, and the selectText type is count, the show 1 of 2 selected etc..
                if (this.multiple && this.options.selectedTextFormat.indexOf('count') > -1) {
                    var max = this.options.selectedTextFormat.split('>');
                    if ((max.length > 1 && selectedItems.length > max[1]) || (max.length == 1 && selectedItems.length >= 2)) {
                        notDisabled = this.options.hideDisabled ? ', [disabled]' : '';
                        var totalCount = this.$element.find('option').not('[data-divider="true"], [data-hidden="true"]' + notDisabled).length,
                            tr8nText = (typeof this.options.countSelectedText === 'function') ? this.options.countSelectedText(selectedItems.length, totalCount) : this.options.countSelectedText;
                        title = tr8nText.replace('{0}', selectedItems.length.toString()).replace('{1}', totalCount.toString());
                    }
                }

                if (this.options.title == undefined) {
                    this.options.title = this.$element.attr('title');
                }

                if (this.options.selectedTextFormat == 'static') {
                    title = this.options.title;
                }

                //If we dont have a title, then use the default, or if nothing is set at all, use the not selected text
                if (!title) {
                    title = typeof this.options.title !== 'undefined' ? this.options.title : this.options.noneSelectedText;
                }

                //strip all HTML tags and trim the result, then unescape any escaped tags
                this.$button.attr('title', htmlUnescape($.trim(title.replace(/<[^>]*>?/g, ''))));
                this.$button.children('.filter-option').html(title);

                this.$element.trigger('rendered.bs.select');
            },

            /**
             * @param [style]
             * @param [status]
             */
            setStyle: function (style, status) {
                if (this.$element.attr('class')) {
                    this.$newElement.addClass(this.$element.attr('class').replace(/selectpicker|mobile-device|bs-select-hidden|validate\[.*\]/gi, ''));
                }

                var buttonClass = style ? style : this.options.style;

                if (status == 'add') {
                    this.$button.addClass(buttonClass);
                } else if (status == 'remove') {
                    this.$button.removeClass(buttonClass);
                } else {
                    this.$button.removeClass(this.options.style);
                    this.$button.addClass(buttonClass);
                }
            },

            liHeight: function (refresh) {
                if (!refresh && (this.options.size === false || this.sizeInfo)) return;

                var newElement = document.createElement('div'),
                    menu = document.createElement('div'),
                    menuInner = document.createElement('ul'),
                    divider = document.createElement('li'),
                    li = document.createElement('li'),
                    a = document.createElement('a'),
                    text = document.createElement('span'),
                    header = this.options.header && this.$menu.find('.popover-title').length > 0 ? this.$menu.find('.popover-title')[0].cloneNode(true) : null,
                    search = this.options.liveSearch ? document.createElement('div') : null,
                    actions = this.options.actionsBox && this.multiple && this.$menu.find('.bs-actionsbox').length > 0 ? this.$menu.find('.bs-actionsbox')[0].cloneNode(true) : null,
                    doneButton = this.options.doneButton && this.multiple && this.$menu.find('.bs-donebutton').length > 0 ? this.$menu.find('.bs-donebutton')[0].cloneNode(true) : null;

                text.className = 'text';
                newElement.className = this.$menu[0].parentNode.className + ' open';
                menu.className = 'dropdown-menu open';
                menuInner.className = 'dropdown-menu inner';
                divider.className = 'divider';

                text.appendChild(document.createTextNode('Inner text'));
                a.appendChild(text);
                li.appendChild(a);
                menuInner.appendChild(li);
                menuInner.appendChild(divider);
                if (header) menu.appendChild(header);
                if (search) {
                    var input = document.createElement('input');
                    search.className = 'bs-searchbox';
                    input.className = 'form-control';
                    search.appendChild(input);
                    menu.appendChild(search);
                }
                if (actions) menu.appendChild(actions);
                menu.appendChild(menuInner);
                if (doneButton) menu.appendChild(doneButton);
                newElement.appendChild(menu);

                document.body.appendChild(newElement);

                var liHeight = a.offsetHeight,
                    headerHeight = header ? header.offsetHeight : 0,
                    searchHeight = search ? search.offsetHeight : 0,
                    actionsHeight = actions ? actions.offsetHeight : 0,
                    doneButtonHeight = doneButton ? doneButton.offsetHeight : 0,
                    dividerHeight = $(divider).outerHeight(true),
                    // fall back to jQuery if getComputedStyle is not supported
                    menuStyle = typeof getComputedStyle === 'function' ? getComputedStyle(menu) : false,
                    $menu = menuStyle ? null : $(menu),
                    menuPadding = {
                        vert: parseInt(menuStyle ? menuStyle.paddingTop : $menu.css('paddingTop')) +
                        parseInt(menuStyle ? menuStyle.paddingBottom : $menu.css('paddingBottom')) +
                        parseInt(menuStyle ? menuStyle.borderTopWidth : $menu.css('borderTopWidth')) +
                        parseInt(menuStyle ? menuStyle.borderBottomWidth : $menu.css('borderBottomWidth')),
                        horiz: parseInt(menuStyle ? menuStyle.paddingLeft : $menu.css('paddingLeft')) +
                        parseInt(menuStyle ? menuStyle.paddingRight : $menu.css('paddingRight')) +
                        parseInt(menuStyle ? menuStyle.borderLeftWidth : $menu.css('borderLeftWidth')) +
                        parseInt(menuStyle ? menuStyle.borderRightWidth : $menu.css('borderRightWidth'))
                    },
                    menuExtras =  {
                        vert: menuPadding.vert +
                        parseInt(menuStyle ? menuStyle.marginTop : $menu.css('marginTop')) +
                        parseInt(menuStyle ? menuStyle.marginBottom : $menu.css('marginBottom')) + 2,
                        horiz: menuPadding.horiz +
                        parseInt(menuStyle ? menuStyle.marginLeft : $menu.css('marginLeft')) +
                        parseInt(menuStyle ? menuStyle.marginRight : $menu.css('marginRight')) + 2
                    }



                document.body.removeChild(newElement);
                this.sizeInfo = {
                    liHeight: liHeight,
                    headerHeight: headerHeight,
                    searchHeight: searchHeight,
                    actionsHeight: actionsHeight,
                    doneButtonHeight: doneButtonHeight,
                    dividerHeight: dividerHeight,
                    menuPadding: menuPadding,
                    menuExtras: menuExtras
                };
            },

            setSize: function () {
                this.findLis();
                this.liHeight();

                if (this.options.header) this.$menu.css('padding-top', 0);
                if (this.options.size === false) return;

                var that = this,
                    $menu = this.$menu,
                    $menuInner = this.$menuInner,
                    $window = $(window),
                    selectHeight = this.$newElement[0].offsetHeight,
                    selectWidth = this.$newElement[0].offsetWidth,
                    liHeight = this.sizeInfo['liHeight'],
                    headerHeight = this.sizeInfo['headerHeight'],
                    searchHeight = this.sizeInfo['searchHeight'],
                    actionsHeight = this.sizeInfo['actionsHeight'],
                    doneButtonHeight = this.sizeInfo['doneButtonHeight'],
                    divHeight = this.sizeInfo['dividerHeight'],
                    menuPadding = this.sizeInfo['menuPadding'],
                    menuExtras = this.sizeInfo['menuExtras'],
                    notDisabled = this.options.hideDisabled ? '.disabled' : '',
                    menuHeight,
                    menuWidth,
                    getHeight,
                    getWidth,
                    selectOffsetTop,
                    selectOffsetBot,
                    selectOffsetLeft,
                    selectOffsetRight,
                    getPos = function() {
                        var pos = that.$newElement.offset(),
                            $container = $(that.options.container),
                            containerPos;

                        if (that.options.container && !$container.is('body')) {
                            containerPos = $container.offset();
                            containerPos.top += parseInt($container.css('borderTopWidth'));
                            containerPos.left += parseInt($container.css('borderLeftWidth'));
                        } else {
                            containerPos = { top: 0, left: 0 };
                        }

                        var winPad = that.options.windowPadding;
                        selectOffsetTop = pos.top - containerPos.top - $window.scrollTop();
                        selectOffsetBot = $window.height() - selectOffsetTop - selectHeight - containerPos.top - winPad[2];
                        selectOffsetLeft = pos.left - containerPos.left - $window.scrollLeft();
                        selectOffsetRight = $window.width() - selectOffsetLeft - selectWidth - containerPos.left - winPad[1];
                        selectOffsetTop -= winPad[0];
                        selectOffsetLeft -= winPad[3];
                    };

                getPos();

                if (this.options.size === 'auto') {
                    var getSize = function () {
                        var minHeight,
                            hasClass = function (className, include) {
                                return function (element) {
                                    if (include) {
                                        return (element.classList ? element.classList.contains(className) : $(element).hasClass(className));
                                    } else {
                                        // return !(element.classList ? element.classList.contains(className) : $(element).hasClass(className));
                                    }
                                };
                            },
                            lis = that.$menuInner[0].getElementsByTagName('li'),
                            lisVisible = Array.prototype.filter ? Array.prototype.filter.call(lis, hasClass('hidden', false)) : that.$lis.not('.hidden'),
                            optGroup = Array.prototype.filter ? Array.prototype.filter.call(lisVisible, hasClass('dropdown-header', true)) : lisVisible.filter('.dropdown-header');

                        getPos();
                        menuHeight = selectOffsetBot - menuExtras.vert;
                        menuWidth = selectOffsetRight - menuExtras.horiz;

                        if (that.options.container) {
                            if (!$menu.data('height')) $menu.data('height', $menu.height());
                            getHeight = $menu.data('height');

                            if (!$menu.data('width')) $menu.data('width', $menu.width());
                            getWidth = $menu.data('width');
                        } else {
                            getHeight = $menu.height();
                            getWidth = $menu.width();
                        }

                        if (that.options.dropupAuto) {
                            that.$newElement.toggleClass('dropup', selectOffsetTop > selectOffsetBot && (menuHeight - menuExtras.vert) < getHeight);
                        }

                        if (that.$newElement.hasClass('dropup')) {
                            menuHeight = selectOffsetTop - menuExtras.vert;
                        }

                        if (that.options.dropdownAlignRight === 'auto') {
                            $menu.toggleClass('dropdown-menu-right', selectOffsetLeft > selectOffsetRight && (menuWidth - menuExtras.horiz) < (getWidth - selectWidth));
                        }

                        if ((lisVisible.length + optGroup.length) > 3) {
                            minHeight = liHeight * 3 + menuExtras.vert - 2;
                        } else {
                            minHeight = 0;
                        }

                        $menu.css({
                            'max-height': menuHeight + 'px', //menuHeight-250 + 'px'
                            'overflow': 'hidden',
                            'min-height': minHeight + headerHeight + searchHeight + actionsHeight + doneButtonHeight + 'px'
                        });
                        var footerHeight = 0;
                        if($('.footer').length > 0 && $(window).width() > 980){
                            footerHeight = $('.footer').height();
                        }else{
                            footerHeight = $('.dv-com-f').height();
                        }



                        $menuInner.css({
                            'max-height': menuHeight - headerHeight - searchHeight - actionsHeight -footerHeight - doneButtonHeight - menuPadding.vert  + 'px',
                            'overflow-y': 'auto',
                            'min-height': Math.max(minHeight - menuPadding.vert, 0) + 'px'
                        });
                    };
                    getSize();
                    this.$searchbox.off('input.getSize propertychange.getSize').on('input.getSize propertychange.getSize', getSize);
                    $window.off('resize.getSize scroll.getSize').on('resize.getSize scroll.getSize', getSize);
                } else if (this.options.size && this.options.size != 'auto' && this.$lis.not(notDisabled).length > this.options.size) {
                    var optIndex = this.$lis.not('.divider').not(notDisabled).children().slice(0, this.options.size).last().parent().index(),
                        divLength = this.$lis.slice(0, optIndex + 1).filter('.divider').length;
                    menuHeight = liHeight * this.options.size + divLength * divHeight + menuPadding.vert;

                    if (that.options.container) {
                        if (!$menu.data('height')) $menu.data('height', $menu.height());
                        getHeight = $menu.data('height');
                    } else {
                        getHeight = $menu.height();
                    }

                    if (that.options.dropupAuto) {
                        //noinspection JSUnusedAssignment
                        this.$newElement.toggleClass('dropup', selectOffsetTop > selectOffsetBot && (menuHeight - menuExtras.vert) < getHeight);
                    }
                    $menu.css({
                        'max-height': menuHeight + headerHeight + searchHeight + actionsHeight + doneButtonHeight + 'px',
                        'overflow': 'hidden',
                        'min-height': ''
                    });
                    $menuInner.css({
                        'max-height': menuHeight - menuPadding.vert + 'px',
                        'overflow-y': 'auto',
                        'min-height': ''
                    });
                }
            },

            setWidth: function () {
                if (this.options.width === 'auto') {
                    this.$menu.css('min-width', '0');

                    // Get correct width if element is hidden
                    var $selectClone = this.$menu.parent().clone().appendTo('body'),
                        $selectClone2 = this.options.container ? this.$newElement.clone().appendTo('body') : $selectClone,
                        ulWidth = $selectClone.children('.dropdown-menu').outerWidth(),
                        btnWidth = $selectClone2.css('width', 'auto').children('button').outerWidth();

                    $selectClone.remove();
                    $selectClone2.remove();

                    // Set width to whatever's larger, button title or longest option
                    this.$newElement.css('width', Math.max(ulWidth, btnWidth) + 'px');
                } else if (this.options.width === 'fit') {
                    // Remove inline min-width so width can be changed from 'auto'
                    this.$menu.css('min-width', '');
                    this.$newElement.css('width', '').addClass('fit-width');
                } else if (this.options.width) {
                    // Remove inline min-width so width can be changed from 'auto'
                    this.$menu.css('min-width', '');
                    this.$newElement.css('width', this.options.width);
                } else {
                    // Remove inline min-width/width so width can be changed
                    this.$menu.css('min-width', '');
                    this.$newElement.css('width', '');
                }
                // Remove fit-width class if width is changed programmatically
                if (this.$newElement.hasClass('fit-width') && this.options.width !== 'fit') {
                    this.$newElement.removeClass('fit-width');
                }
            },

            selectPosition: function () {
                this.$bsContainer = $('<div class="bs-container" />');

                var that = this,
                    $container = $(this.options.container),
                    pos,
                    containerPos,
                    actualHeight,
                    getPlacement = function ($element) {
                        that.$bsContainer.addClass($element.attr('class').replace(/form-control|fit-width/gi, '')).toggleClass('dropup', $element.hasClass('dropup'));
                        pos = $element.offset();

                        if (!$container.is('body')) {
                            containerPos = $container.offset();
                            containerPos.top += parseInt($container.css('borderTopWidth')) - $container.scrollTop();
                            containerPos.left += parseInt($container.css('borderLeftWidth')) - $container.scrollLeft();
                        } else {
                            containerPos = { top: 0, left: 0 };
                        }

                        actualHeight = $element.hasClass('dropup') ? 0 : $element[0].offsetHeight;

                        that.$bsContainer.css({
                            'top': pos.top - containerPos.top + actualHeight,
                            'left': pos.left - containerPos.left,
                            'width': $element[0].offsetWidth
                        });
                    };

                this.$button.on('click', function () {
                    var $this = $(this);

                    if (that.isDisabled()) {
                        return;
                    }

                    getPlacement(that.$newElement);

                    that.$bsContainer
                        .appendTo(that.options.container)
                        .toggleClass('open', !$this.hasClass('open'))
                        .append(that.$menu);
                });

                $(window).on('resize scroll', function () {
                    getPlacement(that.$newElement);
                });

                this.$element.on('hide.bs.select', function () {
                    that.$menu.data('height', that.$menu.height());
                    that.$bsContainer.detach();
                });
            },

            /**
             * @param {number} index - the index of the option that is being changed
             * @param {boolean} selected - true if the option is being selected, false if being deselected
             * @param {JQuery} $lis - the 'li' element that is being modified
             */
            setSelected: function (index, selected, $lis) {
                if (!$lis) {
                    this.togglePlaceholder(); // check if setSelected is being called by changing the value of the select
                    $lis = this.findLis().eq(this.liObj[index]);
                }

                $lis.toggleClass('selected', selected).find('a').attr('aria-selected', selected);
            },

            /**
             * @param {number} index - the index of the option that is being disabled
             * @param {boolean} disabled - true if the option is being disabled, false if being enabled
             * @param {JQuery} $lis - the 'li' element that is being modified
             */
            setDisabled: function (index, disabled, $lis) {
                if (!$lis) {
                    $lis = this.findLis().eq(this.liObj[index]);
                }

                if (disabled) {
                    $lis.addClass('disabled').children('a').attr('href', '#').attr('tabindex', -1).attr('aria-disabled', true);
                } else {
                    $lis.removeClass('disabled').children('a').removeAttr('href').attr('tabindex', 0).attr('aria-disabled', false);
                }
            },

            isDisabled: function () {
                return this.$element[0].disabled;
            },

            checkDisabled: function () {
                var that = this;

                if (this.isDisabled()) {
                    this.$newElement.addClass('disabled');
                    this.$button.addClass('disabled').attr('tabindex', -1).attr('aria-disabled', true);
                } else {
                    if (this.$button.hasClass('disabled')) {
                        this.$newElement.removeClass('disabled');
                        this.$button.removeClass('disabled').attr('aria-disabled', false);
                    }

                    if (this.$button.attr('tabindex') == -1 && !this.$element.data('tabindex')) {
                        this.$button.removeAttr('tabindex');
                    }
                }

                this.$button.click(function () {
                    return !that.isDisabled();
                });
            },

            togglePlaceholder: function () {
                var value = this.$element.val();
                this.$button.toggleClass('bs-placeholder', value === null || value === '' || (value.constructor === Array && value.length === 0));
            },

            tabIndex: function () {
                if (this.$element.data('tabindex') !== this.$element.attr('tabindex') &&
                    (this.$element.attr('tabindex') !== -98 && this.$element.attr('tabindex') !== '-98')) {
                    this.$element.data('tabindex', this.$element.attr('tabindex'));
                    this.$button.attr('tabindex', this.$element.data('tabindex'));
                }

                this.$element.attr('tabindex', -98);
            },

            clickListener: function () {
                var that = this,
                    $document = $(document);

                $document.data('spaceSelect', false);

                this.$button.on('keyup', function (e) {
                    if (/(32)/.test(e.keyCode.toString(10)) && $document.data('spaceSelect')) {
                        e.preventDefault();
                        $document.data('spaceSelect', false);
                    }
                });

                this.$button.on('click', function () {
                    that.setSize();
                });

                this.$element.on('shown.bs.select', function () {
                    if (!that.options.liveSearch && !that.multiple) {
                        that.$menuInner.find('.selected a').focus();
                    } else if (!that.multiple) {
                        var selectedIndex = that.liObj[that.$element[0].selectedIndex];

                        if (typeof selectedIndex !== 'number' || that.options.size === false) return;

                        // scroll to selected option
                        var offset = that.$lis.eq(selectedIndex)[0].offsetTop - that.$menuInner[0].offsetTop;
                        offset = offset - that.$menuInner[0].offsetHeight/2 + that.sizeInfo.liHeight/2;
                        that.$menuInner[0].scrollTop = offset;
                    }
                });

                this.$menuInner.on('click', 'li a', function (e) {
                    var $this = $(this),
                        clickedIndex = $this.parent().data('originalIndex'),
                        prevValue = that.$element.val(),
                        prevIndex = that.$element.prop('selectedIndex'),
                        triggerChange = true;

                    // Don't close on multi choice menu
                    if (that.multiple && that.options.maxOptions !== 1) {
                        e.stopPropagation();
                    }

                    e.preventDefault();

                    //Don't run if we have been disabled
                    if (!that.isDisabled() && !$this.parent().hasClass('disabled')) {
                        var $options = that.$element.find('option'),
                            $option = $options.eq(clickedIndex),
                            state = $option.prop('selected'),
                            $optgroup = $option.parent('optgroup'),
                            maxOptions = that.options.maxOptions,
                            maxOptionsGrp = $optgroup.data('maxOptions') || false;

                        if (!that.multiple) { // Deselect all others if not multi select box
                            $options.prop('selected', false);
                            $option.prop('selected', true);
                            that.$menuInner.find('.selected').removeClass('selected').find('a').attr('aria-selected', false);
                            that.setSelected(clickedIndex, true);
                        } else { // Toggle the one we have chosen if we are multi select.
                            $option.prop('selected', !state);
                            that.setSelected(clickedIndex, !state);
                            $this.blur();

                            if (maxOptions !== false || maxOptionsGrp !== false) {
                                var maxReached = maxOptions < $options.filter(':selected').length,
                                    maxReachedGrp = maxOptionsGrp < $optgroup.find('option:selected').length;

                                if ((maxOptions && maxReached) || (maxOptionsGrp && maxReachedGrp)) {
                                    if (maxOptions && maxOptions == 1) {
                                        $options.prop('selected', false);
                                        $option.prop('selected', true);
                                        that.$menuInner.find('.selected').removeClass('selected');
                                        that.setSelected(clickedIndex, true);
                                    } else if (maxOptionsGrp && maxOptionsGrp == 1) {
                                        $optgroup.find('option:selected').prop('selected', false);
                                        $option.prop('selected', true);
                                        var optgroupID = $this.parent().data('optgroup');
                                        that.$menuInner.find('[data-optgroup="' + optgroupID + '"]').removeClass('selected');
                                        that.setSelected(clickedIndex, true);
                                    } else {
                                        var maxOptionsText = typeof that.options.maxOptionsText === 'string' ? [that.options.maxOptionsText, that.options.maxOptionsText] : that.options.maxOptionsText,
                                            maxOptionsArr = typeof maxOptionsText === 'function' ? maxOptionsText(maxOptions, maxOptionsGrp) : maxOptionsText,
                                            maxTxt = maxOptionsArr[0].replace('{n}', maxOptions),
                                            maxTxtGrp = maxOptionsArr[1].replace('{n}', maxOptionsGrp),
                                            $notify = $('<div class="notify"></div>');
                                        // If {var} is set in array, replace it
                                        /** @deprecated */
                                        if (maxOptionsArr[2]) {
                                            maxTxt = maxTxt.replace('{var}', maxOptionsArr[2][maxOptions > 1 ? 0 : 1]);
                                            maxTxtGrp = maxTxtGrp.replace('{var}', maxOptionsArr[2][maxOptionsGrp > 1 ? 0 : 1]);
                                        }

                                        $option.prop('selected', false);

                                        that.$menu.append($notify);

                                        if (maxOptions && maxReached) {
                                            $notify.append($('<div>' + maxTxt + '</div>'));
                                            triggerChange = false;
                                            that.$element.trigger('maxReached.bs.select');
                                        }

                                        if (maxOptionsGrp && maxReachedGrp) {
                                            $notify.append($('<div>' + maxTxtGrp + '</div>'));
                                            triggerChange = false;
                                            that.$element.trigger('maxReachedGrp.bs.select');
                                        }

                                        setTimeout(function () {
                                            that.setSelected(clickedIndex, false);
                                        }, 10);

                                        $notify.delay(750).fadeOut(300, function () {
                                            $(this).remove();
                                        });
                                    }
                                }
                            }
                        }

                        if (!that.multiple || (that.multiple && that.options.maxOptions === 1)) {
                            that.$button.focus();
                        } else if (that.options.liveSearch) {
                            that.$searchbox.focus();
                        }

                        // Trigger select 'change'
                        if (triggerChange) {
                            if ((prevValue != that.$element.val() && that.multiple) || (prevIndex != that.$element.prop('selectedIndex') && !that.multiple)) {
                                // $option.prop('selected') is current option state (selected/unselected). state is previous option state.
                                changed_arguments = [clickedIndex, $option.prop('selected'), state];
                                that.$element
                                    .triggerNative('change');
                            }
                        }
                    }
                });

                this.$menu.on('click', 'li.disabled a, .popover-title, .popover-title :not(.close)', function (e) {
                    if (e.currentTarget == this) {
                        e.preventDefault();
                        e.stopPropagation();
                        if (that.options.liveSearch && !$(e.target).hasClass('close')) {
                            that.$searchbox.focus();
                        } else {
                            that.$button.focus();
                        }
                    }
                });

                this.$menuInner.on('click', '.divider, .dropdown-header', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    if (that.options.liveSearch) {
                        that.$searchbox.focus();
                    } else {
                        that.$button.focus();
                    }
                });

                this.$menu.on('click', '.popover-title .close', function () {
                    that.$button.click();
                });

                this.$searchbox.on('click', function (e) {
                    e.stopPropagation();
                });

                this.$menu.on('click', '.actions-btn', function (e) {
                    if (that.options.liveSearch) {
                        that.$searchbox.focus();
                    } else {
                        that.$button.focus();
                    }

                    e.preventDefault();
                    e.stopPropagation();

                    if ($(this).hasClass('bs-select-all')) {
                        that.selectAll();
                    } else {
                        that.deselectAll();
                    }
                });

                this.$element.change(function () {
                    that.render(false);
                    that.$element.trigger('changed.bs.select', changed_arguments);
                    changed_arguments = null;
                });
            },

            liveSearchListener: function () {
                var that = this,
                    $no_results = $('<li class="no-results"></li>');

                this.$button.on('click.dropdown.data-api', function () {
                    that.$menuInner.find('.active').removeClass('active');
                    if (!!that.$searchbox.val()) {
                        that.$searchbox.val('');
                        that.$lis.not('.is-hidden').removeClass('hidden');
                        if (!!$no_results.parent().length) $no_results.remove();
                    }
                    if (!that.multiple) that.$menuInner.find('.selected').addClass('active');
                    setTimeout(function () {
                        that.$searchbox.focus();
                    }, 10);
                });

                this.$searchbox.on('click.dropdown.data-api focus.dropdown.data-api touchend.dropdown.data-api', function (e) {
                    e.stopPropagation();
                });

                this.$searchbox.on('input propertychange', function () {
                    that.$lis.not('.is-hidden').removeClass('hidden');
                    that.$lis.filter('.active').removeClass('active');
                    $no_results.remove();

                    if (that.$searchbox.val()) {
                        var $searchBase = that.$lis.not('.is-hidden, .divider, .dropdown-header'),
                            $hideItems;
                        if (that.options.liveSearchNormalize) {
                            $hideItems = $searchBase.find('a').not(':a' + that._searchStyle() + '("' + normalizeToBase(that.$searchbox.val()) + '")');
                        } else {
                            $hideItems = $searchBase.find('a').not(':' + that._searchStyle() + '("' + that.$searchbox.val() + '")');
                        }

                        if ($hideItems.length === $searchBase.length) {
                            $no_results.html(that.options.noneResultsText.replace('{0}', '"' + htmlEscape(that.$searchbox.val()) + '"'));
                            that.$menuInner.append($no_results);
                            that.$lis.addClass('hidden');
                        } else {
                            $hideItems.parent().addClass('hidden');

                            var $lisVisible = that.$lis.not('.hidden'),
                                $foundDiv;

                            // hide divider if first or last visible, or if followed by another divider
                            $lisVisible.each(function (index) {
                                var $this = $(this);

                                if ($this.hasClass('divider')) {
                                    if ($foundDiv === undefined) {
                                        $this.addClass('hidden');
                                    } else {
                                        if ($foundDiv) $foundDiv.addClass('hidden');
                                        $foundDiv = $this;
                                    }
                                } else if ($this.hasClass('dropdown-header') && $lisVisible.eq(index + 1).data('optgroup') !== $this.data('optgroup')) {
                                    $this.addClass('hidden');
                                } else {
                                    $foundDiv = null;
                                }
                            });
                            if ($foundDiv) $foundDiv.addClass('hidden');

                            $searchBase.not('.hidden').first().addClass('active');
                        }
                    }
                });
            },

            _searchStyle: function () {
                var styles = {
                    begins: 'ibegins',
                    startsWith: 'ibegins'
                };

                return styles[this.options.liveSearchStyle] || 'icontains';
            },

            val: function (value) {
                if (typeof value !== 'undefined') {
                    this.$element.val(value);
                    this.render();

                    return this.$element;
                } else {
                    return this.$element.val();
                }
            },

            changeAll: function (status) {
                if (!this.multiple) return;
                if (typeof status === 'undefined') status = true;

                this.findLis();

                var $options = this.$element.find('option'),
                    $lisVisible = this.$lis.not('.divider, .dropdown-header, .disabled, .hidden'),
                    lisVisLen = $lisVisible.length,
                    selectedOptions = [];

                if (status) {
                    if ($lisVisible.filter('.selected').length === $lisVisible.length) return;
                } else {
                    if ($lisVisible.filter('.selected').length === 0) return;
                }

                $lisVisible.toggleClass('selected', status);

                for (var i = 0; i < lisVisLen; i++) {
                    var origIndex = $lisVisible[i].getAttribute('data-original-index');
                    selectedOptions[selectedOptions.length] = $options.eq(origIndex)[0];
                }

                $(selectedOptions).prop('selected', status);

                this.render(false);

                this.togglePlaceholder();

                this.$element
                    .triggerNative('change');
            },

            selectAll: function () {
                return this.changeAll(true);
            },

            deselectAll: function () {
                return this.changeAll(false);
            },

            toggle: function (e) {
                e = e || window.event;

                if (e) e.stopPropagation();

                this.$button.trigger('click');
            },

            keydown: function (e) {
                var $this = $(this),
                    $parent = $this.is('input') ? $this.parent().parent() : $this.parent(),
                    $items,
                    that = $parent.data('this'),
                    index,
                    next,
                    first,
                    last,
                    prev,
                    nextPrev,
                    prevIndex,
                    isActive,
                    selector = ':not(.disabled, .hidden, .dropdown-header, .divider)',
                    keyCodeMap = {
                        32: ' ',
                        48: '0',
                        49: '1',
                        50: '2',
                        51: '3',
                        52: '4',
                        53: '5',
                        54: '6',
                        55: '7',
                        56: '8',
                        57: '9',
                        59: ';',
                        65: 'a',
                        66: 'b',
                        67: 'c',
                        68: 'd',
                        69: 'e',
                        70: 'f',
                        71: 'g',
                        72: 'h',
                        73: 'i',
                        74: 'j',
                        75: 'k',
                        76: 'l',
                        77: 'm',
                        78: 'n',
                        79: 'o',
                        80: 'p',
                        81: 'q',
                        82: 'r',
                        83: 's',
                        84: 't',
                        85: 'u',
                        86: 'v',
                        87: 'w',
                        88: 'x',
                        89: 'y',
                        90: 'z',
                        96: '0',
                        97: '1',
                        98: '2',
                        99: '3',
                        100: '4',
                        101: '5',
                        102: '6',
                        103: '7',
                        104: '8',
                        105: '9'
                    };

                if (that.options.liveSearch) $parent = $this.parent().parent();

                if (that.options.container) $parent = that.$menu;

                $items = $('[role="listbox"] li', $parent);

                isActive = that.$newElement.hasClass('open');

                if (!isActive && (e.keyCode >= 48 && e.keyCode <= 57 || e.keyCode >= 96 && e.keyCode <= 105 || e.keyCode >= 65 && e.keyCode <= 90)) {
                    if (!that.options.container) {
                        that.setSize();
                        that.$menu.parent().addClass('open');
                        isActive = true;
                    } else {
                        that.$button.trigger('click');
                    }
                    that.$searchbox.focus();
                    return;
                }

                if (that.options.liveSearch) {
                    if (/(^9$|27)/.test(e.keyCode.toString(10)) && isActive) {
                        e.preventDefault();
                        e.stopPropagation();
                        that.$menuInner.click();
                        that.$button.focus();
                    }
                    // $items contains li elements when liveSearch is enabled
                    $items = $('[role="listbox"] li' + selector, $parent);
                    if (!$this.val() && !/(38|40)/.test(e.keyCode.toString(10))) {
                        if ($items.filter('.active').length === 0) {
                            $items = that.$menuInner.find('li');
                            if (that.options.liveSearchNormalize) {
                                $items = $items.filter(':a' + that._searchStyle() + '(' + normalizeToBase(keyCodeMap[e.keyCode]) + ')');
                            } else {
                                $items = $items.filter(':' + that._searchStyle() + '(' + keyCodeMap[e.keyCode] + ')');
                            }
                        }
                    }
                }

                if (!$items.length) return;

                if (/(38|40)/.test(e.keyCode.toString(10))) {
                    index = $items.index($items.find('a').filter(':focus').parent());
                    first = $items.filter(selector).first().index();
                    last = $items.filter(selector).last().index();
                    next = $items.eq(index).nextAll(selector).eq(0).index();
                    prev = $items.eq(index).prevAll(selector).eq(0).index();
                    nextPrev = $items.eq(next).prevAll(selector).eq(0).index();

                    if (that.options.liveSearch) {
                        $items.each(function (i) {
                            if (!$(this).hasClass('disabled')) {
                                $(this).data('index', i);
                            }
                        });
                        index = $items.index($items.filter('.active'));
                        first = $items.first().data('index');
                        last = $items.last().data('index');
                        next = $items.eq(index).nextAll().eq(0).data('index');
                        prev = $items.eq(index).prevAll().eq(0).data('index');
                        nextPrev = $items.eq(next).prevAll().eq(0).data('index');
                    }

                    prevIndex = $this.data('prevIndex');

                    if (e.keyCode == 38) {
                        if (that.options.liveSearch) index--;
                        if (index != nextPrev && index > prev) index = prev;
                        if (index < first) index = first;
                        if (index == prevIndex) index = last;
                    } else if (e.keyCode == 40) {
                        if (that.options.liveSearch) index++;
                        if (index == -1) index = 0;
                        if (index != nextPrev && index < next) index = next;
                        if (index > last) index = last;
                        if (index == prevIndex) index = first;
                    }

                    $this.data('prevIndex', index);

                    if (!that.options.liveSearch) {
                        $items.eq(index).children('a').focus();
                    } else {
                        e.preventDefault();
                        if (!$this.hasClass('dropdown-toggle')) {
                            $items.removeClass('active').eq(index).addClass('active').children('a').focus();
                            $this.focus();
                        }
                    }

                } else if (!$this.is('input')) {
                    var keyIndex = [],
                        count,
                        prevKey;

                    $items.each(function () {
                        if (!$(this).hasClass('disabled')) {
                            if ($.trim($(this).children('a').text().toLowerCase()).substring(0, 1) == keyCodeMap[e.keyCode]) {
                                keyIndex.push($(this).index());
                            }
                        }
                    });

                    count = $(document).data('keycount');
                    count++;
                    $(document).data('keycount', count);

                    prevKey = $.trim($(':focus').text().toLowerCase()).substring(0, 1);

                    if (prevKey != keyCodeMap[e.keyCode]) {
                        count = 1;
                        $(document).data('keycount', count);
                    } else if (count >= keyIndex.length) {
                        $(document).data('keycount', 0);
                        if (count > keyIndex.length) count = 1;
                    }

                    $items.eq(keyIndex[count - 1]).children('a').focus();
                }

                // Select focused option if "Enter", "Spacebar" or "Tab" (when selectOnTab is true) are pressed inside the menu.
                if ((/(13|32)/.test(e.keyCode.toString(10)) || (/(^9$)/.test(e.keyCode.toString(10)) && that.options.selectOnTab)) && isActive) {
                    if (!/(32)/.test(e.keyCode.toString(10))) e.preventDefault();
                    if (!that.options.liveSearch) {
                        var elem = $(':focus');
                        elem.click();
                        // Bring back focus for multiselects
                        elem.focus();
                        // Prevent screen from scrolling if the user hit the spacebar
                        e.preventDefault();
                        // Fixes spacebar selection of dropdown items in FF & IE
                        $(document).data('spaceSelect', true);
                    } else if (!/(32)/.test(e.keyCode.toString(10))) {
                        that.$menuInner.find('.active a').click();
                        $this.focus();
                    }
                    $(document).data('keycount', 0);
                }

                if ((/(^9$|27)/.test(e.keyCode.toString(10)) && isActive && (that.multiple || that.options.liveSearch)) || (/(27)/.test(e.keyCode.toString(10)) && !isActive)) {
                    that.$menu.parent().removeClass('open');
                    if (that.options.container) that.$newElement.removeClass('open');
                    that.$button.focus();
                }
            },

            mobile: function () {
                this.$element.addClass('mobile-device');
            },

            refresh: function () {
                this.$lis = null;
                this.liObj = {};
                this.reloadLi();
                this.render();
                this.checkDisabled();
                this.liHeight(true);
                this.setStyle();
                this.setWidth();
                if (this.$lis) this.$searchbox.trigger('propertychange');

                this.$element.trigger('refreshed.bs.select');
            },

            hide: function () {
                this.$newElement.hide();
            },

            show: function () {
                this.$newElement.show();
            },

            remove: function () {
                this.$newElement.remove();
                this.$element.remove();
            },

            destroy: function () {
                this.$newElement.before(this.$element).remove();

                if (this.$bsContainer) {
                    this.$bsContainer.remove();
                } else {
                    this.$menu.remove();
                }

                this.$element
                    .off('.bs.select')
                    .removeData('selectpicker')
                    .removeClass('bs-select-hidden selectpicker');
            }
        };

        // SELECTPICKER PLUGIN DEFINITION
        // ==============================
        function Plugin(option) {
            // get the args of the outer function..
            var args = arguments;
            // The arguments of the function are explicitly re-defined from the argument list, because the shift causes them
            // to get lost/corrupted in android 2.3 and IE9 #715 #775
            var _option = option;

            [].shift.apply(args);

            var value;
            var chain = this.each(function () {
                var $this = $(this);
                if ($this.is('select')) {
                    var data = $this.data('selectpicker'),
                        options = typeof _option == 'object' && _option;

                    if (!data) {
                        var config = $.extend({}, Selectpicker.DEFAULTS, $.fn.selectpicker.defaults || {}, $this.data(), options);
                        config.template = $.extend({}, Selectpicker.DEFAULTS.template, ($.fn.selectpicker.defaults ? $.fn.selectpicker.defaults.template : {}), $this.data().template, options.template);
                        $this.data('selectpicker', (data = new Selectpicker(this, config)));
                    } else if (options) {
                        for (var i in options) {
                            if (options.hasOwnProperty(i)) {
                                data.options[i] = options[i];
                            }
                        }
                    }

                    if (typeof _option == 'string') {
                        if (data[_option] instanceof Function) {
                            value = data[_option].apply(data, args);
                        } else {
                            value = data.options[_option];
                        }
                    }
                }
            });

            if (typeof value !== 'undefined') {
                //noinspection JSUnusedAssignment
                return value;
            } else {
                return chain;
            }
        }

        var old = $.fn.selectpicker;
        $.fn.selectpicker = Plugin;
        $.fn.selectpicker.Constructor = Selectpicker;

        // SELECTPICKER NO CONFLICT
        // ========================
        $.fn.selectpicker.noConflict = function () {
            $.fn.selectpicker = old;
            return this;
        };

        $(document)
            .data('keycount', 0)
            .on('keydown.bs.select', '.bootstrap-select [data-toggle=dropdown], .bootstrap-select [role="listbox"], .bs-searchbox input', Selectpicker.prototype.keydown)
            .on('focusin.modal', '.bootstrap-select [data-toggle=dropdown], .bootstrap-select [role="listbox"], .bs-searchbox input', function (e) {
                e.stopPropagation();
            });

        // SELECTPICKER DATA-API
        // =====================
        $(window).on('load.bs.select.data-api', function () {
            $('.selectpicker').each(function () {
                var $selectpicker = $(this);
                Plugin.call($selectpicker, $selectpicker.data());
            })
        });
    })(jQuery);


}));
</script>
<script>
	$(document).ready(function() {
		
		setTimeout(function() {
			var w = $(".image").children().width();
			var h = $(".image").children().height();
			console.log(w);
			if(w >800){
				var ri = 800/w;
				w = w * ri;
				h = h * ri;
				console.log(ri);
			}
			var a_h = $(".board-view-cont").children().height();
			var a_w = $(".board-view-cont").children().width();
			
			console.log(w+" / "+h+" && "+ a_w+" / "+ a_h);
			$(".image").children().width(w);
			 $(".image").children().height(h);
			
		}, 50);
	});
</script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>