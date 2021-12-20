<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"	%>      
<%-- Message.jsp --%>

<c:choose>
	<c:when test="${WHEREIS=='UPDATE' }">
		<c:set var="sucmsg" value="수정성공함" />
		<c:set var="failmsg" value="수정실패함" />
		<c:set var="moveurl" value="../Community/CommView.sua?idx=${idx}&nowPage=${nowPage}&b_flag=${b_flag }" />
	</c:when>
	<c:otherwise>
		<c:set var="sucmsg" value="삭제성공함" />
		<c:set var="failmsg" value="삭제실패함" />
		<c:set var="moveurl" value="../Community/CommList.sua?nowPage=${nowPage }&b_flag=${b_flag }" />	
	</c:otherwise>
</c:choose>

<script>
<c:choose>
	<c:when test="${SUC_FAIL==1 }">
		alert("${sucmsg }");
		location.href="<c:url value='${moveurl }' />";
	</c:when>
	<c:when test="${SUC_FAIL==0 }">
		alert("${failmsg }");
		location.href="<c:url value='${moveurl }' />";
	</c:when>
	<c:otherwise>
		alert('처리중 예외가 발생했습니다');
		history.back();
	</c:otherwise>
</c:choose>
</script>




