<%@page import="model.BoardDTO"%>
<%@page import="model.SuamilDAO"%>
<%@page import="util.JavascriptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/login_check.jsp" %>
<%@ include file="../include/global_head.jsp" %>
<%
/*
수정하기는 기본적으로 상세보기와 동일하고, 가져온 
내용을 글쓰기 폼의 value속성에 삽입해주면 된다.
*/
String num = request.getParameter("num");
String nowPage = request.getParameter("nowPage");

//기존방식
//BbsDAO dao = new BbsDAO(application);
//커넥션풀로 변경
SuamilDAO dao = new SuamilDAO();

BoardDTO dto = dao.selectView(num);
dto.setContent(dto.getContent().replace("<br/>", "\r\n"));

/*
작성자 본인만 수정할 수 있도록 하기 위해서 해당페이지
에서도 세션영역의 아이디와 게시물의 작성자를 비교하여
처리한다.
*/
String session_id = 
	session.getAttribute("USER_ID").toString();
if(!session_id.equals(dto.getId())){
%>
	<script>
		alert("작성자 본인만 수정할 수 있습니다.");
		history.back();
	</script>
<%	
	return;
}

//멀티 게시판 구현[추가]
String b_flag = request.getParameter("b_flag")==null ? "notice" : request.getParameter("b_flag");
dao.close();//DB자원반납
%>
<%@ include file="common_space.jsp" %>	
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
					<img src="../images/space/<%=title_image %>" alt="공지사항" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;<%=path_str %><p>
				</div>
				<div>
					<script>
						function isValidate(fn){
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
					<form name="writeFrm" method="post" action="./proc/edit_proc_photo.jsp" onsubmit="return isValidate(this);" enctype="multipart/form-data">
					<input type="hidden" name="b_flag" value="<%=b_flag%>" /> 
					<input type="hidden" name="num" value="<%=dto.getNum() %>" />
					<input type="hidden" name="nowPage" value="<%=nowPage%>" />
					<input type="hidden" name="originalfile" value="<%=dto.getChumfile() %>" />	
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
						<!-- <tr>
							<th class="text-center" 
								style="vertical-align:middle;">패스워드</th>
							<td>
								<input type="password" class="form-control"
									style="width:200px;"/>
							</td>
						</tr> -->
						<tr>
							<th class="text-center"
								style="vertical-align:middle;">제목</th>
							<td>
								<input type="text" class="form-control" name="title" value="<%=dto.getTitle()%>" />
							</td>
						</tr>
						<tr>
							<th class="text-center"
								style="vertical-align:middle;">내용</th>
							<td>
								<textarea rows="10" class="form-control" name="content"><%=dto.getContent() %></textarea>
							</td>
						</tr>
						<tr>
							<th class="text-center"
								style="vertical-align:middle;">첨부파일</th>
							<td>
								기존파일:<%=dto.getChumfile() %>
								<br />
								<input type="file" class="form-control" name="chumfile" />
							</td>
						</tr>
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
						<button type="button" class="btn btn-warning" onclick="location.href='sub01_t_list_photo.jsp?b_flag=<%=b_flag%>';">리스트보기</button>
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