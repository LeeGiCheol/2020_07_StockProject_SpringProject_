<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
</head>
<body>

<script>
	$(document).ready(function() {
		$.ajax({
			type : 'GET',
			url : "${pageContext.request.contextPath}/naverUnlock",
			success : function(data) {
				console.log(data)
				location.href=data
			}
		})
	})
	window.onload= function(){
		location.href="/mainPage"
	}
</script>
</body>
</html>