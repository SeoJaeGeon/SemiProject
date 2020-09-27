<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>손만두정산</title>
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

#sidenav a {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 15px;
	color: #000000;
	display: block;
}
/*================================================*/
#sidenav a:hover {
	color: rgb(41, 44, 240);
}

#search-textarea-1{
            height: 100%;
            width: 25%;
            float: left;
        }


#search-btnarea-1{
            height: 100%;
            width: 8%;
            float: left;
        }
/*================================================*/
#midmain{
    width: 80%;      
    padding-top: 20px; 
    padding-left: 15px;
    padding-right:15px;
    border: 1px solid rgb(255, 255, 255);  
    display : inline-block; 
} 

#midmain-1{
    width: 60%;      
    border: 1px solid rgbrgb(255, 255, 255);   
} 
#datechoose{
    float: left; 
    border: 1px solid rgb(255, 255, 255);  
    padding-right: 10px;
    padding-bottom: 10px;
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
	</nav>


	<section id="content">

		<div id="main">

			<div id="sidenav">
				<%@include file="../common/sellsidebar.jsp"%>
			</div>

					<div id="midmain">
						<h5>수익금</h5>

						<div id="midmain-1">
							<div id="datechoose">
								<label>날짜 선택 : </label> 
								<input type="month" name="monthIn">
							</div>

							<div id="search-textarea-1">
								<input type="texta" size="20" name="search">
							</div>
							
							<div id="search-btnarea-1">
								<button type="submit">검색</button>
							</div>

						</div>

						<table class="table table-bordered">
							<thead class="table-primary">
								<tr>
									<th>총판매금액</th>
									<th>총수익</th>
									<th>수수료</th>
									<th>배송비</th>
								</tr>
							</thead>
							<tr>
								<td>100,000</td>
								<td>80,000</td>
								<td>5,000</td>
								<td>15,000</td>
							</tr>
						</table>

						<table class="table table-bordered">
							<thead class="table-primary">
								<tr>
									<th>판매날짜</th>
									<th>상품명</th>
									<th>판매수량</th>
									<th>판매금액</th>
								</tr>
							</thead>

							<tr>
								<td>2020.06.17</td>
								<td>티라미슈</td>
								<td>2</td>
								<td>16,000</td>
							</tr>
							<tr>
								<td>2020.06.17</td>
								<td>티라미슈</td>
								<td>2</td>
								<td>16,000</td>
							</tr>
							<tr>
								<td>2020.06.17</td>
								<td>티라미슈</td>
								<td>2</td>
								<td>16,000</td>
							</tr>
						</table>
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



