<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>손만두</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">

<style>
header, nav, section, article, aside, footer {
	/* border: 1px solid rgb(236, 159, 159); */
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
#img1, #img2, #img3 {
	width: 100%;
	height: 500px;
}

/*--------------------*/
/* #test{
	margin:auto;
} */
</style>
</head>
<body>
	<div id="test">
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
		</nav>

		<section id="content">
			<div id="demo" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" id="img1"
							src="<%=request.getContextPath()%>/resources/images/sale.jpg">
						<div class="carousel-caption d-none d-md-bl ock"></div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="<%=request.getContextPath()%>/resources/images/candle.jpg"
							alt="Second slide" id="img2">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="<%=request.getContextPath()%>/resources/images/home.jpg"
							alt="Third slide" id="img3">
					</div>
					<a class="carousel-control-prev" href="#demo" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<!-- <span>Previous</span> -->
					</a> <a class="carousel-control-next" href="#demo" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
					</a>
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>

						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>
				</div>
		</section>

		<footer>
			<%@include file="../common/footer.jsp"%>
		</footer>
		<button onclick="topFunction()" id="myBtn" title="Go to top">top</button>
	</div>

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