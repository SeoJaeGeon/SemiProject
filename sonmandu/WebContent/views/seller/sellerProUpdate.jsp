
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>손만두상품등록</title>
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
	href="https://cdn.jsdelivr.net/gh/moonspam/Nanu
	mBarunGothic@1.0/nanumbarungothicsubset.css">

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
	display: inline-block;
}

#midmain-1 {
	width: 250px;
	height: 250px;
	border: 1px solid rgb(255, 255, 255);
	float: left;
	margin-left: 20px;
	text-align: center;
}

.btn {
	border-color: rgb(41, 44, 240);
	color: rgb(41, 44, 240);
	background-color:  #c4f1fd;
}

.btn:hover {
border-color: rgb(41, 44, 240);
background-color: rgb(255, 255, 255);
}

/*================================================*/
#new1, #new2 {
	width: 100%;
	height: 100%;
	float: left;
	padding-bottom: 10px;
}
/*================================================*/
.uploadBtn {
	margin-top: 450px;
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
table{
	width : 80%;
	float: left;
}
td {
	padding:1%;
	
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
				<h5>상품등록</h5>
				
			<form id = "proForm" name= "proForm" action="<%= request.getContextPath() %>/insert.product" method="post" enctype="multipart/form-data">
			<table>
			<tr>
			<td colspan="3">
				<label>종류 선택 : </label>
				<select name="categoryKey" id="categoryKey">
				
					<option selected value="0">카테고리</option>
					<option value="C1" >악세서리</option>
					<option value="C2">공예품</option>
					<option value="C3">베이커리</option>
					<option value="C4">에어팟케이스</option>
					<option value="C5">기타</option>
				</select>
			</td>
			</tr>
			<tr>
			<td colspan="2">
				<label>상품명:</label>
				<input type="text" name="prouctName" size="30" >
			</td>
			
			</tr>
			<tr>
			<td>
				<label>가격:</label>
				<input type="number" min="0" name="price" size="2" > 
			</td>
			<td>
				<label>배송비:</label>
				<input type="number" min="0" name="charge" size="2" >
			</td>
			<td>
				<label>재고:</label>
				<input type="number" min="0" name="stock" size="2" >
			</td>
			<td>
				<label>제작기간:</label>
				<input type="number" min="0" name="productTime" size="2" >일
			</td>
			</tr>
			</table>
				<div id="midmain-1">
					<p>--메인페이지 사진--</p>
					<img id="new1" >
                    <button type="button" class="btn" id="contentImg1" >사진첨부  </button>    
				</div>
				
				<div id="midmain-1">
					<p>--상품설명 사진--</p>
					<img id="new2" >
                    <button type="button" class="btn" id="contentImg2">사진첨부  </button>
                                        
				</div>
				
				<div id="fileArea" hidden>
					<input type="file" id="Img1" name="Img1" onchange="loadImg(this,1)" >
					<input type="file" id="Img2" name="Img2" onchange="loadImg(this,2)">
				</div>
				
				<button class="btn uploadBtn" id="submit" type="submit">상품 등록 하기</button>


				<script>
				
				$("#contentImg1").click(function(){
					$("#Img1").click();
				});
				
				$("#contentImg2").click(function(){
					$("#Img2").click();
				});
				
						// input type="file" 태그에 이미지 파일이 첨부 되었을 때
		// div에 미리보기 표현하기
		function loadImg(value, num){
			// value => this : input type="file"
			// num => 각 번호에 맞춰 위의 미리보기 img에 적용 시킬 숫자
			
			// file이 존재한다면
			if(value.files && value.files[0]){
				// 파일을 읽어들일 수 있는 FileReader 객체 생성
				var reader = new FileReader();
				
				// 파일 읽기가 다 완료 되었을 때 실행 되는 메소드
				reader.onload = function(e){
					switch(num){
					case 1:
						$("#new1").attr("src", e.target.result);
						break;
					case 2:
						$("#new2").attr("src", e.target.result);
						break;
					}
				}
				
				// 파일 읽기 하는 메소드
				reader.readAsDataURL(value.files[0]);
			}
		}
						
				</script>

				 

				 
				 </form>
				 		 
			</div>
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



