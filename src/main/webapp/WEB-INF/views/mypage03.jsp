<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link href="resources/css/mypage03.css" rel="stylesheet">
<link href="resources/css/mainheader.css" rel="stylesheet">
<link href="resources/css/mainfooter.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
	$("#jb-checkboxAll-comment").click(function(){
	    if($("#jb-checkboxAll-comment").prop("checked")){
	        $(".comment").prop("checked",true);
	    }else{
	        $(".comment").prop("checked",false);
	    }
	})
	$("#jb-checkboxAll").click(function(){
	    if($("#jb-checkboxAll").prop("checked")){
	        $(".board").prop("checked",true);
	    }else{
	        $(".board").prop("checked",false);
	    }
	})
});
function deleteBoard(){
	var boardID = "";
	
	var deleted = new Array();
	$("input[name='check']:checked").each(function(){
		deleted.push($(this).attr("data-on"));
	});
	for(i=0; i < deleted.length; i++){
		boardID = boardID + deleted[i];
		boardID = boardID + ",";
	}
	if(boardID === ""){
		swal({text:"삭제할 글을 체크해주세요.", icon:"error"});
		return;
	}
	$('#delBoardList').val(boardID);
	window.location.href = '/delete/myBoard?delBoardList='+boardID;
}

function deleteComment(){
	var commentID = "";
	
	var deleted = new Array();
	$("input[name='check']:checked").each(function(){
		deleted.push($(this).attr("data-on"));
	});
	console.log(deleted);
	for(i=0; i < deleted.length; i++){
		commentID = commentID + deleted[i];
		commentID = commentID + ","
	}
	if(commentID === ""){
		swal({text:"삭제할 글을 체크해주세요.", icon:"error"});
		return;
	}
	$('#delCommentList').val(commentID);
	window.location.href = '/delete/myComment?delCommentList='+commentID;
}

</script>
<style>
.pagination{margin-left: 65px; margin-top:40px;}
</style>
</head>
<body>
<%@include file="mainheader.jsp" %>
    <!-- section start -->
    <div class="sideBar col-md-4 order-md-2 mb-4" id="menu-bar">
      <ul class="list-group mb-3">
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed mypage01" onclick="location.href='/myPage01'">
          <div> 
            <h6 class="my-0">내정보</h6>
          </div>
        </li>
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed mypage02" onclick="location.href='/myPage02'">
          <div>
            <h6 class="my-0">계좌정보</h6>
          </div>
        </li>
        <li class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed mypage03" onclick="location.href='/myPage03'" >
          <div>
            <h6 class="my-0">작성 글, 댓글</h6>
          </div>
        </li>
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed mypage04" onclick="location.href='/myPage04'">
          <div >
            <h6 class="my-0">알림</h6>
          </div>
        </li>
      </ul>
    </div>
    <!-- section end -->
    <!-- article start -->
    <article class="bg-light container">
        <div class="allBody">
    <div class="row">
        <div class="sideBar col-md-4 order-md-2 mb-4">
          <div class="col-md-8 order-md-1"></div>
          <h4 class="mb-3">작성 글, 댓글</h4>
        </div>
    </div>
    </div>
    <!-- 게시판 -->
    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
      <li class="nav-item" role="presentation">
        <a class="nav-link active" id="pills-write-tab" data-toggle="pill" href="#pills-write" role="tab" aria-controls="pills-write" aria-selected=true>작성한 글</a>
      </li>
      <li class="nav-item" role="presentation">
        <a class="nav-link " id="pills-commnet-tab" data-toggle="pill" href="#pills-commnet" role="tab" aria-controls="pills-commnet" aria-selected="false">작성한 댓글</a>
      </li>
    </ul>
    <div class="tab-content" id="pills-tabContent">
      <div class="tab-pane fade show active" id="pills-write" role="tabpanel" aria-labelledby="pills-write-tab" style="margin-bottom: 300px;">
        <!-- 내가 작성한 글 -->
        <table class="table table-bordered">
          <thead>
            <tr>
              <td class="checkno"><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkboxAll" class="custom-control-input board"><label class="custom-control-label" for="jb-checkboxAll"></label></div></td>
              <th class="no" scope="col">번호</th>
              <th class="title" scope="col">글제목</th>
              <th class="writer" scope="col">글쓴이</th>
              <th class="date" scope="col">작성일</th>
              <th class="views" scope="col">조회</th>
              <th class="likes" scope="col">추천</th>
            </tr>
          </thead>
          <tbody>
          	<c:forEach items="${myBoard}" var="board">
               <tr> 
                 <td><div class="custom-control custom-checkbox">
                   <input type="checkbox" id="jb-checkbox${board.pno}" class="custom-control-input board" name="check" data-on="${board.pno}"><label class="custom-control-label" for="jb-checkbox${board.pno}"></label></div></td>
                 <th scope="row">${board.pno}</th>
                 <td>${board.title}</td>
                 <td>${board.nickname}</td>
                 <fmt:formatDate value="${board.bdateTime}" var="time" pattern="yyyy/MM/dd HH:mm"/>
				 <td class="board-date">${time}</td>
                 <td>${board.views}</td>
                 <td>${board.likes}</td>
               </tr>
         	</c:forEach>
          </tbody>
        </table>
        <br>
       <form id="myBoardForm" class="form-inline my-2 my-lg-0 underSearchForm" action="/myPage03" method="GET">
        <!-- <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a> -->
	        <select class="nav-link dropdown-toggle" name="bSearchStyle">
	        	<option value="" <c:if test='${bSearchStyle eq ""}'>selected</c:if>>선택</option>
	        	<option value="제목" <c:if test='${bSearchStyle eq "제목"}'>selected</c:if>>제목</option>
	        	<option value="내용" <c:if test='${bSearchStyle eq "내용"}'>selected</c:if>>내용</option>
	        </select>
          <input class="form-control mr-sm-2" type="search" placeholder="search" aria-label="Search" name="boardKeyword" value="${boardKeyword}">
          <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">
              <i class="fas fa-search"></i></button>
          <input type="hidden" id="delBoardList" name="delBoardList">
          <div><button class="btn btn-primary btn-lg btn-block remove" type="button" onclick="deleteBoard();">삭제</button></div>
          <nav aria-label="..." class="pagination">
          
          	<ul class="pagination">
			<c:if test="${boardPage.startPage != 1 }">
				<!-- <a href="/myPage03?nowPage=${boardPage.startPage - 1 }">◀</a> -->
				<li>
					<a class="page-link" href="/myPage03?bnowPage=${boardPage.startPage - 1 }"tabindex="-1" aria-disabled="true">◀</a>
				</li>
			</c:if>
			<c:forEach begin="${boardPage.startPage }" end="${boardPage.endPage }" var="p">
				<c:choose>
					<c:when test="${p == boardPage.nowPage}">
						<!-- <b>${p }</b> -->
						<li class="page-item active" aria-current="page">
							<a class="page-link" href="#">${p}<span class="sr-only">(current)</span></a>
						</li>
					</c:when>
					<c:when test="${p != boardPage.nowPage}">
						<!-- <a href="/myPage03?nowPage=${p }">${p}</a> -->
						<li class="page-item">
							<a class="page-link" href="/myPage03?bnowPage=${p}">${p}</a>
						</li>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${boardPage.endPage != boardPage.lastPage}">
				<!-- <a href="/myPage03?nowPage=${boardPage.endPage+1 }">▶</a> -->
				<li>
					<a class="page-link" href="/myPage03?bnowPage=${boardPage.endPage+1}" tabindex="+1" aria-disabled="true">▶</a>
				</li>
			</c:if>
			</ul>
          </nav>
        </form>
      </div>
      <div class="tab-pane fade" id="pills-commnet" role="tabpanel" aria-labelledby="pills-commnet-tab" style="margin-bottom: 300px;">
        <!-- 내가 작성한 댓글 -->
        <table class="table table-bordered">
          <thead>
            <tr>
              <td class="checkno"><div class="custom-control custom-checkbox">
                <input type="checkbox" id="jb-checkboxAll-comment" class="custom-control-input comment"><label class="custom-control-label" for="jb-checkboxAll-comment"></label></div></td>
              <th class="no" scope="col">번호</th>
              <th class="title" scope="col">글제목</th>
              <th class="writer" scope="col">글쓴이</th>
              <th class="date" scope="col">작성일</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${myComment}" var="comment">
               <tr> 
                 <td><div class="custom-control custom-checkbox">
                   <input type="checkbox" id="jb-checkbox${comment.cno}-comment" class="custom-control-input comment" name="check" data-on="${comment.cno}"><label class="custom-control-label" for="jb-checkbox${comment.cno}-comment"></label></div></td>
                 <th scope="row">${comment.cno}</th>
                <td> <a href="/board/free/detail?pno=${comment.pno}"> ${comment.ccontent}</a></td>
                 <td>${comment.nickname}</td>
           		 <fmt:formatDate value="${comment.cdateTime}" var="time" pattern="yyyy/MM/dd HH:mm"/>
				 <td class="comment-date">${time}</td>
               </tr>
         	</c:forEach>
          </tbody>
        </table>
        <br>
        <form id="myCommentForm" class="form-inline my-2 my-lg-0 underSearchForm" action="/myPage03" method="GET">
	        <!-- <select class="nav-link dropdown-toggle" name="cSearchStyle">
	        	<option value="" selected>선택</option>
	        	<option value="제목">제목</option>
	        	<option value="내용">내용</option>
	        </select> -->
            <input class="form-control mr-sm-2" type="search" placeholder="search" aria-label="Search" name="commentKeyword" value="${commentKeyword}">
            <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">
                <i class="fas fa-search"></i></button>
            <input type="hidden" id="delCommentList" name="delCommentList">
          <div><button class="btn btn-primary btn-lg btn-block remove" type="button" onclick="deleteComment();">삭제</button></div>
            <nav aria-label="..." class="pagination">
           	<ul class="pagination">
				<c:if test="${commentPage.startPage != 1 }">	
							<li>
								<a class="page-link" href="/myPage03?cnowPage=${commentPage.startPage - 1 }"tabindex="-1" aria-disabled="true">◀</a>
							</li>
				</c:if>
			<c:forEach begin="${commentPage.startPage }" end="${commentPage.endPage }" var="p">
				<c:choose>
					<c:when test="${p == commentPage.nowPage}">
						<li class="page-item active" aria-current="page">
							<a class="page-link" href="#">${p}<span class="sr-only">(current)</span></a>
						</li>
					</c:when>
					<c:when test="${p != commentPage.nowPage}">
						<li class="page-item">
							<a class="page-link" href="/myPage03?cnowPage=${p}">${p}</a>
						</li>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${commentPage.endPage != commentPage.lastPage}">
				<li>
					<a class="page-link" href="/myPage03?cnowPage=${comment.endPage+1}" tabindex="+1" aria-disabled="true">▶</a>
				</li>
			</c:if>
			</ul>
            </nav>
          </form>
      </div>
    </div>
    </article>
<!-- article end -->
<%@include file="mainfooter.jsp" %>
</body>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script> -->
<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</html>