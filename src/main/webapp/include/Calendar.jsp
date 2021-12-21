<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//현재 년/월/일을 구하기 위한 인스턴스 생성
Calendar tDay = Calendar.getInstance();

/*
파라미터가 있는 경우 : 파라미터에 해당하는 년/월을 표현
파라미터가 없는 경우 : 무조건 현재 년/월을 표현
*/
int y = (request.getParameter("y")==null) ?
	tDay.get(Calendar.YEAR) : 
	Integer.parseInt(request.getParameter("y"));
int m = (request.getParameter("m")==null) ?
	tDay.get(Calendar.MONTH) : 
	Integer.parseInt(request.getParameter("m"));
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
%>
<table cellpadding="0" cellspacing="0" border="1" class="calendar">
	<colgroup>
		<col width="14%" />
		<col width="14%" />
		<col width="14%" />
		<col width="14%" />
		<col width="14%" />
		<col width="14%" />
		<col width="*" />
	</colgroup>
	<tr>
	<%
	int yoFlag = yo;//일단 오늘의 요일을 저장
	String[] a = { "sun", "mon", "tue", "wed", "thu", "fri", "sat" };
	for (int i = 0; i < 7; i++) {
	%>
		<th style="padding:5px 0;"><img src="../images/day0<%=i+1 %>.gif" alt="<%=a[i]%>" /></th>
		<%-- <th style="padding:5px 0;"><%=a[i]%></th> --%>
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
	for (int j = 1; j <= last_day; j++) {
		yoFlag++;//날짜가 반복될때 증가
	%>
		<!-- 날짜가 출력되는 부분 <%=y%>-<%=m+1%>-<%=j%> <%=yoFlag%>-->
		<td><%=j%></td> 
	<%if ((yo+j-1) % 7 == 0) {%>
	</tr>
	<tr>
	<%
		yoFlag = 0;
		}
	}
	
	for(int e=yoFlag ; e<7 ; e++){
	%>
		<td></td>
	<%
	}
	%> 
</table>
<%
/*
Calendar 클래스는 추상 클래스로 생성자를 제공하지 않는다. 
따라서, 객체를 생성하기 위해 new 연산자를 사용할 수 없다.  
대신 getInstance() 메소드를 사용하여 현재 날짜와 시간의 
객체를 얻어올 수 있다.
*/
//Calendar nowDay = Calendar.getInstance();

/* 년/월/일 */
/* 월 : 0~11까지 반환하므로 +1해줘야 함 */
/* out.println("년="+ nowDay.get(Calendar.YEAR) +"<br/>");
out.println("월="+ (nowDay.get(Calendar.MONTH)+1) +"<br/>");
out.println("일="+ nowDay.get(Calendar.DAY_OF_MONTH) +"<br/>");
out.println("일="+ nowDay.get(Calendar.DATE) +"<br/>"); */

//1년중 오늘이 몇번째 날인지 반환
//out.println(nowDay.get(Calendar.DAY_OF_YEAR)+"<br/>");

//오늘이 이번주의 몇번째 날인지 반환
//일요일1, 월요일2.....
//out.println(nowDay.get(Calendar.DAY_OF_WEEK)+"<br/>");
%>
