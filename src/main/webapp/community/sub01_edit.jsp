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
				<div>
				<!-- 내용 삽입 s -->
				<script>
					function frmValidate(f){
						if(f.name.value==""){
							alert("이름을 입력하세요");
							f.name.focus();
							return false;
						}
						if(f.title.value==""){
							alert("제목을 입력하세요");
							f.title.focus();
							return false;
						}
						if(f.content.value==""){
							alert("내용을 입력하세요");
							f.content.focus();
							return false;
						}
						if(f.pass.value==""){
							alert("비밀번호를 입력하세요");
							f.pass.focus();
							return false;
						}
					}
				</script>
				<form name="writeFrm" method="post"
				 	action="<c:url value="/Community/CommEdit.sua" />"
					onsubmit="return frmValidate(this);"
					enctype="multipart/form-data">
				
				<!-- 게시물 수정을 위한 일련번호 추가 -->
				<input type="hidden" name="idx" value="${dto.idx }"/>
				<input type="hidden" name="nowPage" value="${param.nowPage }" />
				<input type="hidden" name="b_flag" value="${param.b_flag }" />
				<!-- 첨부파일 수정을 위한 기존 파일명 -->
				<input type="hidden" name="originalfile" value="${dto.attachedfile }" />	
						
				<table class="table table-bordered table-striped">
				<colgroup>
					<col width="20%"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center" 
							style="vertical-align:middle;">작성자</th>
						<td>
							<input type="text" class="form-control"
								style="width:100px;" name="name" 
								value="${dto.name }" />
						</td>
					</tr>
					<tr>
						<th class="text-center" 
							style="vertical-align:middle;">패스워드</th>
						<td>
							<input type="password" class="form-control"
								style="width:200px;" name="pass" />
						</td>
					</tr>
					<tr>
						<th class="text-center"
							style="vertical-align:middle;">제목</th>
						<td>
							<input type="text" class="form-control" 
								name="title" value="${dto.title }" />
						</td>
					</tr>
					<tr>
						<th class="text-center"
							style="vertical-align:middle;">내용</th>
						<td>
							<textarea rows="10" 
								class="form-control" 
								name="content">${dto.content }</textarea>
						</td>
					</tr>
					<tr>
						<th class="text-center"
							style="vertical-align:middle;">첨부파일</th>
						<td>
							파일명 : ${dto.attachedfile }<br/>
							<input type="file" class="form-control" 
								name="attachedfile" />
						</td>
					</tr>
				</tbody>
				</table>
				
				<!-- 각종 버튼 -->
				<div class="row mb-3">
					<div class="col text-right">		
						<button type="submit" class="btn btn-danger">전송하기</button>
						<button type="reset" class="btn btn-dark">Reset</button>
						<button type="button" class="btn btn-warning" onclick="location.href='../Community/CommList.sua?nowPage=${param.nowPage }';">리스트보기</button>
					</div>
				</form>
				</div>			
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
 </body>
</html>
