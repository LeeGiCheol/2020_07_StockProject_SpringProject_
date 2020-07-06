<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>알람 상세조회</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
  <!-- CSS파일 -->
  <link href="/resources/css/alarm-detail.css" rel="stylesheet">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script>
   $(document).ready(function(){
    $("#btnDelete").click(function(){
    	swal({
    		  text: "정말 삭제하시겠습니까?",
    		  icon: "warning",
    		  buttons: true,
    		  dangerMode: true,
    		})
    		.then((willDelete) => {
    		  if (willDelete) {
    		    swal("성공적으로 삭제되었습니다.", {
    		      icon: "success",
    		    });
    		  } else {
    		    swal("삭제를 취소하였습니다.");
    		  }
    		}); 
        })
  });
  </script>
</head>

<body>
  <%@include file="../mainheader.jsp" %>
  <!-- article start -->
  <!-- 상단메뉴 -->
  <div class="sideBar col-md-4 order-md-2 mb-4" id="menu-bar">
    <ul class="list-group mb-3">
      <!-- java에서 온클릭 위치 바꾸기!!!!!!!!!!!!!!!!!!!-->
      <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed mypage01"
        onclick="location.href='mypage01.jsp'">
        <div>
          <h6 class="my-0">내정보</h6>
        </div>
      </li>
      <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed mypage02"
        onclick="location.href='mypage02.jsp'">
        <div>
          <h6 class="my-0">계좌정보</h6>
        </div>
      </li>
      <li class="sideBarMenuNonSelect list-group-item d-flex justify-content-between lh-condensed mypage03"
        onclick="location.href='mypage03.jsp'">
        <div>
          <h6 class="my-0">작성 글, 댓글</h6>
        </div>
      </li>
      <li class="sideBarMenuSelect list-group-item d-flex justify-content-between lh-condensed mypage04"
        onclick="location.href='mypage04.jsp'">
        <div>
          <h6 class="my-0">알림</h6>
        </div>
      </li>
    </ul>
  </div>
  <!-- 상단메뉴 끝 -->
  <article class="bg-light container">
    <div class="allBody">
      <div class="row">
        <div class="sideBar col-md-4 order-md-2 mb-4">
          <div class="col-md-8 order-md-1"></div>
          <hr>
          <div>
            <div>
              <div class="notice-header">
                <div class="title-wrap">
                  <p class="category-info"><a href="/notice">알림</a></p>
                  <h2 class="notice-title">#알림제목</h2>
                </div>
                <div class="info-wrap">
                  <ul class="notice-info">
                    <li class="author"><i class="fa fa-user-circle"></i>#작성자 이름</li>
                    <li class="date"><i class="fa fa-clock-o"></i>#2020.05.27</li>
                  </ul>
                </div>
                <div class="article">
                  예정된 기록 관련 변경사항
                  곧 번역 기록을 로그인된 상태에서만 확인할 수 있으며 내 활동에서 함께 관리하도록 변경됩니다. 이번 업그레이드 과정에서 이전 기록이 모두 삭제되므로, 필요한 번역을 저장하여 나중에 편리하게 액세스하세요.
                </div>
              </div>
              <hr>
              <div class="buttons" >
              <button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="window.location.href='mypage04.jsp'">목록</button>
              <button type="button" class="btn btn-sm btn-primary" id="btnDelete" >삭제</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </article>
  <!-- article end -->
<%@include file="../mainfooter.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>