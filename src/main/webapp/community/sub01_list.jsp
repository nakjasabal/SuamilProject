<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"	%>      
<%@ include file="../include/global_head.jsp" %>
<%@ include file="../community/common_community.jsp" %>
<body>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/community/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">		
				<%@ include file = "../include/community_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/community/${title_image }" alt="${path_str }" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;커뮤니티&nbsp;>&nbsp;${path_str }<p>
				</div>
				<div class="row">
					<!-- 검색부분 -->
					<form class="form-inline ml-auto">	
					<input type="hidden" name="b_flag" value="${map.b_flag }" />
					<input type="hidden" name="nowPage" value="1" />
						<div class="form-group">
							<select name="searchColumn" class="form-control fs12">
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="name">작성자</option>
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
				<div class="row mt-3">
					<!-- 게시판리스트부분 -->
					<table class="table table-bordered table-hover table-striped">
					<colgroup>
						<col width="60px"/>
						<col width="*"/>
						<col width="120px"/>
						<col width="120px"/>
						<col width="80px"/>
						<col width="60px"/>
					</colgroup>				
					<thead>
					<tr style="background-color:#d1bfa7; border:1px #858585 solid;" class="text-center text-white">
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>첨부</th>
					</tr>
					</thead>				
					<tbody>
					<c:choose>
						<c:when test="${empty lists }">
							<!-- 등록된 게시물이 없을때... -->
							<tr>
								<td colspan="6" style="height: 100px;text-align: center;vertical-align: middle;">
									등록된 글 없씸 ㅜㅜ;
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<!-- 등록된 글이 있을때 반복하면서 리스트 출력 -->
							<c:forEach items="${lists }" var="row"
								varStatus="loop">
								<tr>
									<td class="text-center">
										${map.totalCount - (((map.nowPage-1) * map.pageSize) + loop.index) }				         
									</td>
									<td class="text-left">
										<a href="../Community/CommView.sua?b_flag=${map.b_flag }&idx=${row.idx }&nowPage=${map.nowPage }">
											${row.title }
										</a>					
									</td>
									<td class="text-center">${row.name }</td>
									<td class="text-center">${row.postdate }</td>
									<td class="text-center">${row.visitcount }</td>
									<td class="text-center">
										<c:if test="${not empty row.attachedfile }">
											<i class="material-icons" style="font-size:18px">attach_file</i>			
										</c:if>
									</td>
								</tr>
							</c:forEach>		
						</c:otherwise>	
					</c:choose>
					</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col text-right">
						<button type="button" class="btn btn-primary" onclick="location.href='../Community/CommWrite.sua?b_flag=${map.b_flag }';">글쓰기</button>
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
							${pagingImg }			
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
