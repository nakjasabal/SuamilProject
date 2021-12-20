<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<script>
function findID(){
	var f = document.frm1;
	if(f.name.value==''){
		alert('이름을 입력하세요');f.name.focus();return;
	}
	if(f.email.value==''){
		alert('이메일을 입력하세요');f.email.focus();return;
	}
	f.method='post';
	f.action='id_pw_process.jsp';
	f.submit();
}
function findPW(){
	var f = document.frm2;
	if(f.id.value==''){
		alert('아이디를 입력하세요');f.id.focus();return;
	}
	if(f.name.value==''){
		alert('이름을 입력하세요');f.name.focus();return;
	}
	if(f.email.value==''){
		alert('이메일을 입력하세요');f.email.focus();return;
	}
	f.method='post';
	f.action='id_pw_process.jsp';
	/*
	이름과 이메일만 넘어오면 아이디찾기
	이름, 이메일, 아이디까지 3개가 넘어오면 비번찾기
	*/
	f.submit();
}
</script>
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
					<img src="../images/member/id_pw_title.gif" alt="" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;멤버쉽&nbsp;>&nbsp;아이디/비밀번호찾기<p>
				</div>
				<div class="idpw_box">
					<div class="id_box">
					<form name="frm1">
						<ul>
							<li><input type="text" name="name" value="" class="login_input01" /></li>
							<li><input type="text" name="email" value="" class="login_input01" /></li>
						</ul>
						<a href="javascript:findID();"><img src="../images/member/id_btn01.gif" class="id_btn" /></a>
						<a href="../member/join01.jsp"><img src="../images/login_btn03.gif" class="id_btn02" /></a>
					</form>
					</div>
					<div class="pw_box">
					<form name="frm2">
						<ul>
							<li><input type="text" name="id" value="" class="login_input01" /></li>
							<li><input type="text" name="name" value="" class="login_input01" /></li>
							<li><input type="text" name="email" value="" class="login_input01" /></li>
						</ul>
						<a href="javascript:findPW();"><img src="../images/member/id_btn01.gif" class="pw_btn" /></a>
					</form>
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
 </body>
</html>
