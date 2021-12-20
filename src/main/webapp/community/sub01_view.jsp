<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
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
				<div>
				<!-- 내용이 들어가는 부분s -->
					<table class="table table-bordered table-striped">
					<colgroup>
						<col width="20%"/>
						<col width="30%"/>
						<col width="20%"/>
						<col width="*"/>
					</colgroup>
					<tbody>
						<tr>
							<th class="text-center" 
								style="vertical-align:middle;">작성자</th>
							<td>${dto.name }</td>
							<th class="text-center" 
								style="vertical-align:middle;">작성일</th>
							<td>${dto.postdate }</td>
						</tr>
						<tr>
							<th class="text-center" 
								style="vertical-align:middle;">다운로드수</th>
							<td>${dto.downcount }</td>
							<th class="text-center" 
								style="vertical-align:middle;">조회수</th>
							<td>${dto.visitcount }</td>
						</tr>
						<tr>
							<th class="text-center"
								style="vertical-align:middle;">제목</th>
							<td colspan="3">
								${dto.title }
							</td>
						</tr>
						<tr>
							<th class="text-center"
								style="vertical-align:middle;">내용</th>
							<td colspan="3" style="height:150px;">
								${dto.content }
							</td>
						</tr>
						<tr>
							<th class="text-center"
								style="vertical-align:middle;">첨부파일</th>
							<td colspan="3">
								<!-- 첨부파일이 있을때만 화면 보임 -->		
								<c:if test="${not empty dto.attachedfile }">
									${dto.attachedfile }
									&nbsp;
									<a href="Download.sua?filename=${dto.attachedfile }&idx=${dto.idx }">
										<i class='fas fa-file-download' style='font-size:20px;color:red'></i>
									</a>
								</c:if>
							</td>
						</tr>
					</tbody>
					</table>
					
					<div class="row mb-3 ml-2">
						<div class="col-6">
							<button type="button" class="btn btn-secondary" 
								onclick="location.href='./CommPassword.sua?b_flag=${param.b_flag }&idx=${param.idx}&mode=edit&nowPage=${param.nowPage }';">수정하기</button>
							<button type="button" class="btn btn-success" 
								onclick="location.href='../Community/CommPassword.sua?b_flag=${param.b_flag }&idx=${dto.idx}&mode=delete&nowPage=${param.nowPage }';">삭제하기</button>	
							<button type="button" class="btn btn-info"
								onclick="location.href='../Community/CommReply.sua?b_flag=${param.b_flag }&idx=${dto.idx}&nowPage=${param.nowPage }';">답글쓰기</button>
						</div>
						<div class="col-6 text-right pr-5">							
							<button type="button" class="btn btn-warning" onclick="location.href='./CommList.sua?b_flag=${param.b_flag }&nowPage=${param.nowPage}';">리스트보기</button>
						</div>
						</form>
					</div>
				</div>				
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
 </body>
</html>
