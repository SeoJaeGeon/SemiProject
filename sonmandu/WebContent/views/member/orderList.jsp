<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, product.model.vo.*"%>
<%
	ArrayList<Order> oList = (ArrayList<Order>)request.getAttribute("oList");



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#body{
		margin: auto;
	} 
 header,
        nav,
        section,
        article,
        aside,
        footer {
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
            height: 170px;
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
            position: relative;
        }

        /*================================================*/
        #header-3>a {
            margin: 15px;
            text-decoration: none;
            font-weight: 600;
            line-height: 25px;
            color: black;
        }

        #header-3>a:hover {
            color: rgb(41, 44, 240);
        }

        #header-3>a:first-child {
            margin-left: 30px;
        }

        /*================================================*/

        #search-text-area {
            height: 100%;
            width: 80%;
            float: left;
        }

        #search-btn-area {
            height: 100%;
            width: 20%;
            float: left;
        }

        #search-input {
            width: 100%;
            height: 100%;
            box-sizing: border-box;
        }

        #search-btn {
            width: 100%;
            height: 100%;
            box-sizing: border-box;
        } 

        /*================================================*/
        #navi {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        #navi>li {
            float: left;
            width: 20%;
        }

        #navi li a {
            display: block;
            text-decoration: none;
            text-align: center;
            color: black;
            font-weight: bold;
            font-size: 20px;
            line-height: 40px;
        }

        #navi li a:hover {
            color: rgb(41, 44, 240);
        }

        /*================================================*/
        
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

        /*================================================*/
        #midmain {
            width: 80%;
            padding-top: 20px;
            padding-left: 15px;
            border: 1px solid rgb(255, 255, 255);
            float: left;
        }


        /*================================================*/
        /* #footer1 {
            width: 100%;
            height: 35px;
            padding: 1px;
            text-align: center;

        }

        #footer2 {
            width: 100%;
            height: 70px;
            text-align: center;
        } */

        #footer1>a {
            text-decoration: none;
            font-weight: 600;
            line-height: 25px;
            color: black;
            margin: 0 10px;

        }

        #footer1>a:hover {
            color: deepskyblue;

        }

        #footer2>p {
            margin: 0;
            font-size: 12px;
        }

        #footer2>p:first-child {
            height: 90%;

        }

        #footer2>p:last-child {
            height: 20%;
        }

        /*================================================*/
        #logo {
            width: 100%;
            height: 100%;
            border: #000000;
        }
        #nametext {
			border: none;
			outline: none;
			background : none;
			width : 65px;
		}
        
        #goMyPage, #goOrderlist, #goQuestions {
		color: black;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 80%;
		margin-left : 28px;
   		box-sizing: border-box;
   		background-color: #ffffff;
   		border-radius: 15px;
		}
        /*================================================*/
        
          #ordertitle {
            font-size: 30px;
            position: relative;
            top : 10px;
            text-align: center;
            color: rgb(66, 66, 66);
            font-weight: lighter;
            /* float: left;  */
            margin-left : 10px;
        }
        
        #orderlist {
        	margin-left : 30px;
        }
        
        #orderlist *:first-childe{
        	margin-left : 50px;
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
	<!------------------------------------------------->
	<section id="content">
		<div id="main">
			<div id="sidenav">
				<h5>
					&emsp;&emsp;반갑습니다.<input type="text" id="nametext" maxlength="13"
						name="memId" value="<%=loginUser.getMemName()%>" aline="center"
						readonly>회원님
				</h5>
				<br>
				<div id="sidemenu">
					<div class="myPage" type="button">
						<button id="goMyPage"
							onclick="location.href='<%=request.getContextPath()%>/views/member/myPage.jsp'">마이페이지</button>
					</div>
					<div class="orderlist" type="button">
						<button id="goOrderlist"
							onclick="location.href='<%=request.getContextPath()%>/OrderList.me'">구매내역</button>
					</div>
					<div class="Questions" type="button">
						<button id="goQuestions" onclick="goBoard();">문의게시판</button>
					</div>
				</div>	
			</div>
			<div class="frist-div top">
			<br>
				<h1 id="ordertitle">주문내역</h1>
				<hr size="10px">
				<div class="frist-div bottom">
					<table id="list">
						<colgroup>
							<col width="15%">
							<col width="30%">
							<col width="15%">
							<col width="5%">
							<col width="35%">
						</colgroup>
						<thead>
							<tr id="orderlist">
								<th width="100">주문일자</th>
								<th width="100">상품</th>
								<th width="100">상품명</th>
								<th width="100">수량</th>
								<th width="100">총 금액</th>
							</tr>
						</thead>
						<% if(oList.isEmpty()) { %>
						<tr>
							<td colspan="5"> 주문하신 내역이 없습니다.</td>
						</tr>
						<% } else { %>
						<% for(Order o : oList) { %>
						<tbody>
							<tr class="orderbody">
								<td class="td1"><%= o.getPay_date()  %></td>
								<td class="td2"><img src="<%= contextPath %>/resources/productImg/<%= o.getChange_name() %>" height="200px" width="200px"></td>
								<td class="td1"><%= o.getProduct_name()  %></td>
								<td class="td1"><%= o.getOrder_quantity() %></td>
								<td class="td1"><%= o.getTotal_sal() %></td>
							</tr>
						</tbody>
						<% } %>
					<% } %>
					</table>
				</div>
			</div>
		</div>
	</section>
	
	<script>
	  function goBoard(){
			location.href = "<%= contextPath %>/list.bo";
		}
    	  
	</script>
</body>
</html>