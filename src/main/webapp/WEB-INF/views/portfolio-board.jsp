<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>포트폴리오 게시판</title>
  <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/album/">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <!-- css file -->
  <link href="/resources/css/portfolio-board.css" rel="stylesheet">
  <!-- 폰트어썸 cdn -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">

<script>
$(document).ready(function(){
	$(function() {
		window.pagObj = $('#pagination-all').twbsPagination({
			totalPages : 35,
			visiblePages : 5,
			onPageClick : function(event, page) {
				console.info(page + ' (from options)');
			}
		}).on('page', function(event, page) {
			console.info(page + ' (from event listening)');
		});
		});
	
	$(function() {
		window.pagObj = $('#pagination-best').twbsPagination({
			totalPages : 35,
			visiblePages : 5,
			onPageClick : function(event, page) {
				console.info(page + ' (from options)');
			}
		}).on('page', function(event, page) {
			console.info(page + ' (from event listening)');
		});
		});  
});
</script>
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
							<li class="mid"><a href="/portfolio"><span>포트폴리오</span></a></li>
							<li class="last"><a href="/news"><span>뉴스</span></a></li>
						</ul>
					</div>
				</div>
  <div class="col-md-10">
	<div class="free-board">
	<div class="drop-nav">
	<h1 class="tit-h1 line">포트폴리오</h1>
	</div>
	<div class="m-drop-nav">
	<h1 class="m-drop-tit-title line" style="cursor:pointer;">포트폴리오 ▼</h1>
	</div>
	<div class="m-drop-down">
		<h1 class="m-drop-tit-body first line" style="cursor:pointer;"><a href="/board/free">자유게시판</a></h1>
		<h1 class="m-drop-tit-body line" style="cursor:pointer;"><a href="/portfolio">포트폴리오</a></h1>
		<h1 class="m-drop-tit-body last line" style="cursor:pointer;"><a href="/news">뉴스</a></h1>
	</div>
		<div class="board-type">
			<div class="board-free-nav">
					<form id="form" class="board-list-top policy-in" action='/board/free'>
						<p class="pc-only">
							<input type="radio" class="ordeby" id="orderby1" name="orderby"
								value="new" checked=""><label for="orderby1"  class="new-board">최신순</label>
							<input type="radio" class="ordeby" id="orderby2" name="orderby"
								value="best"><label for="orderby2" class="hot-board" >인기순</label>
						</p>
					</form>
		 			 
		 			 <c:if test="${loginUser != null}">
						<p class="right"><a href="/board/free/write" class="board-write-btn">글쓰기</a></p>
					 </c:if>	
					 		
			</div>
			<div class="tab-content" id="pills-tabContent">
					<!-- 전체글 -->
					<ul class="photo-list no-line board-col"><li class="type_" data-seq="150357583575745">	<p class="img">		<a href="javascript:bbsWrtView_noti(150357583575745);">			<span>				<img src="//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">			</span>		</a>	</p><dl class="text">		<dt>			<a href="javascript:bbsWrtView_noti(150357583575745);"><span class="ntc">공지</span> 팍스넷 선물옵션이 새롭게 바뀝니다.</a>		</dt>			<dd class="date">				<span>				<span class="nick-badge-small"><a href="javascript:viewProfile('webmaster')"><img src="//www.paxnet.co.kr/my/files/badge/favor3S.png?20200616" alt="">운영자</a></span>					<span class="data-date-format" data-date-format="20200615142741">06.15</span>					<span class="comment" id="countNum150357583575745"><i>댓글</i>4</span>		</span></dd>	</dl></li><li class="type_" data-seq="150357583581691">	<p class="img">		<a href="javascript:bbsWrtView_noti(150357583581691);">			<span>				<img src="//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">			</span>		</a>	</p><dl class="text">		<dt>			<a href="javascript:bbsWrtView_noti(150357583581691);"><span class="ntc">공지</span> [선물옵션 게시물 작성 이벤트] 선물은 상품권을 드립니다!</a>		</dt>			<dd class="date">				<span>				<span class="nick-badge-small"><a href="javascript:viewProfile('webmaster')"><img src="//www.paxnet.co.kr/my/files/badge/favor3S.png?20200616" alt="">운영자</a></span>					<span class="data-date-format" data-date-format="20200616164538">16:45</span>					<span class="comment" id="countNum150357583581691"><i>댓글</i>1</span>		</span></dd>	</dl></li><li class="type_" data-seq="150357579637544">	<p class="img">		<a href="javascript:bbsWrtView_noti(150357579637544);">			<span>				<img src="//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">			</span>		</a>	</p><dl class="text">		<dt>			<a href="javascript:bbsWrtView_noti(150357579637544);"><span class="ntc">공지</span> 사진게시판이란...?</a>		</dt>			<dd class="date">				<span>				<span class="nick-badge-small"><a href="javascript:viewProfile('webmaster')"><img src="//www.paxnet.co.kr/my/files/badge/favor3S.png?20200616" alt="">운영자</a></span>					<span class="data-date-format" data-date-format="20171102162505">11.02</span>					<span class="comment" id="countNum150357579637544"><i>댓글</i>4</span>		</span></dd>	</dl></li>
								
									
										<li class="type_" data-seq="150357583570842"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583570842);">
													<span>
														
															
															
																<img src="#" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583570842);">6월 의 사과원 풍경</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('ejongy')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/like7S.png?20200616" alt="">사과사랑</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Sun Jun 14 06:41:11 KST 2020">06.14</span>
													
														
															
															
																<span class="comment" id="countNum_150357583570842"><i>댓글</i>1</span>
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583563778"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583563778);">
													<span>
														
															
																
																
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/15035758356377820200612110222.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583563778);">강원도 고성 하늬라벤다팜</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('pbk603')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/favor3S.png?20200616" alt="">지수1250</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Fri Jun 12 10:58:19 KST 2020">06.12</span>
													
														
															
																<span class="comment" id="countNum_150357583563778" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583545228"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583545228);">
													<span>
														
															
																
																
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/15035758354522820200609160510.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583545228);">양재천 주말 스켓치</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('pbk603')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/favor3S.png?20200616" alt="">지수1250</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Tue Jun 09 16:03:22 KST 2020">06.09</span>
													
														
															
																<span class="comment" id="countNum_150357583545228" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583545171"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583545171);">
													<span>
														
															
																
																
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/15035758354517120200609155121.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583545171);">5월의 장미</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('pbk603')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/favor3S.png?20200616" alt="">지수1250</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Tue Jun 09 15:49:47 KST 2020">06.09</span>
													
														
															
																<span class="comment" id="countNum_150357583545171" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583492650"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583492650);">
													<span>
														
															
															
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/150357583492650.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583492650);">태국에서 직접 만든 음식들</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('n_1589459960')">
																
																
																
																
																
																	dkdlelanjgo</a>
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Fri May 29 11:24:53 KST 2020">05.29</span>
													
														
															
																<span class="comment" id="countNum_150357583492650" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583492633"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583492633);">
													<span>
														
															
															
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/150357583492633.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583492633);">제주도에서 먹은 왕갈치구이</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('n_1589459960')">
																
																
																
																
																
																	dkdlelanjgo</a>
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Fri May 29 11:22:34 KST 2020">05.29</span>
													
														
															
																<span class="comment" id="countNum_150357583492633" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583466407"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583466407);">
													<span>
														
															
															
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/150357583466407.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583466407);">5월 사과원 풍경 </a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('ejongy')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/like7S.png?20200616" alt="">사과사랑</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Tue May 26 09:37:23 KST 2020">05.26</span>
													
														
															
															
																<span class="comment" id="countNum_150357583466407"><i>댓글</i>1</span>
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583452111"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583452111);">
													<span>
														
															
															
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/150357583452111.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583452111);">하화도 풍경</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('ejongy')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/like7S.png?20200616" alt="">사과사랑</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Fri May 22 19:35:36 KST 2020">05.22</span>
													
														
															
																<span class="comment" id="countNum_150357583452111" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583411288"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583411288);">
													<span>
														
															
															
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/150357583411288.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583411288);">단양 남한강 들레길</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('ejongy')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/like7S.png?20200616" alt="">사과사랑</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Fri May 15 06:42:59 KST 2020">05.15</span>
													
														
															
																<span class="comment" id="countNum_150357583411288" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583398946"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583398946);">
													<span>
														
															
															
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/150357583398946.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583398946);">비트옵션 판교지점 사전 가입 시 10만원 무료 지원!</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('znqk01')">
																
																
																
																
																
																	비트옵션</a>
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Tue May 12 13:53:08 KST 2020">05.12</span>
													
														
															
																<span class="comment" id="countNum_150357583398946" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583388677"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583388677);">
													<span>
														
															
															
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/150357583388677.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583388677);">복숭아 꽃</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('ejongy')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/like7S.png?20200616" alt="">사과사랑</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Sat May 09 06:28:33 KST 2020">05.09</span>
													
														
															
															
																<span class="comment" id="countNum_150357583388677"><i>댓글</i>1</span>
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583385305"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583385305);">
													<span>
														
															
															
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/150357583385305.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583385305);">양재천의 黃梅</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('pbk603')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/favor3S.png?20200616" alt="">지수1250</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Fri May 08 12:06:14 KST 2020">05.08</span>
													
														
															
																<span class="comment" id="countNum_150357583385305" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583376671"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583376671);">
													<span>
														
															
															
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/150357583376671.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583376671);">꽃</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('pbk603')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/favor3S.png?20200616" alt="">지수1250</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Wed May 06 11:36:47 KST 2020">05.06</span>
													
														
															
																<span class="comment" id="countNum_150357583376671" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583374599"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583374599);">
													<span>
														
															
																
																
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/15035758337459920200505163731.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583374599);">하얀 토종 민들레</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('ejongy')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/like7S.png?20200616" alt="">사과사랑</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Tue May 05 16:36:37 KST 2020">05.05</span>
													
														
															
															
																<span class="comment" id="countNum_150357583374599"><i>댓글</i>2</span>
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583373785"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583373785);">
													<span>
														
															
															
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/150357583373785.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583373785);">물 반 고기 반 </a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('anymoney')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/like2S.png?20200616" alt="">파라가테</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Tue May 05 00:07:18 KST 2020">05.05</span>
													
														
															
																<span class="comment" id="countNum_150357583373785" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583371110"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583371110);">
													<span>
														
															
															
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/150357583371110.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583371110);">5월초 부사 꽃</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('ejongy')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/like7S.png?20200616" alt="">사과사랑</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Mon May 04 09:29:44 KST 2020">05.04</span>
													
														
															
																<span class="comment" id="countNum_150357583371110" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583349561"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583349561);">
													<span>
														
															
																
																
																<img src="//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583349561);">별똥운석 신기하고 아름다워 보이니 감상하세요  </a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('shddtingofas')">
																
																
																
																
																
																	산속에별줍다</a>
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Sat Apr 25 19:39:43 KST 2020">04.25</span>
													
														
															
																<span class="comment" id="countNum_150357583349561" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583343553"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583343553);">
													<span>
														
															
																
																
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/15035758334355320200423160920.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583343553);">2020년 봉은사의 봄</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('pbk603')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/favor3S.png?20200616" alt="">지수1250</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Thu Apr 23 16:03:53 KST 2020">04.23</span>
													
														
															
															
																<span class="comment" id="countNum_150357583343553"><i>댓글</i>1</span>
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583331803"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583331803);">
													<span>
														
															
															
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/150357583331803.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583331803);">5월 20일 사과원에 핀 사과 꽃</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('ejongy')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/like7S.png?20200616" alt="">사과사랑</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Tue Apr 21 06:13:08 KST 2020">04.21</span>
													
														
															
																<span class="comment" id="countNum_150357583331803" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583329985"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583329985);">
													<span>
														
															
															
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/150357583329985.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583329985);">양재천의 봄(2)</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('pbk603')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/favor3S.png?20200616" alt="">지수1250</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Mon Apr 20 14:28:24 KST 2020">04.20</span>
													
														
															
															
																<span class="comment" id="countNum_150357583329985"><i>댓글</i>1</span>
															
														
													
												</dd>
											</dl>
										</li>
									
										<li class="type_" data-seq="150357583327044"><!--  class="ntc" -->
											<p class="img">
												<a href="javascript:bbsWrtView(150357583327044);">
													<span>
														
															
															
																<img src="http://www.paxnet.co.kr/tbbs/files/thumbnail/N10982/150357583327044.jpg" onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
															
														
													</span>
												</a>
											</p><!-- 2017.04.12 span 추가 -->
											<dl class="text">
												<dt>
													<a href="javascript:bbsWrtView(150357583327044);">사과밭에 노랑 민들레</a>
												</dt>
												<dd class="date">
													
														<span>
															<span class="nick-badge-small">
																
																	<a href="javascript:viewProfile('ejongy')">
																
																
																
																	<img src="//www.paxnet.co.kr/my/files/badge/like7S.png?20200616" alt="">사과사랑</a>
																
																
																
															</span>
														</span>
													
													
													<span class="data-date-format" data-date-format="Sun Apr 19 16:22:33 KST 2020">04.19</span>
													
														
															
																<span class="comment" id="countNum_150357583327044" style="display: none"><i>댓글</i>0</span>
															
															
														
													
												</dd>
											</dl>
										</li>
									
								
					</ul>
					
					<!-- 페이징 -->
					<div class="paging">	
					<div class="paging-body">				
					<nav aria-label="..." class="pagination">
					    <ul class="pagination">
					
					<c:if test="${boardPage.nowPage != 1}">
					      <!-- << 버튼 -->
					      <li>
					        <a class="page-link"
					          href="/board/free?bnowPage=1"
					          tabindex="-1" aria-disabled="true">
					          <i class="fas fa-angle-double-left"></i>
					        </a>
					      </li>
					      <!-- 1페이지에서 < 버튼 눌렀을 때 -->
					      <c:if test="${boardPage.nowPage == 1}">
					        <li>
					          <a class="page-link"
					            href="/board/free?bnowPage=${boardPage.nowPage}"
					            tabindex="-1" aria-disabled="true">
					            <i class="fas fa-angle-left"></i>
					          </a>
					        </li>
					      </c:if>
					</c:if>
					      
					      <!-- 1페이지가 아닌 페이지에서 < 버튼 눌렀을 때 -->
					      <c:if test="${boardPage.nowPage != 1}">
					        <li>
					          <a class="page-link"
					            href="/board/free?bnowPage=${boardPage.nowPage-1}"
					            tabindex="-1" aria-disabled="true">
					            <i class="fas fa-angle-left"></i>
					          </a>
					        </li>
					      </c:if>
					      
					      <!-- 한번에 5개 페이지 보여줌 -->
					       <c:forEach begin="${boardPage.startPage }"
					        end="${boardPage.endPage }" var="p">
					        <c:choose>
					          <c:when test="${p == boardPage.nowPage}">
					            <li class="page-item active" aria-current="page">
					              <a class="page-link" href="#">${p}
					                <span class="sr-only">(current)</span>
					              </a>
					            </li>
					          </c:when>
					          <c:when test="${p != boardPage.nowPage}">
					            <li class="page-item">
					              <a class="page-link" href="/board/free?bnowPage=${p}">${p}</a>
					            </li>
					          </c:when>
					        </c:choose>
					      </c:forEach> 
					      
					      
					      
					 	 <c:if test="${boardPage.nowPage != boardPage.lastPage}">    
					      <!-- 현재 페이지가 마지막 페이지일 경우 > 버튼을 눌렀을 때 -->
					      <c:if test="${boardPage.nowPage == boardPage.lastPage}">
					        <li>
					          <a class="page-link"
					            href="/board/free?bnowPage=${boardPage.nowPage}"
					            tabindex="+1" aria-disabled="true">
					            <i class="fas fa-angle-right"></i>
					          </a>
					        </li>
					      </c:if>
					      
					      <!-- 현재 페이지가 마지막 페이지가 아닐 경우에 > 버튼을 눌렀을 때 -->					
					      <c:if test="${boardPage.nowPage != boardPage.lastPage}">
					        <li>
					          <a class="page-link"
					            href="/board/free?bnowPage=${boardPage.nowPage+1}"
					            tabindex="+1" aria-disabled="true" data-ajax="false">
					            <i class="fas fa-angle-right"></i>
					          </a>
					        </li>
					      </c:if> 
					
					      <!-- >> 버튼 -->
					      <li>
					        <a class="page-link"
					        href="/board/free?bnowPage=${boardPage.lastPage}"
					        tabindex="-1" aria-disabled="true">
					          <i class="fas fa-angle-double-right"></i>
					        </a>
					      </li>
					      
					      </c:if>
					    </ul>
					  </nav>
					 </div>


					 <c:if test="${loginUser != null}">
						<p class="right"><a href="/board/free/write" class="board-write-btn">글쓰기</a></p>
					 </c:if>
				</div>
				
				<div class="search-area">
					<div  class="search-area-body">
					<form class="form-inline my-2 my-lg-0 underSearchForm" action="/board/free">
						<!-- <a class="nav-link dropdown-toggle" href="#" id="dropdown01"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a> -->
						<select class="dropdown-toggle-board" name="searchStyle">
							<option class="nav-link dropdown-toggle board-item" id="dropdown01"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" value="" <c:if test='${searchStyle eq ""}'>selected</c:if>>전체</option>
							<option class="dropdown-item board-item" value="search_title"<c:if test='${searchStyle eq "search_title"}'>selected</c:if>>제목</option> 
							<option class="dropdown-item board-item" value="search_content"<c:if test='${searchStyle eq "search_content"}'>selected</c:if>>내용</option> 
							<option class="dropdown-item board-item" value="search_title_content"<c:if test='${searchStyle eq "search_title_content"}'>selected</c:if>>제목 + 내용</option> 
							<option class="dropdown-item board-item" value="search_nick"<c:if test='${searchStyle eq "search_nick"}'>selected</c:if>>글쓴이</option>
						</select>
						<input class="form-control mr-sm-2 board-search" type="search"
							placeholder="검색어 입력" aria-label="Search">
						<button class="btn btn-outline-secondary my-2 my-sm-0 board-search-btn"
							type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
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
</div>
 
<!--       <div id="carouselExampleControls" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href="#">[특징주]상보, 中희토류 전략무기화 가능성 상승에 대체제 부각 '강세'</a>
				</div>
				<div class="carousel-item">
					<a href="#">[특징주]상보, 中희토류 전략무기화 가능성 상승에 대체제 부각 '강세'</a>
				</div>
				<div class="carousel-item">
					<a href="#">[특징주]상보, 中희토류 전략무기화 가능성 상승에 대체제 부각 '강세'</a>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
	  </div>
    <div class="sideBar col-md-4 order-md-2 mb-4" id="menu-bar">
      <ul class="list-group mb-3">
      
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed free-board" onclick="location.href='free-board.jsp'">
          <div> 
            <h6 class="my-0">자유 게시판</h6>
          </div>
        </li>
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed news-borad" onclick="location.href='newboard.jsp'">
          <div>
            <h6 class="my-0">뉴스 게시판</h6>
          </div>
        </li>
        <li class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed protfolio-board" onclick="location.href='portfolio-board.jsp'" >
          <div>
            <h6 class="my-0">포트폴리오 게시판</h6>
          </div>
        </li>
      </ul>
    </div>
  
  <article class="bg-light container">
    <main role="main">
        <div class="allbody">
           <div class="row" style="margin-top:-40px;">
	        <div class="sidebar-header col-md-4 order-md-2 mb-4">
	            <div class="col-md-8 order-md-1"></div>
		          <h4 class="mb-3">포트폴리오 게시판</h4>
		        </div>
	 	    </div>	
          <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <li class="nav-item" role="presentation">
              <a class="nav-link active" id="pills-all-tab" data-toggle="pill" href="#pills-all" role="tab" aria-controls="pills-all" aria-selected="true">전체글</a>
            </li>
            <li class="nav-item" role="presentation">
              <a class="nav-link" id="pills-best-tab" data-toggle="pill" href="#pills-best" role="tab" aria-controls="pills-best" aria-selected="false">인기글</a>
            </li>
          </ul>
          Tab Menu
          <div class="tab-content" id="pills-tabContent">
            전체글
            <div class="tab-pane fade show active" id="pills-all" role="tabpanel" aria-labelledby="pills-all-tab" style="margin-bottom: 300px;">
            1row
              <div class="row" style="margin-bottom: 30px;">
                1set
                <div class="col-md-4">
                  <div class="card mb-4 shadow-sm">
                    <img src="/resources/img/portfolio2.png" style="width:337px; height:auto; border-bottom: 1px dotted #5a6268;">사진
                    <div class="card-body">
                      <p class="card-text"></p>
                      <div class="d-flex justify-content-between align-items-center">
                        <ul class="notice-info">
                            <li class="author"><i class="fa fa-user-circle"></i> #홍길동</li>
                		    <li class="date"><i class="fas fa-stopwatch"></i> #2020.05.27</li>
                		    <li class="likes"><i class="fas fa-thumbs-up"></i> #3</li>
                		    <li class="views"><i class="fas fa-eye"></i> #27</li>
                		    <button type="button" class="btn btn-sm btn-outline-secondary like-button">좋아요</button>
                		</ul>
                      </div>
                    </div>
                  </div>
                </div>
               
                <div class="col-md-4">
                  <div class="card mb-4 shadow-sm">
                    <img src="/resources/img/portfolio1.jpg" style="width:337px; height:auto; border-bottom: 1px dotted #5a6268;">사진
                    <div class="card-body">
                      <p class="card-text"></p>
                      <div class="d-flex justify-content-between align-items-center">
                        <ul class="notice-info">
                            <li class="author"><i class="fa fa-user-circle"></i> #홍길동</li>
                		    <li class="date"><i class="fas fa-stopwatch"></i> #2020.05.27</li>
                		    <li class="likes"><i class="fas fa-thumbs-up"></i> #3</li>
                		    <li class="views"><i class="fas fa-eye"></i> #27</li>
                		    <button type="button" class="btn btn-sm btn-outline-secondary like-button">좋아요</button>
                		</ul>
                      </div>
                    </div>
                  </div>
                </div>
               
              </div>
             
 		 <form class="form-inline my-2 my-lg-0 underSearchForm">
	          <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a>
		          <div class="dropdown-menu" aria-labelledby="dropdown01">
		            <a class="dropdown-item" href="#">제목</a>
		            <a class="dropdown-item" href="#">내용</a>
		            <a class="dropdown-item" href="#">제목 + 내용</a>
		            <a class="dropdown-item" href="#">글쓴이</a>
		          </div>
             <input class="form-control mr-sm-2" type="search" placeholder="search" aria-label="Search">
             <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit"> <i class="fas fa-search"></i></button>
            <div class="buttons">
	            <button class="btn btn-primary btn-lg btn-block add" type="button" onclick="location.href='portfolio-writeForm.jsp'">작성</button>
          	</div>             
          </form>
             
	            <div class="paging">
					<div class="paging-body">
						<ul class="pagination" id="pagination-all"></ul>
					</div>
	    		</div>
	    	 
            </div>
           
            <div class="tab-pane fade" id="pills-best" role="tabpanel" aria-labelledby="pills-best-tab" style="margin-bottom: 300px;">
               1row
               <div class="row" style="margin-bottom: 30px;">
                1set
                <div class="col-md-4">
                  <div class="card mb-4 shadow-sm">
                    <img src="/resources/img/portfolio1.jpg" style="width:337px; height:auto; border-bottom: 1px dotted #5a6268;">사진
                    <div class="card-body">
                      <p class="card-text"></p>s
                      <div class="d-flex justify-content-between align-items-center">
                        <ul class="notice-info">
                            <li class="author"><i class="fa fa-user-circle"></i> #홍길동</li>
                		    <li class="date"><i class="fas fa-stopwatch"></i> #2020.05.27</li>
                		    <li class="likes"><i class="fas fa-thumbs-up"></i> #3</li>
                		    <li class="views"><i class="fas fa-eye"></i> #27</li>
                		    <button type="button" class="btn btn-sm btn-outline-secondary like-button">좋아요</button>
                		</ul>
                      </div>
                    </div>
                  </div>
                </div>
                
              </div>
              
          <form class="form-inline my-2 my-lg-0 underSearchForm">
	          <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a>
		          <div class="dropdown-menu" aria-labelledby="dropdown01">
		            <a class="dropdown-item" href="#">제목</a>
		            <a class="dropdown-item" href="#">내용</a>
		            <a class="dropdown-item" href="#">제목 + 내용</a>
		            <a class="dropdown-item" href="#">글쓴이</a>
		          </div>
             <input class="form-control mr-sm-2" type="search" placeholder="search" aria-label="Search">
             <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit"> <i class="fas fa-search"></i></button>
          </form>
             
	            <div class="paging">
					<div class="paging-body">
						<ul class="pagination" id="pagination-best"></ul>
					</div>
	    		</div>
	    	
            </div>
            
          </div>
       
       </div>
  </main>
</article>   -->


<%@include file="mainfooter.jsp" %>	

</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- paginate -->
<script src="/resources/jpaginate/jquery.twbsPagination.js" type="text/javascript"></script>
</html>