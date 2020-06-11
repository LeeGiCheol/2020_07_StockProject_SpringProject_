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
<link href="/resources/css/free-board-detail.css" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="jpaginate/style.css"/> -->

<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script src="/resources/jpaginate/jQuery.paginate.js"></script>
<script src="https://www.jsviews.com/download/jsrender.js"></script>

<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">

<script>
	$(document).ready(function() {
		
		setTimeout(function() {
			var w = $(".image").children().width();
			var h = $(".image").children().height();
			
			if(w > 1024){
				var ri = 1024/w;
				w = w * ri;
				h = h * ri;
			}
			var a_h = $(".article").children().height();
			var a_w = $(".article").children().width();
			
			console.log(w+" / "+h+" && "+ a_w+" / "+ a_h);
			$(".image").children().width(w);
			 $(".image").children().height(h);
			
		}, 50);
		
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

html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video, button, a {
    font-family: 'Noto Sans KR', sans-serif;
}

html, body, div, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote,
   pre, abbr, address, cite, code, del, dfn, img, ins, kbd, q, samp, small,
   var, i, dl, dt, dd, ol, ul, li, fieldset, form, legend, table, caption,
   tbody, tfoot, thead, tr, article, aside, canvas, details, figcaption,
   figure, footer, header, hgroup, menu, nav, section, summary, time,
   audio, video {
   margin: 0;
   padding: 0;
   border: 0;
   vertical-align: baseline;
   font-size: 14px;
   background: transparent;
   list-style: none;
   box-sizing: border-box;
   word-break: break-all;
}

span, em, mark, strong, b, label {
   margin: 0;
   padding: 0;
   border: 0;
   vertical-align: baseline;
   background: transparent;
   list-style: none;
   box-sizing: border-box;
}

em, i {
   font-style: normal;
}

a, a:link, a:visited, a:active, a:hover {
   text-decoration: none;
}

p {
    line-height: 160%;
}

.table td, .table th {
    padding: 6px;
}
tr td button{
	background: transparent;
	border: none;
	margin: 0;
	padding: 0;
} 
.table{
	margin-bottom: 0;
}
.containerNew{
position: relative;
    max-width: 1260px;
    height: 100%;
    padding: 20px 0 0 0;
    margin: 0 auto;
}
@media (max-width: 979px)
.containerNew {
    padding-top: 104px;
}
@media only screen and (max-width: 979px)
.containerNew {
    padding: 0;
    padding-bottom: 170px;
}
</style>
</head>

<body>

<%@include file="mainheader.jsp" %> 
	
	<div class="containerNew">
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
								<button type="button" class="reply-btn" onclick="writeComment('${boardDetail.pno }')">댓글 남기기</button>
							</fieldset>
						</form>




					</div>
				</div>
				<div class="buttons">
					<button type="button" class="btn btn-sm btn-primary" id="btnList"
						onclick="window.location.href='/board/free'">목록</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnMyList"
						onclick="window.location.href='/myPage03'">내가 쓴글</button>

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
	    
	    var like = "좋아요";
	    
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
					console.log(data)
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
					board +=					'<i class="far fa-clock"></i>'+changeDate(boardDatetime)
					board +=				'</li>'
					board +=			'</ul>'
					board +=		'</div>'
					board +=		'<div class="article">'+boardContent
					board +=		'<div style="position:absolute; bottom:0px;"><span id="likes"><button id="likesBtn" onclick="updateLikes('+data.boardDetail.pno+')">'+like+'</button>'+data.boardDetail.likes+'</span></div>'
					board +=		'</div>'
					board +=	'</div>'
					board +=	'<hr>'
							
					
					$("#boardList").html(board)
	

					// 댓글
					var comment= "";
					
					
					for(var i=0; i<data.commentList.length; i++){
						
						comment += "<div class='commentBody' id= 'comment" + data.commentList[i].cno + "'>"
						comment += "<i class='fa fa-user-circle'></i> <b>"+data.commentList[i].nickname+"</b><br>"
						comment += "<i class='far fa-clock'></i>"+changeDate(data.commentList[i].cdataTime)+"<br> <br>"
						comment += "<div id='com" + data.commentList[i].cno + "'>" + data.commentList[i].ccontent + "</div>"
						
						// 내 댓글에 수정/삭제 버튼 띄우기
						if("${loginUser.nickname}" == data.commentList[i].nickname){
							var test = data.commentList[i].ccontent
							console.log("${loginUser.nickname}")
							//console.log(data.commentList.nickname)
							comment +=  	   '<button type="button" class="btn btn-sm btn-primary"'
							comment += 		   'id="btnUpdate'+data.commentList[i].cno+'" onclick="updateCommentView(' + data.commentList[i].cno + ', ' + "'" + data.commentList[i].ccontent + "'" + ')">수정</button>'
							comment += 	       '<button type="button" class="btn btn-sm btn-primary"'
							comment += 		   'id="btnDelete" onclick="deleteComment(' + data.commentList[i].cno + ')">삭제</button>'
						}
							comment += '</div>'
							
	 
						
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
	   

		

		//댓글 수정창 input
		function updateCommentView(cno, ccontent){
		    var comment ='';
		    
		    comment += '<div class="input-group">';
		    comment += 		'<input type="text" name="ccontent'+cno+'" value="'+ccontent+'"/>';
		    comment += 		'<button class="btn btn-primary" type="button" onclick="updateComment('+cno+');">확인</button>';
		    comment += '</div>';
		    
		    
		    $("#btnUpdate"+cno+"").hide()
		    
		    $('#com'+cno).html(comment);
		    
		}
		
		// 댓글 수정
		function updateComment(cno){
		    var ccontent = $('[name=ccontent'+cno+']').val();
		    
		    $.ajax({
		        url : "${pageContext.request.contextPath}/board/updateComment",
		        type : 'POST',
		        data : { 'cno' : cno, 'ccontent' : ccontent },
		        success : function(data){
		        	console.log(data)
		            if(data=="success") 
		            	list(); 
		        }
		    });
		}
		 
		// 댓글 삭제
		function deleteComment(cno){
			 $.ajax({
		        url : "${pageContext.request.contextPath}/board/deleteComment",
		        type : 'POST',
		        data : { 'cno' : cno },
		        success : function(data){
		        	console.log(data)
		        	if(data=="success") 
		            	list(); 
		        }
			 })
		        
		}
		
		
	    // datetime 변환
	    function changeDate(date){
	        var date = new Date(date);
			console.log(date.toString())
	        
	        year = date.getFullYear();
	        month = date.getMonth();
	        month += 1;
	        day = date.getDate();
	        hour = date.getHours();
	        minute = date.getMinutes();
	        second = date.getSeconds();
	        strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	        return strDate;
	    }
		
	    
	    function updateLikes(pno){
		    $.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/board/free/detail/likes/ajax',
				dataType : 'json',
				data : {"pno" : pno},
				contentType : "application/x-www-form-urlencoded;chartset=UTF-8",
				success : function(data){ 
					list();
					
					    /* if (like=="좋아요") 
					    	like = "좋아요 취소"
					    
				    	else
					    	like = "좋아요" */
				},
			    error : function(error, data){
			    	
					console.log(data)
					console.log(error)
					alert('error!!'); 
			    }
		    })
		}			
	    
		
/* 		history.pushState(null, null, location.href);

		window.onpopstate = function(event) {
			console.log(event)
			location.href = "/board/free";

		}; */




	
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