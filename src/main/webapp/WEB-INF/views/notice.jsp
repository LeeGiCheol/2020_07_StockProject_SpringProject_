<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script><!-- sweetalert -->
</head>
<body>
	<script>
		var msg = "${msg}";
		if(msg == "로그인 성공!"){
			swal({title:"환영합니다", text:"${msg}", icon:"success"}).then(function() {
				window.location = "${location}";
	    	});
		}else{
			swal({text:"${msg}", icon:"error"}).then(function() {
				window.location = "${location}";
	    	});
		}
	</script>
</body>
</html>