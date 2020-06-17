<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보유 주식</title>
</head>
<body>
	<table border="1px">
		<tr>
			<td>종목명</td>
			<td>수량</td>
			<td>평균 단가</td>
		</tr>
		<c:forEach items="${pageHoldingStock}" var="list">
			<tr>
				<td class="first" title="종목명"><c:out value="${list.stockName}" /></td>
				<td title="수량"><c:out value="${list.quantity}" /></td>
				<td title="평균 단가"><c:out value="${list.avgprice}" /></td>
			</tr>
		</c:forEach>
	</table>

	<c:forEach var="i" begin="0" end="${(total-1)/15}">
		<a href="/trade_history?page=${i+1}">${i+1}</a>
	</c:forEach>

</body>
</html>