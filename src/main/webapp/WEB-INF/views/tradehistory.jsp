<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 기록</title>
</head>
<body>
	<table border="1px">
		<tr>
			<td>주문번호</td>
			<td>구분</td>
			<td>종목명</td>
			<td>주문단가</td>
			<td>수량</td>
			<td>거래 일시</td>
		</tr>
	<c:forEach items="${history}" var="list">
		<tr>
			<td class="first" title="주문번호"><c:out value="${list.tno}" /></td>
			<td title="구분"><c:out value="${list.category}" /></td>
			<td title="종목명"><c:out value="${list.stockName}" /></td>
			<td title="주문단가"><c:out value="${list.tprice}" /></td>
			<td title="주문수량"><c:out value="${list.quantity}" /></td>
			<td title="거래일시"><fmt:formatDate value="${list.tdatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>