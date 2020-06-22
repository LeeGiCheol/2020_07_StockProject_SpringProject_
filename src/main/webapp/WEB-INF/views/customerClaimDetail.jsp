<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1 문의 내역</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- CSS파일 -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="/resources/css/mainfooter3.css">
<link rel="stylesheet" href="/resources/css/mainheader2.css">

<link rel="stylesheet" href="/resources/css/free-board.css">
  <link rel="stylesheet" href="/resources/css/sidebar.css">
 
</head>
<body>

	<%@include file="mainheader.jsp"%>
	<div class="cont-area">
		<h1 class="tit-h1">Q&amp;A</h1>

		<div class="qna-desc">
			<strong class="import">서비스 이용중 궁금한 내역이 있으시면, 언제든지 문의해주세요!</strong>
			<span class="time">1:1로 접수 주시면 빠른답변을 받아보실 수 있습니다. 평일 08:30~17:30</span>
			<a href="javascript:pageMove('serviceInqryInsert');" class="inquiry">1:1문의</a>
		</div>
		<!-- // qna-desc -->

		<h2 class="tit-h2 type mopad">문의내역</h2>
		<div class="table-scroll-no">
			<table class="table-row">
				<caption>Q&amp;A 상세내용 : 처리현황, 아이디, 제목, 내용에 대한 정보</caption>
				<colgroup>
					<col style="width:25%;">
					<col style="width:75%;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">처리현황</th>
						<td><span class="ing">준비중</span></td>
					</tr>
					<tr>
						<th scope="row">아이디</th>
						<td>n_1592798761</td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td>ㄹㅎㅇㅎㄴㅎㅇㅎ</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td><div><p>ㅎㄹㅇㅎㄴ호롱ㄴ <br></p></div></td>
					</tr>
				</tbody>
			</table>
			<!-- //table-row -->
		</div>
		<!-- // table-scroll-no -->

		
			<div class="answer-box">
				<strong class="tit">문의주신 내역에 대한 답변입니다.</strong>
				
				
					<div class="answer no-answer">
						죄송합니다. 운영자의 답변이 아직 기재되지 않았습니다.<br>
						24시간이 경과한 이후에도 답변이 없다면, 다시 문의하여 주시기 바랍니다. 빠른 시간안에 답변을 드리겠습니다.
					</div>
					
					
					<div class="answer no-answer">
						
					
					
					</div>
				
					
			</div>	
		
		
		<!-- // answer-box -->

		<div class="bt-area">
			<span>
				<a href="javascript:pageMove('serviceInqry');" class="btn-s">목록</a>
				<a href="javascript:eventAjax('삭제','serviceInqryDelAjax');" class="btn-s red">삭제</a>
			</span> 
		</div>

	</div>


	<%@include file="mainfooter2.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="/resources/jpaginate/jquery.twbsPagination.js"
	type="text/javascript"></script>
</html>