<%@page import="org.json.simple.JSONObject"%>
<%@page import="model.MemberDTO"%>
<%@page import="model.SuamilDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값받기
String userid = request.getParameter("userid");

//dao생성
SuamilDAO dao = new SuamilDAO();

//함수호출
MemberDTO memberInfo = dao.getMemberInfo(userid);

JSONObject json = new JSONObject();

if(memberInfo.getName()==null && userid!=null && !userid.equals("")){
	 //회원정보가 없으므로 가입 가능
	 json.put("idResult", 1);
	 json.put("Msg","<span style='color:blue;'>사용가능한 아이디입니다</span>");
}
else{
	//이미 존재하는 아이디이므로 가입 불가능
	json.put("idResult", 0);
	json.put("Msg","<span style='color:red;'>중복된 아이디가 존재합니다. 사용불가입니다.</span>");
}
out.println(json.toJSONString());
%>