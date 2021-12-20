<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/global_head.jsp" %>


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
					<img src="../images/space/sub03_title.gif" alt="자유게시판" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린공간&nbsp;>&nbsp;자유게시판<p>
				</div>
				

<!-- 검색 -->
<div class="row text-right" style="margin-bottom:20px;
	padding-right:50px;">
<form class="form-inline">
	<div class="form-group">
		<select name="" class="form-control">
			<option value="">제목</option>
			<option value="">내용</option>
			<option value="">제목+내용</option>
		</select>
	</div>
	<div class="input-group">
		<input type="text" name="" class="form-control" />
		<div class="input-group-btn">
			<button type="submit" class="btn btn-info">
				<i class="glyphicon glyphicon-search">
				</i>
			</button>
		</div>				
	</div>
</form>	
</div>

<!-- 게시판 리스트  -->
<!-- table>tr*2>td*6 -->
<table class="table table-bordered table-hover">
<colgroup>
	<col width="80px" />
	<col width="*" />
	<col width="120px" />
	<col width="120px" />
	<col width="80px" />
	<col width="50px" />
</colgroup>
<thead>
	<tr>
		<th class="text-center">번호</th>
		<th class="text-center">제목</th>
		<th class="text-center">작성자</th>
		<th class="text-center">작성일</th>
		<th class="text-center">조회수</th>
		<th class="text-center">첨부</th>
	</tr>
</thead>
<tbody>
	<!-- 반복시작 -->	
	<tr>
		<td class="text-center">번호</td>
		<td class="text-left"><a href="ViewSkin.jsp">제목</a></td>
		<td class="text-center">작성자</td>
		<td class="text-center">작성일</td>
		<td class="text-center">조회수</td>
		<td class="text-center">첨부</td>
	</tr>
	<!-- 반복끝 -->
</table>

<!-- 각종 버튼 -->
<div class="row text-right" style="padding-right:50px;">
	<button type="button" class="btn btn-primary"
		onclick="location.href='WriteSkin.jsp';">
		글쓰기</button>
	<!-- <button type="button" class="btn btn-success">
		수정하기</button>
	<button type="button" class="btn btn-info">
		삭제하기</button>
	<button type="button" class="btn btn-warning">
		답글쓰기</button>
	<button type="button" class="btn btn-danger">
		리스트보기</button>
	<button type="button" class="btn btn-default">
		전송하기</button>
	<button type="button" class="btn">
		Reset</button> -->
</div>

<!-- 페이지번호 -->
<div class="row text-center">
	<ul class="pagination">
		<li><span class="glyphicon 
			glyphicon-fast-backward"></span></li>
		
		<li class="active"><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		
		<li><span class="glyphicon 
			glyphicon-fast-forward"></span></li>
	</ul>
</div>
				
				
				
				
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
 </body>
</html>
