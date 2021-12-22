<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../include/global_head.jsp" %>
<script>
function basketIn(idx){
	
	var choiceCount = document.getElementById("amount_"+idx).value;
	console.log("상품번호&갯수", idx, choiceCount);
	alert("상품번호:"+ idx +", 갯수:"+ choiceCount)
}
</script>
<body>
	<div id="wrap">
		<%@ include file="../include/top.jsp" %>

		<img src="../images/market/sub_image.jpg" id="main_visual" />

		<div class="contents_box">
			<div class="left_contents">
				<%@ include file = "../include/market_leftmenu.jsp" %>
			</div>
			<div class="right_contents">
				<div class="top_title">
					<img src="../images/market/sub01_title.gif" alt="수아밀 제품 주문" class="con_title" />
					<p class="location"><img src="../images/center/house.gif" />&nbsp;&nbsp;열린장터&nbsp;>&nbsp;수아밀 제품 주문<p>
				</div>
				<form name="basketFrm">
				<table cellpadding="0" cellspacing="0" border="0" class="market_board01">
					<colgroup>
						<col width="5%" />
						<col width="20%" />
						<col width="*" />
						<col width="10%" />
						<col width="10%" />
						<col width="15%" />
					</colgroup>
					<tr>
						<th>NO</th>
						<th>상품이미지</th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>장바구니</th>
					</tr>
					<c:forEach begin="1" end="5" step="1" var="i">
					<tr>
						<td>${i }</td>
						<td><a href="market_view.jsp?idx=${i }"><img src="../images/market/img01.jpg" /></a></td>
						<td class="t_left"><a href="market_view.jsp?idx=${i }">녹차 쌀 무스케잌${i }</a></td>
						<td class="p_style">30,000</td>
						<td><input type="number" name="amount_${i }" id="amount_${i }" value="1" class="n_box" /></td>
						<td>
							<!-- <a href=""><img src="../images/market/btn01.gif" style="margin-bottom:5px;" /></a>
							<br /> -->
							<img src="../images/market/btn02.gif" onclick="basketIn(${i })" style="cursor:pointer;"/>							
						</td>
					</tr>
					</c:forEach> 
				</table>
				</form>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
 </body>
</html>
