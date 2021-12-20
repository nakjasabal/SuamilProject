<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"	%>    
<c:choose>
	<c:when test="${map.b_flag eq 'pds' }">
    	<c:set var="title_image" value="sub01_title.gif" />
    	<c:set var="path_str" value="직원자료실" />
	</c:when>
	<c:when test="${map.b_flag eq 'guardian' }">
    	<c:set var="title_image" value="sub02_title.gif" />
    	<c:set var="path_str" value="보호자게시판" />
	</c:when>
	<c:otherwise>
		<c:set var="title_image" value="sub01_title.gif" />
    	<c:set var="path_str" value="직원자료실" />
	</c:otherwise>
</c:choose>