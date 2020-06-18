<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>글쓰기페이지</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<!-- CSS파일 -->
	<style>
		.ck-blurred,
		.ck-focused {
			height: 500px;
		}
	</style>
	<link href="/resources/css/writeForm.css" rel="stylesheet">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="/resources/css/mainfooter.css">
	<link rel="stylesheet" href="/resources/css/mainheader.css">
	<link rel="stylesheet" href="/resources/css/customers.css">

	<script type="text/javascript">
		$(document).ready(function () {
			console.log("document ready!");

			var $sticky = $('.sticky');
			var $stickyrStopper = $('.footer_info');
			if (!!$sticky.offset()) { // make sure ".sticky" element exists

				var generalSidebarHeight = $sticky.innerHeight();
				var stickyTop = $sticky.offset().top;
				var stickOffset = 0;
				var stickyStopperPosition = $stickyrStopper.offset().top;
				var stopPoint = stickyStopperPosition - generalSidebarHeight - stickOffset;
				var diff = stopPoint + stickOffset;

				$(window).scroll(function () { // scroll even
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
</head>

<body>

	<%@include file="mainheader.jsp" %>

	<div class="all-dim"></div>
	<div class="containerNew">
		<div class="board-page">
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
					<div class="free-board" role="main">


						<div class="drop-nav">
							<h1 class="tit-h1 line">1:1문의</h1>
						</div>

						<div class="m-drop-nav">
							<h1 class="m-drop-tit-title line" style="cursor:pointer;">1:1문의 ▼</h1>
						</div>
						<div class="m-drop-down">
							<h1 class="m-drop-tit-body first line" style="cursor:pointer;"><a href="/board/free">고객센터</a></h1>
							<h1 class="m-drop-tit-body line" style="cursor:pointer;"><a href="#">공지사항</a></h1>
							<h1 class="m-drop-tit-body line" style="cursor:pointer;"><a href="#">도움말</a></h1>
							<h1 class="m-drop-tit-body last line" style="cursor:pointer;"><a href="/news">1:1문의</a></h1>
						</div>






						<form name="form" id="form" role="form" method="POST" action="/board/free/write">
							<div class="form-table">
								<table>
									<tbody>
										<tr>
											<th scope="row"><label for="title">제목</label></th>
											<td>
												<span class="input-style-case02">
													<input type="text" id="title" name="title" placeholder="제목을 입력하세요" value="" maxlength="250">

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
											<th scope="row">내용</th>
											<td>
												<textarea class="form-control" rows="5" name="bcontent" id="content"
													placeholder="내용을 입력해 주세요"></textarea>
											</td>
										</tr>

									</tbody>
								</table>
							</div>
							<div class="bt-area">
								<a href="/board/free" class="moreBttn left norm">취소</a>
								<span><a href="javascript:btnSave();" class="moreBttn right norm" id="addBtn">작성</a></span>
							</div>
						</form>




					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="mainfooter.jsp" %>
</body>
<script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script> <!-- 글쓰기 메뉴들 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>