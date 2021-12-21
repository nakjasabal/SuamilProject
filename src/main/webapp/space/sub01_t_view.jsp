<%@page import="model.BoardDTO"%>
<%@page import="model.SuamilDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<script type="text/javascript">
	function isDelete(){
		var ans = confirm("정말로 삭제하시겠습니까?");		
		if(ans==true){
			//삭제처리페이지로 전송	
			var f = document.writeFrm;
			f.action="./proc/delete_proc.jsp";
			f.method="post"
			f.submit();
		}		
	}
</script>
<%
/*
  상세보기의 경우 작성자 본인이 아니더라도 열람할수 
있어야 한다.
  대신 수정, 삭제의 경우에만 회원인증을 통하여 작성자
본인만 할수 있도록 처리한다.
*/

String num = request.getParameter("num");
String nowPage = request.getParameter("nowPage");

//커넥션풀로 변경
SuamilDAO dao = new SuamilDAO();

//조회수 증가
dao.updateVisitCount(num); 

//게시물 가져오기
BoardDTO dto = dao.selectView(num);

//EL식 사용위해 페이지 영역에 저장하기
pageContext.setAttribute("dto", dto);

dao.close();//DB자원반납

//멀티 게시판 구현[추가]
String b_flag = 
	request.getParameter("b_flag")==null 
		? "notice" : request.getParameter("b_flag");

//켈린더 추가
String y = request.getParameter("y");
String m = request.getParameter("m");
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
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;
						열린공간&nbsp;>&nbsp;<%=path_str %><p>	
				</div>
				<div class="mt-3 mr-1">
					<table class="table table-bordered">
					<form name="writeFrm">
					<input type="hidden" name="num" value="<%=num%>" />
					<input type="hidden" name="b_flag" value="<%=b_flag%>" />
					<input type="hidden" name="nowPage" value="<%=nowPage%>" />
					<colgroup>
						<col width="20%"/>
						<col width="30%"/>
						<col width="20%"/>
						<col width="*"/>
					</colgroup>
					<tbody>
						<tr>
							<th class="text-center table-active align-middle">작성자</th>
							<td>${dto.name }</td>
							<th class="text-center table-active align-middle">작성일</th>
							<td>${dto.postDate }</td>
						</tr>
						<tr>
							<th class="text-center table-active align-middle">이메일</th>
							<td>${dto.email }</td>
							<th class="text-center table-active align-middle">조회수</th>
							<td>${dto.visitcount }</td>
						</tr>
						<tr>
							<th class="text-center table-active align-middle">제목</th>
							<td colspan="3">
								${dto.title }
							</td>
						</tr>
						<tr>
							<th class="text-center table-active align-middle">내용</th>
							<td colspan="3" class="align-middle" style="height:150px;">
								${dto.content }
							</td>
						</tr>
						<% if(dto.getChumfile()!=null && !dto.getChumfile().equals("")){ %>
						<tr>
							<th class="text-center table-active align-middle">첨부파일</th>
							<td colspan="3">
								<img src="../Upload/${dto.chumfile }" style="max-width:650px;" />
							</td>
						</tr>
						<% } %>
					</tbody>
					</table>
				</div>
				<div class="row mb-3">
					<div class="col-6">
					<% 
					String listLink = "", editLink = "";
					
					switch(b_flag){
					case "program": //프로그램일정
						listLink = "sub01_t_list_cal.jsp?b_flag="+b_flag+"&y="+y+"&m="+m;	 
						editLink = "sub01_t_edit_cal.jsp?num="+dto.getNum()+"&b_flag="+b_flag+"&y="+y+"&m="+m;
						break;
					case "photo": //사진게시판
						listLink = "sub01_t_list_photo.jsp?b_flag="+b_flag+"&nowPage="+nowPage; 
						editLink = "sub01_t_edit_photo.jsp?num="+dto.getNum()+"&b_flag="+b_flag+"&nowPage="+nowPage;
						break;
					default: 
						listLink = "sub01_t_list.jsp?b_flag="+b_flag+"&nowPage="+nowPage; 
						editLink = "sub01_t_edit.jsp?num="+dto.getNum()+"&b_flag="+b_flag+"&nowPage="+nowPage;
					}
					
					if(session.getAttribute("USER_ID")!=null && session.getAttribute("USER_ID").toString().equals(dto.getId()))
					{						
					%>	
						<button type="button" class="btn btn-secondary" onclick="location.href='<%=editLink %>';">수정하기</button> 
						<button type="button" class="btn btn-success" onclick="isDelete();">삭제하기</button>	
						<!-- <button type="button" class="btn btn-info">답글쓰기</button> -->
					<%
					}
					%>
					</div>
					<div class="col-6 text-right pr-5">
						<button type="button" class="btn btn-warning" onclick="location.href='<%=listLink %>';">리스트보기</button>
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