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
<link rel="stylesheet" href="resources/css/newsA.css">
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
	});

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
							<li><a href="/board/free"><span>자유게시판</span></a></li>
							<li class="mid"><a href="#"><span>포트폴리오</span></a></li>
							<li class="last"><a href="/news"><span>뉴스</span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-10">
				<div class="newsboard-area">
				<div class="drop-nav">
					<h1 class="tit-h1 line">뉴스</h1>
				</div>
				<div class="m-drop-nav">
					<h1 class="m-drop-tit-title line" style="cursor: pointer;">뉴스 ▼</h1>
				</div>
				<div class="m-drop-down">
					<h1 class="m-drop-tit-body first line" style="cursor: pointer;">
						<a href="/news">뉴스</a>
					</h1>
					<h1 class="m-drop-tit-body line" style="cursor: pointer;">
						<a href="/board/free">자유게시판</a>
					</h1>
					<h1 class="m-drop-tit-body last line" style="cursor: pointer;">
						<a href="#">포트폴리오</a>
					</h1>
				</div>
				<div class="newsboard-nav">
					<ul class="nav newsboard-nav-tab" id="pills-tab" role="tablist">
						<li class="newsboard-nav-item selected" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-home" role="tab" aria-controls="pills-home"
							aria-selected="true">종합</a></li>
						<li class="newsboard-nav-item" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-profile" role="tab" aria-controls="pills-profile"
							aria-selected="false">증권</a></li>
						<li class="newsboard-nav-item" role="presentation"><a
							class="nav-link" id="top-nav-font" data-toggle="pill"
							href="#pills-contact" role="tab" aria-controls="pills-contact"
							aria-selected="false" style="border-right: none;">정치/사회</a></li>
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
<ul class="realtimeNewsList" id="newsnewsnews">
<li class="newsList top">

</ul>

				<!-- <div class="tab-content" id="pills-tabContent">
					<div class="tab-pane fade show active" id="pills-home"
						role="tabpanel" aria-labelledby="pills-home-tab">
						<ul class="newslist">
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="전운 감도는 美·中…희토류 관련株 급등" src="resources/img/희토류.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">전운 감도는 美·中…희토류 관련株 급등</a>
									</dt>
									<dd class="cont">
										<a href="#">- 中희토류 무기화 가능성 부각- “美제재 범위 따라 대응해야”[이데일리 김윤지
											기자] 미국과 중국 갈등 고조에 희토류 관련주가 급등했다. 양국 관계가 악화되면 중국이 희토류 무기화 카드를
											꺼낼 가능성이 부각되면…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 19:47</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">IMM PE, 한국콜마 제약부문·콜마파마 인수[마켓워치]</a>
									</dt>
									<dd class="cont">
										<a href="#">5125억원에 주식매매계약 체결 IMM프라이빗에쿼티(PE)가 한국콜마의
											제약사업부문과 한국콜마홀딩스의 자회사 콜마파마를 인수한다. IMM PE는 27일 한국콜마그룹은 한국콜마의
											제약사업부문과 한국콜마홀딩스의 자회사이자 의약품 생산업체인 콜마파마 인수에 관한 주식매…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 19:46</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">금융당국, 회계부정 신고 대상 확대…"분기 및 반기 재무제표까지"</a>
									</dt>
									<dd class="cont">
										<a href="#">- 회계부정 신고 독려 목적[이데일리 유현욱 기자] 앞으로는 기말 재무제표뿐만
											아니라 분·반기 재무제표 관련 회계부정 신고에도 정부 포상금을 지급한다.금융위원회는 27일 제10차 정례회의를
											열어 이런 내용을 담은 ‘회계 관련 부정행위 신고 및 포상 등에 대한 규정 …</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:28</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">충남 천안·아산 28개 학교 등교 연기…"코로나19 확산 우려로 3일만 연기"</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] 충남 천안과 아산지역 28개 학교가 신종
											코로나바이러스감염증(코로나19) 확산 우려에 등교수업을 중단했다.충남교육청은 27일 천안 18개, 아산 10개
											학교가 등교를 연기했다고 밝혔다. 학교별로 1~3일 등 일정 기간만 연기한다는 방침이다. 천안…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:28</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="[이준기의 미국in]회복하는 美경제…트럼프·바이든 누구 손들어줄까"
											src="resources/img/트럼프.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">[이준기의 미국in]회복하는 美경제…트럼프·바이든 누구 손들어줄까</a>
									</dt>
									<dd class="cont">
										<a href="#">- 바이든, 트럼프의 '전유물' 경제 파고드나- 일각 "트럼프 잘해왔다"…자충수 될
											수도- 바이든, 경제대응 실패·회복 적임자 강조사진=AFP[뉴욕=이데일리 이준기 특파원]미국 민주당의
											대선후보로 확정된 조 바이든(사…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="쿠팡 물류센터발 코로나19 재확산…확진자 30명으로 늘어"
											src="resources/img/쿠팡.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">쿠팡 물류센터발 코로나19 재확산…확진자 30명으로 늘어</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] 쿠팡 부천 물류센터를 중심으로 다시 확산되고 있는 신종
											코로나바이러스감염증(코로나19)이 수도권 일대에서 확산하고 있다. 인천시는 부천 물류센터와 관련한 코로나19
											확진자가 27일 오후 3…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">27일 장 마감 후 주요 종목뉴스</a>
									</dt>
									<dd class="cont">
										<a href="#">[이데일리 이광수 기자] 다음은 27일 장 마감 후 주요 종목
											뉴스다.△웅진씽크빅(095720)은 공시 번복했지만 감경 사유로 불성실공시법인에 지정되진 않았다고 공시.

											△SK이노베이션(096770)은 미국 소재 자회사인 SK배터리아메리카에 5567억원 규모의 채무보증을 결정했…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="LG화학, 현대·기아차에 전기차 배터리 공급…CATL도 첫 공급"
											src="resources/img/lg화학.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">LG화학, 현대·기아차에 전기차 배터리 공급…CATL도 첫 공급</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] LG화학이 현대·기아자동차에 수조 원대 규모의 전기차
											배터리를 공급한다.27일 자동차 및 배터리업계에 따르면 LG화학은 현대·기아차가 2022년부터 양산 예정인
											순수 전기차 전용 플랫폼 ‘E…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 18:58</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="차환 막힌 단기증권, '원금상환'사상최대" src="resources/img/단기증권.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">차환 막힌 단기증권, '원금상환'사상최대"</a>
									</dt>
									<dd class="cont">
										<a href="#">이달에만 순상환액 12조 넘어 이달 들어 기업어음(CP)과
											자산유동화기업어음(ABCP) 등 단기증권 순상환액이 12조원을 넘어섰다. 단기자금 시장이 경색되면서 기업들이
											발행한 단기증권보다 상…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 18:46</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="밑천 드러난 나라살림.. 증세 불지피는 국책硏" src="resources/img/나라살림.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">밑천 드러난 나라살림.. 증세 불지피는 국책硏</a>
									</dt>
									<dd class="cont">
										<a href="#">KDI 이어 조세재정硏도 언급전문가들 "시기 문제일뿐 수순"부자 겨냥 핀셋증세는
											효과 적어국민 소득세 구간 확대가 대안靑·기재부는 여전히 "검토 안해" 정부와 청와…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 18:46</span>
									</dd>
								</dl>
							</li>
						</ul>
					</div>
					<div class="tab-pane fade" id="pills-profile" role="tabpanel"
						aria-labelledby="pills-profile-tab">
						<ul class="newslist">
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="[이준기의 미국in]회복하는 美경제…트럼프·바이든 누구 손들어줄까"
											src="resources/img/트럼프.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">[이준기의 미국in]회복하는 美경제…트럼프·바이든 누구 손들어줄까</a>
									</dt>
									<dd class="cont">
										<a href="#">- 바이든, 트럼프의 '전유물' 경제 파고드나- 일각 "트럼프 잘해왔다"…자충수 될
											수도- 바이든, 경제대응 실패·회복 적임자 강조사진=AFP[뉴욕=이데일리 이준기 특파원]미국 민주당의
											대선후보로 확정된 조 바이든(사…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="전운 감도는 美·中…희토류 관련株 급등" src="resources/img/희토류.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">전운 감도는 美·中…희토류 관련株 급등</a>
									</dt>
									<dd class="cont">
										<a href="#">- 中희토류 무기화 가능성 부각- “美제재 범위 따라 대응해야”[이데일리 김윤지
											기자] 미국과 중국 갈등 고조에 희토류 관련주가 급등했다. 양국 관계가 악화되면 중국이 희토류 무기화 카드를
											꺼낼 가능성이 부각되면…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 19:47</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">IMM PE, 한국콜마 제약부문·콜마파마 인수[마켓워치]</a>
									</dt>
									<dd class="cont">
										<a href="#">5125억원에 주식매매계약 체결 IMM프라이빗에쿼티(PE)가 한국콜마의
											제약사업부문과 한국콜마홀딩스의 자회사 콜마파마를 인수한다. IMM PE는 27일 한국콜마그룹은 한국콜마의
											제약사업부문과 한국콜마홀딩스의 자회사이자 의약품 생산업체인 콜마파마 인수에 관한 주식매…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 19:46</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">금융당국, 회계부정 신고 대상 확대…"분기 및 반기 재무제표까지"</a>
									</dt>
									<dd class="cont">
										<a href="#">- 회계부정 신고 독려 목적[이데일리 유현욱 기자] 앞으로는 기말 재무제표뿐만
											아니라 분·반기 재무제표 관련 회계부정 신고에도 정부 포상금을 지급한다.금융위원회는 27일 제10차 정례회의를
											열어 이런 내용을 담은 ‘회계 관련 부정행위 신고 및 포상 등에 대한 규정 …</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:28</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">충남 천안·아산 28개 학교 등교 연기…"코로나19 확산 우려로 3일만 연기"</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] 충남 천안과 아산지역 28개 학교가 신종
											코로나바이러스감염증(코로나19) 확산 우려에 등교수업을 중단했다.충남교육청은 27일 천안 18개, 아산 10개
											학교가 등교를 연기했다고 밝혔다. 학교별로 1~3일 등 일정 기간만 연기한다는 방침이다. 천안…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:28</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="쿠팡 물류센터발 코로나19 재확산…확진자 30명으로 늘어"
											src="resources/img/쿠팡.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">쿠팡 물류센터발 코로나19 재확산…확진자 30명으로 늘어</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] 쿠팡 부천 물류센터를 중심으로 다시 확산되고 있는 신종
											코로나바이러스감염증(코로나19)이 수도권 일대에서 확산하고 있다. 인천시는 부천 물류센터와 관련한 코로나19
											확진자가 27일 오후 3…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">27일 장 마감 후 주요 종목뉴스</a>
									</dt>
									<dd class="cont">
										<a href="#">[이데일리 이광수 기자] 다음은 27일 장 마감 후 주요 종목
											뉴스다.△웅진씽크빅(095720)은 공시 번복했지만 감경 사유로 불성실공시법인에 지정되진 않았다고 공시.

											△SK이노베이션(096770)은 미국 소재 자회사인 SK배터리아메리카에 5567억원 규모의 채무보증을 결정했…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="LG화학, 현대·기아차에 전기차 배터리 공급…CATL도 첫 공급"
											src="resources/img/lg화학.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">LG화학, 현대·기아차에 전기차 배터리 공급…CATL도 첫 공급</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] LG화학이 현대·기아자동차에 수조 원대 규모의 전기차
											배터리를 공급한다.27일 자동차 및 배터리업계에 따르면 LG화학은 현대·기아차가 2022년부터 양산 예정인
											순수 전기차 전용 플랫폼 ‘E…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 18:58</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="차환 막힌 단기증권, '원금상환'사상최대" src="resources/img/단기증권.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">차환 막힌 단기증권, '원금상환'사상최대"</a>
									</dt>
									<dd class="cont">
										<a href="#">이달에만 순상환액 12조 넘어 이달 들어 기업어음(CP)과
											자산유동화기업어음(ABCP) 등 단기증권 순상환액이 12조원을 넘어섰다. 단기자금 시장이 경색되면서 기업들이
											발행한 단기증권보다 상…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 18:46</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="밑천 드러난 나라살림.. 증세 불지피는 국책硏" src="resources/img/나라살림.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">밑천 드러난 나라살림.. 증세 불지피는 국책硏</a>
									</dt>
									<dd class="cont">
										<a href="#">KDI 이어 조세재정硏도 언급전문가들 "시기 문제일뿐 수순"부자 겨냥 핀셋증세는
											효과 적어국민 소득세 구간 확대가 대안靑·기재부는 여전히 "검토 안해" 정부와 청와…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 18:46</span>
									</dd>
								</dl>
							</li>
						</ul>
					</div>
					<div class="tab-pane fade" id="pills-contact" role="tabpanel"
						aria-labelledby="pills-contact-tab">
						<ul class="newslist">
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="밑천 드러난 나라살림.. 증세 불지피는 국책硏" src="resources/img/나라살림.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">밑천 드러난 나라살림.. 증세 불지피는 국책硏</a>
									</dt>
									<dd class="cont">
										<a href="#">KDI 이어 조세재정硏도 언급전문가들 "시기 문제일뿐 수순"부자 겨냥 핀셋증세는
											효과 적어국민 소득세 구간 확대가 대안靑·기재부는 여전히 "검토 안해" 정부와 청와…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 18:46</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">IMM PE, 한국콜마 제약부문·콜마파마 인수[마켓워치]</a>
									</dt>
									<dd class="cont">
										<a href="#">5125억원에 주식매매계약 체결 IMM프라이빗에쿼티(PE)가 한국콜마의
											제약사업부문과 한국콜마홀딩스의 자회사 콜마파마를 인수한다. IMM PE는 27일 한국콜마그룹은 한국콜마의
											제약사업부문과 한국콜마홀딩스의 자회사이자 의약품 생산업체인 콜마파마 인수에 관한 주식매…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 19:46</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">금융당국, 회계부정 신고 대상 확대…"분기 및 반기 재무제표까지"</a>
									</dt>
									<dd class="cont">
										<a href="#">- 회계부정 신고 독려 목적[이데일리 유현욱 기자] 앞으로는 기말 재무제표뿐만
											아니라 분·반기 재무제표 관련 회계부정 신고에도 정부 포상금을 지급한다.금융위원회는 27일 제10차 정례회의를
											열어 이런 내용을 담은 ‘회계 관련 부정행위 신고 및 포상 등에 대한 규정 …</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:28</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="전운 감도는 美·中…희토류 관련株 급등" src="resources/img/희토류.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">전운 감도는 美·中…희토류 관련株 급등</a>
									</dt>
									<dd class="cont">
										<a href="#">- 中희토류 무기화 가능성 부각- “美제재 범위 따라 대응해야”[이데일리 김윤지
											기자] 미국과 중국 갈등 고조에 희토류 관련주가 급등했다. 양국 관계가 악화되면 중국이 희토류 무기화 카드를
											꺼낼 가능성이 부각되면…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 19:47</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">충남 천안·아산 28개 학교 등교 연기…"코로나19 확산 우려로 3일만 연기"</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] 충남 천안과 아산지역 28개 학교가 신종
											코로나바이러스감염증(코로나19) 확산 우려에 등교수업을 중단했다.충남교육청은 27일 천안 18개, 아산 10개
											학교가 등교를 연기했다고 밝혔다. 학교별로 1~3일 등 일정 기간만 연기한다는 방침이다. 천안…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:28</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="[이준기의 미국in]회복하는 美경제…트럼프·바이든 누구 손들어줄까"
											src="resources/img/트럼프.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">[이준기의 미국in]회복하는 美경제…트럼프·바이든 누구 손들어줄까</a>
									</dt>
									<dd class="cont">
										<a href="#">- 바이든, 트럼프의 '전유물' 경제 파고드나- 일각 "트럼프 잘해왔다"…자충수 될
											수도- 바이든, 경제대응 실패·회복 적임자 강조사진=AFP[뉴욕=이데일리 이준기 특파원]미국 민주당의
											대선후보로 확정된 조 바이든(사…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="쿠팡 물류센터발 코로나19 재확산…확진자 30명으로 늘어"
											src="resources/img/쿠팡.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">쿠팡 물류센터발 코로나19 재확산…확진자 30명으로 늘어</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] 쿠팡 부천 물류센터를 중심으로 다시 확산되고 있는 신종
											코로나바이러스감염증(코로나19)이 수도권 일대에서 확산하고 있다. 인천시는 부천 물류센터와 관련한 코로나19
											확진자가 27일 오후 3…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<dl class="text">
									<dt>
										<a href="#">27일 장 마감 후 주요 종목뉴스</a>
									</dt>
									<dd class="cont">
										<a href="#">[이데일리 이광수 기자] 다음은 27일 장 마감 후 주요 종목
											뉴스다.△웅진씽크빅(095720)은 공시 번복했지만 감경 사유로 불성실공시법인에 지정되진 않았다고 공시.

											△SK이노베이션(096770)은 미국 소재 자회사인 SK배터리아메리카에 5567억원 규모의 채무보증을 결정했…</a>
									</dd>
									<dd class="date">
										<span>이데일리</span> <span>2020.05.27 19:00</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="LG화학, 현대·기아차에 전기차 배터리 공급…CATL도 첫 공급"
											src="resources/img/lg화학.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">LG화학, 현대·기아차에 전기차 배터리 공급…CATL도 첫 공급</a>
									</dt>
									<dd class="cont">
										<a href="#">[아시아경제 황윤주 기자] LG화학이 현대·기아자동차에 수조 원대 규모의 전기차
											배터리를 공급한다.27일 자동차 및 배터리업계에 따르면 LG화학은 현대·기아차가 2022년부터 양산 예정인
											순수 전기차 전용 플랫폼 ‘E…</a>
									</dd>
									<dd class="date">
										<span>아시아경제</span> <span>2020.05.27 18:58</span>
									</dd>
								</dl>
							</li>
							<li>
								<p class="img">
									<a href="#"> <span id="img-span"> <img
											alt="차환 막힌 단기증권, '원금상환'사상최대" src="resources/img/단기증권.jpg">
									</span>
									</a>
								</p>
								<dl class="text">
									<dt>
										<a href="#">차환 막힌 단기증권, '원금상환'사상최대"</a>
									</dt>
									<dd class="cont">
										<a href="#">이달에만 순상환액 12조 넘어 이달 들어 기업어음(CP)과
											자산유동화기업어음(ABCP) 등 단기증권 순상환액이 12조원을 넘어섰다. 단기자금 시장이 경색되면서 기업들이
											발행한 단기증권보다 상…</a>
									</dd>
									<dd class="date">
										<span>파이낸셜뉴스</span> <span>2020.05.27 18:46</span>
									</dd>
								</dl>
							</li>
						</ul>
					</div>
				</div> -->
				
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
	  
	  $("#newsnewsnews").html(`${news}`);
	  var naverNewsLink = $("#newsnewsnews a").attr("href")
	  $("#newsnewsnews a").attr("href", "https://finance.naver.com"+naverNewsLink)
	  $("#newsnewsnews a").attr("target", "_blank")
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