<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1px">종목 검색결과
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
	
	<table border="1px">포트폴리오 검색결과
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
	</table>


	<table border="1px">닉네임 검색결과
		<tr>
			<td>닉네임</td>
		</tr>
		<c:forEach items="${nick}" var="list">
			<tr onClick = "location.href='${pageContext.request.contextPath}/selectUserMoney?nickname=${list.nickname}'">
				<td title="닉네임"><c:out value="${list.nickname}" /></td>
			</tr>
		</c:forEach>
	</table>
	


</body>
</html>