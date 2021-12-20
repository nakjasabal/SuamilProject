<%@page import="java.util.Calendar"%>
<%@page import="util.PagingUtil"%> 
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.SuamilDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>
<%@ include file="logic_list.jsp" %>
<%@ include file="common_space.jsp" %>	
<style>
.dayCell{height: 100px;}
</style>
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
				<div class="mt-3">
					<!-- 게시판리스트부분 -->
					<!-- <table class="table table-bordered table-hover table-striped"> -->
<%
//현재 년/월/일을 구하기 위한 인스턴스 생성
Calendar tDay = Calendar.getInstance();

/*
파라미터가 있는 경우 : 파라미터에 해당하는 년/월을 표현
파라미터가 없는 경우 : 무조건 현재 년/월을 표현
*/
int y = (request.getParameter("y")==null) ?	tDay.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("y"));
int m = (request.getParameter("m")==null) ?	tDay.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("m"));
int d = tDay.get(Calendar.DATE);

/*
날자설정을 위한 객체생성 : 현재 년/월 그리고 1일로 설정
한다. 즉 현재월의 1일로 설정한다.
*/
Calendar dSet = Calendar.getInstance();

dSet.set(y, m, 1);//현재 년/월/1 일로 설정함
//오늘이 어떤 요일인지 구한다.
int yo = dSet.get(Calendar.DAY_OF_WEEK);
//현재월의 마지막 날자를 구한다.(7월->31, 9월->30)
int last_day = dSet.getActualMaximum(Calendar.DATE);

int prevY, prevM, nextY, nextM;
//이전달 링크
if(m==0){
	prevY = y - 1;
	prevM = 11;
}
else{
	prevY = y;
	prevM = m - 1;	
}
//다음달 링크
if(m==11){
	nextY = y + 1;
	nextM = 0;	
}
else{
	nextY = y;
	nextM = m + 1;
}
%>
<div class="text-center">
	<a href="?y=<%=prevY %>&m=<%=prevM %>">[이전달]</a>
	&nbsp;&nbsp;
	<%=y %>년 <%=m+1 %>월
	&nbsp;&nbsp;
	<a href="?y=<%=nextY %>&m=<%=nextM %>">[다음달]</a>	
</div>
<table class="table table-bordered">
	<colgroup>
		<col width="14%" />
		<col width="14%" />
		<col width="14%" />
		<col width="14%" />
		<col width="14%" />
		<col width="14%" />
		<col width="*" />
	</colgroup>
	<tr class="table-active">
	<%
	String[] a = { "sun", "mon", "tue", "wed", "thu", "fri", "sat" };
	for (int i = 0; i < 7; i++) {
	%>
		<%-- <th style="padding:5px 0;"><img src="../images/day0<%=i+1 %>.gif" alt="<%=a[i]%>" /></th> --%>
		<th style="padding:5px 0;text-align: center;"><%=a[i]%></th>
	<%
	}
	%>		
	</tr>
	<tr>
	<%
	for (int k = 1; k < yo; k++) {
	%>
		<td></td>
	<%
	}
	%>
	<%
	String tableColor ;
	for (int j = 1; j <= last_day; j++) {		
		if((yo+j-1) % 7 == 0) tableColor="table-primary";
		else if((yo+j-1) % 7 == 1) tableColor="table-danger";
		else tableColor="";
	%>
		<!-- 날짜가 출력되는 부분 <%=y%>-<%=m%>-<%=j%> -->
		<td class="dayCell <%=tableColor%>"><%=j%></td> 
	<%if ((yo+j-1) % 7 == 0) {%>
	</tr>
	<tr>
	<%
		}
	}
	for(int e=1;e<(7-yo)-1;e++){
	%>
		<td></td>
	<%
	}
	%>
	</tr>
</table>
<div class="row">
	<div class="col text-right">
		<button type="button" class="btn btn-primary" onclick="location.href='sub01_t_write_cal.jsp?b_flag=<%=b_flag%>';">일정등록하기</button>
		<!-- 각종 버튼 부분 -->
		<!-- <button type="button" class="btn">Basic</button> -->
		<!-- <button type="button" class="btn btn-secondary">수정하기</button>
		<button type="button" class="btn btn-success">삭제하기</button>
		<button type="button" class="btn btn-info">답글쓰기</button>
		<button type="button" class="btn btn-warning">리스트보기</button>
		<button type="button" class="btn btn-danger">전송하기</button>
		<button type="button" class="btn btn-dark">Reset</button>
		<button type="button" class="btn btn-light">Light</button>
		<button type="button" class="btn btn-link">Link</button> -->
	</div>
</div>
					
				</div>	
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>


	<%@ include file="../include/footer.jsp" %>
 </body>
</html>