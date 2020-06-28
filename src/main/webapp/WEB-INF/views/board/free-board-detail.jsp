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
<link rel="stylesheet" href="/resources/css/mainfooter3.css">
<link rel="stylesheet" href="/resources/css/mainheader2.css">
<link rel="stylesheet" href="/resources/css/sidebar.css">
<link rel="stylesheet" href="/resources/css/popup.css">
</head>
<body>

<div class="wrap">
<%@include file="../mainheader.jsp" %> 
	<div class="all-dim"></div>
	<div class="containerNew">
		<div class="board-page">
			<div class="row">
				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu" style="position: relative;">
						<ul>	
							<li class="selected mid"><a href="/board/free"><span>자유게시판</span></a></li>
							<li class="mid"><a href="/board/portfolio"><span>포트폴리오</span></a></li>
							<li><a href="/news"><span>오늘의 뉴스</span></a></li>
						</ul>
					</div>
				</div>
	  <div class="col-md-10">
		<div class="free-board">
						<div class="drop-nav">
							<h1 class="tit-h1 line">자유게시판</h1>
						</div>
						<div class="m-drop-nav">
							<h1 class="m-drop-tit-title line" style="cursor: pointer;">자유게시판 <i class="fas fa-angle-down"></i></h1>
						</div>
						<div class="m-drop-down">
							<h1 class="m-drop-tit-body first line" style="cursor: pointer;">
								<a href="/board/free">자유게시판</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/board/portfolio">포트폴리오</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/news">오늘의 뉴스</a>
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
		tent" class="commentCentent byte-count e-login" disabled="disabled;" style="background: white;" data-byte-limit="1000" rows="2" cols="10" placeholder="댓글을 작성하시려면 로그인을 해주세요"></textarea>
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
		
		<div class="support-button">
			<c:if test="${loginUser != null}">
				<span class="insert"><a href="javascript:commentInsertConfirm('${boardDetail.pno }');" class="btn-s gray">등록</a></span>
			</c:if>
			<c:if test="${loginUser == null}">
				<span class="insert"><a onclick="insertNotLoginUser();" class="btn-s gray">등록</a></span>
			</c:if>
			<script>
				function insertNotLoginUser(){
					swal("로그인을 해주세요", "", "error")
				}
			</script>

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
            <c:if test="${loginUser != null}">
            <a href="/board/free" class="btn-s bodrb">목록</a>
			<a href="/board/free/write" class="btn-s fantasy">글쓰기</a>
			</c:if>
			<c:if test="${loginUser == null}">
			<a href="/board/free" class="btn-s bodrb">목록</a>
			</c:if>
		</span>
    	</p>
    	<div class="prev-next" id="prev-next">
	      
	    </div>
		</div>
		</div>
		</div>
		</div>
	</div>
	<%@include file="../mainfooter2.jsp" %>
</div>
<c:if test="${loginUser.point ge 0 }">
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
									<tr
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
											<option value="광고">광고</option>
											<option value="욕설">욕설</option>
											<option value="허위루머">허위루머</option>
											<option value="타종목추천">타종목추천</option>
											<option value="도배">도배</option>
											<option value="명예훼손">명예훼손</option>
											<option value="주제무관">주제무관</option>
											<option value="위조/변조">위조/변조</option>
											<option value="음란">음란</option>
											<option value="지역감정">지역감정</option>
											<option value="기타">기타</option>
										</select>
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
	</c:if>
<c:if test="${loginUser.point le -1 }">
	<script>
	window.onload = function(){showReport(${boardDetail.pno});}
	</script>
	<div id="reportPopup" class="pop-layer" style="display:none" >
		<div class="pop-inner">
			<div class="popup-wrap">
				<form id="reportBoard" action="" method="POST">
				<%-- <button type="button" onclick="showReport('${boardDetail.pno}');"></button> --%>
					<div class="pop-tit"><span>게시물 신고 내역</span></div>
					<div class="pop-cont">
						<div class="pop-clean" id="nonReport">
							<table>
								<colgroup><col style="width: 100px;"><col style=""></colgroup>
								<tbody id="reportSelectList">
								</tbody>
							</table>
						</div>
							<div class="pop-btn" id="pageLocation">
							</div>
					</div>
					<button type="button" onclick="hidePopup()" class="cla-close e-reportPopupClose">닫기</button>
				</form> 
			</div>
		</div>
	</div>
</c:if>
	
	<script>
        /** 신고 기능들 모음 Report */
    	 function showReport(pno){
     	$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}/admin/showReport',
				data : { "pno" : pno },
				success : function(data) {
						var reportSelectList = "";
						var pageLocation=""
						if(data === ('')){
							reportSelectList += '해당 게시물은 신고되지 않았습니다.'
							$("#nonReport").html(reportSelectList);
							pageLocation += '<button type="button"  onclick="hidePopup()" class="btn-m e-reportPopupClose">취소</button>'
							$("#pageLocation").html(pageLocation);
						}
						else if(data.reportSelectList.rno >= 1){
						reportSelectList += '<tr>'
						reportSelectList += 	'<th scope="col">처리현황</th>'
						reportSelectList += 	'<td id="re.rcheck">'+data.reportSelectList.rcheck+'</td>'
						reportSelectList += '</tr>'
						reportSelectList += '<tr>'
						reportSelectList += 	'<th scope="col">신고날짜</th>'
						reportSelectList += 	'<td>'+changeDate(data.reportSelectList.rdatetime)+'</td>'
						reportSelectList += '</tr>'
						reportSelectList += '<tr>'
						reportSelectList += 	'<th scope="col">신고사항</th>'
						reportSelectList += 	'<td>'+data.reportSelectList.rtype+'</td>'
						reportSelectList += '</tr>'
						reportSelectList += '<tr>'
						reportSelectList += 	'<th scope="col">작성자</th>'
						reportSelectList += 	'<td>'+data.reportSelectList.nickname+'</td>'
						reportSelectList += '</tr>'
						reportSelectList += '<tr>'
						reportSelectList += 	'<th scope="col">신고제목</th>'
						reportSelectList += 	'<td>'+data.reportSelectList.title+'</td>'
						reportSelectList += '</tr>'
	
						$("#reportSelectList").html(reportSelectList);
						var pageLocation=""
							if((data.reportSelectList.rcheck)===("처리대기중")){
								pageLocation += '<button type="button" class="btn-m" onclick="location.href=\'/admin/report/delete?pno='+data.reportSelectList.pno+'\'">게시물 삭제</button>'
							}
								pageLocation += '<button type="button"  onclick="hidePopup()" class="btn-m e-reportPopupClose">취소</button>'
								$("#pageLocation").html(pageLocation);
						}
						
					}
				});
			}
     
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



<script>

		
		$(function(){
	    	list()

	    })
	    
	    // 목록 뿌리기
	    
	    var like = "좋아요";
	    
	    function list(){
	    
	    
		var pno = ${boardDetail.pno}
		var page = "&bnowPage="+${commentPage.nowPage}
		
			/* console.log(page) */
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/board/free/detail/ajax?pno='+pno + page,
				dataType : 'json',
				contentType : "application/x-www-form-urlencoded;chartset=UTF-8",
				success : function(data){ 
					/* console.log(data) */
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
					board +=			'<span class="nickname" style="cursor:pointer;" onclick="#;"><a href="/selectUserBoard?nickname='+boardNickname+'">'+boardNickname+'</a></span>'
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
					
					// 공지사항은 신고 못하게 함
					if(data.boardDetail.bno != 3){
						board +=			'<button type="button" id="reportPopupBtn" class="btn-s notify clean-popup-button e-login"><span>신고</span></button>'
					}

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
								/* console.log("${loginUser.nickname}") */
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
						/* console.log(1) */
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
					/* console.log(data)
					console.log(error) */
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
	        hour = date.getHours() + 9;
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
<script src="/resources/js/selectpicker.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>