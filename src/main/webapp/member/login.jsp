<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>


 <body>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/member/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/member_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/login_title.gif" alt="인사말" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;로그인<p>
				</div>
<script>
	function loginValidate(f){
		if(f.id.value==""){
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		if(f.pass.value==""){
			alert("패스워드를 입력하세요");
			f.pass.focus();
			return false;
		}
	}
</script>
<form name="loginFrm" method="post" action="../Member/LoginProc.sua" onsubmit="return loginValidate(this);">

<%
//세션영역에 회원정보가 없다면 로그인화면 출력
if(session.getAttribute("USER_ID")==null)
{
%>
				<div class="login_box01">
					<img src="../images/login_tit.gif" style="margin-bottom:30px;" />
					<ul>
<li><img src="../images/login_tit001.gif" alt="아이디" style="margin-right:15px;" />
<input type="text" name="id" value="" class="login_input01" /></li>

<li><img src="../images/login_tit002.gif" alt="비밀번호" style="margin-right:15px;" />
<input type="password" name="pass" value="" class="login_input01" /></li>
					</ul>
<input type="image" src="../images/login_btn.gif" class="login_btn01" /></a>
				</div>
				<p style="text-align:center; margin-bottom:50px;"><a href=""><img src="../images/login_btn02.gif" alt="아이디/패스워드찾기" /></a>&nbsp;<a href=""><img src="../images/login_btn03.gif" alt="회원가입" /></a></p>
<% }else{ %>
	<div class="login_box01" style="font-size:;">		
		<span style="font-weight:bold; color:#333;">${USER_NAME }</span>님, 반갑습니다.
		<br />로그인 하셨습니다.<br /><br />						
		<button type="button" class="btn btn-warning" onclick="location.href='modify_t.jsp';">
			회원정보수정</button>
		<button type="button" class="btn btn-danger" onclick="location.href='logout.jsp';">
			로그아웃</button>
	</div>
<% } %>
</form>
			
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
 </body>
</html>
