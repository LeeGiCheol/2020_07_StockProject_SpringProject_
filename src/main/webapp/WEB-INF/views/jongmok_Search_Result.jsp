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
<link rel="stylesheet" href="/resources/css/total-search-result.css">
<link rel="stylesheet" href="/resources/css/mainheader2.css">
<link rel="stylesheet" href="/resources/css/mainfooter.css">
<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
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
		<li class="swiper-slide"><a href="javascript:goTab('');" style="width: 100%;">통합검색</a></li>
		<li class="selected swiper-slide"><a href="javascript:goTab('1');" style="width: 100%;">종목</a></li>
		<li class="swiper-slide"><a href="javascript:goTab('2');" style="width: 100%;">자유게시판</a></li>  
		<li class="swiper-slide"><a href="javascript:goTab('3');" style="width: 100%;">포트폴리오</a></li>
		<li class="swiper-slide"><a href="javascript:goTab('6');" style="width: 100%; border-right: none;">회원</a></li>
	</ul>
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
								
								<span class="star"><button type="button" id="_btn_1_2" onclick="fncAnalysisPopupSearch('1_2','005930');" class="_star005930 ">관심종목 추가</button></span>
								
								
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
			</div>
			<!-- //종목 -->
							
		</div>
		

	</div>
	
	<div class="message-wrap">
		<div class="message-st-01">
			<p class="big-text">
				조회하는 단어와 일치하는 <span> 데이터가 없습니다.</span><br> 
				<span class="color-fantasy">다른 검색어로 검색해 보세요.</span>
			</p>
		</div>
	</div>

</div>


<%@include file="mainfooter2.jsp"%>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
</body>
</html>