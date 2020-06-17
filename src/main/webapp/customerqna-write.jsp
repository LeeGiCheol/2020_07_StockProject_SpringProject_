<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>도움말</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<link rel="stylesheet" href="/resources/css/mainfooter.css">
	<link rel="stylesheet" href="/resources/css/mainheader.css">
	<script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>
	<link href="/resources/css/writeForm.css" rel="stylesheet">

	<link rel="stylesheet" href="/resources/css/customers.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style type="text/css">

	</style>
</head>
<script type="text/javascript">
	$(document).ready(function () {
		console.log("document ready!");

		var $sticky = $('.sticky');
		var $stickyrStopper = $('.footer_info');
		if (!!$sticky.offset()) { // make sure ".sticky" element exist

			var generalSidebarHeight = $sticky.innerHeight();
			var stickyTop = $sticky.offset().top;
			var stickOffset = 0;
			var stickyStopperPosition = $stickyrStopper.offset().top;
			var stopPoint = stickyStopperPosition - generalSidebarHeight - stickOffset;
			var diff = stopPoint + stickOffset;

			$(window).scroll(function () { // scroll event
				var windowTop = $(window).scrollTop(); // returns number

				if (stopPoint < windowTop) {
					$sticky.css({
						position: 'relative',
						top: diff
					});
				} else if (stickyTop < windowTop + stickOffset) {
					$sticky.css({
						position: 'fixed',
						top: stickOffset
					});
				} else {
					$sticky.css({
						position: 'relative',
						top: 'initial'
					});
				}
			});

		}
		$(".m-drop-nav").click(function () {
			$(".m-drop-down").slideToggle("slow");
		});
	});
</script>
<script>
	function btnSave() {
		// 글제목
		var title = $("#title").val();
		// 글내용 -> 
		var content = $("p").html();

		if (content == '<br data-cke-filler="true">') {
			content = content.replace('<br data-cke-filler="true">', " ")
		}

		if (content.indexOf("&nbsp;") != -1) {
			console.log("????")
			content = content.replace("&nbsp;", " ")
		}
		console.log(content)

		if (content.trim() == '<br data-cke-filler="true">' && title == "") {
			swal({
				text: "제목과 내용을 입력해주세요.",
				icon: "error"
			});
			$("#title").focus();
		} else if (content == '<br data-cke-filler="true">' || content.trim() == "") {
			swal({
				text: "내용을 입력해주세요.",
				icon: "error"
			});
		} else if (title.trim() == "") {
			swal({
				text: "제목을 입력해주세요.",
				icon: "error"
			});
			$("#title").focus();
		} else {
			$("#form").submit();
		}
	};
</script>

<body>
	<%@include file="mainheader.jsp" %>


	<!-- 전체메뉴 백그라운드-->
	<div class="all-dim"></div>

	<div class="containerNew">

		<div class="row">
			<div class="col-md-2">
				<div class="sidebar sticky" id="cssmenu">
					<ul>
						<li id="sideTitle"><a href="#"><span>고객센터</span></a></li>
						<li><a href="#"><span>공지사항</span></a></li>
						<li><a href="#"><span>도움말</span></a></li>
						<li><a href="#"><span>1:1문의</span></a></li>
					</ul>
				</div>
			</div>




			<div class="col-md-10">

				<div class="community">



					<div id="qnaCategory" class="sectionBox">
						<div class="blueBox">
							<div class="qnaGroup">
								<div class="qnaTitle">
									QnA
								</div>


								<div class="qnabox">

									<svg class="bi bi-person-circle" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
										<path
											d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z" />
										<path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
										<path fill-rule="evenodd"
											d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z" />
									</svg>

									<a href="#">회원계정</a>
								</div>
								<div class="qnabox">
									<svg class="bi bi-people-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd"
											d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z" />
									</svg>
									<a href="#">커뮤니티</a>
								</div>
								<div class="qnabox">
									<svg class="bi bi-pencil-square" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
										<path
											d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
										<path fill-rule="evenodd"
											d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
									</svg>
									<a href="#">거래</a>
								</div>
							</div>
						</div>
					</div>




					<div class="sectionBox">

						<div class="sectionWrapper">
							<h2 class="main-tit">도움말추가</h2>



							<form name="form" id="form" role="form" method="POST" action="/board/free/write">
								<div class="form-table">
									<table>
										<tbody>
											<tr>
												<th scope="row"><label for="question">질문</label></th>
												<td>
													<span class="input-style-case02">
														<input type="text" id="title" name="question" placeholder="질문을 입력하세요" value=""
															maxlength="250">

													</span>
												</td>

											</tr>
											<tr class="writer-nickname" style="display: none;">
												<td>
													<label for="writer"><b>작성자</b></label>
													<input type="text" class="form-control" name="nickname" id="writer"
														value="${loginUser.nickname}" readonly>
													<input type="hidden" name="id" value="${loginUser.id}">
												</td>
											</tr>
											<tr>
												<th scope="row"><label for="answer">답변</label></th>
												<td>
													<textarea class="form-control" rows="5" name="answer" id="content"
														placeholder="답변을 입력해 주세요"></textarea>
												</td>
											</tr>

										</tbody>
									</table>
								</div>
								<div class="bt-area">
									<a href="/board/free" class="moreBttn norm left">취소</a>

									<a id="addBtn" class="moreBttn blue right" href="javascript:btnSave();">글쓰기</a>

								</div>
							</form>

						</div>


					</div>





				</div>






			</div>






		</div>
	</div>

	<%@include file="mainfooter.jsp" %>

	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>




</body>

</html>