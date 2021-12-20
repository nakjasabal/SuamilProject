<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.SuamilDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글처리
request.setCharacterEncoding("UTF-8");


//커넥션풀로 변경
SuamilDAO dao = new SuamilDAO();
 

//매개변수 저장을 위한 컬렉션 생성(DAO로 전달)
Map<String,Object> param = new HashMap<String,Object>();


//멀티 게시판 구현[추가]
String b_flag = request.getParameter("b_flag")==null ? "notice" : request.getParameter("b_flag");
param.put("b_flag", b_flag);
System.out.println("b_flag="+b_flag);
//문자열 검색 파라미터를 페이지 처리 메소드로 넘겨주기 위한 변수선언
String queryStr = "b_flag="+b_flag+"&";



//폼값받기(검색관련)
String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");
if(searchWord!=null){
	//입력한 검색어가 있다면 맵에 추가함
	param.put("Column", searchColumn);
	param.put("Word", searchWord);
	
	//파라미터 추가
	queryStr = String.format("&searchColumn=%s&searchWord=%s&", searchColumn, searchWord);
}


//페이지 처리를 위한 로직 시작
//1.게시판 테이블의 전체 레코드 갯수 구하기
int totalRecordCount = dao.getTotalRecordCount(param); 

//2.web.xml에 설정된 값 가져오기
int pageSize;
if(b_flag.equals("photo")){
	pageSize = 6;
}
else{
	pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
}
int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));


//3.전체페이지수 계산하기
int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);

//4.페이지번호가 없는경우 무조건 1로 설정
int nowPage = 
  request.getParameter("nowPage")==null
  ? 1 : 
  Integer.parseInt(request.getParameter("nowPage"));

//5.가져올 레코드의 구간을 결정하기 위한 연산
int start = (nowPage-1)*pageSize + 1;
int end = nowPage * pageSize;

//6.파라미터 전달을 위해 map에 추가
param.put("start", start);
param.put("end", end);

/////게시판 페이지 처리 로직 끝

  
/*
게시판에서 레코드를 가져올때는 반드시 "List계열"의 
컬렉션을 사용해야 한다. Set계열의 컬렉션은 저장된 요소의
순서를 보장하지 않기때문에 게시판 목록을 구현할때 문제가 
될수있기 때문이다.
*/
List<BoardDTO> bbs = dao.selectList(param);

dao.close();
%>