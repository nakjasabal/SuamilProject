<%@page import="model.BoardDTO"%>
<%@page import="model.SuamilDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../include/login_check.jsp" %>
<%
//파일명 : delete_proc.jsp
request.setCharacterEncoding("UTF-8");

String num = request.getParameter("num");
String b_flag = request.getParameter("b_flag");
String photoLink = "";
if(b_flag.equals("photo")){
	photoLink="_photo";
}	
String nowPage = request.getParameter("nowPage");

BoardDTO dto = new BoardDTO();

//기존방식
//BbsDAO dao = new BbsDAO(application);
//커넥션풀로 변경
SuamilDAO dao = new SuamilDAO();

//삭제전 작성자 아이디와 비교후 삭제여부판단
dto = dao.selectView(num);

//세션영역에 저장된 아이디 가져오기
String session_id = 
	session.getAttribute("USER_ID").toString();

int affected = 0;

System.out.println(session_id+"<>"+dto.getId());

//세션아이디와 작성자아이디가 동일할때 삭제처리
if(session_id.equals(dto.getId())){
	dto.setNum(num);
	affected = dao.delete(dto);
}
else{
	JavascriptUtil.jsAlertBack("본인만 " 
		+" 삭제가능합니다.", out);
	return;
}


if(affected==1){
	//삭제에 성공했을때...(JAVA파일에서 내용출력)
	JavascriptUtil.jsAlertLocation("삭제되었습니다", 
		"../sub01_t_list"+photoLink+".jsp?b_flag="+b_flag+"&nowPage="+nowPage, out);	
}
else{
	//삭제에 실패했을때...(JSP에서 내용출력)	
	out.println(JavascriptUtil.jsAlertBack("삭제실패하였습니다"));
}
%>