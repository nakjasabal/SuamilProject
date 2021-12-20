<%@page import="util.JavascriptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/login_check.jsp" %>
<%@ include file="../include/global_head.jsp" %>
<%
//글쓰기 - 멀티 게시판 구현[추가]
String b_flag = 
	request.getParameter("b_flag")==null 
		? "notice" : request.getParameter("b_flag");
%>
<%@ include file="common_space.jsp" %>	

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="//resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
    $( function() {
        $( "#postdate" ).datepicker();
        //대한민국에서 사용하는 날짜포맷으로 옵션 변경
        $( "#postdate" ).datepicker( "option", "dateFormat", "yy-mm-dd" );        
    } );
</script>

<body>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/space/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/space_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/space/<%=title_image%>" alt="공지사항" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;<%=path_str%><p>
				</div>
				<div>
					<script>
						function isValidate(fn){
							if(fn.postdate.value==""){
								alert("날짜를 입력해주세요");
								fn.postdate.focus();
								return false;
							}
							if(fn.title.value==""){
								alert("제목을 입력해주세요");
								fn.title.focus();
								return false;
							}
							if(fn.content.value==""){
								alert("내용을 입력해주세요");
								fn.content.focus();
								return false;
							}
						}
					</script>					
					<table class="table table-bordered table-striped">
					<form name="writeFrm" method="post" action="./proc/write_proc.jsp" onsubmit="return isValidate(this);">
					<input type="hidden" name="b_flag" value="<%=b_flag%>" /> 
					<colgroup>
						<col width="20%"/>
						<col width="*"/>
					</colgroup>
					<tbody>
						<tr>
							<th class="text-center align-middle">작성자</th>
							<td>
								<input type="text" class="form-control"	style="width:100px;" value="${USER_ID }" disabled />
							</td>
						</tr>
						<tr>
							<th class="text-center" style="vertical-align:middle;">날짜</th>
							<td>
								<input type="text" class="form-control" id="postdate" name="postdate" style="width:100px;" />
							</td>
						</tr>
						<tr>
							<th class="text-center"
								style="vertical-align:middle;">제목</th>
							<td>
								<input type="text" class="form-control" name="title" />
							</td>
						</tr>
						<tr>
							<th class="text-center"
								style="vertical-align:middle;">내용</th>
							<td>
								<textarea rows="10" class="form-control" name="content"></textarea>
							</td>
						</tr>
						<!-- <tr>
							<th class="text-center"
								style="vertical-align:middle;">첨부파일</th>
							<td>
								<input type="file" class="form-control" />
							</td>
						</tr> -->
					</tbody>
					</table>
				</div>
				<div class="row mb-3">
					<div class="col text-right">
						<!-- 각종 버튼 부분 -->
						<!-- <button type="button" class="btn">Basic</button> -->
						<!-- <button type="button" class="btn btn-primary" 
							onclick="location.href='BoardWrite.jsp';">글쓰기</button> -->
						<!-- <button type="button" class="btn btn-secondary">수정하기</button>
						<button type="button" class="btn btn-success">삭제하기</button>
						<button type="button" class="btn btn-info">답글쓰기</button>
						<button type="button" class="btn btn-light">Light</button>
						<button type="button" class="btn btn-link">Link</button> -->
						<button type="submit" class="btn btn-danger">전송하기</button>
						<button type="reset" class="btn btn-dark">Reset</button>
						<button type="button" class="btn btn-warning" onclick="location.href='sub01_t_list_cal.jsp?b_flag=<%=b_flag%>';">리스트보기</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>


	<%@ include file="../include/footer.jsp" %>
 </body>
</html>