<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>포트폴리오 게시판</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/album/">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!-- css file -->
<link href="/resources/css/portfolio-board.css" rel="stylesheet">
<!-- 폰트어썸 cdn -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">

<script>
$(document).ready(function(){
	console.log(1)
	$(function() {
		window.pagObj = $('#pagination-all').twbsPagination({
			totalPages : 35,
			visiblePages : 5,
			onPageClick : function(event, page) {
				console.info(page + ' (from options)');
			}
		}).on('page', function(event, page) {
			console.info(page + ' (from event listening)');
		});
		});
	
	$(function() {
		window.pagObj = $('#pagination-best').twbsPagination({
			totalPages : 35,
			visiblePages : 5,
			onPageClick : function(event, page) {
				console.info(page + ' (from options)');
			}
		}).on('page', function(event, page) {
			console.info(page + ' (from event listening)');
		});
		});  
	
	
	$(document).ready(function() {
		$("#jb-checkboxAll-best").click(function() {
			if ($("#jb-checkboxAll-best").prop("checked")) {
				$(".check-best").prop("checked", true);
			} else {
				$(".check-best").prop("checked", false);
			}
		})
		$("#jb-checkboxAll").click(function() {
			if ($("#jb-checkboxAll").prop("checked")) {
				$(".check").prop("checked", true);
			} else {
				$(".check").prop("checked", false);
			}
		})
	    $("input:radio[name='orderby']").click(function(){

	    	$("#form").submit()
	    })
	});
	
	
});
</script>
</head>
<body>

	<%@include file="mainheader.jsp"%>

	<div class="all-dim"></div>
	<div class="containerNew">
		<div class="board-page">
			<div class="row">
				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu">
						<ul>
							<li><a href="/board/free"><span>자유게시판</span></a></li>
							<li class="mid"><a href="/board/portfolio"><span>포트폴리오</span></a></li>
							<li class="last"><a href="/news"><span>뉴스</span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-10">
					<div class="free-board">
						<div class="drop-nav">
							<h1 class="tit-h1 line">포트폴리오</h1>
						</div>
						<div class="m-drop-nav">
							<h1 class="m-drop-tit-title line" style="cursor: pointer;">포트폴리오
								▼</h1>
						</div>
						<div class="m-drop-down">
							<h1 class="m-drop-tit-body first line" style="cursor: pointer;">
								<a href="/board/free">자유게시판</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/portfolio">포트폴리오</a>
							</h1>
							<h1 class="m-drop-tit-body last line" style="cursor: pointer;">
								<a href="/news">뉴스</a>
							</h1>
						</div>
						<div class="board-type">
							<div class="board-free-nav">
								<form id="form" class="board-list-top policy-in"
									action='/board/portfolio'>
									<p class="pc-only">
										<input type="radio" class="ordeby" id="orderby1"
											name="orderby" value="new"><label
											for="orderby1" class="new-board">최신순</label> <input
											type="radio" class="ordeby" id="orderby2" name="orderby"
											value="best" checked=""><label for="orderby2" class="hot-board">인기순</label>
									</p>
								</form>

								<c:if test="${loginUser != null}">
									<p class="right">
										<a href="/board/portfolio/write" class="board-write-btn">글쓰기</a>

									</p>
								</c:if>

							</div>
							<div class="tab-content" id="pills-tabContent">
								<!-- 전체글 -->
								<ul class="photo-list no-line board-col">
										<c:forEach items="${portfolioList}" var="portfolioList">
											<c:if test="${portfolioList.bno eq 2}">
												<li class="type_" data-seq="150357583575745">
													<p class="img">
														<a href="/board/portfolio/detail?pno=${portfolioList.pno}"> <span>
																<img
																src="${portfolioList.thumbnailName}"
																onerror="this.onError=null;this.src=&quot;//image.paxnet.co.kr/rpan/cafe/common/images/noimg_w.png&quot;">
														</span>
														</a>
													</p>
													<dl class="text">
														<dt>
															<a href="/board/portfolio/detail?pno=${portfolioList.pno}"><!-- <span
																class="ntc"> </span>-->${portfolioList.title}</a>
														</dt>
														<dd class="date">
															<span> <span class="nick-badge-small"><a
																	href="javascript:viewProfile('webmaster')"><img
																		src="//www.paxnet.co.kr/my/files/badge/favor3S.png?20200616"
																		alt="">${portfolioList.nickname}</a></span> 
																		
																		
																		<fmt:formatDate value="${portfolioList.bdateTime}" var="time" pattern="MM/dd HH:mm"/>
																		<span class="data-date-format">${time}</span> <span
																class="comment" id="countNum150357583575745"><i>댓글</i>${portfolioList.commentCount}</span>
															</span>
														</dd>
													</dl>
												</li>
											</c:if>
										</c:forEach>
								</ul>
									

								<!-- 페이징 -->
								<div class="paging">
									<div class="paging-body">
										<nav aria-label="..." class="pagination">
											<ul class="pagination">

												<c:if test="${boardPage.nowPage != 1}">
													<!-- << 버튼 -->
													<li><a class="page-link" href="/board/free?bnowPage=1"
														tabindex="-1" aria-disabled="true"> <i
															class="fas fa-angle-double-left"></i>
													</a></li>
													<!-- 1페이지에서 < 버튼 눌렀을 때 -->
													<c:if test="${boardPage.nowPage == 1}">
														<li><a class="page-link"
															href="/board/free?bnowPage=${boardPage.nowPage}"
															tabindex="-1" aria-disabled="true"> <i
																class="fas fa-angle-left"></i>
														</a></li>
													</c:if>
												</c:if>

												<!-- 1페이지가 아닌 페이지에서 < 버튼 눌렀을 때 -->
												<c:if test="${boardPage.nowPage != 1}">
													<li><a class="page-link"
														href="/board/free?bnowPage=${boardPage.nowPage-1}"
														tabindex="-1" aria-disabled="true"> <i
															class="fas fa-angle-left"></i>
													</a></li>
												</c:if>

												<!-- 한번에 5개 페이지 보여줌 -->
												<c:forEach begin="${boardPage.startPage }"
													end="${boardPage.endPage }" var="p">
													<c:choose>
														<c:when test="${p == boardPage.nowPage}">
															<li class="page-item active" aria-current="page"><a
																class="page-link" href="#">${p} <span
																	class="sr-only">(current)</span>
															</a></li>
														</c:when>
														<c:when test="${p != boardPage.nowPage}">
															<li class="page-item"><a class="page-link"
																href="/board/free?bnowPage=${p}">${p}</a></li>
														</c:when>
													</c:choose>
												</c:forEach>



												<c:if test="${boardPage.nowPage != boardPage.lastPage}">
													<!-- 현재 페이지가 마지막 페이지일 경우 > 버튼을 눌렀을 때 -->
													<c:if test="${boardPage.nowPage == boardPage.lastPage}">
														<li><a class="page-link"
															href="/board/free?bnowPage=${boardPage.nowPage}"
															tabindex="+1" aria-disabled="true"> <i
																class="fas fa-angle-right"></i>
														</a></li>
													</c:if>

													<!-- 현재 페이지가 마지막 페이지가 아닐 경우에 > 버튼을 눌렀을 때 -->
													<c:if test="${boardPage.nowPage != boardPage.lastPage}">
														<li><a class="page-link"
															href="/board/free?bnowPage=${boardPage.nowPage+1}"
															tabindex="+1" aria-disabled="true" data-ajax="false">
																<i class="fas fa-angle-right"></i>
														</a></li>
													</c:if>

													<!-- >> 버튼 -->
													<li><a class="page-link"
														href="/board/free?bnowPage=${boardPage.lastPage}"
														tabindex="-1" aria-disabled="true"> <i
															class="fas fa-angle-double-right"></i>
													</a></li>

												</c:if>
											</ul>
										</nav>
									</div>


									<c:if test="${loginUser != null}">
										<p class="right">
											<a href="/board/portfolio/write" class="board-write-btn">글쓰기</a>
										</p>
									</c:if>
								</div>

								<div class="search-area">
									<div class="search-area-body">
										<form class="form-inline my-2 my-lg-0 underSearchForm"
											action="/board/free">
											<!-- <a class="nav-link dropdown-toggle" href="#" id="dropdown01"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a> -->
											<select class="dropdown-toggle-board" name="searchStyle">
												<option class="nav-link dropdown-toggle board-item"
													id="dropdown01" data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false" value=""
													<c:if test='${searchStyle eq ""}'>selected</c:if>>전체</option>
												<option class="dropdown-item board-item"
													value="search_title"
													<c:if test='${searchStyle eq "search_title"}'>selected</c:if>>제목</option>
												<option class="dropdown-item board-item"
													value="search_content"
													<c:if test='${searchStyle eq "search_content"}'>selected</c:if>>내용</option>
												<option class="dropdown-item board-item"
													value="search_title_content"
													<c:if test='${searchStyle eq "search_title_content"}'>selected</c:if>>제목
													+ 내용</option>
												<option class="dropdown-item board-item" value="search_nick"
													<c:if test='${searchStyle eq "search_nick"}'>selected</c:if>>글쓴이</option>
											</select> <input class="form-control mr-sm-2 board-search"
												type="search" placeholder="검색어 입력" aria-label="Search">
											<button
												class="btn btn-outline-secondary my-2 my-sm-0 board-search-btn"
												type="submit">
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
  $( document ).ready(function() {
	  console.log( "document ready!" );

	  var $sticky = $('.sticky');
	  var $stickyrStopper = $('.footer_info');
	  if (!!$sticky.offset()) { // make sure ".sticky" element exists

	    var generalSidebarHeight = $sticky.innerHeight();
	    var stickyTop = $sticky.offset().top;
	    var stickOffset = 0;
	    var stickyStopperPosition = $stickyrStopper.offset().top;
	    var stopPoint = stickyStopperPosition - generalSidebarHeight - stickOffset;
	    var diff = stopPoint + stickOffset;

	    $(window).scroll(function(){ // scroll event
	      var windowTop = $(window).scrollTop(); // returns number

	      if (stopPoint < windowTop) {
	          $sticky.css({ position: 'relative', top: diff });
	      } else if (stickyTop < windowTop+stickOffset) {
	          $sticky.css({ position: 'fixed', top: stickOffset });
	      } else {
	          $sticky.css({position: 'relative', top: 'initial'});
	      }
	    });

	  }
	  $(".m-drop-nav").click(function(){
		    $(".m-drop-down").slideToggle("slow");
		  });
  });
  


 
  </script>
	</div>

	<!--       <div id="carouselExampleControls" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<a href="#">[특징주]상보, 中희토류 전략무기화 가능성 상승에 대체제 부각 '강세'</a>
				</div>
				<div class="carousel-item">
					<a href="#">[특징주]상보, 中희토류 전략무기화 가능성 상승에 대체제 부각 '강세'</a>
				</div>
				<div class="carousel-item">
					<a href="#">[특징주]상보, 中희토류 전략무기화 가능성 상승에 대체제 부각 '강세'</a>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleControls"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleControls"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
	  </div>
    <div class="sideBar col-md-4 order-md-2 mb-4" id="menu-bar">
      <ul class="list-group mb-3">
      
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed free-board" onclick="location.href='free-board.jsp'">
          <div> 
            <h6 class="my-0">자유 게시판</h6>
          </div>
        </li>
        <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed news-borad" onclick="location.href='newboard.jsp'">
          <div>
            <h6 class="my-0">뉴스 게시판</h6>
          </div>
        </li>
        <li class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed protfolio-board" onclick="location.href='portfolio-board.jsp'" >
          <div>
            <h6 class="my-0">포트폴리오 게시판</h6>
          </div>
        </li>
      </ul>
    </div>
  
  <article class="bg-light container">
    <main role="main">
        <div class="allbody">
           <div class="row" style="margin-top:-40px;">
	        <div class="sidebar-header col-md-4 order-md-2 mb-4">
	            <div class="col-md-8 order-md-1"></div>
		          <h4 class="mb-3">포트폴리오 게시판</h4>
		        </div>
	 	    </div>	
          <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <li class="nav-item" role="presentation">
              <a class="nav-link active" id="pills-all-tab" data-toggle="pill" href="#pills-all" role="tab" aria-controls="pills-all" aria-selected="true">전체글</a>
            </li>
            <li class="nav-item" role="presentation">
              <a class="nav-link" id="pills-best-tab" data-toggle="pill" href="#pills-best" role="tab" aria-controls="pills-best" aria-selected="false">인기글</a>
            </li>
          </ul>
          Tab Menu
          <div class="tab-content" id="pills-tabContent">
            전체글
            <div class="tab-pane fade show active" id="pills-all" role="tabpanel" aria-labelledby="pills-all-tab" style="margin-bottom: 300px;">
            1row
              <div class="row" style="margin-bottom: 30px;">
                1set
                <div class="col-md-4">
                  <div class="card mb-4 shadow-sm">
                    <img src="/resources/img/portfolio2.png" style="width:337px; height:auto; border-bottom: 1px dotted #5a6268;">사진
                    <div class="card-body">
                      <p class="card-text"></p>
                      <div class="d-flex justify-content-between align-items-center">
                        <ul class="notice-info">
                            <li class="author"><i class="fa fa-user-circle"></i> #홍길동</li>
                		    <li class="date"><i class="fas fa-stopwatch"></i> #2020.05.27</li>
                		    <li class="likes"><i class="fas fa-thumbs-up"></i> #3</li>
                		    <li class="views"><i class="fas fa-eye"></i> #27</li>
                		    <button type="button" class="btn btn-sm btn-outline-secondary like-button">좋아요</button>
                		</ul>
                      </div>
                    </div>
                  </div>
                </div>
               
                <div class="col-md-4">
                  <div class="card mb-4 shadow-sm">
                    <img src="/resources/img/portfolio1.jpg" style="width:337px; height:auto; border-bottom: 1px dotted #5a6268;">사진
                    <div class="card-body">
                      <p class="card-text"></p>
                      <div class="d-flex justify-content-between align-items-center">
                        <ul class="notice-info">
                            <li class="author"><i class="fa fa-user-circle"></i> #홍길동</li>
                		    <li class="date"><i class="fas fa-stopwatch"></i> #2020.05.27</li>
                		    <li class="likes"><i class="fas fa-thumbs-up"></i> #3</li>
                		    <li class="views"><i class="fas fa-eye"></i> #27</li>
                		    <button type="button" class="btn btn-sm btn-outline-secondary like-button">좋아요</button>
                		</ul>
                      </div>
                    </div>
                  </div>
                </div>
               
              </div>
             
 		 <form class="form-inline my-2 my-lg-0 underSearchForm">
	          <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a>
		          <div class="dropdown-menu" aria-labelledby="dropdown01">
		            <a class="dropdown-item" href="#">제목</a>
		            <a class="dropdown-item" href="#">내용</a>
		            <a class="dropdown-item" href="#">제목 + 내용</a>
		            <a class="dropdown-item" href="#">글쓴이</a>
		          </div>
             <input class="form-control mr-sm-2" type="search" placeholder="search" aria-label="Search">
             <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit"> <i class="fas fa-search"></i></button>
            <div class="buttons">
	            <button class="btn btn-primary btn-lg btn-block add" type="button" onclick="location.href='portfolio-writeForm.jsp'">작성</button>
          	</div>             
          </form>
             
	            <div class="paging">
					<div class="paging-body">
						<ul class="pagination" id="pagination-all"></ul>
					</div>
	    		</div>
	    	 
            </div>
           
            <div class="tab-pane fade" id="pills-best" role="tabpanel" aria-labelledby="pills-best-tab" style="margin-bottom: 300px;">
               1row
               <div class="row" style="margin-bottom: 30px;">
                1set
                <div class="col-md-4">
                  <div class="card mb-4 shadow-sm">
                    <img src="/resources/img/portfolio1.jpg" style="width:337px; height:auto; border-bottom: 1px dotted #5a6268;">사진
                    <div class="card-body">
                      <p class="card-text"></p>s
                      <div class="d-flex justify-content-between align-items-center">
                        <ul class="notice-info">
                            <li class="author"><i class="fa fa-user-circle"></i> #홍길동</li>
                		    <li class="date"><i class="fas fa-stopwatch"></i> #2020.05.27</li>
                		    <li class="likes"><i class="fas fa-thumbs-up"></i> #3</li>
                		    <li class="views"><i class="fas fa-eye"></i> #27</li>
                		    <button type="button" class="btn btn-sm btn-outline-secondary like-button">좋아요</button>
                		</ul>
                      </div>
                    </div>
                  </div>
                </div>
                
              </div>
              
          <form class="form-inline my-2 my-lg-0 underSearchForm">
	          <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a>
		          <div class="dropdown-menu" aria-labelledby="dropdown01">
		            <a class="dropdown-item" href="#">제목</a>
		            <a class="dropdown-item" href="#">내용</a>
		            <a class="dropdown-item" href="#">제목 + 내용</a>
		            <a class="dropdown-item" href="#">글쓴이</a>
		          </div>
             <input class="form-control mr-sm-2" type="search" placeholder="search" aria-label="Search">
             <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit"> <i class="fas fa-search"></i></button>
          </form>
             
	            <div class="paging">
					<div class="paging-body">
						<ul class="pagination" id="pagination-best"></ul>
					</div>
	    		</div>
	    	
            </div>
            
          </div>
       
       </div>
  </main>
</article>   -->


	<%@include file="mainfooter.jsp"%>

</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- paginate -->
<script src="/resources/jpaginate/jquery.twbsPagination.js"
	type="text/javascript"></script>
</html>