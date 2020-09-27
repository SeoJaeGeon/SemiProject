<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>	

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">

<style>
#sidenav {
	width: 20%;
	height: 600px;
	padding-top: 20px;
	border: 1px solid rgb(255, 255, 255);
	background-color: #daeff5;
	float: left;
	text-align: center;
}

#sidenav-1 {
	width: 20%;
	height: 600px;
	padding-top: 20px;
	border: 1px solid rgb(5, 5, 5);
	background-color: #daeff5;
	float: left;
}

#sidenav a {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 15px;
	color: #000000;
	display: block;

}

#sidenav a:hover {
	color: rgb(41, 44, 240);
}

.side {
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
</style>
</head>
<body>
	<img id="sellpng" src="<%= request.getContextPath()  %>/resources/images/duck.png">
	<br>
	<h5> <%= ((Member)session.getAttribute("loginUser")).getMemName() %> </h5><br>
        
       	<button id="sidebtn" onclick="location.href='<%= request.getContextPath() %>/main.sell'">메인페이지</button><br><br>
        <button id="sidebtn" onclick="location.href='<%= request.getContextPath() %>/views/seller/sellerProUpdate.jsp'">상품등록</button><br><br>
        <button id="sidebtn" onclick="location.href='<%= request.getContextPath() %>/views/seller/sellerUpdate.jsp'">판매자정보수정</button><br><br>
<%--    <button id="sidebtn" onclick="location.href='<%= request.getContextPath() %>/views/seller/sellerAllPro.jsp'">이달의 수익금</button> <br> --%>
        <button id="sidebtn" onclick="location.href='<%= request.getContextPath() %>/home.sell'">작가 홈 페이지</button> <br><br>
        

</body>
</html>