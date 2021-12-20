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
				
<!-- Contents 시작 -->
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
		<td>홍길동</td>
		<th class="text-center" 
			style="vertical-align:middle;">작성일</th>
		<td>2018-07-04</td>
	</tr>
	<tr>
		<th class="text-center" 
			style="vertical-align:middle;">이메일</th>
		<td>hong@naver.com</td>
		<th class="text-center" 
			style="vertical-align:middle;">조회수</th>
		<td>999</td>
	</tr>
	<tr>
		<th class="text-center"
			style="vertical-align:middle;">제목</th>
		<td colspan="3">
			제목입니다.
		</td>
	</tr>
	<tr>
		<th class="text-center"
			style="vertical-align:middle;">내용</th>
		<td colspan="3">
			내용입니다. <br />
			내용입니다. <br />
			내용입니다. <br />
			내용입니다. <br />
		</td>
	</tr>
	<tr>
		<th class="text-center"
			style="vertical-align:middle;">첨부파일</th>
		<td colspan="3">
			파일명.jpg <a href="">[다운로드]</a>
		</td>
	</tr>
</tbody>
</table>

<!-- 각종 버튼 -->
<div class="row text-center" style="padding-right:50px;">
	<!-- 
	<button type="button" class="btn btn-primary"
		onclick="location.href='WriteSkin.jsp';">
		글쓰기</button>
	
	<button type="submit" class="btn btn-default">
		전송하기</button>
	<button type="reset" class="btn">	
		Reset</button>
	 -->	 
	
	<button type="button" class="btn btn-success">
		수정하기</button>
	<button type="button" class="btn btn-info">
		삭제하기</button>
	<button type="button" class="btn btn-warning">
		답글쓰기</button>
	<button type="button" class="btn btn-danger"
		onclick="location.href='ListSkin.jsp';">
		리스트보기</button>
</div>	


<p>&nbsp;</p>

<!-- 댓글작성폼 -->
<form name="commentFrm" onsubmit="return commentFrmCheck();">
<input type="hid den" name="" value="해당게시물의 idx값" />
<input type="hid den" name="" value="페이지번호" />
<table class="table table-bordered">
	<colgroup>
		<col width="*"><col width="10%">
	</colgroup>	
	<tbody>				 
		<tr>
			<td colspan="2" class="form-inline">
				<div class="form-group">
					<label for="co_name">작성자:</label>
					<input type="text" class="form-control" name="co_name" id="co_name" placeholder="Enter name">
				</div>
				&nbsp;&nbsp;&nbsp;
				<div class="form-group">
					<label for="co_pass">패스워드:</label>
					<input type="password" class="form-control" name="co_pass" id="co_pass" placeholder="Enter password">
				</div>							
			</td>
		</tr>
		<tr>
			<th class="text-center" style="vertical-align:middle;">
				<textarea class="form-control" name="co_comments" style="height:100px;"></textarea>
			</th>
			<td>
				<button type="submit" class="btn btn-warning" style="width:100px;height:100px;">댓글쓰기</button>
			</td>
		</tr>
	</tbody>
</table>
</form>

<!-- 댓글리스트 시작-->
<%
for(int i=1 ; i<=5 ; i++)
{
%>
<div class="media">	
	<div class="media-body">
		<p>
			<code>작성자</code> : 성낙현&nbsp;&nbsp;&nbsp;&nbsp;
			<code>작성일</code> : 2018-07-20
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalEdit" style="padding:0 5px 0 5px; height:24px;" onclick="getComments('edit','100');">수정</button>
			<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModalDelete" style="padding:0 5px 0 5px; height:24px;" onclick="getComments('del','100');">삭제</button>
		</p>
		<p class="bg-info" style="padding:10px;">
			댓글내용입니다. <br />
			댓글내용입니다. <br />
			댓글내용입니다. <br />
			댓글내용입니다. <br />
		</p>
	</div>		
</div>
<hr>
<%
}
%>
<!-- 댓글리스트 끝-->

<!-- 댓글 수정 모달창 -->
<div class="modal fade" id="myModalEdit" role="dialog">
	<div class="modal-dialog">
<form name="commentEditFrm" onsubmit="return commentEditFrmCheck();">
<input type="hidden" name="seq" />
	<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">				
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">댓글 수정</h4>
			</div>
			<div class="modal-body">
				<div class="form-inline">
					<label for="co_pass">패스워드:</label>
<input type="password" class="form-control" name="co_pass" id="co_pass" placeholder="Enter password">
				</div>	
				<p class="form-inline">
<textarea name="co_comments" class="form-control" style="width:450px;height:100px;"></textarea>
<button type="submit" class="btn btn-primary" style="width:100px;height:100px;float:right;">댓글수정</button>
				</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>		  
</form>
	</div>
</div>

<!-- 댓글 삭제 모달창 -->
<div class="modal fade" id="myModalDelete" role="dialog">
	<div class="modal-dialog">
<form name="commentDeleteFrm" onsubmit="return commentDeleteFrmCheck();">
<input type="hidden" name="seq" value="" />
	<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">				
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">댓글 삭제</h4>
			</div>
			<div class="modal-body">
				<div class="form-inline">
					<label for="co_pass">패스워드:</label>
<input type="password" class="form-control" name="co_pass" id="co_pass" placeholder="Enter password">
<button type="submit" class="btn btn-success" style="float:right;">댓글삭제</button>
				</div>	
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>		  
	</form>
	</div>
</div>  
			
			</div>
<!-- Contents 끝 -->			
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
 </body>
</html>
