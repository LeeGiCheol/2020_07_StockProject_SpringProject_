<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>포르폴리오 글쓰기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- CSS파일 -->
<style>
.ck-blurred, .ck-focused{height: 500px;}

</style>
<link href="/resources/css/portfolio-writeForm.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>

<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">

<script>
$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});
	
	$(document).on(
		'click',
		'#btnList',
		function(e) {
		e.preventDefault();
		location.href = "${pageContext.request.contextPath}/board/getBoardList";
});
      
</script>
</head>
<body>

<%@include file="mainheader.jsp" %> 	

  <article>
		<div class="container" role="main">
			<h2 class="main">포트폴리오 글작성</h2>
			<br>
			<br>
			<br>
			<form name="form" id="form" role="form" method="post" action="">
               <div class="mb-3 title">
                    <label for="title"><b>제목</b></label>
                    <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요" required>
               </div>
               <div class="mb-3 title">
                    <label for="writer"><b>작성자</b></label>
                    <input type="text" class="form-control" name="writer" id="writer" value="${loginUser.nickname}" readonly>
               </div>
			   <div class="mb-3">
					<label for="content"><b>내용</b></label>
					<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요"></textarea>
			   </div>
			</form>
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave" >저장</button>
                <button type="button" class="btn btn-sm btn-primary" id="btnCancle" onclick="window.location.href='portfolio-board.jsp'">취소</button>
			</div>
		</div>
	</article>  

<%@include file="mainfooter.jsp" %>	

</body>
<script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script> <!-- 글쓰기 메뉴들 -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</html>