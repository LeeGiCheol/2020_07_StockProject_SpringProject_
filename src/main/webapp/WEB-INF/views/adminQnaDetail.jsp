 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Jekyll v4.0.1">
  
  <title>관리자페이지</title>




    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
   <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/dashboard/">
<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<!-- 데이터테이블스타일 -->
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
 
<!--  스타일-->
  <link href="/resources/css/free-board-detail.css" rel="stylesheet">
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
        <ul class="navbar-nav ml-auto ml-md-0">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    <a class="dropdown-item" href="/mainPage">로그아웃</a>
                </div>
            </li>
        </ul>



    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark"">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">메인</div>
                        <a class="nav-link" href="/admin/main">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
             			               대시보드
                        </a>
                        <div class="sb-sidenav-menu-heading">사이트관리</div>
                        <a class="nav-link" href="/admin/qna">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
         				                   문의
                        </a>
                        <a class="nav-link" href="/admin/report">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                         		   신고
                        </a>
                    </div>
                </div>
                
                
             <!--    페이지 하단에 ~로 로그인 하셨습니다 -->
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    
                </div>
                
                
                
            </nav>
        </div>
        <div id="layoutSidenav_content">
					<div class="cont-area">	
 							<div class="drop-nav">
								<h1 class="tit-h1 line">1:1문의 내역</h1>
							</div>
							<div class="m-drop-nav">
								<h1 class="m-drop-tit-title line" style="cursor: pointer;">1:1문의 내역 <i class="fas fa-angle-down"></i></h1>
							</div>
							<div class="m-drop-down">
								<h1 class="m-drop-tit-body first line" style="cursor: pointer;">
									<a href="/customer">고객센터</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerNotice">공지사항</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerqna">도움말</a>
								</h1>
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerClaim/write">1:1문의</a>
								</h1>														
								<h1 class="m-drop-tit-body line" style="cursor: pointer;">
									<a href="/customerClaim/list">1:1문의 내역</a>
								</h1>
							</div>	
		<!-- <h1 class="tit-h1">Q&amp;A</h1> -->

		<div class="qna-desc">
			<strong class="import">서비스 이용중 궁금한 내역이 있으시면, 언제든지 문의해주세요!</strong>
			<span class="time">1:1로 접수 주시면 빠른답변을 받아보실 수 있습니다. 평일 08:30~17:30</span>
			<a href="javascript:pageMove('serviceInqryInsert');" class="inquiry">1:1문의</a>
		</div>
		<!-- // qna-desc -->

		<h2 class="tit-h2 type mopad">문의내역</h2>
		<div class="table-scroll-no">
			<table class="table-row">
				<caption>Q&amp;A 상세내용 : 처리현황, 아이디, 제목, 내용에 대한 정보</caption>
				<colgroup>
					<col style="width:25%;">
					<col style="width:75%;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">처리현황</th>
						<td><span class="ing">${qna.qcheck}</span></td>
					</tr>
					<tr>
						<th scope="row">아이디</th>
						<td>${qna.id}</td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td>${qna.qtitle}</td>
					</tr>
					<tr>
						<th scope="row">작성일</th>
						<fmt:formatDate value="${qna.qdateTime}" var="time"
							pattern="MM/dd HH:mm" />
						<td class="board-date">${time}</td>
					</tr>
					<tr>
						<th scope="row">내용</th>
						<td><div><p>${qna.qcontent}<br></p></div></td>
					</tr>
				</tbody>
			</table>
			<!-- //table-row -->
		</div>
		<!-- // table-scroll-no -->

		
			<div class="answer-box">
				<strong class="tit">문의주신 내역에 대한 답변입니다.</strong>
				
					
					<c:if test="${qna.atitle eq null}">
						<div class="answer no-answer">
							죄송합니다. 운영자의 답변이 아직 기재되지 않았습니다.<br>
							24시간이 경과한 이후에도 답변이 없다면, 다시 문의하여 주시기 바랍니다. 빠른 시간안에 답변을 드리겠습니다.
						</div>
											<a href="/qnaAnswer/write?qno=${qna.qno}" class="btn-s fantasy">답변</a>
					</c:if>
					
					<c:if test="${qna.atitle ne null }">
					<div class="answer no-answer">
						${qna.acontent}
					</div>
										<a href="/customerClaim/update?qno=${qna.qno}" class="btn-s">수정</a>
					
					</c:if>					
				
					
			</div>	
		
		
		<!-- // answer-box -->

		<div class="bt-area">
				<c:if test="${qna.qcheck eq '준비중'}">
				
				</c:if>
				<c:if test="${qna.qcheck eq '답변완료'}">
					<a href="/qnaAnswer/write?qno=${qna.qno}" class="btn-s fantasy">답변</a>
					<a href="/customerClaim/update?qno=${qna.qno}" class="btn-s">수정</a>
				</c:if>
			<span>
				<a href="/admin/qna" class="btn-s">목록</a>
				
				<a href="/customerClaim/delete?qno=${qna.qno}" class="btn-s fantasy">삭제</a>
			</span> 
		</div>

	</div>
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

</body>

</html>