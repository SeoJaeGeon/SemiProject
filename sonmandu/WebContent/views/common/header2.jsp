<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<style>
input:-ms-input-placeholder {
	color: #a8a8a8;
}

input:-webkit-input-placeholder {
	color: #a8a8a8;
}

input:-moz-placeholder {
	color: #a8a8a8;
}

#search-form {
	height: 60px;
	width: 400px;
	border: 3px solid red;
	background: #ffffff;
	margin:auto;
	margin-top: 40px;
}

#search_Text {
	font-size: 18px;
	width: 325px;
	padding: 12px;
	border: 0px;
	outline: none;
	float: left;
	font-family: 'NanumBarunGothic', sans-serif;
}

#search_Btn {
	width: 65px;
	height: 100%;
	border: 0px;
	font-size: 20px;
	background: red;
	outline: none;
	float: right;
	color: #ffffff;
	font-family: 'NanumBarunGothic', sans-serif;
}
</style>
</head>
<body>
	<div id="search-form">
		<input type="text" id="search_Text" name="search_Text"
			placeholder="검색어 입력 (상품명,작가명)">
		<button type="button" id="search_Btn" name="search_Btn" onclick="search();">검색</button>
	</form>
	<script>
		function search(){
			var content = $("#search_Text").val();
			if(content != ""){
				location.href="<%=request.getContextPath()%>/search.pro?content="+content;				
			}
			
		}
	</script>
</body>
</html>