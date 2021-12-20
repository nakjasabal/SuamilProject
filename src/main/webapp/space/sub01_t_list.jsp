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
				<div class="row mr-2">
					<!-- 검색부분 -->
					<form class="form-inline ml-auto">	
					<input type="hidden" name="b_flag" value="<%=b_flag%>" />
					<input type="hidden" name="nowPage" value="1" />
						<div class="form-group">
							<select name="searchColumn" class="form-control fs12">
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="both">제목+내용</option>
							</select>
						</div>
						<div class="input-group">
							<input type="text" name="searchWord"  class="form-control fs12"/>
							<div class="input-group-btn">
								<button type="submit" class="btn btn-warning">
									<i class='fa fa-search fs18'></i>
								</button>
							</div>
						</div>
					</form>	
				</div>
				<div class="mt-3">
					<!-- 게시판리스트부분 -->
					<table class="table table-bordered table-hover table-striped">
					<colgroup>
						<col width="60px"/>
						<col width="*"/>
						<col width="120px"/>
						<col width="120px"/>
						<col width="80px"/>
						<!-- <col width="60px"/> -->
					</colgroup>				
					<thead>
					<tr style="background-color:#d1bfa7; border:1px #858585 solid;" class="text-center text-white">
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<!-- <th>첨부</th> -->
					</tr>
					</thead>				
					<tbody>
					<%
					if(bbs.isEmpty()){
									//컬렉션에 저장된 데이터가 없는경우
					%>
							<tr>
								<td colspan="6" height="100" style="vertical-align: middle;text-align: center;">
									등록된 게시물이 없습니다^^*
								</td>
							</tr>
					<%
					}
								else
								{
									//컬렉션에 저장된 데이터가 있는경우 for-each문을통해
									//내용 출력
									int vNum = 0;
									int countNum = 0;
									for(BoardDTO dto : bbs)
									{
										vNum = totalRecordCount - (((nowPage-1)*pageSize)+countNum++);
					%>
						<tr>
							<td class="text-center"><%=vNum %></td>
							<td class="text-left">
								<a href="sub01_t_view.jsp?num=<%=dto.getNum()%>&b_flag=<%=b_flag%>&nowPage=<%=nowPage%>">
									<%=dto.getTitle() %>
								</a></td>
							<td class="text-center"><%=dto.getName() %></td>
							<td class="text-center"><%=dto.getPostDate() %></td>
							<td class="text-center"><%=dto.getVisitcount() %></td>
							<%-- <td class="text-center">
								<% if(dto.getChumfile()!=null){ %>
									<i class="material-icons" style="font-size:20px">attach_file</i>
								<% } %>	
							</td> --%>
						</tr>
						<!-- 리스트반복 -->
					<%
						}//for-each문 끝
					}//if문 끝
					%>
					</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col text-right">
						<button type="button" class="btn btn-primary" onclick="location.href='sub01_t_write.jsp?b_flag=<%=b_flag%>';">글쓰기</button>
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
				<div class="row mt-3">
					<div class="col">
						<!-- 페이지번호 부분 -->
						<ul class="pagination justify-content-center">
							<%=PagingUtil.pagingHomepy(totalRecordCount, pageSize, blockPage, nowPage, "sub01_t_list.jsp?"+queryStr) %>			
						</ul>
					</div>				
				</div>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>


	<%@ include file="../include/footer.jsp" %>
 </body>
</html>