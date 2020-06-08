<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 상세조회</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- CSS파일 -->
<link href="/resources/css/free-board-detail1.css" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="jpaginate/style.css"/> -->

<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script src="/resources/jpaginate/jQuery.paginate.js"></script>
<script src="https://www.jsviews.com/download/jsrender.js"></script>

<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">

<script>
	$(document).ready(function() {
		$("#btnDelete").click(function() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				location.href = '/board/free/delete?pno=${boardDetail.pno}';
			} else {
				alert("취소하셨습니다.");
			}
		})
	});
</script>
<style>
div>ul>li {
	width: 380px;
}
</style>
</head>

<body>

<%@include file="mainheader.jsp" %> 

	<!-- article start -->
	<!-- 상단메뉴 -->
	<div class="sideBar col-md-4 order-md-2 mb-4" id="menu-bar">
		<ul class="list-group mb-3">
			<!-- java에서 온클릭 위치 바꾸기!!!!!!!!!!!!!!!!!!!-->
			<li
				class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed free-board"
				onclick="location.href='free-board.jsp'">
				<div>
					<h6 class="my-0">자유 게시판</h6>
				</div>
			</li>
			<li
				class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed news-borad"
				onclick="location.href='newsboard.jsp'">
				<div>
					<h6 class="my-0">뉴스 게시판</h6>
				</div>
			</li>
			<li
				class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed protfolio-board"
				onclick="location.href='#'">
				<div>
					<h6 class="my-0">포트폴리오 게시판</h6>
				</div>
			</li>
		</ul>
	</div>
	<!-- 상단메뉴 끝 -->
	<article class="bg-light container">
		<div class="allBody">
			<div class="row">
				<div class="sideBar col-md-4 order-md-2 mb-4">
					<div class="col-md-8 order-md-1"></div>
					<hr>
					<div id="boardList">
						
					</div>
				</div>
			</div>
		</div>
		<div>
		<h2 id='commentBody' class='comment-title'>댓글</h2>
		
		<!-- 댓글 -->
		<div id="commentList">
		</div>
		
		<!-- 댓글 페이징 -->
		<div id="commentPaging">
		</div>


			<hr>
			<div class="comment-wrap">
				<div>
					<div class="comment-form">
						<form action="/board/writeComment" method="POST" id="commentForm">
							<fieldset>
								<dl class="comment-write">
									<dt>
										<label for="[##_comment_input_comment_##]">내용</label>
									</dt>
									<dd>
										<input type="hidden" name="pno" value="${boardDetail.pno}">
										<textarea name="ccontent" id="[##_comment_input_comment_##]"
											placeholder="여러분의 소중한 댓글을 입력해주세요"></textarea>
									</dd>
								</dl>
								<button type="button" class="reply-btn" onClick="writeComment('${boardDetail.pno }')">댓글 남기기</button>
							</fieldset>
						</form>




					</div>
				</div>
				<div class="buttons">
					<button type="button" class="btn btn-sm btn-primary" id="btnList"
						onclick="window.location.href='free-board.jsp'">목록</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnMyList"
						onclick="window.location.href='mypage03.jsp'">내가 쓴글</button>

					<c:if test="${loginUser.nickname eq boardDetail.nickname}">
						<button type="button" class="btn btn-sm btn-primary"
							id="btnUpdate"
							onclick="location.href='/board/free/update?pno=${boardDetail.pno}'">수정</button>
						<button type="button" class="btn btn-sm btn-primary"
							id="btnDelete">삭제</button>
					</c:if>
				</div>
			</div>
	
		</div>
		
		
		
		
		<!-- 댓글 끝 -->
	</article>

	<!-- article end -->

<%@include file="mainfooter.jsp" %>


<script>

		
		$(function(){
	    	list()

	    })
	    
	    // 목록 뿌리기
	    function list(){
	    
	    
		var pno = ${boardDetail.pno}
		var page = "&bnowPage="+${commentPage.nowPage}
		
			console.log(page)
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/board/free/detail/ajax?pno='+pno + page,
				dataType : 'json',
				contentType : "application/x-www-form-urlencoded;chartset=UTF-8",
				success : function(data){ 
				
					// 게시판상세보기
					var board = "";
					var boardTitle = data.boardDetail.title
					var boardNickname = data.boardDetail.nickname
					var boardDatetime = data.boardDetail.bdateTime
					var boardContent = data.boardDetail.bcontent
						
					board +=	'<div class="notice-header">'
					board +=		'<div class="title-wrap">'
					board +=			'<p class="category-info"></p>'
					board +=			'<h2 id="" class="notice-title">'+boardTitle+'</h2>'
					board +=		'</div>'
					board +=		'<div class="info-wrap">'
					board +=			'<ul class="notice-info">'
					board +=				'<li class="author">'
					board +=					'<i class="fa fa-user-circle"></i>'+boardNickname
					board +=				'</li>'
					board +=				'<li class="date">'
					board +=					'<i class="far fa-clock"></i>'+boardDatetime
					board +=				'</li>'
					board +=			'</ul>'
					board +=		'</div>'
					board +=		'<div class="article">'+boardContent
					board +=		'</div>'
					board +=	'</div>'
					board +=	'<hr>'
							
					
					$("#boardList").html(board)
	

					// 댓글
					var comment= "";
					
					for(var i=0; i<data.commentList.length; i++){
						
						comment += "<div class='commentBody'>"
						comment += "<i class='fa fa-user-circle'></i> <b>"+data.commentList[i].nickname+"</b><br>"
						comment += "<i class='far fa-clock'></i>"+data.commentList[i].cdataTime+"<br> <br>"
						comment += data.commentList[i].ccontent
						comment += "</div>"
	
						$("#commentList").empty().html(comment)
					}	
					
					
					// 페이징처리
					var commentPaging = "";
					
					// 댓글이 4개 이상일 때 띄우기
	 				if(data.commentPage.total >= 4) {
	 					commentPaging += '<nav aria-label="..." class="pagination">' 
						commentPaging += '<ul class="pagination">' 
						
						
						// 1페이지가 아니면
	 					if(data.commentPage.nowPage != 1){
	 						
	 						// << 버튼 
	 						commentPaging +=	'<li>'
	 						commentPaging +=		'<a class="page-link"'
	 						commentPaging +=			'href="/board/free/detail?pno=${boardDetail.pno}&bnowPage=1"'
	 						commentPaging +=			'tabindex="-1" aria-disabled="true">'
	 						commentPaging +=			'<i class="fas fa-angle-double-left"></i>'
	 						commentPaging +=		'</a>'
	 						commentPaging +=	'</li>'
	 						
	 						// < 버튼
			 				commentPaging +=	'<li>'
		 					commentPaging +=		'<a class="page-link"'
							commentPaging +=			'href="/board/free/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.nowPage-1}"'
							commentPaging +=			'tabindex="-1" aria-disabled="true">'
							commentPaging +=			'<i class="fas fa-angle-left"></i>'
							commentPaging +=		'</a>'
							commentPaging +=	'</li>'
	 					}
						
						// 한번에 5개 페이지 보여줌
						for(var i=data.commentPage.startPage; i<=data.commentPage.endPage; i++){
							if(i == data.commentPage.nowPage){
								commentPaging +=	'<li class="page-item active" aria-current="page">'
								commentPaging +=			'<a class="page-link" href="#">'+i
								commentPaging +=				'<span class="sr-only">(current)</span>'
								commentPaging +=				'</a>'
								commentPaging +=		'</li>'
							}
							if(i != data.commentPage.nowPage){
								commentPaging +=	'<li class="page-item">'
								
								commentPaging +=	"<a class='page-link' href='/board/free/detail?pno="+data.boardDetail.pno+"&bnowPage="+i+"'>"+i+"</a>"
							
								commentPaging +=	'</li>'
							}
						}
						
						
						// 마지막페이지아닐때
						if(data.commentPage.nowPage != data.commentPage.lastPage){
							commentPaging += '<li>'
							commentPaging += 	'<a class="page-link"'
							commentPaging += 		"href='/board/free/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.nowPage+1}'"
							commentPaging += 		'tabindex="+1" aria-disabled="true" data-ajax="false">'
							commentPaging += 			'<i class="fas fa-angle-right"></i>'
							commentPaging += 	'</a>'
							commentPaging += '</li>'
							
							// >> 버튼
							commentPaging += '<li>'
							commentPaging += '<a class="page-link"'
							commentPaging += "href='/board/free/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.lastPage}'"						
							commentPaging += 'tabindex="-1" aria-disabled="true">'
							commentPaging += 		'<i class="fas fa-angle-double-right"></i>'
							commentPaging += 	'</a>'
							commentPaging += '</li>'
						}
						
	 					$("#commentPaging").empty().html(commentPaging)
 					} 
	 			},
				error : function(error, data){
					console.log(data)
					console.log(error)
					alert('error!!'); 
				}
			});
	    }
			

	   // 댓글등록
		function writeComment(pno){
		    
		    $.ajax({
		        type:'POST',
		        url : "${pageContext.request.contextPath}/board/writeComment",
		        data:$("#commentForm").serialize(),
		        success : function(data){
		            if(data=="success"){
		                list();
		                $("#ccontent").val("");
		            }
		        },
		        error:function(request,status,error){
		        	console.log(error)
		       }
		        
		    });
		}
	   


	
</script>
<!--  
<script id="commnet" type="text/x-jsrender">
		<div class='commentBody'>
		<i class='fa fa-user-circle'></i> <b>{{:nickname}}</b><br>
		<i class='far fa-clock'></i>{{:cdataTime}}<br> <br>
		{{:ccontent}}
		</div>
</script>

-->

</body>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>