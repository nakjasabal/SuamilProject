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
				
				<!-- 게시판 리스트  -->
				<div class="row text-center mt-3">		 
				<%
		 				if(bbs.isEmpty()){
		 							//컬렉션에 저장된 데이터가 없는경우
		 				%>
						<div class="col p-5">
							등록된 게시물이 없습니다^^*
						</div>
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
								//게시물의 번호를 순서대로 출력하기위한
								//가상번호 생성(게시물의 갯수를 기준)
								vNum = totalRecordCount - (((nowPage-1)*pageSize)+countNum++);
				%>
					<div class="col-md-4">
						<div class="thumbnail mb-4 p-1 border" style="height:230px;">
							<a href="sub01_t_view.jsp?num=<%=dto.getNum()%>&b_flag=<%=b_flag%>&nowPage=<%=nowPage%>">
								<img src="../Upload/<%=dto.getChumfile()%>" alt="겔러리이미지" style="max-width:220px;">
								<div class="caption">
									<p>
										<a href="sub01_t_view.jsp?num=<%=dto.getNum()%>&b_flag=<%=b_flag%>&nowPage=<%=nowPage%>">
											<%=dto.getTitle() %>
										</a>
									</p>
								</div>
							</a>
						</div>
					</div>
				<%
					}//for-each문 끝
				}//if문 끝
				%>
				</div> 
 
				<div class="row">
					<div class="col text-right">
						<button type="button" class="btn btn-primary" onclick="location.href='sub01_t_write_photo.jsp?b_flag=<%=b_flag%>';">사진게시판글쓰기</button>
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
							<%=PagingUtil.pagingHomepy(totalRecordCount, pageSize, blockPage, nowPage, "sub01_t_list_photo.jsp?"+queryStr) %>			
						</ul>
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