<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>mainpage</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<link rel="stylesheet" href="mainpage.css">
	<link rel="stylesheet" href="mainfooter.css">
	<link rel="stylesheet" href="mainheader.css">
	<link rel="stylesheet" href="customers.css">

	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style type="text/css">

	</style>
</head>

<body>
	<div id="header"></div>


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




				<!-- 현재 코스피 주가지수 -->


				<div class="community">


					<!-- 검색 -->
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
									<a href="#">모의투자</a>
								</div>
							</div>
						</div>
					</div>



					<!-- 아코디언게시판 -->
					<div class="sectionBox">

						<div class="sectionWrapper">
							<h2 class="main-tit">회원계정</h2>
							<a class="moreBttn" href="#">글쓰기</a>
							<div class="accordion" id="accordionExample">



								<!-- 반복시작 -->
								<div class="card">
									<div class="card-header" id="headingOne">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse"
												data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
												[아이디/비밀번호]비밀번호를 잊어버렸습니다.
											</button>
										</h2>
									</div>

									<div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
										data-parent="#accordionExample">
										<div class="card-body">
											<div class="qAnswer">
												회원가입시 설정하신 비밀번호는 모두 암호화되어 저장되므로,
												고객센터에서 확인이 불가능합니다.

												로그인 영역> 비밀번호 찾기 를 통해 확인 부탁 드립니다.
											</div>
										</div>
									</div>
								</div>
								<!-- 반복끝 -->

								<div class="card">
									<div class="card-header" id="headingTwo">
										<h2 class="mb-0">
											<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse"
												data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
												[아이디/비밀번호]아이디 변경은 어떻게 하나요?
											</button>
										</h2>
									</div>
									<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
										<div class="card-body">
											<div class="qAnswer">
												회원가입 상태에서는 아이디를 변경하실 수가 없습니다.

												단, 아이디를 제외한 나머지 정보들(필명,이메일,주소,전화번호,비밀번호 등)

												은 변경이 가능합니다.

												아이디를 변경하시기 위해서는 회원 탈퇴 후 다시 재가입 을 하셔야 합니다.

												회원탈퇴를 하시기전에 사용하셨던

												아이디, 유료서비스 등의 사용이 불가능 하므로

												탈퇴하시기 전에 반드시 유료서비스를 먼저 해지하여주시기 바랍니다.
											</div>
										</div>
									</div>
								</div>









							</div>

						</div>


					</div>





				</div>






			</div>






		</div>
	</div>

	<div id="footer"></div>

	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script>
		$(document).ready(function () {


			//헤더
			$("#header").load("mainheader.html");
			//푸터
			$("#footer").load("mainfooter.html");







		})
		//			<!-- 차트 자리 -->
	</script>


</body>

</html>