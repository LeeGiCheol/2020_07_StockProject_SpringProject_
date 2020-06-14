<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 상세조회</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link href="/resources/css/free-board-detail.css" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="jpaginate/style.css"/> -->
<script src="http://code.jquery.com/jquery-3.1.0.js"></script>
<script src="/resources/jpaginate/jQuery.paginate.js"></script>
<script src="https://www.jsviews.com/download/jsrender.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="/resources/css/mainfooter.css">
<link rel="stylesheet" href="/resources/css/mainheader.css">

<script>
	$(document).ready(function() {
		
		setTimeout(function() {
			var w = $(".image").children().width();
			var h = $(".image").children().height();
			
			if(w > 1024){
				var ri = 1024/w;
				w = w * ri;
				h = h * ri;
			}
			var a_h = $(".article").children().height();
			var a_w = $(".article").children().width();
			
			console.log(w+" / "+h+" && "+ a_w+" / "+ a_h);
			$(".image").children().width(w);
			 $(".image").children().height(h);
			
		}, 50);
		
		$("#btnDelete").click(function() {
			/* sweetAlert */
			swal({
				  text: "정말삭제하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    swal("성공적으로 삭제되었습니다.", {
				      icon: "success",
				    }).then(function(){
					  location.href = '/board/free/delete?pno=${boardDetail.pno}';
				    });
				  } else {
				    swal("삭제가 취소되었습니다.");
				  }
				});
			/* if (confirm("정말로 삭제하시겠습니까?")) {
				location.href = '/board/free/delete?pno=${boardDetail.pno}';
			} else {
				alert("취소하셨습니다.");
			} */
		})
	});
</script>
<style>

html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video, button, a {
    font-family: 'Noto Sans KR', sans-serif;
}

html, body, div, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote,
   pre, abbr, address, cite, code, del, dfn, img, ins, kbd, q, samp, small,
   var, i, dl, dt, dd, ol, ul, li, fieldset, form, legend, table, caption,
   tbody, tfoot, thead, tr, article, aside, canvas, details, figcaption,
   figure, footer, header, hgroup, menu, nav, section, summary, time,
   audio, video {
   margin: 0;
   padding: 0;
   border: 0;
   vertical-align: baseline;
   font-size: 14px;
   background: transparent;
   list-style: none;
   box-sizing: border-box;
   word-break: break-all;
}

span, em, mark, strong, b, label {
   margin: 0;
   padding: 0;
   border: 0;
   vertical-align: baseline;
   background: transparent;
   list-style: none;
   box-sizing: border-box;
}

em, i {
   font-style: normal;
}

a, a:link, a:visited, a:active, a:hover {
   text-decoration: none;
}

p {
    line-height: 160%;
}

.table td, .table th {
    padding: 6px;
}
tr td button{
	background: transparent;
	border: none;
	margin: 0;
	padding: 0;
} 
.table{
	margin-bottom: 0;
}
.all-dim {
    content: "";
    position: fixed;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    z-index: -1;
    background: #eff3f6;
    text-indent: -9999px;
}
.containerNew{
position: relative;
    max-width: 1260px;
    height: 100%;
    padding: 20px 0 0 0;
    margin: 0 auto;
}
.row {
   margin: 0;
}
.board-views span, .board-likes span {
    display: none;
}
.m-drop-nav, .m-drop-down{
	display: none;
}
.free-board {
    padding: /*20px 30px 60px 30px*/20px 30px 0 30px;
    margin-bottom: /*70px*/40px;
    background: #fff;
    position: relative;
    border: 1px solid #dddddd;
}
.last{
	border-bottom: 1px solid #eaeaea;
}
.m-drop-tit-title{
    margin: 0 -30px 30px;
    border-bottom: 1px solid #eaeaea;
    padding: 0 30px 20px;
    font-size: 20px;
    margin-bottom: 30px;
    font-weight: bold;
    line-height: 100%;
}
.tit-h1, .m-drop-tit-title {
    margin: 0 -30px 30px;
    border-bottom: 1px solid #eaeaea;
    padding: 0 30px 20px;
    font-size: 20px;
    margin-bottom: 30px;
    font-weight: bold;
    line-height: 100%;
}
.m-drop-tit-body a{
	color: #848889;
}
.m-drop-tit-body:hover > a {
  color: #000000;
  font-weight: 600;
}
.m-drop-tit-body{
    margin: 0 -30px 30px;
    padding: 0 30px 20px;
    font-size: 20px;
    margin-bottom: 30px;
    color: #888888;
    font-weight: bold;
    line-height: 100%;
}
@media (max-width: 979px)
.containerNew {
    padding-top: 104px;
}
@media only screen and (max-width: 979px)
.containerNew {
    padding: 0;
    padding-bottom: 170px;
}


.sidebar {
  float: left;
  width: auto;
  border: 1px solid #dddddd;
  padding: 10px
}
.col-md-10, .col-md-2{
    padding-right: 5px;
    padding-left: 5px;
}
@media only screen and (max-width: 1599px)
.board-page {
    margin: 0 auto 100px;
}
/*start 사이드 바 css */
#cssmenu,
#cssmenu ul,
#cssmenu ul li,
#cssmenu ul ul {
  list-style: none;
  margin: 0;
  padding: 0;
  border: 0;
}
#cssmenu ul {
  position: relative;
  z-index: 597;
  float: left;
}
#cssmenu ul li {
  float: left;
  min-height: 1px;
  line-height: 1em;
  vertical-align: middle;
}
#cssmenu ul li.hover,
#cssmenu ul li:hover {
  position: relative;
  z-index: 599;
  cursor: default;
}
#cssmenu ul ul {
  margin-top: 1px;
  visibility: hidden;
  position: absolute;
  top: 1px;
  left: 99%;
  z-index: 598;
  width: 100%;
}
#cssmenu ul ul li {
  float: none;
}
#cssmenu ul ul ul {
  top: 1px;
  left: 99%;
}
#cssmenu ul li:hover > ul {
  visibility: visible;
}
#cssmenu ul li {
  float: none;
}
#cssmenu ul ul li {
  font-weight: normal;
}
/* Custom CSS Styles */
#cssmenu {
  font-size: 18px;
  width: 200px;
  background: white;
  /* border: 1px solid #848889; */
  border-bottom: 1px solid #d7d8da;
  border-top: 1px solid #d7d8da;
  border-right: 1px solid #d7d8da;
}
#cssmenu ul a,
#cssmenu ul a:link,
#cssmenu ul a:visited {
	display: block;
    color: #848889;
    text-decoration: none;
    font-weight: 300;
    font-size: 16px;
}
#cssmenu > ul {
  float: none;
}
#cssmenu ul {
  background: #fff;
}
#cssmenu > ul > li {
  border-left: 3px solid #d7d8da;
}
#cssmenu > ul > li > a {
padding: 25px 10px;
}
#cssmenu > ul > li:hover {
  border-left: 3px solid #000000;
}
#cssmenu ul li:hover > a {
  color: #000000;
  font-weight: 600;
}
#cssmenu > ul > li:hover {
  background: #f6f6f6;
}
/* Sub Menu */
#cssmenu ul ul a:link,
#cssmenu ul ul a:visited {
  font-weight: 400;
  font-size: 14px;
}
#cssmenu ul ul {
  width: 180px;
  background: none;
  border-left: 20px solid transparent;
}
#cssmenu ul ul a {
  padding: 8px 0;
  border-bottom: 1px solid #eeeeee;
}
#cssmenu ul ul li {
  padding: 0 20px;
  background: #fff;
}
#cssmenu ul ul li:last-child {
  border-bottom: 3px solid #d7d8da;
  padding-bottom: 10px;
}
#cssmenu ul ul li:first-child {
  padding-top: 10px;
}
#cssmenu ul ul li:last-child > a {
  border-bottom: none;
}
#cssmenu ul ul li:first-child:after {
  content: '';
  display: block;
  width: 0;
  height: 0;
  position: absolute;
  left: -20px;
  top: 13px;
  border-left: 10px solid transparent;
  border-right: 10px solid #fff;
  border-bottom: 10px solid transparent;
  border-top: 10px solid transparent;
}
#cssmenu > ul > .mid {
	border-bottom: 1px solid #d7d8da;
	border-top: 1px solid #d7d8da;
}
/*end 사이드 바 css */
.board-view {
    padding: 0 0 30px;
}
.board-view .board-view-tit {
    position: relative;
    border-bottom: #eaeaea 1px solid;
    padding: 0 0 20px;
}
.board-view .board-view-tit h1 {
    font-size: 28px;
    color: #000;
    line-height: 1.2;
    padding-right: 130px;
    word-break: break-all;
}
.board-view .board-view-tit .writer {
    min-height: 35px;
    line-height: 35px;
    margin-top: 10px;
    color: #888888;
    font-size: 13px;
}
.board-view .board-view-tit .writer .img, .board-view .board-view-tit .writer .text {
    display: inline;
}
.board-view .board-view-tit .writer img {
    vertical-align: middle;
    display: inline-block;
    margin-right: 5px;
    width: 34px;
    height: 34px;
    border-radius: 50%;
    background-color: #eaeaea;
}
.board-view .board-view-tit .writer span {
    background: url(/resources/img/bg_line.png) no-repeat right 50%;
    padding-right: 10px;
    margin-right: 5px;
}
.board-view .board-view-tit .writer span:last-child {
    background: none;
}
.board-view .board-view-cont {
    border-bottom: #eaeaea 1px solid;
    padding: 40px 0;
    line-height: 1.6;
    min-height: 250px;
}
.board-view .board-view-cont p {
    font-size: 16px;
}
.sns-area.board-sns {
    margin-top: 0;
    padding-top: 20px;
}
.sns-area {
    min-height: 36px;
    margin-top: 15px;
    position: relative;
    text-align: center;
    clear: both;
    z-index: 100;
    margin-bottom: 60px;
}
.sns-area .notify-box {
    float: left;
}
.sns-area .notify-box .notify {
    height: 28px;
    line-height: 25px;
    padding: 0px 15px 0 10px;
    box-sizing: border-box;
}

[class*="btn-"] {
    position: relative;
    background: #fff;
    border: 1px solid #444;
    line-height: 100%;
    display: inline-block;
    color: #000;
    vertical-align: middle;
    box-sizing: border-box;
    text-align: center;
}
[class*="btn-s"] {
    padding: 6px 10px;
    min-width: 60px;
    font-size: 14px;
    border: 1px solid #ccc;
    color: #888;
}
input[type="button"], button {
    margin: 0;
    padding: 0;
    border: 0;
    cursor: pointer;
    background: none;
}
button, html input[type="button"], input[type="reset"], input[type="submit"] {
    -webkit-appearance: button;
    cursor: pointer;
}
button, select {
    text-transform: none;
}
button {
    overflow: visible;
}
button, input, optgroup, select, textarea {
    margin: 0;
    font: inherit;
    color: inherit;
}
.sns-area .notify-box .notify span {
    display: inline-block;
    height: 20px;
    line-height: 20px;
    background: url(/resources/img/ico_sub.png) no-repeat 0 -100px;
    color: #888888;
    padding-left: 24px;
}
.sns-area .like-box {
    float: right;
}
.sns-area .like-box .like {
    height: 36px;
    line-height: 36px;
    padding: 0px;
    box-sizing: border-box;
    color: #a7753a;
}
[class*="btn-m"] {
    padding: /*10px 14px*/7px 14px;
    min-width: 70px;
    font-size: 14px;
}
.sns-area .like-box .like i {
    display: inline-block;
    width: 20px;
    height: 20px;
    line-height: 20px;
    background: url(/resources/img/ico_board.png) no-repeat 0 -60px;
    text-indent: -9999em;
    margin-right: 5px;
}
.comment-cont {
    position: relative;
    margin-top: 30px;
}
.comment-cont .cmt-write {
    border: #eaeaea 1px solid;
    box-sizing: border-box;
    position: relative;
    clear: both;
}
.comment-cont .cmt-write textarea {
    border: none;
    width: 100%;
    height: 60px;
    box-sizing: border-box;
    font-size: 14px;
    line-height: 18px;
}
textarea {
    padding: 1%;
    width: 100%;
    border: 1px solid #ccc;
    color: #4d4d4d;
    resize: none;
    box-sizing: border-box;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border-radius: 0;
}
textarea {
    overflow: auto;
}
.comment-cont .cmt-write .text-byte {
    background: #fff;
    text-align: right;
    color: #888;
    font-size: 13px;
}
.comment-cont .cmt-write > p {
    padding: 10px;
    background-color: #f9f9f9;
    position: relative;
}
.comment-cont .cmt-write > div.support-button {
    padding: 10px;
    background-color: #f9f9f9;
    position: relative;
    height: 40px;
}
.comment-cont .cmt-write .insert {
    padding: 0;
    position: absolute;
    bottom: 6px;
    right: 7px;
}
.comment-cont .cmt-write .insert .btn-s.gray {
    border: #444 1px solid;
    color: #fff;
}
[class*="btn-"].gray {
    background: #444;
    border: 1px solid #444;
    color: #fff;
}
.comment-cont .cmt-list {
    padding-top: 20px;
}
.comment-cont .cmt-list > p {
    border-bottom: none;
}
.comment-cont .cmt-list > p {
    position: relative;
    font-size: 16px;
    color: #000;
    font-weight: bold;
    border-bottom: #eaeaea 1px solid;
    padding-bottom: 10px;
}
.comment-cont .cmt-list > p span {
    color: #ff545b;
}
.comment-cont .cmt-list > p strong {
    position: absolute;
    top: 6px;
    right: 0;
    font-size: 13px;
    font-weight: normal;
}
input[type="checkbox"]:not(old), input[type="radio"]:not(old) {
    opacity: 0;
    outline: 0;
    margin-left: 0;
    position: absolute;
    z-index: -1;
}
.comment-cont .cmt-list > p strong input[type="radio"]:not(old):checked + label {
    color: #ff545b;
}
.comment-cont .cmt-list > p strong input[type="radio"] + label {
    margin-left: 10px;
    color: #666;
}
.comment-cont:after {
    content: "";
    position: absolute;
    left: -30px;
    right: -30px;
    top: -30px;
    border-top: #000 1px solid;
}
input[type="radio"]:not(old):checked + label {
    background-image: url(/resources/img/bg_radio_on.png);
}
input[type="radio"]:not(old) + label {
    display: inline-block;
    height: 18px;
    padding: 0 0 0 18px;
    background-image: url(/resources/img/bg_radio.png);
    background-position: 0 2px;
    background-repeat: no-repeat;
    background-size: 13px 13px;
    cursor: pointer;
    line-height: 18px;
}
.comment-cont .cmt-list li.list {
    padding: 20px 10px;
    position: relative;
}
.comment-cont .cmt-list li.list > .img {
    position: absolute;
    top: 20px;
    left: 10px;
}
.comment-cont .cmt-list li.list > .img > img {
    width: 35px;
    height: 35px;
    border-radius: 20px;
    background-color: #eaeaea;
}
fieldset, img, abbr, acronym {
    border: 0;
}

.comment-cont.anonymity .cmt-list li.list > div {
    padding-left: 0;
}
.comment-cont .cmt-list .list div.text .writer {
    font-size: 13px;
    color: #888;
    vertical-align: top;
    padding-bottom: 3px;
    padding-right: 70px;
}
.comment-cont .cmt-list .list div.text .writer span:first-child {
    background: url(/resources/img/bg_line.png) no-repeat right 50%;
    padding-right: 10px;
    margin-right: 5px;
}
.comment-cont .cmt-list .list div.text .writer {
    font-size: 13px;
    color: #888;
    vertical-align: top;
    padding-bottom: 3px;
    padding-right: 70px;
}
.comment-cont .cmt-list .list div.text .cont {
    padding-bottom: 10px;
    color: #222222;
    line-height: 1.4;
    word-break: break-word;
}
.comment-cont .cmt-list li.list .share-more {
    position: absolute;
    top: 20px;
    right: 0;
}
.comment-cont .cmt-list li.list .share-more a:last-child {
    background: none;
}
.comment-cont .cmt-list li.list .share-more a {
    display: inline-block;
    color: #a7753a;
    font-size: 13px;
    padding: 0 3px 0 4px;
}
.comment-cont .cmt-list li.list .share-more a.notify span {
    background: url(/resources/img/ico_sub.png) no-repeat 0 -370px;
}
.comment-cont .cmt-list li.list .share-more a span {
    display: inline-block;
    width: 20px;
    height: 20px;
    line-height: 20px;
    text-indent: -9999em;
}
.comment-cont .cmt-list li.list > div {
    padding-left: 45px;
}
@media only screen and (min-width: 979px){
.comment-cont.anonymity .cmt-list li.list > div {
    padding-left: 45px;
}
}
.bt-area {
    overflow: hidden;
    padding: 20px 0 40px;
}
.bt-area span {
    display: block;
    float: right;
}
[class*="btn-s"].bodrb {
    border: 1px solid #444;
    color: #000;
}
#replyArea {
    border-bottom: #eaeaea 1px solid;
}
[class*="btn-"].red {
    background: #ff545b;
    border: 1px solid #ff545b;
    color: #fff;
}
.prev-next {
    width: 100%;
    overflow: hidden;
    border-top: #444444 1px solid;
    margin-bottom: 30px;
}
.prev-next > div {
    border: #eaeaea 1px solid;
}
.prev-next > div dl {
    padding: 10px 20px;
    overflow: hidden;
}
.prev-next > div dl dt {
    color: #444;
    float: left;
    width: 80px;
}
</style>
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
							<li><a href="/board/free"><span>자유게시판</span></a></li>
							<li class="mid"><a href="#"><span>포트폴리오</span></a></li>
							<li class="last"><a href="/news"><span>뉴스</span></a></li>
						</ul>
					</div>
				</div>
	  <div class="col-md-10">
		<div class="free-board">
		<div class="drop-nav">
			<h1 class="tit-h1 line">자유게시판</h1>
		</div>
		<div class="m-drop-nav">
			<h1 class="m-drop-tit-title line" style="cursor:pointer;">자유게시판 ▼</h1>
		</div>
		<div class="m-drop-down">
			<h1 class="m-drop-tit-body first line" style="cursor:pointer;"><a href="/board/free">자유게시판</a></h1>
			<h1 class="m-drop-tit-body line" style="cursor:pointer;"><a href="#">포트폴리오</a></h1>
			<h1 class="m-drop-tit-body last line" style="cursor:pointer;"><a href="/news">뉴스</a></h1>
		</div>
		<div class="board-detail">
			<div id="boardList"></div>
		</div>
		<div class="board-view">
		</div>	
		
		<div class="comment-cont anonymity">

	<!-- 실명인증 -->
	<div class="cmt-write">
		<textarea id="inputComment" class="commentCentent byte-count e-login" data-byte-limit="1000" rows="2" cols="10" placeholder="따뜻한 댓글은 글쓴이에게 큰 힘이 됩니다. 욕설/비방이 담긴 댓글은 삭제될 수 있습니다."></textarea>
		
		<p class="text-byte">0/1000 byte</p>
		<div class="support-button">
			<span class="insert"><a href="javascript:addComment(this);" class="btn-s gray">등록</a></span>
		</div> 
		</div>
	<!-- //cmt-write -->
	
	<div class="cmt-list" id="cmt-list" style="">
		<p>
			댓글 보기 <span id="commentCnt">1</span>
			<strong>
				<input type="radio" id="orderby1" name="orderby3" checked="checked" onclick="changeOrder();"><label for="orderby1">최신순</label>
				<input type="radio" id="orderby2" name="orderby3" onclick="changeOrder('popular');"><label for="orderby2">인기순</label>
			</strong>
		</p>
		<ul id="replyArea">
		
				<li class="list">
						<p class="img"><img class="pax_f2_proimg" cust_id="angelina0416" src="/resources/img/pi_08.png"></p>
						<div>
							<div class="text" id="text_45219165">
								<p class="writer">
									<span id="writer_45219165" onclick="javascript:viewProfile('angelina0416')" style="cursor:pointer;">안녕하세용용</span>
									<span class="data-date-format" data-date-format="Thu Jun 11 13:11:12 KST 2020">06.11</span>
								</p>

								<p class="cont">저는 고기를 많이 사먹음ㅋㅋ</p>

							</div>

							<!-- //text -->
							<div class="share-more">
								<a class="notify e-login e-report-comt-popup" href="javascript:bbsComment_report('45219165', '안녕하세용용');"><span>신고</span></a>
											</div>
						</div>
					</li>
</ul>
	</div>
</div>
		
		<p class="bt-area view-bt-area">

        <span>
            <a href="javascript:goList();" class="btn-s bodrb">목록</a>
			<a href="javascript:goEdit();" class="btn-s red">글쓰기</a>
		</span>
    	</p>
    	<div class="prev-next">
	        <div class="prev">
	            <dl>
	                <dt>이전글</dt>
	                <dd>
	                    <a href="javascript:goNextPreView('150357583535303','N10841','');">현충원 최고의 명당자리에 묻혀있는 일본군 장교 56명</a>
	                        </dd>
	            </dl>
	        </div>
	        <div class="next">
	            <dl>
	                <dt>다음글</dt>
	                <dd>
	                    <a href="javascript:goNextPreView('150357583551308','N10841','');">저는 여자를 좋아하지 않습니다</a>
	                        </dd>
	            </dl>
	        </div>
	    </div>
		<div class="comment">
		<h2 id='commentBody' class='comment-title'>댓글</h2>
		
		<!-- 댓글 -->
		<div id="commentList">
		</div>
		
		<!-- 댓글 페이징 -->
		<div id="commentPaging">
		</div>
			<div class="comment-wrap">
				<div>
					<div class="comment-form">
						<form action="/board/writeComment" method="POST" id="commentForm">
							<fieldset>
								<dl class="comment-write">
									<dt>
										<label for="[##_comment_input_comment_##]">내용</label>
									</dt>
									<dd>
										<input type="hidden" name="pno" value="${boardDetail.pno}">

									<c:if test="${loginUser != null}">
											<textarea name="ccontent" id="[##_comment_input_comment_##]"
												placeholder="여러분의 소중한 댓글을 입력해주세요"></textarea>
									</c:if>
	
									<c:if test="${loginUser == null}">
											<textarea name="ccontent" id="[##_comment_input_comment_##]"
												placeholder="댓글을 작성하시려면 로그인을 해주세요" onclick="location.href='/signInPage'"></textarea>
									</c:if>

									</dd>
								</dl>
									<button type="button" class="reply-btn" onclick="writeComment('${boardDetail.pno }')">댓글 남기기</button>
							</fieldset>
						</form>




					</div>
				</div>
				<div class="buttons">
					<button type="button" class="btn btn-sm btn-primary" id="btnList"
						onclick="window.location.href='/board/free'">목록</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnMyList"
						onclick="window.location.href='/myPage03'">내가 쓴글</button>

					<c:if test="${loginUser.nickname eq boardDetail.nickname}">
						<button type="button" class="btn btn-sm btn-primary"
							id="btnUpdate"
							onclick="location.href='/board/free/update?pno=${boardDetail.pno}'">수정</button>
						<button type="button" class="btn btn-sm btn-primary"
							id="btnDelete">삭제</button>
					</c:if>
				</div>
			</div>
	
		</div>
		</div>
		</div>
		</div>
		
		
		
		<!-- 댓글 끝 -->
</div>
</div>


	<!-- article end -->

<%@include file="mainfooter.jsp" %>


<script>

		
		$(function(){
	    	list()

	    })
	    
	    // 목록 뿌리기
	    
	    var like = "좋아요";
	    
	    function list(){
	    
	    
		var pno = ${boardDetail.pno}
		var page = "&bnowPage="+${commentPage.nowPage}
		
			console.log(page)
			$.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/board/free/detail/ajax?pno='+pno + page,
				dataType : 'json',
				contentType : "application/x-www-form-urlencoded;chartset=UTF-8",
				success : function(data){ 
					console.log(data)
					// 게시판상세보기
					var board = "";
					
					var boardTitle = data.boardDetail.title
					var boardNickname = data.boardDetail.nickname
					var boardDatetime = data.boardDetail.bdateTime
					var boardContent = data.boardDetail.bcontent
						
					board +='<div class="board-view-tit">'
					board +=		'<h1>'+boardTitle+'</h1>'
					board +=		'<div class="writer">'
					board +=			'<p class="img"><img class="pax_f2_proimg" cust_id="ciaws94" src="https://www.paxnet.co.kr/my/files/proimg/di/pi_08.png"></p>'
					board +=			'<p class="text">'
					board +=			'<span class="nickname" style="cursor:pointer;" onclick="#;">'+boardNickname+'</span>'
					board +=			'<span class="time">'+changeDate(boardDatetime)+'</span>'
					board +=			'<span class="viewer"><i>조회</i>64</span>'
					board +=			'</p>'
					board +=		'</div>'
					board +=	'</div>'
					board +=	'<div id="bbsWrtCntn" class="board-view-cont" style="word-break:break-word;">'+boardContent+'</div>'
					board +=	'<div class="sns-area board-sns">'
					board +=		'<p class="notify-box">'
					board +=			'<button type="button" id="reportPopupBtn" class="btn-s notify clean-popup-button e-login"><span>신고</span></button>'
					board +=		'</p>'
					board +=		'<p class="like-box" id="actBtn" style="">'
					board +=			'<button class="btn-m like" id="recmBtn" onclick="updateLikes('+data.boardDetail.pno+');"><i>추천</i><span id="recommendCount">'+data.boardDetail.likes+'</span></button>'
					board +=		'</p>'
					board +=	'</div>'
					board +='</div>'

/* 						board +=	'<div class="board-view-tit">'
							board +=		'<h1>'+boardTitle+'</h1>'
							board +=			'<p class="category-info"></p>'
							board +=			'<h2 id="" class="notice-title">'+boardTitle+'</h2>'
							board +=		'</div>'
							board +=		'<div class="info-wrap">'
							board +=			'<ul class="notice-info">'
							board +=				'<li class="author">'
							board +=					'<i class="fa fa-user-circle"></i>'+boardNickname
							board +=				'</li>'
							board +=				'<li class="date">'
							board +=					'<i class="far fa-clock"></i>'+changeDate(boardDatetime)
							board +=				'</li>'
							board +=			'</ul>'
							board +=		'</div>'
							board +=		'<div class="article">'+boardContent
							board +=		'<div style="position:absolute; bottom:0px;"><span id="likes"><button id="likesBtn" onclick="updateLikes('+data.boardDetail.pno+')">'+like+'</button>'+data.boardDetail.likes+'</span></div>'
							board +=		'</div>'
							board +=	'</div>'
							board +=	'<hr>'	 */				
					
					$(".board-view").html(board)
	

					// 댓글
					var comment= "";
					
					
					for(var i=0; i<data.commentList.length; i++){
						
						comment += "<div class='commentBody' id= 'comment" + data.commentList[i].cno + "'>"
						comment += "<i class='fa fa-user-circle'></i> <b>"+data.commentList[i].nickname+"</b><br>"
						comment += "<i class='far fa-clock'></i>"+changeDate(data.commentList[i].cdateTime)+"<br> <br>"
						comment += "<div id='com" + data.commentList[i].cno + "'>" + data.commentList[i].ccontent + "</div>"
						
						// 내 댓글에 수정/삭제 버튼 띄우기
						if("${loginUser.nickname}" == data.commentList[i].nickname){
							var test = data.commentList[i].ccontent
							console.log("${loginUser.nickname}")
							//console.log(data.commentList.nickname)
							comment +=  	   '<button type="button" class="btn btn-sm btn-primary"'
							comment += 		   'id="btnUpdate'+data.commentList[i].cno+'" onclick="updateCommentView(' + data.commentList[i].cno + ', ' + "'" + data.commentList[i].ccontent + "'" + ')">수정</button>'
							comment += 	       '<button type="button" class="btn btn-sm btn-primary"'
							comment += 		   'id="btnDelete" onclick="deleteComment(' + data.commentList[i].cno + ')">삭제</button>'
						}
							comment += '</div>'
							
	 
						
						$("#commentList").empty().html(comment)
					}	
					
					
					// 페이징처리
					var commentPaging = "";
					
					// 댓글이 4개 이상일 때 띄우기
	 				if(data.commentPage.total >= 4) {
	 					commentPaging += '<nav aria-label="..." class="pagination">' 
						commentPaging += '<ul class="pagination">' 
						
						
						// 1페이지가 아니면
	 					if(data.commentPage.nowPage != 1){
	 						
	 						// << 버튼 
	 						commentPaging +=	'<li>'
	 						commentPaging +=		'<a class="page-link"'
	 						commentPaging +=			'href="/board/free/detail?pno=${boardDetail.pno}&bnowPage=1"'
	 						commentPaging +=			'tabindex="-1" aria-disabled="true">'
	 						commentPaging +=			'<i class="fas fa-angle-double-left"></i>'
	 						commentPaging +=		'</a>'
	 						commentPaging +=	'</li>'
	 						
	 						// < 버튼
			 				commentPaging +=	'<li>'
		 					commentPaging +=		'<a class="page-link"'
							commentPaging +=			'href="/board/free/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.nowPage-1}"'
							commentPaging +=			'tabindex="-1" aria-disabled="true">'
							commentPaging +=			'<i class="fas fa-angle-left"></i>'
							commentPaging +=		'</a>'
							commentPaging +=	'</li>'
	 					}
						
						// 한번에 5개 페이지 보여줌
						for(var i=data.commentPage.startPage; i<=data.commentPage.endPage; i++){
							if(i == data.commentPage.nowPage){
								commentPaging +=	'<li class="page-item active" aria-current="page">'
								commentPaging +=			'<a class="page-link" href="#">'+i
								commentPaging +=				'<span class="sr-only">(current)</span>'
								commentPaging +=				'</a>'
								commentPaging +=		'</li>'
							}
							if(i != data.commentPage.nowPage){
								commentPaging +=	'<li class="page-item">'
								
								commentPaging +=	"<a class='page-link' href='/board/free/detail?pno="+data.boardDetail.pno+"&bnowPage="+i+"'>"+i+"</a>"
							
								commentPaging +=	'</li>'
							}
						}
						
						
						// 마지막페이지아닐때
						if(data.commentPage.nowPage != data.commentPage.lastPage){
							commentPaging += '<li>'
							commentPaging += 	'<a class="page-link"'
							commentPaging += 		"href='/board/free/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.nowPage+1}'"
							commentPaging += 		'tabindex="+1" aria-disabled="true" data-ajax="false">'
							commentPaging += 			'<i class="fas fa-angle-right"></i>'
							commentPaging += 	'</a>'
							commentPaging += '</li>'
							
							// >> 버튼
							commentPaging += '<li>'
							commentPaging += '<a class="page-link"'
							commentPaging += "href='/board/free/detail?pno=${boardDetail.pno}&bnowPage=${commentPage.lastPage}'"						
							commentPaging += 'tabindex="-1" aria-disabled="true">'
							commentPaging += 		'<i class="fas fa-angle-double-right"></i>'
							commentPaging += 	'</a>'
							commentPaging += '</li>'
						}
						
	 					$("#commentPaging").empty().html(commentPaging)
 					} 
	 			},
				error : function(error, data){
					console.log(data)
					console.log(error)
					alert('error!!'); 
				}
			});
	    }
			

	   // 댓글등록
		function writeComment(pno){
		    
		    $.ajax({
		        type:'POST',
		        url : "${pageContext.request.contextPath}/board/writeComment",
		        data:$("#commentForm").serialize(),
		        success : function(data){
		            if(data=="success"){
		                list();
		                $("#ccontent").val("");
		            }
		        },
		        error:function(request,status,error){
		        	console.log(error)
		       }
		        
		    });
		}
	   

		

		//댓글 수정창 input
		function updateCommentView(cno, ccontent){
		    var comment ='';
		    
		    comment += '<div class="input-group">';
		    comment += 		'<input type="text" name="ccontent'+cno+'" value="'+ccontent+'"/>';
		    comment += 		'<button class="btn btn-primary" type="button" onclick="updateComment('+cno+');">확인</button>';
		    comment += '</div>';
		    
		    
		    $("#btnUpdate"+cno+"").hide()
		    
		    $('#com'+cno).html(comment);
		    
		}
		
		// 댓글 수정
		function updateComment(cno){
		    var ccontent = $('[name=ccontent'+cno+']').val();
		    
		    $.ajax({
		        url : "${pageContext.request.contextPath}/board/updateComment",
		        type : 'POST',
		        data : { 'cno' : cno, 'ccontent' : ccontent },
		        success : function(data){
		        	console.log(data)
		            if(data=="success") 
		            	list(); 
		        }
		    });
		}
		 
		// 댓글 삭제
		function deleteComment(cno){
			 $.ajax({
		        url : "${pageContext.request.contextPath}/board/deleteComment",
		        type : 'POST',
		        data : { 'cno' : cno },
		        success : function(data){
		        	console.log(data)
		        	if(data=="success") 
		            	list(); 
		        }
			 })
		        
		}
		
		
	    // datetime 변환
	    function changeDate(date){
	        var date = new Date(date);
			console.log(date.toString())
	        
	        year = date.getFullYear();
	        month = date.getMonth();
	        month += 1;
	        day = date.getDate();
	        hour = date.getHours();
	        minute = date.getMinutes();
	        second = date.getSeconds();
	        strDate = year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	        return strDate;
	    }
		
	    
	    function updateLikes(pno){
		    $.ajax({
				type : 'GET',
				url : '${pageContext.request.contextPath}/board/free/detail/likes/ajax',
				dataType : 'json',
				data : {"pno" : pno},
				contentType : "application/x-www-form-urlencoded;chartset=UTF-8",
				success : function(data){ 
					if(data == 0){
						swal("좋아요", "", "success");
					}
					else if(data == 1){
						swal("좋아요취소", "", "error");
					}
					else if(data == 2){
						swal("로그인을 해주세요", "", "error").then(function(){
							window.location = "/signInPage";
						});
					}
					
					
					list();
					
					    /* if (like=="좋아요") 
					    	like = "좋아요 취소"
					    
				    	else
					    	like = "좋아요" */
				},
			    error : function(error, data){
			    	
					console.log(data)
					console.log(error)
					alert('error!!'); 
			    }
		    })
		}			
	    
	    
	    
		
/* 		history.pushState(null, null, location.href);

		window.onpopstate = function(event) {
			console.log(event)
			location.href = "/board/free";

		}; */




	
</script>
<!--  
<script id="commnet" type="text/x-jsrender">
		<div class='commentBody'>
		<i class='fa fa-user-circle'></i> <b>{{:nickname}}</b><br>
		<i class='far fa-clock'></i>{{:cdataTime}}<br> <br>
		{{:ccontent}}
		</div>
</script>

-->

</body>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

</html>