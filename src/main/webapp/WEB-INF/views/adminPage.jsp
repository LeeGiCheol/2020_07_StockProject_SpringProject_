 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Jekyll v4.0.1">
  <title>관리자 페이지</title>




    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
   <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/dashboard/">
<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- 데이터테이블스타일 -->
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
 
<!--  스타일-->
  <link href="/resources/css/datatable.css" rel="stylesheet" />
        
<!-- 통합관리자 -->
 <link rel="stylesheet" href="/resources/css/admin.css">


  <style type="text/css">

  </style>

</head>

<body class="sb-nav-fixed">



    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!--    로고들어감 -->
        			<a href="/mainPage" class="navbar-logo">
			<img class="" id="logo"
				src="/resources/img/finalogo.png">
				</a> 
        <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i
                class="fas fa-bars"></i></button>




        <!-- Navbar 모바일 미디어 드롭메뉴- 사람아이콘 누르면 -->
        <ul class="navbar-nav ml-auto mr-md-0">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="/logOut">로그아웃</a>
                </div>
            </li>
        </ul>



    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark"">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <a class="nav-link" href="/admin/main">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
             			               관리자 페이지
                        </a>

                        <a class="nav-link" href="/admin/qna">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
         				                   Q&amp;A
                        </a>
                        <a class="nav-link" href="/admin/report">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                         		   신고
                        </a>
                    </div>
                </div>
                
         
                
                
                
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                   <!--  <h3 class="mt-3">관리자페이지</h3> -->


                    <!-- 차트들어가는부분 -->
                    <div class="row">
                        <div class="col-xl-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-area mr-1"></i>
                                    Area Chart Example
                                    차트1
                                </div>
                                <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                            </div>
                        </div>
                        <div class="col-xl-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-bar mr-1"></i>
                                    Bar Chart Example
                                    차트2
                                </div>
                                <div class="card-body" id="boardChart" style="width: 100%; height: 300px;"><!-- <canvas id="myBarChart" width="100%" height="40"></canvas> --></div>
                            </div>
                        </div>
                    </div>




					<div class="row">

                            

                                <!-- 문s의테이블 시작 -->
                                <div class="col-xl-6">
                                	<div class="card mb-4 table-div">
                                <h5 class="mt-4">1:1문의</h5>
                                <table class="adminTable" width="100%" cellspacing="0">
                                    <!-- 테이블 데이터 헤더 -->
                                    <thead>
                                        <tr>
                                            <th class="class center" style="width: 10%;">종류</th>
                                            <th class="status center" style="width: 10%">처리현황</th>
                                            <th class="title tleft" style="width: 55%">제목</th>
                                            <th class="writer tleft" style="width: 10%">닉네임</th>
                                            <th class="date center" style="width: 15%">일시</th>
                                        </tr>
                                    </thead>
                                    
                                    
                                    <!-- 데이터값 들어가는 곳 -->
                                    <tbody>
                                    
                                    
                                    	<c:forEach var="qnaList" items="${qnaList}">
	                                       <tr>
	                                            <td class="tClass center">${qnaList.qtype}</td>
	                                            <td class="tStatus center">${qnaList.qcheck}</td>
	                                            <td class="tTitle tleft"> <a href="/admin/qna/detail?qno=${qnaList.qno}">${qnaList.qtitle}</a></td>
	
	                                            <td class="tWriter tleft">${qnaList.nickname}</td>
	                                            <fmt:formatDate value="${qnaList.qdateTime}" var="time"
													pattern="MM/dd HH:mm" />
												<td class="board-date">${time}</td>
	                                        </tr>
                                        </c:forEach>

									</tbody>
                                </table>
                                </div>
                                <!-- 문의테이블끝 -->
								</div>
                                
                                
                                
                                <!-- 신고테이블 시작 -->
                               <div class="col-xl-6">
                                <div class="card mb-4 table-div">
                                <h5 class="mt-4">신고</h5>
                                <table class="adminTable tRight" width="100%" cellspacing="0">
                                    <!-- 테이블 데이터 헤더 -->
                                    <thead>
                                        <tr>
                                            <th class="class center" style="width: 10%;">종류</th>
                                            <th class="status center" style="width: 10%">처리현황</th>
                                            <th class="title tleft" style="width: 55%">제목</th>
                                            <th class="writer tleft" style="width: 10%">아이디</th>
                                            <th class="date center" style="width: 15%">일시</th>
                                        </tr>
                                    </thead>
                                    <!--  데이터값 들어가는 곳 -->
                                    <tbody>
                                       <tr>
                                            <td class="tClass center">종류</td>
                                            <td class="tStatus center">처리현황</td>
                                            <td class="tTitle tleft"> <a href="">메시지 요청된 리소스 (는) 가용하지 않습니다.ioiuoiuouiouio</a></td>

                                            <td class="tWriter tleft">아이디</td>
                                            <td class="tDate center">05/22/2022</td>
                                        </tr>
                                        
                                        
                                       <tr>
                                            <td class="tClass center">종류</td>
                                            <td class="tStatus center">처리현황</td>
                                            <td class="tTitle tleft"> <a href="">메시지 요청된 리소스 (는) 가용하지 않습니다.ioiuoiuouiouio</a></td>

                                            <td class="tWriter tleft">아이디</td>
                                            <td class="tDate center">05/22/2022</td>
                                        </tr>
                                        

                                    </tbody>
                                </table>
                                </div>
                                <!-- 신고테이블끝 -->




                        
                        </div>
                        
                    </div>

<!--                     <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table mr-1"></i>
                            사이트관리
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">

                                문의테이블 시작
                                <h5 class="mt-4">문의</h5>
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    테이블 데이터 헤더
                                    <thead>
                                        <tr>
                                            <th class="center" style="width: 10%;">종류</th>
                                            <th class="center"style="width: 10%">처리현황</th>
                                            <th style="width: 25%">제목</th>
                                            <th style="width: 35%">내용</th>
                                            <th class="center" style="width: 10%">아이디</th>
                                            <th class="center" style="width: 10%">일시</th>
                                        </tr>
                                    </thead>
                                    
                                    
                                    데이터값 들어가는 곳
                                    <tbody>
                                        <tr>
                                            <td class="center">종류</td>
                                            <td class="center">처리현황</td>
                                            <td><p class="content">제목타입 상태 보고
메시지 요청된 리소스 (는) 가용하지 않습니다.</p></td>
                                            <td><p class="content">내용타입 상태 보고
메시지 요청된 리소스 [/board/portfolio]은(는) 가용하지 않습니다.
설명 Origin 서버가 대상 리소스를 위한 현재의 representation을 찾지 못했거나, 그것이 존재하는지를 밝히려 하지 않습니다.</p></td>
                                            <td class="center">아이디</td>
                                            <td class="center">05/22/2022</td>
                                        </tr>
                                        
                                       <tr>
                                            <td class="center">종류</td>
                                            <td class="center">처리현황</td>
                                            <td><p class="content">제목</p></td>
                                            <td><p class="content">내용</p></td>
                                            <td class="center">아이디</td>
                                            <td class="center">05/22/2022</td>
                                        </tr>

                                    </tbody>
                                </table>
                                문의테이블끝

                                
                                신고테이블 시작
                                <h5 class="mt-4">신고</h5>
                                <table class="table table-bordered" width="100%" cellspacing="0">
                                    테이블 데이터 헤더
                                    <thead>
                                        <tr>
                                            <th class="center" style="width: 10%;">종류</th>
                                            <th class="center"style="width: 10%">처리현황</th>
                                            <th style="width: 25%">제목</th>
                                            <th style="width: 35%">내용</th>
                                            <th class="center" style="width: 10%">아이디</th>
                                            <th class="center" style="width: 10%">일시</th>
                                        </tr>
                                    </thead>
                                     데이터값 들어가는 곳
                                    <tbody>
                                       <tr>
                                            <td class="center">종류</td>
                                            <td class="center">처리현황</td>
                                            <td><p class="content">제목</p></td>
                                            <td><p class="content">내용</p></td>
                                            <td class="center">아이디</td>
                                            <td class="center">05/22/2022</td>
                                        </tr>

                                    </tbody>
                                </table>
                                신고테이블끝




                            </div>
                        </div>
                    </div> -->





                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright ⓒ 2020 - 2020 fantasy stock. All rights reserved.</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous">
    </script>
    <script src="/resources/js/scripts.js"></script>
    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="/resources/js/chart-area-demo.js"></script>
    <script src="/resources/js/chart-bar-demo.js"></script>
    <script src="/resources/js/datatables-demo.js"></script>    
    
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>


<script>
	google.charts.load("current", {packages:["bar"]});
	 google.charts.setOnLoadCallback(drawChart);

var a = "${boardChart[0].chartCount}"
	
	function drawChart() {

		 var data = google.visualization.arrayToDataTable([
	          ['일별 게시물 개수', '개수'],
	          ["${boardChart[0].chartDate}", ${boardChart[0].chartCount}],
	          ["${boardChart[1].chartDate}", ${boardChart[1].chartCount}],
	          ["${boardChart[2].chartDate}", ${boardChart[2].chartCount}],
	          ["${boardChart[3].chartDate}", ${boardChart[3].chartCount}],
	          ["${boardChart[4].chartDate}", ${boardChart[4].chartCount}]
	        ]);
		 
		 
		 
		var options = {
			chart : {
				title : 'Analysis of Dialogue System',
				subtitle : ''
			}
		};

		var chart = new google.charts.Bar(document
				.getElementById('boardChart'));

		chart.draw(data, google.charts.Bar.convertOptions(options));

	}	

</script>

</body>

</html>