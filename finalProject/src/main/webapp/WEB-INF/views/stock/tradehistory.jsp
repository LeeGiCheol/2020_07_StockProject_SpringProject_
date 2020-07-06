<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 기록</title>
</head>
<!-- 모달css -->
<link rel="stylesheet" href="/resources/css/modal.css">
<body>
<div id="history" class="stockModal">
	<table>
	<thead>
		<tr>
			<th>주문번호</th>
			<th>구분</th>
			<th>종목명</th>
			<th>주문단가</th>
			<th>수량</th>
			<th>거래 일시</th>
		</tr>
		</thead>
		<c:forEach items="${pageHistory}" var="list">
			<tr>
				<td class="first" title="주문번호"><c:out value="${list.tno}" /></td>
				<td title="구분"><c:out value="${list.category}" /></td>
				<td title="종목명"><c:out value="${list.stockName}" /></td>
				<td title="주문단가"><c:out value="${list.tprice}" /></td>
				<td title="주문수량"><c:out value="${list.quantity}" /></td>
				<td title="거래일시"><fmt:formatDate value="${list.tdatetime}"
						pattern="yyyy-MM-dd HH:mm:ss" /></td>
			</tr>
		</c:forEach>
	</table>

	<c:forEach var="i" begin="0" end="${(total-1)/15}">
		<a class="page" href="/trade_history?page=${i+1}">${i+1}</a>
	</c:forEach>
</div>
</body>
</html>