<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, product.model.vo.*"%>
<%

	ArrayList<Product> pList = (ArrayList<Product>)request.getAttribute("pList");

	int pNo = 0;
	String proImage1 = "";
	String proImage2 = "";
	String seller = "";
	String productName = "";
	int price = 0;
	int charge = 0;
	int stock = 0;
	int productTime = 0;
	int storeId = 0;
	
	for(Product p : pList) {
		if(p.getFileLevel() == 0) {
			pNo = p.getProductId();
			proImage1 = p.getChangeName();
			seller = p.getStoreName();
			productName = p.getProductName();
			price = p.getPrice();
			charge = p.getCharge();
			stock = p.getStock();
			productTime = p.getProductTime();
			storeId = p.getStoreId();
		
		} else {
			proImage2 = p.getChangeName();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>손만두</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">

<style>
#body {
	margin: auto;
}

header, nav, section, article, aside, footer {
	box-sizing: border-box;
	display: block;
}

body {
	width: 1500px;
	margin: auto;
}

header {
	width: 100%;
	height: 150px;
}

nav {
	width: 100%;
	height: 50px;
}

#content {
	width: 100%;
}

footer {
	width: 100%;
	height: 150px;
	float: left;
}

header>section {
	float: left;
}

#header-1 {
	width: 30%;
	height: 100%;
	position: relative;
}

#header-2 {
	width: 55%;
	height: 100%;
	position: relative;
}

#header-3 {
	width: 15%;
	height: 100%;
}

#footer1 {
	width: 100%;
	height: 50px;
	padding: 1px;
}

#footer2 {
	width: 100%;
	height: 50px;
}

#content1 {
	width: 50%;
	height: 500px;
	float: left;
	border:1px gray solid;
}

#content2 {
	width: 50%;
	height: 500px;
	float: left;
	padding: 15px;
	border:1px gray solid;
}

#content3 {
	width: 100%;
	height: 60px;
	float: left;
}

#content3 :first-child {
	margin-left: 38%;
}

#content4 {
	width: 100%;
	float: left;
}

#img_sal {
	width: 90%;
	height: 90%;
	margin-left: 40px;
	margin-top: 20px;
}

#myBtn {
	display: none;
	position: fixed;
	bottom: 20px;
	right: 30px;
	z-index: 99;
	border: none;
	outline: none;
	background-color: red;
	color: white;
	cursor: pointer;
	padding: 15px;
	border-radius: 10px;
	font-size: 18px;
}

#myBtn:hover {
	background-color: #555;
}

#redbtn {
	color: red;
	margin-top: 10px;
	margin-right: 20px;
}

#redbtn:hover {
	background: #f44336;
	color: white;
}

#content2-mini3>span {
	font-size: 25px;
	position: absolute;
	left: 0;
	bottom: 0;
	transform: translate(0%, 0%);
	font-family: 'NanumBarunGothic', sans-serif;
}

#salBtn {
	display: inline-block;
	background-color: #f4511e;
	border: none;
	color: white;
	padding: 16px 40px;
	text-align: center;
	font-size: 16px;
	transition: 0.3s;
	position: absolute;
	right: 0;
	bottom: 0;
	transform: translate(-5%, -15%);
}

#salBtn:hover {
	background: #a7403b;
}

#content2-mini1 {
	width: 100%;
	height: 70%;
}

#content2-mini2 {
	width: 100%;
	height: 10%;
}

#content2-mini3 {
	width: 100%;
	height: 20%;
	position: relative;
}

/*------------------------------------------------*/
.card_link {
	font-size: 18px;
	font-style: none;
	color: black;
	display: inline-block;
	width: 100%;
	font-family: 'NanumBarunGothic', sans-serif;
}

.card_link:hover {
	color: black;
	text-decoration: none;
}

.card_img {
	width: 30px;
	height: 30px;
	display: inline-block;
}

.price_tag {
	width: 100%;
	font-size: 20px;
	font-family: 'NanumBarunGothic', sans-serif;
}

.price_tag>* {
	display: inline-block;
}

.aside_marked {
	float: right;
	margin-right: 15px;
}

.product_info {
	width: 100%;
	font-size: 20px;
	font-family: 'NanumBarunGothic', sans-serif;
}

.data-row table tr td:first-child {
	width: 100px;
}

.ui_Btn {
	width: 100%;
	height: 50px;
	font-family: 'NanumBarunGothic', sans-serif;
	font-size: 20px;
	background: #dd5850;
	color: white;
	overflow: hidden;
}

.ui_Btn:hover {
	background: #a7403b;
}

.pro_Val {
	width: 70%;
	height: 100%;
	font-size: 30px;
	text-align: center;
	float: right;
}
</style>
</head>
<body id="body">
	<header>
		<section id="header-1">
			<%@include file="../common/header1.jsp"%>
		</section>
		<section id="header-2">
			<%@include file="../common/header2.jsp"%>
		</section>
		<section id="header-3">
			<%@include file="../common/header3.jsp"%>
		</section>
	</header>

	<nav>
		<%@include file="../common/navi.jsp"%>
	</nav>

	<section id="content">
		<section id="content1">
			<img id="img_sal" src="<%= contextPath %>/resources/productImg/<%= proImage1 %>">
		</section>
		<section id="content2">
			<section id="content2-mini1">

				<a class="card_link" href="<%= contextPath %>/sHome.sell?storeId=<%= storeId%>">
					<span><%= seller %></span>
				</a>

				<h2 class="aside_title"><%= productName %></h2>

				<div class="price_tag">
					<span><strong><%= price %></strong>원</span>
				</div>

				<div class="product_info">
					<div class="data-row">
						<table>
							<tr>
								<td>배송비</td>
								<td><span><%= charge %>원</span></td>
							</tr>
						</table>
					</div>

					<div class="data-row">
						<table>
							<tr>
								<td>배송 시작</td>
								<td><span>최대 <%= productTime %>일 이내</span></td>
							</tr>
						</table>
					</div>

					<div class="data-row">
						<table>
							<tr>
								<td>수량</td>
								<td><span><%= stock %>개</span></td>
							</tr>
						</table>
					</div>
				</div>
				<br>
					<button class="ui_Btn" onclick="basketBtn();">장바구니 담기</button>
			</section>
			<section id="content2-mini2">
				<label style="font-size: 25px">수량 선택 : </label> 
				<input type="number" value="1" class="pro_Val">
			</section>
			<section id="content2-mini3">
				<span>
					<input type="hidden" id="price" value="<%= price %>">
					<p id="tPrice">총 작품금액 : <%= price %>원</p>
				</span>
					<button id="salBtn" onclick="salBtn();">구매하기</button>
			</section>

		</section>
		<section id="content3">
			<button class="btn" id="redbtn" onclick="salPage();">상품페이지</button>
			<button class="btn" id="redbtn" onclick="reviewPage();">리뷰페이지</button>
			<button class="btn" id="redbtn" onclick="goBoard();">문의페이지</button>
		</section>
		<section id="content4">
			<img src="<%= contextPath %>/resources/productImg/<%= proImage2 %>" width="100%">
		</section>
	</section>

	<footer>
		<%@include file="../common/footer.jsp" %>
	</footer>
	<button onclick="topFunction()" id="myBtn" title="Go to top">구매하러가기</button>

	<script>
		mybutton = document.getElementById("myBtn");
		window.onscroll = function() {
			scrollFunction()
		};

		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				mybutton.style.display = "block";
			} else {
				mybutton.style.display = "none";
			}
		}

		function topFunction() {
			document.body.scrollTop = 0;
			document.documentElement.scrollTop = 0;
		}
		
		function salPage(){
			location.href = "<%= contextPath %>/detail.pro?pNo="+<%= pNo %>
		}
		
		$(".pro_Val").click(function(){
			var proVal = $(this).val();
			var price = $("#price").val();
			var mul = price * proVal;
			var test = document.getElementById("tPrice");
			
			test.innerHTML="<p>총 작품금액 : "+mul+"원</p>";
			
			
		});
		
		
		
		function basketBtn(){
			<% if(loginUser != null){ %>
			var proVal = $(".pro_Val").val();
			var userNum = <%= loginUser.getMemNum() %>;
			
			alert("장바구니에"+proVal+"개 담았어요~ ^^");
			
			location.href = "<%= request.getContextPath() %>/insert.bas?pNo=<%= pNo%>&proVal="+proVal;
			<% } else { %>
				alert("로그인을 해주세요.");
			<% } %>
		}
		
		function salBtn(){
			<% if(loginUser != null){ %>
			var proVal = $(".pro_Val").val();
				location.href = "<%= contextPath %>/buy.pro?pNo=<%= pNo %>&proVal="+proVal;
			<% } else { %>
				alert("로그인을 해주세요.");
			<% } %>
		}
		
		 function goBoard(){
				location.href = "<%= contextPath %>/list.bo";
			}
	      	  
		
	</script>
</body>
</html>