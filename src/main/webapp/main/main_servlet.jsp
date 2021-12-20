<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"	%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마포구립장애인 직업재활센터</title>
<style type="text/css" media="screen">
@import url("../css/common.css");
@import url("../css/main.css");
@import url("../css/sub.css");
</style>
<script src="../js/jquery/jquery-3.5.1.js"></script>
</head>
<body>
<center>
	<div id="wrap">
		<%@ include file="../include/top.jsp"%>
		
		<div id="main_visual">
		<a href="/product/sub01.jsp"><img src="../images/main_image_01.jpg" /></a><a href="/product/sub01_02.jsp"><img src="../images/main_image_02.jpg" /></a><a href="/product/sub01_03.jsp"><img src="../images/main_image_03.jpg" /></a><a href="/product/sub02.jsp"><img src="../images/main_image_04.jpg" /></a>
		</div>

		<div class="main_contents">
			<div class="main_con_left">
				<p class="main_title" style="border:0px; margin-bottom:0px;"><img src="../images/main_title01.gif" alt="로그인 LOGIN" /></p>
				<div class="login_box">
				<%
				//세션영역에 회원정보가 없다면...로그인 전 화면 출력
				if(session.getAttribute("USER_ID")==null)
				{
				%>
					<script>
						function loginValidate(fn){
							if(fn.id.value==""){
								alert("아이디를 입력하세요");
								fn.id.focus();
								return false;
							}
							if(fn.pass.value==""){
								alert("패스워드를 입력하세요");
								fn.pass.focus();
								return false;
							}
						}
					</script>
					<form action="../main/main.do" method="post" name="loginFrm" onsubmit="return loginValidate(this);">
					<input type="hidden" name="backUrl" value="${param.backUrl }" />
					
					<table cellpadding="0" cellspacing="0" border="0">
						<colgroup>
							<col width="45px" />
							<col width="120px" />
							<col width="55px" />
						</colgroup>
						<tr>
							<th><img src="../images/login_tit01.gif" alt="아이디" /></th>
							<td><input type="text" name="id" tabindex="1" class="login_input" value="${user }" /></td>
							<td rowspan="2"><input type="image" tabindex="3" src="../images/login_btn01.gif" alt="로그인" /></td>
						</tr>
						<tr>
							<th><img src="../images/login_tit02.gif" alt="패스워드" /></th>
							<td><input type="password" name="pass" tabindex="2" value="" class="login_input" /></td>
						</tr>
					</table>
					<p>					
						<input type="checkbox" name="id_save" value="Y" 
							<c:if test="${not empty user }">
								checked="checked"
							</c:if> 
						/><img src="../images/login_tit03.gif" alt="저장" />
						<a href="../member/id_pw.jsp"><img src="../images/login_btn02.gif" alt="아이디/패스워드찾기" /></a>
						<a href="../member/join01.jsp"><img src="../images/login_btn03.gif" alt="회원가입" /></a>
					</p>
				<% }else{ %>	 
					<!-- 로그인 후 -->
					<p style="padding:10px 0px 10px 10px">
						<span style="font-weight:bold; color:#333;">${USER_NAME }</span>님, 반갑습니다.
						<br />로그인 하셨습니다.
					</p>
					<p style="text-align:right; padding-right:10px;">
						<a href="../member/modify_t.jsp"><img src="../images/login_btn04.gif" /></a>
						<a href="../main/main.do?mode=logout"><img src="../images/login_btn05.gif" /></a>
					</p>
			 	<% } %>	
				</div>
			</div>
			<div class="main_con_center">
				<p class="main_title"><img src="../images/main_title02.gif" alt="공지사항 NOTICE" /><a href="/space/sub01.jsp"><img src="../images/more.gif" alt="more" class="more_btn" /></a></p>
				<ul class="main_board_list">
					<li><p><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></p></li>
					<li><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></li>
					<li><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></li>
					<li><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></li>
				</ul>
			</div>
			<div class="main_con_right">
				<p class="main_title"><img src="../images/main_title03.gif" alt="자유게시판 FREE BOARD" /><a href="/space/sub03.jsp"><img src="../images/more.gif" alt="more" class="more_btn" /></a></p>
				<ul class="main_board_list">
					<li><p><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></p></li>
					<li><a href="">마포 구립 장애인 직업재활센터 홈페이지마포 구립 장애인 직업재활센터 홈페이지마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></li>
					<li><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></li>
					<li><a href="">마포 구립 장애인 직업재활센터 홈페이지</a><span>2012.01.26</span></li>
				</ul>
			</div>
		</div>

		<div class="main_contents">
			<div class="main_con_left">
				<p class="main_title"><img src="../images/main_title04.gif" alt="월간일정 CALENDAR" /></p>
				<img src="../images/main_tel.gif" />
			</div>
			<div class="main_con_center">
				<p class="main_title" style="border:0px; margin-bottom:0px;"><img src="../images/main_title05.gif" alt="월간일정 CALENDAR" /></p>
				<div class="cal_top">
					<%
					//캘린더 클래스로 현재 년/월 구하기
					Calendar nowDay = Calendar.getInstance();
					int now_year = nowDay.get(Calendar.YEAR);
					int now_month = nowDay.get(Calendar.MONTH);
					%>
					<table cellpadding="0" cellspacing="0" border="0">
						<colgroup>
							<col width="13px;" />
							<col width="*" />
							<col width="13px;" />
						</colgroup>
						<tr>
							<td><img src="../images/cal_a01.gif" style="margin-top:3px;cursor:pointer;" id="month_prev" /></a></td>
							<td style="font-weight:bold;font-size:14px;" id="calendar_n_view">
								<%=now_year %>년 
								<%=(now_month+1) %>월
							</td>
							<td><img src="../images/cal_a02.gif" style="margin-top:3px;cursor:pointer;" id="month_next" /></a></td>
						</tr>
					</table>
				</div>
				<div class="cal_bottom" id="calendar_view">
					 <!-- 여기 켈린더 -->
				</div>
			</div>
			<div class="main_con_right">
				<p class="main_title"><img src="../images/main_title06.gif" alt="사진게시판 PHOTO BOARD" /><a href="/space/sub04.jsp"><img src="../images/more.gif" alt="more" class="more_btn" /></a></p>
				<ul class="main_photo_list">
					<li>
						<dl>
							<dt><a href=""><img src="../images/g_img.gif" /></a></dt>
							<dd><a href="">마포 구립 장애인...</a></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><a href=""><img src="../images/g_img.gif" /></a></dt>
							<dd><a href="">마포 구립 장애인...</a></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><a href=""><img src="../images/g_img.gif" /></a></dt>
							<dd><a href="">마포 구립 장애인...</a></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><a href=""><img src="../images/g_img.gif" /></a></dt>
							<dd><a href="">마포 구립 장애인...</a></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><a href=""><img src="../images/g_img.gif" /></a></dt>
							<dd><a href="">마포 구립 장애인...</a></dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt><a href=""><img src="../images/g_img.gif" /></a></dt>
							<dd><a href="">마포 구립 장애인...</a></dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<%@ include file="../include/quick.jsp"%>
	</div>

	<%@ include file="../include/footer.jsp"%>
<script>
$(function(){
	//현재월을 출력하는 달력 로드하기
	$('#calendar_view').load('../include/Calendar.jsp');
	
	//이전달
	$('#month_prev').click(function(){
		
		//히든폼에 입력된 값 가져오기
		var n_year = parseInt($('#now_year').val());
		var n_month = parseInt($('#now_month').val());
		
		//1월의 이전달은 12월이므로 년도-1,12월로 변경한다.
		if(n_month==0){
			n_year--;
			n_month=11;
		}
		else{
			n_month--;
		}
		
		//계산된 년/월을 히든폼에 입력
		$('#now_year').val(n_year);
		$('#now_month').val(n_month);
		
		//계산된 년/월을 켈린더 상단에 표현
		$('#calendar_n_view').html(n_year+"년 "+
				(n_month+1)+'월');
		
		//calendar.jsp로 위값을 파라미터로 전달
		$.get('../include/Calendar.jsp',
			{
				y : n_year,
				m : n_month
			},
			function(d){
				$('#calendar_view').html(d);
			}	
		);
	});
	$('#month_next').click(function(){
		//다음달
		var n_year = parseInt($('#now_year').val());
		var n_month = parseInt($('#now_month').val());
		
		//12월이 되었을때 년+1, 월은 0으로 초기화한다.
		if(n_month==11){
			n_year++;
			n_month=0;
		}
		else{
			n_month++;	
		}
		
		$('#now_year').val(n_year) ;
		$('#now_month').val(n_month) ;
		$('#calendar_n_view').html(n_year+'년 '+(n_month+1)+'월') ;
		
		$.ajax({
			url : "../include/Calendar.jsp",
			dataType : "html",
			type : "post",
			//전송방식이 post인 경우 아래 컨텐츠타입을
			//사용해야 함
			contentType : "application/x-www-form-urlencoded;charset=UTF-8",
			data : {
				y : n_year, m : n_month
			},			
			success:function(responseData){
				$('#calendar_view').html(responseData);
			},
			error:function(errorData){
				alert("오류발생:"+errorData.status+":"+errorData.statusText);
			}
		});
	});
});
</script>

<input type="hidden" id="now_year" value="<%=now_year %>" />
<input type="hidden" id="now_month" value="<%=now_month %>" />	
</center>
</body>
</html>