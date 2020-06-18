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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<link rel="stylesheet" href="/resources/css/mainfooter.css">
	<link rel="stylesheet" href="/resources/css/mainheader.css">
	<link href="/resources/css/mypage04.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<style>
		.paging-body {
			margin-left: 300px;
			margin-bottom: 300px;
		}

		td>a {
			cursor: pointer;
		}

		.no {
			width: 76px;
		}
	</style>
</head>

<body>
	<%@include file="mainheader.jsp"%>
	<!-- section start -->
	<div class="containerNew">
		<!-- contents -->
		<div class="contents member" id="contents">
			<div class="row">
				<div class="col-md-2">
					<div class="sidebar sticky" id="cssmenu" style="position: relative; top: initial;">
						<ul>
							<li><a href="/myPage01"><span>내 정보 관리</span></a></li>
							<li class="mid"><a href="/mypageUpdatePassword"><span>비밀번호 변경</span></a></li>
							<li class="last"><a href="/myPage02"><span>계좌정보</span></a></li>
							<li class="mid"><a href="/myPage03"><span>작성 글 | 댓글</span></a></li>
							<li class="last"><a href="/myPage04"><span>알림</span></a></li>
						</ul>
					</div>
				</div>
				<!-- section end -->

				<!-- article start -->
				<div class="col-md-10">
					<div class="row">
						<div class="sideBar col-md-4 order-md-2 mb-4">
							<div class="col-md-8 order-md-1"></div>
							<h4 class="mb-3">알림</h4>
							<h6>(확인시 자동 삭제)</h6>
						</div>
					</div>
					<!-- 게시판 -->
					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
						<li class="nav-item" role="presentation">
							<a class="nav-link active" id="pills-trade-tab" data-toggle="pill" href="#pills-trade" role="tab"
								aria-controls="pills-trade" aria-selected="true">거래체결</a>
						</li>
						<li class="nav-item" role="presentation">
							<a class="nav-link" id="pills-board-tab" data-toggle="pill" href="#pills-board" role="tab"
								aria-controls="pills-board" aria-selected="false">게시판 알림</a>
						</li>
					</ul>
					<div class="tab-content" id="pills-tabContent">
						<!-- 게래체결 -->
						<div class="tab-pane fade show active" id="pills-trade" role="tabpanel" aria-labelledby="pills-trade-tab"
							style="margin-bottom: 300px;">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="tno" scope="col">거래번호</th>
										<th class="stockName" scope="col">종목명</th>
										<th class="tprice" scope="col">단가</th>
										<th class="quantity" scope="col">수량</th>
										<th class="tdatetime" scope="col">거래일시</th>
										<th class="category" scope="col">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${modifiedNotice}" var="list">
										<tr>

											<td class="first" title="주문번호">
												<c:out value="${list.tno}" />
											</td>
											<td title="종목명">
												<c:out value="${list.stockName}" />
											</td>
											<td title="주문단가">
												<c:out value="${list.tprice}" />
											</td>
											<td title="주문수량">
												<c:out value="${list.quantity}" />
											</td>
											<td title="거래일시">
												<fmt:formatDate value="${list.tdatetime}" pattern="yyyy-MM-dd HH:mm:ss" />
											</td>
											<td title="상태">
												<c:out value="${list.category}" />
											</td>
										</tr>
									</c:forEach>
							</table>
						</div>
						<!-- 게시판알림 -->
						<div class="tab-pane fade" id="pills-board" role="tabpanel" aria-labelledby="pills-board-tab"
							style="margin-bottom: 300px;">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th class="no" scope="col">글번호</th>
										<th class="title" scope="col">내용</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${commentNotice}" var="list">
										<tr>
											<td class="first" title="글번호">
												<c:out value="${list.pno}" />
											</td>
											<td title="내용">
												<c:out value="${list.title}" /> 글에 댓글이 달렸습니다.</td>
										</tr>
									</c:forEach>
							</table>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!-- article end -->
	<%@include file="mainfooter.jsp"%>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>