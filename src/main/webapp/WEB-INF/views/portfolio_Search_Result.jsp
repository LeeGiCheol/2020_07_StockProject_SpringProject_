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
		<li class="swiper-slide"><a href="javascript:goTab('1');" style="width: 100%;">종목</a></li>
		<li class="swiper-slide"><a href="javascript:goTab('2');" style="width: 100%;">자유게시판</a></li>  
		<li class="selected swiper-slide"><a href="javascript:goTab('3');" style="width: 100%;">포트폴리오</a></li>
		<li class="swiper-slide"><a href="javascript:goTab('6');" style="width: 100%; border-right: none;">회원</a></li>
	</ul>
</div> 


	
			<div>
				<div class="heading-wrap">
					<h2 class="tit-h2">포트폴리오 <span class="color-fantasy">17,760</span>건</h2>
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