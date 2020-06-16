<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>newsboard</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">
<link rel="stylesheet" href="resources/css/newboard.css">
	<link rel="stylesheet" href="/resources/css/customers.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".newsboard-nav-item").each(function() {
			$(this).click(function() {
				$(this).addClass("selected"); //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
				$(this).siblings().removeClass("selected"); //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
			});
		});
/* 		$(function() {
			var sBtn = $("ul > li"); //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
			sBtn.find("a").click(function() { // sBtn에 속해 있는  a 찾아 클릭 하면.
				sBtn.removeClass("active"); // sBtn 속에 (active) 클래스를 삭제 한다.
				$(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
			})
		}) */
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : 35,
				visiblePages : 5,
				onPageClick : function(event, page) {
					console.info(page + ' (from options)');
				}
			}).on('page', function(event, page) {
				console.info(page + ' (from event listening)');
			});
		});
	});
</script>

<script type="text/javascript">
	var date = new Date();
	date.setDate(date.getDate());
	//var todayCnt = 0;
	var $datepick;
	$(document).ready(function() {
		$('.calendar').datepicker({
			format : 'yyyy.mm.dd',
			clearBtn : true,
			language : "ko",
			orientation : "bottom auto",
			autoclose : true,
			todayBtn : "linked",
			endDate : date,
		}).on('changeDate', function(ev) {
			//alert(ev)
			//console.log(ev.format())
			_year = ev.date.getFullYear()
			_month = ev.date.getMonth()
			_day = ev.date.getDate()
			_date = ev.format()
			console.log("changeDate() _date : " + _date)
			//console.log("test _date : " + endDate)
			//console.log(ev.format())
			$('#test-date').html(_date)

			showHideTomorrowBtn(ev.date, new Date());
		});

		setToday();
	}

	);

	function showHideTomorrowBtn(checkDate, nowDate) {
		if (nowDate.getFullYear() > checkDate.getFullYear()) {
			$("#btn-tomorrow").show();
		} else {
			if (nowDate.getMonth() > checkDate.getMonth()) {
				$("#btn-tomorrow").show();
			} else {
				if (nowDate.getDate() > checkDate.getDate()) {
					$("#btn-tomorrow").show();
				} else {
					$("#btn-tomorrow").hide();
				}
			}
		}

	}

	function setToday() {
		console.log("setToday()")
		$('.calendar').datepicker('setDate', 'today');
		//$("#btn-tomorrow").hide();
		//todayCnt = 0;
		//showHideTomorrow();
		var nowDate = $(".calendar").datepicker('getDate');
		showHideTomorrowBtn(nowDate, nowDate);
	}
	function setTomorrow() {
		var nowDate = $(".calendar").datepicker('getDate');
		console.log("nowDate: " + nowDate)
		var tomorrowDate = new Date(nowDate.getFullYear(), nowDate.getMonth(),
				nowDate.getDate() + 1);
		$(".calendar").datepicker('setDate', tomorrowDate)
		//todayCnt++;
		//showHideTomorrow();
		showHideTomorrowBtn(tomorrowDate, new Date());
	}
	function setYesterday() {
		var nowDate = $(".calendar").datepicker('getDate');
		console.log("nowDate: " + nowDate)
		var yesterdayDate = new Date(nowDate.getFullYear(), nowDate.getMonth(),
				nowDate.getDate() - 1);
		$(".calendar").datepicker('setDate', yesterdayDate)
		//todayCnt--;

		//showHideTomorrow();
		showHideTomorrowBtn(yesterdayDate, new Date());
	}
</script>

</head>
<body>
	
	<%@include file="mainheader.jsp" %> 

	<!-- 전체메뉴 백그라운드-->
	<div class="all-dim"></div>


	<div class="containerNew">
		<div class="contents">
		<div class="row">
		
		
			<div class="col-md-2">
				<div class="sidebar sticky" id="cssmenu">
					<ul>
						<li id="sideTitle"><a href="#"  style="cursor:pointer;"><span>고객센터</span></a></li>
						<li><a href="#"><span>공지사항</span></a></li>
						<li><a href="#"><span>도움말</span></a></li>
						<li><a href="#"><span>1:1문의</span></a></li>
					</ul>
				</div>
			</div>
				
				
				
				
				
				
				<div class="col-md-10">
				
				
				
				<div class="newsboard-area">
				
				
				<div class="drop-nav">
								<h1 class="tit-h1 line">도움말</h1>
							</div>
							
							<div class="m-drop-nav">
								<h1 class="m-drop-tit-title line" style="cursor:pointer;">도움말 ▼</h1>
							</div>
							<div class="m-drop-down">
								<h1 class="m-drop-tit-body first line" style="cursor:pointer;"><a href="/board/free">고객센터</a></h1>
								<h1 class="m-drop-tit-body line" style="cursor:pointer;"><a href="#">공지사항</a></h1>
								<h1 class="m-drop-tit-body line" style="cursor:pointer;"><a href="#">도움말</a></h1>
								<h1 class="m-drop-tit-body last line" style="cursor:pointer;"><a href="/news">1:1문의</a></h1>
							</div>
				
				
				<div class="newsboard-nav">
					<ul class="nav newsboard-nav-tab" id="pills-tab" role="tablist">
						<li class="newsboard-nav-item selected" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-home" role="tab" aria-controls="pills-home"
							aria-selected="true">회원</a></li>
						<li class="newsboard-nav-item" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-profile" role="tab" aria-controls="pills-profile"
							aria-selected="false">커뮤니티</a></li>
						<li class="newsboard-nav-item" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-contact" role="tab" aria-controls="pills-contact"
							aria-selected="false" style="border-right: none;">거래</a></li>
					</ul>
				</div>

				<div class="board-calendar">
					
					<div class="week ">
						<p class="date">
							<button onclick="setYesterday();" class="prev-week">어제</button>
							<strong id="test-date" value="setToday();"></strong>
							<span class="input-group-addon"> <button type="button" class="calendar add-on">달력보기</button></span>
							<button type="button" onclick="setToday();" class="btn-s">오늘</button>
							<button onclick="setTomorrow();" class="next-week" id="btn-tomorrow">내일</button>
						</p>
					</div>
					<!-- //week -->
				</div>
				<!-- //board-calendar -->


				<div class="tab-content" id="pills-tabContent">
				
				
				
					<div class="tab-pane fade show active" id="pills-home"
						role="tabpanel" aria-labelledby="pills-home-tab">
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
												<p>회원가입시 설정하신 비밀dfsfd번호는 모두 암호화되어 저장되므로,
												고객센터에서 확인이 불가능합니다.

												로그인 영역> 비밀번호 찾기 를 통해 확인 부탁 드립니다.</p>
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
												<p>회원가입 상태에서는 아이디를 변경하실 수가 없습니다.
												단, 아이디를 제외한 나머지 정보들(필명,이메일,주소,전화번호,비밀번호 등)
												은 변경이 가능합니다.
												아이디를 변경하시기 위해서는 회원 탈퇴 후 다시 재가입 을 하셔야 합니다.

												회원탈퇴를 하시기전에 사용하셨던
												아이디, 유료서비스 등의 사용이 불가능 하므로
												탈퇴하시기 전에 반드시 유료서비스를 먼저 해지하여주시기 바랍니다.</p>
											</div>
										</div>
									</div>
								</div>



							</div>
																		<a class="moreBttn right blue" href="#">글쓰기</a>
							
				
					</div>
					
					
					<div class="tab-pane fade" id="pills-profile" role="tabpanel"
						aria-labelledby="pills-profile-tab">
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
												<p>회원가입시 설정하신 비밀dfsfd번호는 모두 암호화되어 저장되므로,
												고객센터에서 확인이 불가능합니다.

												로그인 영역> 비밀번호 찾기 를 통해 확인 부탁 드립니다.</p>
											</div>
										</div>
									</div>
								</div>
								<!-- 반복끝 -->
								</div>
								<a class="moreBttn right blue" href="#">글쓰기</a>
					</div>
					
					
					<div class="tab-pane fade" id="pills-contact" role="tabpanel"
						aria-labelledby="pills-contact-tab">
				
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
												<p>회원가입시 설정하신 비밀dfsfd번호는 모두 암호화되어 저장되므로,
												고객센터에서 확인이 불가능합니다.

												로그인 영역> 비밀번호 찾기 를 통해 확인 부탁 드립니다.</p>
											</div>
										</div>
									</div>
								</div>
								<!-- 반복끝 -->
								</div>
								<a class="moreBttn right blue" href="#">글쓰기</a>
				
				
				
				
				
				
					</div>
					
					
				</div>
				
				<!-- 페이징 -->
				<div class="paging">	
					<div class="paging-body">				
					<nav aria-label="..." class="pagination">
					    <ul class="pagination">
					
					<c:if test="${boardPage.nowPage != 1}">
					      <!-- << 버튼 -->
					      <li>
					        <a class="page-link"
					          href="/board/free?bnowPage=1"
					          tabindex="-1" aria-disabled="true">
					          <i class="fas fa-angle-double-left"></i>
					        </a>
					      </li>
					      <!-- 1페이지에서 < 버튼 눌렀을 때 -->
					      <c:if test="${boardPage.nowPage == 1}">
					        <li>
					          <a class="page-link"
					            href="/board/free?bnowPage=${boardPage.nowPage}"
					            tabindex="-1" aria-disabled="true">
					            <i class="fas fa-angle-left"></i>
					          </a>
					        </li>
					      </c:if>
					</c:if>
					      
					      <!-- 1페이지가 아닌 페이지에서 < 버튼 눌렀을 때 -->
					      <c:if test="${boardPage.nowPage != 1}">
					        <li>
					          <a class="page-link"
					            href="/board/free?bnowPage=${boardPage.nowPage-1}"
					            tabindex="-1" aria-disabled="true">
					            <i class="fas fa-angle-left"></i>
					          </a>
					        </li>
					      </c:if>
					      
					      <!-- 한번에 5개 페이지 보여줌 -->
					       <c:forEach begin="${boardPage.startPage }"
					        end="${boardPage.endPage }" var="p">
					        <c:choose>
					          <c:when test="${p == boardPage.nowPage}">
					            <li class="page-item active" aria-current="page">
					              <a class="page-link" href="#">${p}
					                <span class="sr-only">(current)</span>
					              </a>
					            </li>
					          </c:when>
					          <c:when test="${p != boardPage.nowPage}">
					            <li class="page-item">
					              <a class="page-link" href="/board/free?bnowPage=${p}">${p}</a>
					            </li>
					          </c:when>
					        </c:choose>
					      </c:forEach> 
					      
					      
					      
					 	 <c:if test="${boardPage.nowPage != boardPage.lastPage}">    
					      <!-- 현재 페이지가 마지막 페이지일 경우 > 버튼을 눌렀을 때 -->
					      <c:if test="${boardPage.nowPage == boardPage.lastPage}">
					        <li>
					          <a class="page-link"
					            href="/board/free?bnowPage=${boardPage.nowPage}"
					            tabindex="+1" aria-disabled="true">
					            <i class="fas fa-angle-right"></i>
					          </a>
					        </li>
					      </c:if>
					      
					      <!-- 현재 페이지가 마지막 페이지가 아닐 경우에 > 버튼을 눌렀을 때 -->					
					      <c:if test="${boardPage.nowPage != boardPage.lastPage}">
					        <li>
					          <a class="page-link"
					            href="/board/free?bnowPage=${boardPage.nowPage+1}"
					            tabindex="+1" aria-disabled="true" data-ajax="false">
					            <i class="fas fa-angle-right"></i>
					          </a>
					        </li>
					      </c:if> 
					
					      <!-- >> 버튼 -->
					      <li>
					        <a class="page-link"
					        href="/board/free?bnowPage=${boardPage.lastPage}"
					        tabindex="-1" aria-disabled="true">
					          <i class="fas fa-angle-double-right"></i>
					        </a>
					      </li>
					      
					      </c:if>
					    </ul>
					  </nav>
					 </div>
				</div>
				
				<div class="search-area">
					<div  class="search-area-body">
					<form class="form-inline my-2 my-lg-0 underSearchForm" action="/board/free">
						<!-- <a class="nav-link dropdown-toggle" href="#" id="dropdown01"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">제목</a> -->
						<select class="dropdown-toggle-board" name="searchStyle">
							<option class="nav-link dropdown-toggle board-item" id="dropdown01"
								data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" value="" <c:if test='${searchStyle eq ""}'>selected</c:if>>전체</option>
							<option class="dropdown-item board-item" value="search_title"<c:if test='${searchStyle eq "search_title"}'>selected</c:if>>제목</option> 
							<option class="dropdown-item board-item" value="search_content"<c:if test='${searchStyle eq "search_content"}'>selected</c:if>>내용</option> 
							<option class="dropdown-item board-item" value="search_title_content"<c:if test='${searchStyle eq "search_title_content"}'>selected</c:if>>제목 + 내용</option> 
							<option class="dropdown-item board-item" value="search_nick"<c:if test='${searchStyle eq "search_nick"}'>selected</c:if>>글쓴이</option>
						</select>
						<input class="form-control mr-sm-2 board-search" type="search"
							placeholder="검색어 입력" aria-label="Search">
						<button class="btn btn-outline-secondary my-2 my-sm-0 board-search-btn"
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

	<%@include file="mainfooter.jsp" %> 
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
	<script src="resources/jpaginate/jquery.twbsPagination.js"></script>
	<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
	<script src="resources/js/bootstrap-datepicker.ko.min.js"></script>
	<!-- paginate -->
	<script src="resources/jpaginate/jquery.twbsPagination.js" type="text/javascript"></script>
	<!-- paginate -->
</body>
</html>