<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이페이지</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<link rel="stylesheet" href="/resources/css/mainfooter.css">
	<link rel="stylesheet" href="/resources/css/mainheader.css">
<!-- 	<link href="/resources/css/mypage04.css" rel="stylesheet"> -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 	<style>
		.paging-body {
			margin-left: 300px;
			margin-bottom: 300px;
		}

		td>a {
			cursor: pointer;
		}

		.no {
			width: 76px;
		}
	</style> -->
<style type="text/css">
span, em, mark, strong, b, label {
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    background: transparent;
    list-style: none;
    box-sizing: border-box;
}
.my-list-scrap {
    position: relative;
    height: 28px;
    line-height: 28px;
    margin-bottom: 10px;
    padding: 0 10px;
}
.alarm-area {
    border-top: #444 1px solid;
}
input[type="checkbox"]:not(old), input[type="radio"]:not(old) {
    opacity: 0;
    outline: 0;
    margin-left: 0;
    position: absolute;
    z-index: -1;
}
input[type="checkbox"]:not(old):checked + label {
    min-width: 18px;
    background-image: url(/resources/img/bg_check_on_m.png);
}
input[type="checkbox"]:not(old) + label {
    display: inline-block;
    height: 18px;
    line-height: 18px;
    padding: 0 0 2px 20px;
    background-image: url(/resources/img/bg_check.png);
    background-position: 0 2px;
    background-repeat: no-repeat;
    background-size: 14px 14px;
    cursor: pointer;
}
.my-list-scrap label i {
    color: #ff545b;
}
.my-list-scrap p {
    vertical-align: middle;
    display: inline-block;
    margin-left: 10px;
}
.my-list-scrap p .adhere {
    float: left;
    margin-right: -1px;
}

[class*="btn-"] {
    position: relative;
    background: #fff;
    border: 1px solid #444;
    line-height: 100%;
    display: inline-block;
    color: #000;
    vertical-align: middle;
    box-sizing: border-box;
    text-align: center;
}
[class*="btn-s"] {
    padding: 6px 10px;
    min-width: 60px;
    font-size: 14px;
    border: 1px solid #ccc;
    color: #888;
}
input[type="button"], button {
    margin: 0;
    padding: 0;
    border: 0;
    cursor: pointer;
    background: none;
}
.my-list-scrap p .del::before {
    content: "";
    width: 14px;
    height: 14px;
    display: inline-block;
    vertical-align: top;
    background: url(/resources/img/ico_sub2.png) no-repeat 0 -136px;
    background-size: 40px 400px;
    padding-right: 5px;
}
.alarm-area li {
    border-bottom: #eaeaea 1px solid;
    width: 100%;
    display: table;
    padding: 10px 0;
    table-layout: fixed;
}
.alarm-area li p.check {
    display: table-cell;
    width: 40px;
    vertical-align: middle;
    text-align: center;
}

.alarm-area li p.check label {
    width: 0;
    text-indent: -9999em;
}	
.alarm-area li p.img {
    display: table-cell;
    width: 65px;
    vertical-align: middle;
    text-align: left;
}
.pro-badge {
    display: inline-block;
    position: relative;
    width: 46px;
    height: 46px;
}
.pro-badge > img {
    width: 46px !important;
    height: 46px !important;
    border-radius: 50% !important;
    /* background-color: #dc4e55; */
    background-color: #eaeaea;
    font-size: 13px;
    display: inline-block;
    color: #000;
    text-align: center;
}
.alarm-area li dl {
    display: table-cell;
    width: 90%;
    vertical-align: middle;
    line-height: 1.6;
}
.alarm-area li dl dt a {
    font-size: 14px;
    color: #000;
}
.alarm-area li dl dd span {
    font-size: 13px;
    color: #888;
    background: url(/resources/img/bg_line.png) no-repeat right 50%;
    padding-right: 10px;
    margin-right: 5px;
}
.alarm-area li dl dd span a {
    color: #888;
}
.alarm-area li dl dd span:last-child {
    background: none;
    margin-right: 0;
}
input[type="checkbox"]:not(old):checked + label {
    min-width: 18px;
    background-image: url(/resources/img/bg_check_on_m.png);
}








@media only screen and (max-width: 979px){	
.my-list-scrap {
    padding: 0 15px;
}
input[type="checkbox"]:not(old):checked + label {
    background-image: url(/resources/img/bg_check_on_m.png);
}
input[type="checkbox"]:not(old) + label {
    background-image: url(/resources/img/bg_check_m.png);
}
.my-list-scrap p {
    position: absolute;
    top: 0;
    right: 15px;
}
.alarm-area li {
    padding-right: 10px;
}
.mobile-only-check.fixed {
    position: fixed;
    bottom: 0;
}
.mobile-only-check {
    display: block;
    width: 100%;
    text-align: center;
    padding: 11px 0;
    background-color: #444444;
    overflow: hidden;
    position: absolute;
    bottom: 0;
    left: 0;
}
.mobile-only-check span {
    display: block;
    width: 33.33%;
    float: left;
    color: #fff;
    vertical-align: top;
    background: url(/resources/img/bg_line2.png) no-repeat right 50%;
}
.mobile-only-check span button.del {
    background: url(/resources/img/ico_sub2.png) no-repeat 0 -317px;
    background-size: 40px 400px;
    padding-left: 20px;
}
.mobile-only-check span button {
    color: #fff;
    height: 14px;
    line-height: 1;
}
.mobile-only-check span button.cancel {
    background: url(/resources/img/ico_sub2.png) no-repeat 0 -335px;
    background-size: 40px 400px;
    padding-left: 20px;
}
}

.comm-list {
    border-top: #000 1px solid;
    line-height: 1.6;
    margin-bottom: 15px;
}



</style>
</head>

<body>
	<%@include file="mainheader.jsp"%>
	<!-- section start -->
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
				<!-- section end -->

				<!-- article start -->
				<div class="col-md-10">
					<div class="row">
						<div class="sideBar col-md-4 order-md-2 mb-4">
							<div class="col-md-8 order-md-1"></div>
							<h4 class="mb-3">알림</h4>
							<h6>(확인시 자동 삭제)</h6>
						</div>
					</div>
					<!-- 게시판 -->
					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
						<li class="nav-item" role="presentation">
							<a class="nav-link active" id="pills-trade-tab" data-toggle="pill" href="#pills-trade" role="tab"
								aria-controls="pills-trade" aria-selected="true">거래체결</a>
						</li>
						<li class="nav-item" role="presentation">
							<a class="nav-link" id="pills-board-tab" data-toggle="pill" href="#pills-board" role="tab"
								aria-controls="pills-board" aria-selected="false">게시판 알림</a>
						</li>
					</ul>
					<div class="tab-content" id="pills-tabContent">
						<!-- 게래체결 -->
						<div class="tab-pane fade show active" id="pills-trade" role="tabpanel" aria-labelledby="pills-trade-tab"
							style="margin-bottom: 300px;">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="tno" scope="col">거래번호</th>
										<th class="stockName" scope="col">종목명</th>
										<th class="tprice" scope="col">단가</th>
										<th class="quantity" scope="col">수량</th>
										<th class="tdatetime" scope="col">거래일시</th>
										<th class="category" scope="col">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${modifiedNotice}" var="list">
										<tr>

											<td class="first" title="주문번호">
												<c:out value="${list.tno}" />
											</td>
											<td title="종목명">
												<c:out value="${list.stockName}" />
											</td>
											<td title="주문단가">
												<c:out value="${list.tprice}" />
											</td>
											<td title="주문수량">
												<c:out value="${list.quantity}" />
											</td>
											<td title="거래일시">
												<fmt:formatDate value="${list.tdatetime}" pattern="yyyy-MM-dd HH:mm:ss" />
											</td>
											<td title="상태">
												<c:out value="${list.category}" />
											</td>
										</tr>
									</c:forEach>
							</table>
						</div>
						<!-- 게시판알림 -->
						<div class="tab-pane fade" id="pills-board" role="tabpanel" aria-labelledby="pills-board-tab"
							style="margin-bottom: 300px;">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="no" scope="col">글번호</th>
										<th class="title" scope="col">내용</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${commentNotice}" var="list">
										<tr>
											<td class="first" title="글번호">
												<c:out value="${list.pno}" />
											</td>
											<td title="내용">
												<c:out value="${list.title}" /> 글에 댓글이 달렸습니다.</td>
										</tr>
									</c:forEach>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

<form name="alarmForm">
			<input type="hidden" name="flag" id="flag" value="">

			<div class="my-list-scrap">
				<input type="checkbox" class="check_all" id="check-all">
				<label for="check-all">총 <i>1</i>개
				</label>
				<p>
					<button type="button" class="btn-s adhere del selectAlarmDelete">삭제</button>
					<button type="button" class="btn-s adhere readAlarmDelete">읽은 알림 삭제</button>
				</p>
			</div>
			<div class="alarm-area">
				<ul>
					<!-- 2017.04.26 추가 -->
					
					
					<!-- //2017.04.26 추가 -->

					<!-- //2017.04.28 추가 -->
					<!-- 읽은 내용 <a> 태그 부모에 class="visited" 삽입 → a 텍스트 색 #888 처리됩니다.-->
					
						
							
								<li>
									<p class="check">
										<input type="checkbox" id="eventSeq_28900862" class="seq_check" name="eventSeq" value="28900862">
										<label for="eventSeq_28900862">선택 삭제</label>
									</p>
									
										
										
											<p class="img">
												<span class="pro-badge"> <img class="pax_f2_proimg" cust_id="g_1589453219" src="https://www.paxnet.co.kr/my/files/proimg/di/pi_08.png"><i style="display: none;"><img class="current_badge_s" cust_id="g_1589453219" id="current_badge_g_1589453219"></i>
												</span>
											</p>
										
									
									<dl>
										<dt class="" id="visited_28900862">
											<!-- 방문여부 : visited -->
											<span class="red">[댓글]</span> <strong>
													
														<a href="#" onclick="javascript:goView('28900862', 'http://www.paxnet.co.kr/tbbs/view?id=N10841&amp;seq=150357583596792');return false;" title="http://www.paxnet.co.kr/tbbs/view?id=N10841&amp;seq=150357583596792">내가 쓴 글의 댓글이 작성되었습니다.</a>
													
													
												</strong>
										</dt>

										
										
											
											
												<dd>
													<span><a href="#">개미굴리트</a></span> <span>2020.06.18 22:47</span>
												</dd>
											
										
									</dl>
								</li>
							
						
						
					
				</ul>
			</div>
			<!-- //board-type -->

			<div class="mobile-only-check fixed">
				<!-- fixed -->
				<span><input type="checkbox" id="check_all_mo" class="check_all"><label for="check_all_mo">전체선택</label></span> <span><button type="button" class="del selectAlarmDelete">삭제</button></span> <span><button type="button" class="cancel">취소</button></span>
			</div>
		</form>
		
		
		
		
		<ul class="comm-list opt-list" id="comm-list">
							
						<li class="board-col">
							<div class="type" style="width:15%;">게시판</div>
							<div class="title"><p class="tit">제목</p></div>
							<div class="write">작성자</div>
							<div class="viewer">조회</div>
							<div class="like">추천</div>
							<div class="date">작성일</div>
						</li>
						
						
							<li><!--  class="ntc" -->
								<div class="type type_" data-seq="150357583596792" style="width:15%;">
									<strong class="company-name">[<a href="http://www.paxnet.co.kr/tbbs/list?tbbsType=L&amp;id=N10841">자유게시판</a>]
								</strong></div><strong class="company-name">
								</strong><div class="title" style="padding:12px 0 10px 0;"><strong class="company-name">
									</strong><p class="tit" id="tit_111111"><strong class="company-name">
										</strong> <a href="http://www.paxnet.co.kr/tbbs/view?id=N10841&amp;seq=150357583596792">dddddddddddd</a>
										
										
											<span class="comment" id="countNum_150357583596792" style="">댓글</span><b class="comment-num" id="comment-num_150357583596792" style="">1</b>
										
									</p>
								</div>
							
								<div class="write">
									<span class="nick-badge-small">
											나다이시키야
									</span>
								</div>
							
								<div class="viewer" id="hitsNum_150357583596792"><span>조회 </span>4</div>
								<div class="like" id="recmNum_150357583596792"><span>추천 </span>0</div>											
									<div class="date"><span class="data-date-format">06.18</span></div>
							</li>
							
							
							
							
							
						
					</ul>
	<!-- article end -->
	<%@include file="mainfooter.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>