<%@page import="model.SuamilDAO"%>
<%@page import="model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"	%>
<%@ include file="../../include/login_check.jsp" %> 	
	      
<%
 		      //파일명 : write_proc.jsp

 		       		      //한글깨짐처리
 		       		      request.setCharacterEncoding("UTF-8");

 		       		      //폼값받기
 		       		      String num = request.getParameter("num");
 		       		      String title = request.getParameter("title");
 		       		      String content = request.getParameter("content");
 		       		      //멀티게시판 추가
 		       		      String b_flag = request.getParameter("b_flag");
 		       		      String nowPage = request.getParameter("nowPage");

 		       		      //DTO객체 생성 및 값 설정
 		       		      BoardDTO dto = new BoardDTO();
 		       		      dto.setNum(num);
 		       		      dto.setTitle(title);
 		       		      dto.setContent(content);
 		       		      dto.setId(session.getAttribute("USER_ID").toString());
 		       		      //멀티게시판 추가
 		       		      dto.setB_flag(b_flag);

 		       		      //커넥션풀로 변경
 		       		      SuamilDAO dao = new SuamilDAO();

 		       		      int affected = dao.updateEdit(dto);
 		       		      if(affected==1){
 		       		      	//수정에 성공했을때...
 		       		      	response.sendRedirect("../sub01_t_view.jsp?num="+num+"&b_flag="+b_flag+"&nowPage="+nowPage);
 		       		      }
 		       		      else{
 		       		      	//글쓰기에 실패했을때...
 		      %>
	<script>
		alert("글쓰기에 실패하였습니다.");
		history.go(-1);
	</script>
<%	
}
%>