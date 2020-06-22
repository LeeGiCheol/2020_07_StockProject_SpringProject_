<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="/resources/css/mainfooter2.css">
<link rel="stylesheet" href="/resources/css/mainheader4.css">
<link href="resources/css/mypage03.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
	<%@include file="mainheader.jsp"%>
	<!-- section start -->

	<!-- <form name="alarmForm">
			<input type="hidden" name="flag" id="flag" value="">

			<div class="my-list-scrap">
				<input type="checkbox" class="check_all" id="check-all">
				<label for="check-all">총 <i>1</i>개
				</label>
				<p>
					<button type="button" class="btn-s adhere del selectAlarmDelete">삭제</button>
					<button type="button" class="btn-s adhere readAlarmDelete">읽은 알림 삭제</button>
				</p>
			</div>
			<div class="alarm-area">
				<ul>
					2017.04.26 추가
					
					
					//2017.04.26 추가

					//2017.04.28 추가
					읽은 내용 <a> 태그 부모에 class="visited" 삽입 → a 텍스트 색 #888 처리됩니다.
					
						
							
								<li>
									<p class="check">
										<input type="checkbox" id="eventSeq_28900862" class="seq_check" name="eventSeq" value="28900862">
										<label for="eventSeq_28900862">선택 삭제</label>
									</p>
									
										
										
											<p class="img">
												<span class="pro-badge"> <img class="pax_f2_proimg" cust_id="g_1589453219" src="https://www.paxnet.co.kr/my/files/proimg/di/pi_08.png"><i style="display: none;"><img class="current_badge_s" cust_id="g_1589453219" id="current_badge_g_1589453219"></i>
												</span>
											</p>
										
									
									<dl>
										<dt class="" id="visited_28900862">
											방문여부 : visited
											<span class="red">[댓글]</span> <strong>
													
														<a href="#" onclick="javascript:goView('28900862', 'http://www.paxnet.co.kr/tbbs/view?id=N10841&amp;seq=150357583596792');return false;" title="http://www.paxnet.co.kr/tbbs/view?id=N10841&amp;seq=150357583596792">내가 쓴 글의 댓글이 작성되었습니다.</a>
													
													
												</strong>
										</dt>

										
										
											
											
												<dd>
													<span><a href="#">개미굴리트</a></span> <span>2020.06.18 22:47</span>
												</dd>
											
										
									</dl>
								</li>
							
						
						
					
				</ul>
			</div>
			//board-type

			<div class="mobile-only-check fixed">
				fixed
				<span><input type="checkbox" id="check_all_mo" class="check_all"><label for="check_all_mo">전체선택</label></span> <span><button type="button" class="del selectAlarmDelete">삭제</button></span> <span><button type="button" class="cancel">취소</button></span>
			</div>
		</form> -->
	<div class="all-dim"></div>
	<div class="containerNew">
		<div class="board-page">
			<div class="row">
				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu">
						<ul>
							<li><a href="/myPage01"><span>내 정보 관리</span></a></li>
							<li class="mid"><a href="/mypageUpdatePassword"><span>비밀번호
										변경</span></a></li>
							<li class="last"><a href="/myPage02"><span>나의
										계좌정보</span></a></li>
							<li class="mid"><a href="/myPage03"><span>작성 글 |
										댓글</span></a></li>
							<li class="last"><a href="/myPage04"><span>알림</span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-10">
					<div class="free-board">
						<div class="drop-nav">
							<h1 class="tit-h1 line">알림</h1>

						</div>
						<div class="m-drop-nav">
							<h1 class="m-drop-tit-title line" style="cursor: pointer;">알림
								▼</h1>
						</div>
						<div class="m-drop-down">
							<h1 class="m-drop-tit-body first line" style="cursor: pointer;">
								<a href="/news">내 정보 관리</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/board/free">비밀번호 변경</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/board/free">나의 계좌정보</a>
							</h1>
							<h1 class="m-drop-tit-body line" style="cursor: pointer;">
								<a href="/board/free">작성 글 | 댓글</a>
							</h1>
							<h1 class="m-drop-tit-body last line" style="cursor: pointer;">
								<a href="#">알림</a>
							</h1>
						</div>
						<div class="board-type">
							<div class="board-free-nav">
								<form id="form" class="board-list-top policy-in"
									action='/board/free'>
									<p class="pc-only">
										<input type="radio" class="ordeby" id="orderby1"
											name="orderby" value="new" checked=""><label
											for="orderby1" class="new-board">거래 알림</label> <input
											type="radio" class="ordeby" id="orderby2" name="orderby"
											value="best"><label for="orderby2" class="hot-board">커뮤니티
											알림</label>
									</p>
								</form>


							</div>
							<div class="tab-content" id="pills-tabContent">
								<!-- 전체글 -->
								<table class="board-free-table">
									<colgroup>
										<col width="10%">
										<col width="35%">
										<col width="15%">
										<col width="10%">
										<col width="15%">
										<col width="10%">
									</colgroup>
									<thead id="a_title">
										<tr>
											<th class="no" scope="col">NO</th>
											<th class="title" scope="col">종목명</th>
											<th class="writer" scope="col">단가</th>
											<th class="views" scope="col">수량</th>
											<th class="likes" scope="col">거래일시</th>
											<th class="date" scope="col">상태</th>
										</tr>
									</thead>
									<tbody id="a_contents">
										<c:forEach items="${modifiedNotice}" var="list">
											<tr>
												<c:choose>
													<c:when test="${list.confirm eq 1}">
													<td class="first" title="주문번호" style="color: red">NEW</td>
													</c:when>
													<c:otherwise>
													<td class="first" title="주문번호"><c:out
														value="${list.tno}" /></td>
													</c:otherwise>
												</c:choose>
												<td title="종목명"><c:out value="${list.stockName}" /></td>
												<td title="주문단가"><c:out value="${list.tprice}" /></td>
												<td title="주문수량"><c:out value="${list.quantity}" /></td>
												<td title="거래일시"><fmt:formatDate
														value="${list.tdatetime}" pattern="yyyy-MM-dd HH:mm:ss" />
												</td>
												<td title="상태"><c:out value="${list.category}" /></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>

								<script type="text/javascript">
    $(document)
        .ready(
            function () {
                $("#orderby2")
                    .click(
                        function () {
                            $(
                                "#a_title")
                                .html(
                                    "<tr><th class='no' scope='col'>글번호</th><th class='title' scope='col'>내용</th></tr>");
                            console
                                .log("클릭");
                            $(
                                "#a_contents")
                                .html(
                                    '<c:forEach items="${commentNotice}" var="list"><tr><c:choose><c:when test="${list.confirm eq 1}"><td class="first" title="글번호" style="color: red">NEW</td></c:when><c:otherwise><td class="first" title="글번호""><c:out value="${list.pno}" /></td></c:otherwise></c:choose><td title="내용"><c:out value="${list.title}" /> 글에 댓글이 달렸습니다.</td>	</tr></c:forEach>');
                        })
                $("#orderby1")
                    .click(
                        function () {
                            $(
                                "#a_title")
                                .html(
                                    '<tr><th class="no" scope="col">NO</th><th class="title" scope="col">종목명</th><th class="writer" scope="col">단가</th><th class="views" scope="col">수량</th><th class="likes" scope="col">거래일시</th><th class="date" scope="col">상태 </th></tr>');
                            console
                                .log("클릭");
                            $(
                                "#a_contents")
                                .html(
                                    '<c:forEach items="${modifiedNotice}" var="list"><tr><c:choose><c:when test="${list.confirm eq 1}"><td class="first" title="주문번호" style="color: red">NEW</td></c:when><c:otherwise><td class="first" title="주문번호"><c:out value="${list.tno}" /></td>	</c:otherwise></c:choose><td title="종목명"><c:out value="${list.stockName}" /></td><td title="주문단가"><c:out value="${list.tprice}" /></td><td title="주문수량"><c:out value="${list.quantity}" /></td><td title="거래일시"><fmt:formatDate value="${list.tdatetime}" pattern="yyyy-MM-dd HH:mm:ss" /></td><td title="상태"><c:out value="${list.category}" /></td></tr></c:forEach>');
                        })

            })
</script>

								<!-- 페이징 -->
								<%-- <div class="paging">
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
											<a href="/board/free/write" class="board-write-btn">삭제</a>
										</p>
									</c:if>
								</div> --%>

								<%-- <div class="search-area">
									<div class="search-area-body">
										<form class="form-inline my-2 my-lg-0 underSearchForm"
											action="/board/free">
											<!-- <a class="nav-link dropdown-toggle" href="#" id="dropdown01"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a> -->
											<select class="dropdown-toggle-board" name="searchStyle">
												<option class="nav-link dropdown-toggle board-item"
													id="dropdown01" data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false" value=""
													<c:if test='${searchStyle eq ""}'>selected</c:if>>전체
												</option>
												<option class="dropdown-item board-item"
													value="search_title"
													<c:if
													test='${searchStyle eq "search_title"}'>selected</c:if>>제목</option>
												<option class="dropdown-item board-item"
													value="search_content"
													<c:if
													test='${searchStyle eq "search_content"}'>selected</c:if>>내용
												</option>
												<option class="dropdown-item board-item"
													value="search_title_content"
													<c:if test='${searchStyle eq "search_title_content"}'>selected
													</c:if>>제목
													+ 내용</option>
												<option class="dropdown-item board-item" value="search_nick"
													<c:if
													test='${searchStyle eq "search_nick"}'>selected</c:if>>글쓴이</option>
											</select> <input class="form-control mr-sm-2 board-search"
												type="search" placeholder="검색어 입력" aria-label="Search">
											<button
												class="btn btn-outline-secondary my-2 my-sm-0 board-search-btn"
												type="submit">
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div> --%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			$(document).ready(
					function() {
						console.log("document ready!");

						var $sticky = $('.sticky');
						var $stickyrStopper = $('.footer_info');
						if (!!$sticky.offset()) { // make sure ".sticky" element exists

							var generalSidebarHeight = $sticky.innerHeight();
							var stickyTop = $sticky.offset().top;
							var stickOffset = 0;
							var stickyStopperPosition = $stickyrStopper
									.offset().top;
							var stopPoint = stickyStopperPosition
									- generalSidebarHeight - stickOffset;
							var diff = stopPoint + stickOffset;

							$(window).scroll(
									function() { // scroll event
										var windowTop = $(window).scrollTop(); // returns number

										if (stopPoint < windowTop) {
											$sticky.css({
												position : 'relative',
												top : diff
											});
										} else if (stickyTop < windowTop
												+ stickOffset) {
											$sticky.css({
												position : 'fixed',
												top : stickOffset
											});
										} else {
											$sticky.css({
												position : 'relative',
												top : 'initial'
											});
										}
									});

						}
						$(".m-drop-nav").click(function() {
							$(".m-drop-down").slideToggle("slow");
						});
					});
		</script>
	</div>



	<!-- article end -->
	<%@include file="mainfooter.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>