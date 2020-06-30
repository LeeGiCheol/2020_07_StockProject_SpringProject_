<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보유 주식</title>
</head>
<!-- 모달css -->
<link rel="stylesheet" href="/resources/css/modal.css">
<body>

<div id="own" class="stockModal">
	<table>
	<thead>
		<tr>
			<th>종목명</th>
			<th>수량</th>
			<th>평균 단가</th>
		</tr>
		</thead>
		<c:forEach items="${pageHoldingStock}" var="list">
			<tr>
				<td class="first" title="종목명"><c:out value="${list.stockName}" /></td>
				<td title="수량"><c:out value="${list.quantity}" /></td>
				<td title="평균 단가"><c:out value="${list.avgprice}" /></td>
			</tr>
		</c:forEach>
	</table>

	<c:forEach var="i" begin="0" end="${(total-1)/15}">
		<a class="page" href="/trade_history?page=${i+1}">${i+1}</a>
	</c:forEach>
</div>

</body>
</html>