<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, member.model.vo.Member, seller.model.vo.* "%>
<%

	ArrayList<Product> pList = (ArrayList<Product>)request.getAttribute("pList");
	ArrayList<Attachment> fList = (ArrayList<Attachment>)request.getAttribute("fList");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작가홈</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
header, nav, section, article, aside, footer {
	border: 1px solid rgb(255, 255, 255);
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

#main {
	width: 100%;
	border: 1px solid rgb(255, 255, 255);
}

/*================================================*/
#sidenav {
	width: 20%;
	height: 600px;
	padding-top: 20px;
	border: 1px solid rgb(255, 255, 255);
	background-color: #daeff5;
	float: left;
	text-align: center;
}

#userInfo {
	text-align: center;
}

#sidebtn {
	border: none;
	outline: none;
	color: black;
	cursor: pointer;
	background-color: #daeff5;
	margin : 5px;
	
}

#sidenav a {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 15px;
	color: #000000;
	display: block;
}

.side {
	text-align: center;
}

#sidenav a:hover {
	color: rgb(41, 44, 240);
}
/*================================================*/
#midmain {
	width: 80%;
	padding-top: 20px;
	padding-left: 15px;	
	border: 1px solid rgb(255, 255, 255);
	float: left;
}

#cardout{
    width: 210px;
    height: 300px;
    text-align: center; 
    float: left; 
    border: 1px solid rgb(197, 196, 196);  
}

#cardimg{
    width: 210px;
    height: 200px;
}

#cardIn{
    width: 210px;
    height: 200px;
    padding-bottom: 15px;
    border: 1px solid rgb(197, 196, 196); 

}
#cardtext1{
    padding-top: 5px;
}

#cardtext2>a{
    text-decoration: none;
    font-weight: 600;
    line-height: 25px;
    color: rgb(0, 0, 0);
    margin:0 10px;
}

#cardtext2>a:hover{
    color: rgb(87, 90, 243);
}

/*================================================*/


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
#img1, #img2, #img3 {
	width: 100%;
	height: 500px;
}
</style>
</head>

<body>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script>
		$('.carousel').carousel({
			interval : 2000
		})
	</script>
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


	<section id="content">

		<div id="main">

			<div id="sidenav">
				<img id="sellpng"
					src="<%= request.getContextPath()  %>/resources/images/duck.png"><br>
					
				<div id="userInfo">
					<label><h5><%= loginUser.getMemName() %>작가님</label></h5><br>
						
       <button id="sidebtn" onclick="location.href='<%= request.getContextPath() %>/views/seller/sellerHomeForm.jsp'">작품 소개</button><br><br>
        <button id="sidebtn" onclick="location.href='<%= request.getContextPath() %>/views/product/productDetail.jsp'">작가 소개</button><br><br>
					
				</div>
			</div>



			<div id="midmain">
			
	            <h5>판매중인 상품</h5>
	            
	            <% for(Product p : pList){ %>
	            
                <div id ="cardout">
                	<input type="hidden" value="<%= p.getProductId() %>">
                    <% for(Attachment at : fList){ %>
					<% if(p.getProductId() == at.getProductId()){ %>
                    
                    <div id ="cardIn">
                     <img id="cardimg" src="<%= contextPath %>/resources/productImg/<%= at.getChangeName() %>"class="card-img-top" >
                    </div>
                    <% } %>
					<% } %>

                    <div id ="cardtext1">
                    <label><%= p.getProductName() %></label><br> 
					<label><%= p.getPrice() %>원</label>
                    </div>

                    <div id = "cardtext2">
                     <a href="#" onclick="location.href='<%= request.getContextPath() %>/detail.pro'">구매하러 가기</a><br>
                        
                    </div>
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
	</script>


</body>

</html>



