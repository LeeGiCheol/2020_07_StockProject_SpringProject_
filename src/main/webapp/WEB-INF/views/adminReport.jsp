 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Jekyll v4.0.1">
  <title>관리자페이지</title>




    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
   <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/dashboard/">
<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- 데이터테이블스타일 -->
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
 
<!--  스타일-->
  <link href="/resources/css/datatable.css" rel="stylesheet" />
        
<!-- 통합관리자 -->
<link rel="stylesheet" href="/resources/css/admin.css">
<link rel="stylesheet" href="/resources/css/free-board.css">
<link rel="stylesheet" href="/resources/css/sidebar.css">
<link href="/resources/css/free-board-detail.css" rel="stylesheet">

<style type="text/css">
.free-board {
	margin-bottom: 0 !important;
	box-shadow:none !important;
	border: none !important;
}
</style>

</head>

<body class="sb-nav-fixed">



    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!--    로고들어감 -->
        			<a href="/mainPage" class="navbar-logo">
			<img class="" id="logo"
				src="/resources/img/finalogo.png">
				</a> 
        <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i
                class="fas fa-bars"></i></button>




        <!-- Navbar 모바일 미디어 드롭메뉴- 사람아이콘 누르면 -->
        <ul class="navbar-nav ml-auto mr-md-0">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="/mainPage">로그아웃</a>
                </div>
            </li>
        </ul>



    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark"">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <a class="nav-link" href="/admin/main">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
             			               관리자페이지
                        </a>

                        <a class="nav-link" href="/admin/qna">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
         				                   문의
                        </a>
                        <a class="nav-link" href="/admin/report">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                         		   신고
                        </a>
                    </div>
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
 						<div class="free-board" >
							<h1 class="tit-h1 line">신고</h1>
						<div class="board-type">
							<div class="tab-content" id="pills-tabContent">
								<!-- 전체글 -->
								<table class="board-free-table">
									<colgroup>
										<col width="10%">
										<col width="20%">
										<col width="30%">
										<col width="10%">
										<col width="10%">
										<col width="20%">
									</colgroup>
									<thead>
										 <tr>
                                            <th class="center" >신고사항</th>
                                            <th >제목</th>
                                            <th >내용</th>
                                            <th class="center" >신고자 닉네임</th>
                                            <th class="center">처리현황</th>
                                            <th class="center" >신고 일시</th>
                                        </tr>
									</thead>
									<tbody>
										<c:forEach items="${reportList}" var="re" varStatus="status">
	                                       <tr>
	                                       		<c:if test="${re.rtype eq 'RP001'}"><td class="center">광고</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP002'}"><td class="center">욕설</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP003'}"><td class="center">허위루머</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP004'}"><td class="center">타종목추천</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP005'}"><td class="center">도배</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP006'}"><td class="center">명예훼손</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP007'}"><td class="center">주제무관</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP008'}"><td class="center">위조변조</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP009'}"><td class="center">음란</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP010'}"><td class="center">지역감정</td></c:if>
	                                       		<c:if test="${re.rtype eq 'RP011'}"><td class="center">기타</td></c:if>
	                                            <td><p class="content">${re.title}</p></td>
	                                            <td><p class="content" id="popup-btn">${re.rcontent}</p></td>
	                                            <td class="center">${re.nickname}</td>
	                                            <td class="center">처리 대기 중</td>
	                                            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${re.rdatetime}"/></td>
	                                        </tr>
                                        </c:forEach>
									</tbody>
								</table>
	
								<!-- 페이징 -->
								<div class="paging">
									<c:if test="${boardPage.total gt 15}">
										<div class="paging-body">
											<nav aria-label="..." class="pagination">
												<ul class="pagination">

													<c:if test="${boardPage.nowPage != 1}">
														<!-- << 버튼 -->
														<li><a class="page-link"
															href="/board/free?bnowPage=1" tabindex="-1"
															aria-disabled="true"> <i
																class="fas fa-angle-double-left"></i>
														</a></li>
														<!-- 1페이지에서 < 버튼 눌렀을 때 -->
														<c:if test="${boardPage.nowPage == 1}">
															<li><a class="page-link"
																href="/board/free?bnowPage=${boardPage.nowPage}"
																tabindex="-1" aria-disabled="true"> <i
																	class="fas fa-angle-left"></i>
															</a></li>
														</c:if>
													</c:if>

													<!-- 1페이지가 아닌 페이지에서 < 버튼 눌렀을 때 -->
													<c:if test="${boardPage.nowPage != 1}">
														<li><a class="page-link"
															href="/board/free?bnowPage=${boardPage.nowPage-1}"
															tabindex="-1" aria-disabled="true"> <i
																class="fas fa-angle-left"></i>
														</a></li>
													</c:if>

													<!-- 한번에 5개 페이지 보여줌 -->
													<c:forEach begin="${boardPage.startPage }"
														end="${boardPage.endPage }" var="p">
														<c:choose>
															<c:when test="${p == boardPage.nowPage}">
																<li class="page-item active" aria-current="page"><a
																	class="page-link" href="#">${p} <span
																		class="sr-only">(current)</span>
																</a></li>
															</c:when>
															<c:when test="${p != boardPage.nowPage}">
																<li class="page-item"><a class="page-link"
																	href="/board/free?bnowPage=${p}">${p}</a></li>
															</c:when>
														</c:choose>
													</c:forEach>



													<c:if test="${boardPage.nowPage != boardPage.lastPage}">
														<!-- 현재 페이지가 마지막 페이지일 경우 > 버튼을 눌렀을 때 -->
														<c:if test="${boardPage.nowPage == boardPage.lastPage}">
															<li><a class="page-link"
																href="/board/free?bnowPage=${boardPage.nowPage}"
																tabindex="+1" aria-disabled="true"> <i
																	class="fas fa-angle-right"></i>
															</a></li>
														</c:if>

														<!-- 현재 페이지가 마지막 페이지가 아닐 경우에 > 버튼을 눌렀을 때 -->
														<c:if test="${boardPage.nowPage != boardPage.lastPage}">
															<li><a class="page-link"
																href="/board/free?bnowPage=${boardPage.nowPage+1}"
																tabindex="+1" aria-disabled="true" data-ajax="false">
																	<i class="fas fa-angle-right"></i>
															</a></li>
														</c:if>

														<!-- >> 버튼 -->
														<li><a class="page-link"
															href="/board/free?bnowPage=${boardPage.lastPage}"
															tabindex="-1" aria-disabled="true"> <i
																class="fas fa-angle-double-right"></i>
														</a></li>

													</c:if>
												</ul>
											</nav>
										</div>
									</c:if>

								</div>

								<div class="search-area">
									<div class="search-area-body">
										<form class="form-inline my-2 my-lg-0 underSearchForm"
											action="/customerClaim/list">
											<!-- <a class="nav-link dropdown-toggle" href="#" id="dropdown01"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a> -->
											<select class="dropdown-toggle-board" name="searchStyle">
												<option class="nav-link dropdown-toggle board-item"
													id="dropdown01" data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false" value=""
													<c:if test='${searchStyle eq ""}'>selected</c:if>>전체</option>
												<option class="dropdown-item board-item"
													value="search_title"
													<c:if test='${searchStyle eq "search_title"}'>selected</c:if>>제목</option>
												<option class="dropdown-item board-item"
													value="search_content"
													<c:if test='${searchStyle eq "search_content"}'>selected</c:if>>내용</option>
												<option class="dropdown-item board-item"
													value="search_title_content"
													<c:if test='${searchStyle eq "search_title_content"}'>selected</c:if>>제목
													+ 내용</option>
												<option class="dropdown-item board-item" value="search_nick"
													<c:if test='${searchStyle eq "search_nick"}'>selected</c:if>>글쓴이</option>
											</select> <input class="form-control mr-sm-2 board-search"
												type="search" name="keyword" placeholder="검색어 입력"
												aria-label="Search">
											<button
												class="btn btn-outline-secondary my-2 my-sm-0 board-search-btn"
												type="submit">
												<i class="fas fa-search"></i>
											</button>
										</form>
									
									</div>
								</div>
							</div>
						</div>
					</div>            
            
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright ⓒ 2020 - 2020 fantasy stock. All rights reserved.</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    
<div id="reportPopup" class="pop-layer" style="display:none">
		<div class="pop-inner">
			<div class="popup-wrap">
				<form id="reportBoard" action="/reportBoard" method="POST"> 
					<div class="pop-tit"><span>게시물 신고 내역</span></div>
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
									<th scope="col">처리현황</th>
									<td>${boardDetail.nickname}</td>
								</tr>	
								<tr>
									<th scope="col">신고날짜</th>
									<td>${boardDetail.nickname}</td>
								</tr>															
								<tr>
									<th scope="col">신고사항</th>
									<td>${boardDetail.title}</td>
								</tr>
								<tr>
									<th scope="col">작성자</th>
									<td>${boardDetail.nickname}</td>
								</tr>																
								<tr>
									<th scope="col">제목</th>
									<td>${boardDetail.title}</td>
								</tr>
								<tr>
									<th scope="col">내용</th>
									<td>${boardDetail.title}</td>
								</tr>								


																
								</tbody>
							</table>
	
					
						</div>
						
							<input type="hidden" name="pno" value="${boardDetail.pno}">
							<input type="hidden" name="title" value="${boardDetail.title}">
						
						<div class="pop-btn">
							<button type="button"  onclick="hidePopup()" class="btn-m e-reportPopupClose">게시물 삭제</button>
							<button type="button"  onclick="hidePopup()" class="btn-m e-reportPopupClose">취소</button>
							<button type="submit" id="submitReport" class="btn-m red">게시물 이동</button>
						</div>
					</div>
					<button type="button" onclick="hidePopup()" class="cla-close e-reportPopupClose">닫기</button>
				</form> 
			</div>
		</div>
	</div>


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
                jQuery(document).on('click', '#popup-btn', function () {
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
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<!--     <script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script> -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" ></script>
    <script src="/resources/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" ></script>
    <script src="/resources/js/chart-area-demo.js"></script>
    <script src="/resources/js/chart-bar-demo.js"></script>
    <script src="/resources/js/datatables-demo.js"></script>    
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
</body>

</html>