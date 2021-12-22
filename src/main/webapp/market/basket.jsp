<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../include/global_head.jsp" %>
<script>
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function basketEdit(idx){
	var choiceCount = document.getElementById("amount_"+idx).value;	
	var price = document.getElementById("price_"+idx).value;
	
	var sum = document.getElementById("sum_"+idx);
	sum.innerHTML = numberWithCommas(choiceCount*price)+"원";
	alert("DB에 적용해야함");
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
				<table cellpadding="0" cellspacing="0" border="0" class="basket_list">
					<colgroup>
						<col width="7%" />
						<col width="10%" />
						<col width="*" />
						<col width="10%" />
						<col width="8%" />
						<col width="15%" />
						<col width="8%" />
					</colgroup>
					<thead>
						<tr>
							<th>선택</th>
							<th>이미지</th>
							<th>상품명</th>
							<th>판매가</th>
							<th>적립금</th>
							<th>수량</th>							 
							<th>합계</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach begin="1" end="3" step="1" var="i">
						<tr>
							<td><input type="checkbox" name="" id="" value="${i }" checked /></td>
							<td><img src="../images/market/cake_img1.jpg" /></td>
							<td>녹차 쌀 무스케잌</td>
							<td>30,000원</td>
							<td><img src="../images/market/j_icon.gif" />&nbsp;300원</td>
							<td>
								<input type="number" name="amount_${i }" id="amount_${i }" value="1" class="basket_num" style="width:45px;padding:0 2px;"/>
								&nbsp;<img src="../images/market/m_btn.gif" onclick="basketEdit(${i });" style="cursor:pointer;" />
								<input type="hidden" name="price_${i }" id="price_${i }" value="30000" />
							</td>
							<td><span id="sum_${i }">30,000원<span></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<p class="basket_text"> 
					<span>상품구매금액</span> 137,000 + <span>배송비</span> 0 = 
					합계 : <span class="money">137,000원</span>
					<br /><br />
					<a href=""><img src="../images/market/basket_btn01.gif" /></a>&nbsp;
					<a href="basket02.jsp"><img src="../images/market/basket_btn02.gif" /></a>
				</p>
			</div>
		</div>
		<%@ include file="../include/quick.jsp" %>
	</div>
	

	<%@ include file="../include/footer.jsp" %>
</body>
</html>
