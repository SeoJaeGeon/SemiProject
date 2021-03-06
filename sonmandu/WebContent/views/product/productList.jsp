<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, product.model.vo.*"%>
<%
	ArrayList<Product> pList = (ArrayList<Product>)request.getAttribute("pList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>손만두</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">

<style>
* {
	box-sizing: border-box;
}

#body{
	margin:auto;
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

/* top 버튼*/
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

/* top 버튼*/
.product {
	box-sizing: border-box;
	width: 245px;
	height: 280px;
	display: inline-block;
	font-family: 'NanumBarunGothic', sans-serif;
}

.product>img {
	box-sizing: border-box;
	width: 100%;
	height: 60%;
    margin-bottom: 15px;
}

.product>p, .product>a {
	color: black;
	margin-bottom: 0;
	margin-left: 2px;
	display: inline-block;
	text-decoration: none;
}

.product>a:hover {
	color: black;
	text-decoration: none;
}

#menu_select {
	width: 100%;
}

#menu_select ul {
	margin-top : 30px;
	margin-bottom : 50px;
	list-style: none;
}

#menu_select li {
	width: 250px;
	height: 300px;
	margin-left: 30px;
	margin-top: 30px;
	box-sizing: border-box;
	display: inline-block;
	background : #f8f9fb;
	border:2px solid gray;
}

#menu_select textarea {
	width: 90%;
	height: 50px;
	display: inline-block;
	resize: none;
	border: none;
	background-color: #f8f9fb;
}

#menu_select textarea:focus {
	background-color: #f8f9fb;
	outline: none;
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
		<div id="menu_select">
			<% if(!pList.isEmpty()) {%>
			<ul class="">
			<% for(Product p : pList) { %>
				<li class="pli">
				<input type="hidden" value="<%= p.getProductId() %>">
					<div class="product" type="button">
						<img src="<%= contextPath %>/resources/productImg/<%=p.getChangeName()%>">
						<a href="#"><%= p.getStoreName() %></a><br>
						<textarea readonly><%= p.getProductName() %></textarea>
						<p>
							금액  <span><%= p.getPrice() %></span>원
						</p>
					</div>
				</li>
			<% } %>
			</ul>
			<% } else {%>
			<div>
				<h1 width="100%" align="center">해당하는 상품이 없습니다.</h1>			
			</div>
			<% } %>
		</div>
	</section>

	<footer>
		<%@include file="../common/footer.jsp"%>
	</footer>

	<button onclick="topFunction()" id="myBtn" title="Go to top">top</button>

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
		
		$(".pli").click(function(){
			var pNo = $(this).children().eq(0).val();
			location.href = "<%= contextPath %>/detail.pro?pNo="+pNo;
		});
	</script>
</body>
</html>