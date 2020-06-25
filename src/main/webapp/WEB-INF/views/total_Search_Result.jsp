<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="/resources/css/mainheader2.css">
<link rel="stylesheet" href="/resources/css/mainfooter.css">

<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
<style>

html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video, button, a {
    font-family: 'Noto Sans KR', sans-serif;
}

html, body, div, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote,
   pre, abbr, address, cite, code, del, dfn, img, ins, kbd, q, samp, small,
   var, i, dl, dt, dd, ol, ul, li, fieldset, form, legend, table, caption,
   tbody, tfoot, thead, tr, article, aside, canvas, details, figcaption,
   figure, footer, header, hgroup, menu, nav, section, summary, time,
   audio, video {
   margin: 0;
   padding: 0;
   border: 0;
   vertical-align: baseline;
   font-size: 14px;
   background: transparent;
   list-style: none;
   box-sizing: border-box;
   word-break: break-all;
}
legend, caption {
    font-size: 0;
    overflow: hidden;
    text-indent: -9999999px;
    height: 0;
    width: 0;
    line-height: 0;
}
span, em, mark, strong, b, label {
   margin: 0;
   padding: 0;
   border: 0;
   vertical-align: baseline;
   background: transparent;
   list-style: none;
   box-sizing: border-box;
}
ol, ul {
    list-style: none;
}
em, i {
   font-style: normal;
}

a, a:link, a:visited, a:active, a:hover {
   text-decoration: none;
}

p {
    line-height: 160%;
}
table {
    table-layout: fixed;
    border-collapse: collapse;
    border-spacing: 0;
    border: 0;
}
td, th {
    word-break: break-all;
    margin: 0;
    padding: 0;
    font-size: 14px;
    box-sizing: border-box;
}

body {
    line-height: 1;
    -webkit-text-size-adjust: none;
    background: #eff3f6;
    color: #000;
}
input[type="text"], input[type="password"], input[type="tel"] {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    line-height: 1;
    width: 100%;
    padding: 5px 35px 6px 10px;
    border: 1px solid #ccc;
    background: #fff;
    color: #000;
    vertical-align: middle;
    box-sizing: border-box;
    border-radius: 0;
}
.containerNew {
    position: relative;
    max-width: 1260px;
    height: 100%;
    padding: 20px 0 0 0;
    margin: 0 auto;
}
.cont-area {
    padding: /*20px 30px 60px 30px*/20px 30px 30px 30px;
    margin-bottom: /*70px*/40px;
    background: #fff;
    position: relative;
}
.hidden {
    overflow: hidden;
    width: 0;
    height: 0;
    line-height: 0;
    margin: 0;
    padding: 0;
    font-size: 0;
    text-indent: -9999px;
}
.t-search-box {
    padding-top: 10px;
}
.condition-area {
    position: relative;
    border: 1px solid #eaeaea;
    padding: 20px 17px 20px 20px;
    text-align: center;
}
.condition-area .search-area {
    margin-bottom: 0;
    border: 0;
    padding: 0;
    display: inline-block;
    text-align: left;
}
.search-area {
    position: relative;
    border: 1px solid #eaeaea;
    padding: 20px;
    text-align: center;
    margin-bottom: 30px;
}
.search-area:after {
    content: "";
    display: block;
    clear: both;
}
.search-area .input-style {
    width: 360px;
}
.condition-area .search-area .input-style.short {
    width: 320px;
}
[class*="input-style"] {
    display: inline-block;
    position: relative;
}
.search-area .input-style input {
    width: 100%;
}


/* 버튼 css */
[class*="btn-"].gray {
    background: #444;
    border: 1px solid #444;
    color: #fff;
}
[class*="btn-t"] {
    padding: 6px 10px;
    min-width: 60px;
    font-size: 14px;
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
input[type="button"], button {
    margin: 0;
    padding: 0;
    border: 0;
    cursor: pointer;
    background: none;
}



.search-area:after {
    content: "";
    display: block;
    clear: both;
}
.t-search-box > div {
    margin-top: 60px;
}
.t-search-box > div.t-search-msg {
    margin-top: 40px;
}
.t-search-box > div.t-search-msg p {
    font-size: 16px;
}
.t-search-box > div.t-search-msg p span {
    font-weight: bold;
}
.color-fantasy {
    color: rgba(46,87,255,1) !important;
}
.t-search-box .tab-area {
    margin-top: 20px;
}
.swiper-container {
    margin-left: auto;
    margin-right: auto;
    position: relative;
    overflow: hidden;
    z-index: 1;
}
.tab-area {
    position: relative;
    width: 100%;
}
.swiper-container-android .swiper-slide, .swiper-wrapper {
    -webkit-transform: translate3d(0px, 0, 0);
    -moz-transform: translate3d(0px, 0, 0);
    -o-transform: translate(0px, 0px);
    -ms-transform: translate3d(0px, 0, 0);
    transform: translate3d(0px, 0, 0);
}
.swiper-wrapper {
    position: relative;
    width: 100%;
    z-index: 1;
    display: -webkit-box;
    display: -moz-box;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    -webkit-transition-property: -webkit-transform;
    -moz-transition-property: -moz-transform;
    -o-transition-property: -o-transform;
    -ms-transition-property: -ms-transform;
    transition-property: transform;
    -webkit-box-sizing: content-box;
    -moz-box-sizing: content-box;
    box-sizing: content-box;
}
[class*="tab-st01"] {
    margin-bottom: 30px;
    border: 1px solid #eaeaea;
    background: #f9f9f9;
    box-sizing: border-box !important;
}
[class*="tab-st01"]:after {
    content: "";
    display: block;
    clear: both;
    width: 0;
    height: 0;
}
.t-search-box .tab-area + div {
    margin-top: 0;
}
.t-search-box .heading-wrap {
    min-height: 33px;
    overflow: visible;
}
.heading-wrap {
    overflow: hidden;
    padding-bottom: 5px;
}
.heading-wrap .tit-h2, .heading-wrap .tit-h3 {
    float: left;
}
.tit-h2 {
    font-size: 16px;
    margin-bottom: 10px;
    font-weight: bold;
}
.t-search-box .t-search-mem {
    border-top: #444 1px solid;
    padding: 10px 15px;
}
.t-search-box .t-search-mem li {
    line-height: 1.6;
    padding-bottom: 5px;
}
.t-search-box .t-search-mem li a {
    color: #000;
}
.t-search-box .more {
    background-color: #f9f9f9;
    text-align: center;
    border-bottom: #eaeaea 1px solid;
    border-top: #eaeaea 1px solid;
    /* margin-bottom: 60px; */
}
.t-search-box .more p {
    height: 40px;
    line-height: 40px;
}
.link-btn {
    position: relative;
    display: inline-block;
    padding-right: 18px;
    color: #af814d;
    font-size: 13px;
    font-weight: normal;
}
.t-search-box .search-jongmok > ul {
    border-top: #444444 1px solid;
}
.t-search-box .search-jongmok > ul > li {
    clear: both;
}
.t-search-box .search-jongmok ul li > p {
    position: relative;
    padding: 10px 10px 10px 10px;
    color: #000;
    border-bottom: #eaeaea 1px solid;
    box-sizing: border-box;
    width: 100%;
}
.t-search-box .search-jongmok ul li > p a {
    font-size: 16px;
    display: inline-block;
    color: #000;
}
.t-search-box .keyword {
    color: #1ea3fe;
    font-size: inherit;
}
.t-search-box .search-jongmok ul li > p .star {
    margin-left: 5px;
}
.t-search-box .search-jongmok ul li > p .star button {
    display: inline-block;
    width: 20px;
    height: 19px;
    background: url(/resources/img/star2.png) no-repeat 0 0;
    background-size: 20px 75px;
    text-indent: -9999em;
    margin-right: 10px;
}
.heading-wrap > p {
    float: right;
    font-size: 13px;
    color: #888;
}
.t-search-box .heading-wrap p > button.selected {
    color: rgba(46,87,255,1);
}
.t-search-box .heading-wrap p > button {
    color: #888888;
    margin-left: 10px;
    font-size: 14px;
}
.t-search-box .heading-wrap p > button i {
    font-size: 10px;
}
.t-search-box .search-posts {
    border-top: #444 1px solid;
}
.t-search-box .search-posts > ul > li {
    padding: 10px 15px;
    line-height: 1.6;
    border-bottom: #eaeaea 1px solid;
}
.t-search-box .search-posts > ul > li .crumb {
    font-size: 13px;
    color: #888;
    padding-bottom: 5px;
}
.t-search-box .search-posts > ul > li > a {
    font-size: 16px;
    color: #000;
    display: block;
    width: 100%;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.t-search-box b {
    color: #1ea3fe;
    font-size: inherit;
}
.t-search-box .search-posts > ul > li .info span {
    background: url(/resources/img/bg_line.png) no-repeat right 50%;
    padding-right: 10px;
    margin-right: 5px;
    font-size: 13px;
    color: #888;
    white-space: nowrap;
}
[class*="tab-st01"] li {
    position: relative;
    float: left;
    width: 50%;
}
.tab-st01.num07 li {
    width: 14.28%;
}
[class*="tab-st01"] li:after {
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    top: 0;
    z-index: 2;
}
[class*="tab-st01"] li.selected a {
    z-index: 3;
    background: #fff;
    line-height: 50px;
    color: rgba(46,87,255,1);
}
[class*="tab-st01"] li a {
    position: relative;
    z-index: 1;
    display: block;
    height: 50px;
    line-height: 50px;
    text-align: center;
    color: #000;
    border-right: 1px solid #eaeaea;
    background: #f9f9f9;
    box-sizing: border-box;
}
[class*="tab-st01"] li.selected a:after {
    content: "";
    position: absolute;
    left: -1px;
    right: -1px;
    bottom: -1px;
    border-bottom: 2px solid rgba(46,87,255,1);
}





@media only screen and (max-width: 979px){
.containerNew {
    padding-bottom: 160px;
    padding-top: 0;
}
.cont-area {
    margin: 0 auto;
    max-width: 950px;
    width: 100%;
    float: none;
}
.cont-area {
    min-height: auto;
    margin-right: 0;
    padding: 20px 0 120px;
    /* border-top: 10px solid #eff3f6; */
    max-width: none !important;
    width: 100% !important;
}
.cont-area h1 {
    display: none;
}
.t-search-box {
    padding-top: 0;
}
.condition-area {
    padding: 0;
    border-width: 1px 0 1px;
    border: none;
    border-bottom: #eaeaea 1px solid;
    border-bottom: #eff3f6 10px solid;
}
.condition-area .search-area {
    display: block;
    padding: 0 15px;
    min-height: 55px;
}
.search-area {
    border: 0;
    padding: 0 15px 15px;
    margin-bottom: 0;
    text-align: left;
}
.condition-area .search-area .input-style.short {
    width: 74%;
}
.search-area .input-style {
    width: 74%;
    float: left;
}
input[type="text"], input[type="password"], input[type="tel"] {
    padding: 9px 35px 10px 10px;
    height: 36px;
}
.t-search-box .search-area > button {
    width: 26%;
}
.search-area > button {
    width: 25%;
    float: right;
}
[class*="btn-t"] {
    padding: 10px 10px;
    min-width: 70px;
    font-size: 14px;
    height: 36px;
}
.t-search-box > div.t-search-msg {
    margin-top: 0;
    margin-bottom: 0;
    padding: 10px 15px;
}
.t-search-box > div {
    margin-top: 0;
    border-bottom: #eff3f6 10px solid;
    margin-bottom: 20px;
}
.t-search-box .tab-area {
    margin-top: 0;
    border-bottom: none;
}
.tab-area {
    border-bottom: 1px solid #eaeaea;
    background: url(/resources/img/tab_bg.png) repeat-x 0 bottom;
}
.tab-area {
    margin-top: -15px;
    width: 100%;
    height: 45px;
    margin-bottom: 20px;
}
.tab-area:after {
    content: "";
    display: block;
    clear: both;
    width: 0;
    height: 0;
}
[class*="tab-st01"] {
    overflow: hidden;
    position: relative;
    height: 44px;
    margin-bottom: 0;
    border: 0;
    background: #fff;
    z-index: 1;
}
[class*="tab-st01"] {
    overflow: visible;
    padding-left: 15px;
}
.tab-area:after {
    content: "";
    display: block;
    clear: both;
    width: 0;
    height: 0;
}
.t-search-box .heading-wrap {
    padding-left: 15px;
    padding-right: 15px;
}
.heading-wrap {
    padding-right: 15px;
}
.t-search-box .search-jongmok ul li > p {
    display: block;
}
.t-search-box .heading-wrap p {
    float: none;
    clear: both;
}
.t-search-box .heading-wrap p button:first-child {
    margin-left: 0;
}
.t-search-box .heading-wrap p button {
    font-size: 13px;
}
.t-search-box .search-posts > ul > li > a {
    font-size: 14px;
}
.tab-st01.num07 li {
    width: auto;
}
[class*="tab-st01"] li {
    width: auto;
    margin-bottom: 10px;
}
[class*="tab-st01"] li.selected a {
    height: 43px;
    line-height: 43px;
}
[class*="tab-st01"] li a {
    height: 43px;
    line-height: 43px;
    border-bottom: 0;
    padding: 0 10px;
    background: none;
    border-right: 0;
    min-width: 50px;
}
[class*="tab-st01"] li.selected a:after {
    bottom: -2px;
}
[class*="tab-st01"] li.selected a:after {
    border-bottom: 1px solid rgba(46,87,255,1);
}
}
</style>
</head>
<body>

<%@include file="mainheader.jsp"%>
<%-- 	<table border="1px">종목 검색결과
		<tr>
			<td>종목명</td>
		</tr>
		<c:forEach items="${stock}" var="list">
			<tr onClick="location.href='${pageContext.request.contextPath}/trade?stockName=${list.stockName}'">
				<td class="first" title="주문번호" ><c:out value="${list.stockName}" /></td>
			</tr>
		</c:forEach>
	</table>

	<table border="1px">자유게시판 검색결과
		<tr>
			<td>글번호</td>
			<td>작성자</td>
			<td>제목</td>
		</tr>
		<c:forEach items="${free}" var="list">
			<tr onClick = "location.href='${pageContext.request.contextPath}/board/free/detail?pno=${list.pno}'">
				<td class="first" title="주문번호"><c:out value="${list.pno}" /></td>
				<td title="작성자"><c:out value="${list.nickname}" /></td>
				<td title="제목"><c:out value="${list.title}" /></td>
			</tr>
		</c:forEach>
	</table>
	
	<table border="1px">포릍폴리오 검색결과
		<tr>
			<td>글번호</td>
			<td>작성자</td>
			<td>제목</td>
		</tr>
		<c:forEach items="${port}" var="list">
			<tr onClick = "location.href='${pageContext.request.contextPath}/board/portfolio/detail?pno=${list.pno}'">
				<td class="first" title="주문번호"><c:out value="${list.pno}" /></td>
				<td title="작성자"><c:out value="${list.nickname}" /></td>
				<td title="제목"><c:out value="${list.title}" /></td>
			</tr>
		</c:forEach>
	</table> --%>
	
<div class="containerNew">
<div class="cont-area toggle_wrap">
		<h1 class="hidden">통합검색</h1>
		
		<div class="t-search-box">

<form id="frmData" method="get" action="/search/home">
<input type="hidden" name="currentPageNo" id="currentPageNo" value="1">	
<input type="hidden" name="searchType" id="searchType" value="">
<input type="hidden" name="order" id="order" value="">
<input type="hidden" name="memberCustId" id="memberCustId" value="ihdah">
<input type="hidden" name="dateGubun" id="dateGubun_frm" value="">
<input type="hidden" name="subTab" id="subTab" value="">

<fieldset>

	<legend>통합검색 검색어입력 영역</legend>
	<div class="condition-area">
		<div class="search-area">
			<span class="input-style short">
				<input type="text" placeholder="검색어 입력" name="kwd" id="kwd" value="삼성" onkeyup="enter();">
			</span>
			<button type="button" class="btn-t gray" onclick="frmSubmit();">통합검색</button>
		</div>
	</div>
	</fieldset>
</form>

            <div class="t-search-msg">
                <p>
                    
                    
                    ‘<span class="color-fantasy">삼성</span>’
                    (으)로 검색한 결과입니다.
                </p>
            </div>
	
	
		










<!-- //검색결과없음 -->
<div class="tab-area swiper-container swiper-container-horizontal" style="cursor: grab;">
	<ul class="tab-st01 num07 swiper-wrapper" style="width: auto;">
		<li class="selected swiper-slide"><a href="javascript:goTab('');" style="width: 100%;">통합검색</a></li>
		<li class="swiper-slide"><a href="javascript:goTab('1');" style="width: 100%;">종목</a></li>
		<li class="swiper-slide"><a href="javascript:goTab('2');" style="width: 100%;">뉴스</a></li>  
		<li class="swiper-slide"><a href="javascript:goTab('3');" style="width: 100%;">커뮤니티</a></li>
		<li class="swiper-slide"><a href="javascript:goTab('4');" style="width: 100%;">카페</a></li>
		<li class="swiper-slide"><a href="javascript:goTab('5');" style="width: 100%;">전문가</a></li>
		<li class="swiper-slide"><a href="javascript:goTab('6');" style="width: 100%; border-right: none;">회원</a></li>
	 <li class="swiper-slide forMobile"></li></ul> 
</div> 
		



		
			<div>
				<div class="heading-wrap">
					<h2 class="tit-h2">종목 <span class="color-fantasy">98</span>건</h2>
				</div>
				<div class="search-jongmok">
					<ul id="ulJongmok">
					
					<li class="liChk clicked" id="_li_1_1">
							<p>
								
								<a href="javascript:goJongmokHome('530031')"><i class="keyword">삼성</i> 레버리지 WTI원유 선물 ETN 530031</a>
								
								<span class="star"><button type="button" id="_btn_1_1" onclick="fncAnalysisPopupSearch('1_1','530031');" class="_star530031 ">관심종목 추가</button></span>
								
								
							</p>
							
					</li>
					
					<li class="liChk " id="_li_1_2">
							<p>
								
								<a href="javascript:goJongmokHome('005930')"><i class="keyword">삼성</i>전자 005930</a>
								
								<span class="star"><button type="button" id="_btn_1_2" on
								click="fncAnalysisPopupSearch('1_2','005930');" class="_star005930 ">관심종목 추가</button></span>
								
								
							</p>
						</li>
					
					<li class="liChk " id="_li_1_3">
							<p>

								<a href="javascript:goJongmokHome('530036')"><i class="keyword">삼성</i> 인버스 2X WTI원유 선물 ETN 530036</a>
								
								<span class="star"><button type="button" id="_btn_1_3" onclick="fncAnalysisPopupSearch('1_3','530036');" class="_star530036 ">관심종목 추가</button></span>

							</p>
						</li>
					</ul>	
				</div>
				
				<div class="more">
					<p><a href="javascript:goTab('1');" class="link-btn tyb">종목 더보기<i class="fas fa-angle-right"></i></a></p>
				</div>
				
			</div>
			<!-- //종목 -->
		

		
		


		
			<div>
				<div class="heading-wrap">
					<h2 class="tit-h2">커뮤니티 <span class="color-fantasy">17,760</span>건</h2>
					<p>
						<button type="button" class="selected" onclick="setHomeOrder('3','0','');">정확도순 <i>▼</i></button>
						<button type="button" onclick="setHomeOrder('3','1','');">최신순 <i>▼</i></button>
						<button type="button" onclick="setHomeOrder('3','2','');">좋아요 <i>▼</i></button>
					</p>
				</div>
				<div class="search-posts">
					<ul>	
						
						<li>
							<p class="crumb">
							선물옵션 &gt; 선물옵션 토론실
							</p>
							<a href="http://www.paxnet.co.kr/tbbs/view?id=N00401&amp;seq=150357583260308"><b>삼성</b>증건사가 마비됩니다 <b>삼성</b>전자 사러 <b>삼성</b>증건으로 가서</a>
							<p class="info">
								<span>금김대성</span>
								<span>2020.04.01</span>
								<span>댓글수 1</span>
								<span>좋아요 2</span>
							</p>
						</li>	
						
						<li>
							<p class="crumb">
							커뮤니티 &gt; 강추이종목
							</p>
							<a href="http://www.paxnet.co.kr/tbbs/view?id=N00820&amp;seq=150357582757592"><b>삼성</b>중공업[특징주] <b>삼성</b>중공업, 1조8천억 규모 LNG선 수주 소식에 강세 - 무조건 수혜네요 팩트 *대창솔루션 <b>삼성</b>중공업 LNG운반선 기</a>
							<p class="info">
								<span>청산백옥</span>
								<span>2019.11.25</span>
								<span>댓글수 0</span>
								<span>좋아요 0</span>
							</p>
						</li>
						
						<li>
							<p class="crumb">
							종목입체분석 &gt; 대창솔루션 &gt; 종목토론
							</p>
							<a href="http://www.paxnet.co.kr/tbbs/view?id=096350&amp;seq=150357582757593"><b>삼성</b>중공업[특징주] <b>삼성</b>중공업, 1조8천억 규모 LNG선 수주 소식에 강세 - 무조건 수혜네요 팩트 *대창솔루션 <b>삼성</b>중공업 LNG운반선 기</a>
							<p class="info">
								<span>청산백옥</span>
								<span>2019.11.25</span>
								<span>댓글수 0</span>
								<span>좋아요 0</span>
							</p>
						</li>					
						<li>
							<p class="crumb">
							종목입체분석 &gt; 삼성전자 &gt; 종목토론
							</p>
							<a href="http://www.paxnet.co.kr/tbbs/view?id=005930&amp;seq=150357582254154">일본이 수출규제는 <b>삼성</b>전자 비메모리반도체 133조억원 투자로 엄청 커가는것에대한 두러움에서 <b>삼성</b>전자 비메모리반도체 방해공작이라</a>
							<p class="info">
								<span>goog대박</span>
								<span>2019.07.04</span>
								<span>댓글수 0</span>
								<span>좋아요 2</span>
							</p>
						</li>					
						<li>
							<p class="crumb">
							종목입체분석 &gt; 삼성전자 &gt; 종목토론
							</p>
							<a href="http://www.paxnet.co.kr/tbbs/view?id=005930&amp;seq=150357582248049">일본 족발이색끼들이 한국에 <b>삼성</b>,하이닉스 잘못 걸들린것이여 <b>삼성</b>전자,하이닉스 일본으로 수출되는 반도체 중단시 일본 가전제품 80%</a>
							<p class="info">
								<span>goog대박</span>
								<span>2019.07.02</span>
								<span>댓글수 0</span>
								<span>좋아요 3</span>
							</p>
						</li>		
					</ul>
				</div>
				<div class="more">
					<p><a href="javascript:goTab('3');" class="link-btn tyb">커뮤니티 더보기<i class="fas fa-angle-right"></i></a></p>
				</div>
			</div>
			<!-- //커뮤니티 -->							

				
			<div>
				<div class="heading-wrap">
					<h2 class="tit-h2">회원 <span class="color-fantasy">760</span>건</h2>
				</div>
				<div class="t-search-mem">
					<ul>
					
						<li><a href="javascript:goMemberBbs('brownivy','삼성삼성삼성');"><strong><i class="keyword">삼성</i><i class="keyword">삼성</i><i class="keyword">삼성</i>님</strong>이 쓴 글 모두보기</a></li>
					
						<li><a href="javascript:goMemberBbs('tlsalstn','삼성동삼성팬');"><strong><i class="keyword">삼성</i>동<i class="keyword">삼성</i>팬님</strong>이 쓴 글 모두보기</a></li>
					
						<li><a href="javascript:goMemberBbs('fullhouse','삼성산');"><strong><i class="keyword">삼성</i>산님</strong>이 쓴 글 모두보기</a></li>
					
						<li><a href="javascript:goMemberBbs('kalcular','삼성동깡소주');"><strong><i class="keyword">삼성</i>동깡소주님</strong>이 쓴 글 모두보기</a></li>
					
						<li><a href="javascript:goMemberBbs('narc777','삼성전설천황');"><strong><i class="keyword">삼성</i>전설천황님</strong>이 쓴 글 모두보기</a></li>
					
					</ul>
				</div>
				
				<div class="more">
					<p><a href="javascript:goTab('6');" class="link-btn tyb">회원 더보기<i class="fas fa-angle-right"></i></a></p>
				</div>
			</div>		

			<!-- //회원 -->  
							
		</div>
		

	</div>
</div>


<%@include file="mainfooter2.jsp"%>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
</body>
</html>