<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.model.vo.*, java.util.ArrayList"%>
<%
	Board b = (Board)request.getAttribute("board");

	String[] bWriter = b.getbWriter().split(",");
	
	int memNum = Integer.parseInt(bWriter[0]);
	b.setbWriter(bWriter[1]);

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#body {
		margin : auto;
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

        #logo {
            width: 100%;
            height: 100%;
            border: #000000;
        }

		
	
      /*------------------------------------------*/  
        #hone1 {
       		font-size: 30px;
            position: relative;
            top : 10px;
            text-align: center;
            color: rgb(66, 66, 66);
            font-weight: lighter;
       }

	.outer{
		width:800px;
		height:500px;
		background:white;
		color:black;
		margin:auto;
		margin-top:50px;
	}
	
	td {
		border:1px solid black;
	}

	.tableArea {
		border:1px solid white;
		width:700px;
		height:400px;
		margin:auto;
	}
	#content {
		height:230px;
	}
	button {
		height:25px;
		width:80px;
		background:gray;
		border:gray;
		color:white;
		border-radius:5px;
	}
	
	button:hover{
		cursor:pointer;
	}
	
	#updateBtn, #deleteBtn {
		height:25px;
		width:80px;
		background:gray;
		border:gray;
		color:white;
		border-radius:5px;
	}
	/* ------------------------------------- */
	
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
		<!---------------------------------------------------------------------------------------------->
	
	<div class="outer">
		<h2 id="hone1" align="center">문의사항 작성</h2>
		<br>
		<div class="tableArea">
			
				<table align="center" width="100%">
					<tr>
						<td colspan="3">조회수 :<span><%= b.getbCount() %></span> </td>
						<td colspan="3">작성일 :  <span><%= b.getModifyDate() %></span></td>
					</tr>
					<tr>
						<td colspan="4">제목 : <span><%= b.getbTitle() %></span></td>
						<td colspan="2">작성자 <span><%= b.getbWriter() %></span></td>
					</tr>
					<tr>
						<td colspan="6">내용</td>
					</tr>
					<tr>
						<td colspan="6"><p id="content"><%= (b.getbContent()).replace("\n","<br>") %></p></td>
					</tr>
				</table>
				
				<div align="center">
					<button type="button" onclick="returnToList();">목록으로</button>
					<% if(memNum == loginUser.getMemNum()) {%>
					<button id="deleteBtn" type="button" onclick="deleteBoard();">삭제</button>
					<% } %>
				</div>
		</div>
	</div>
	
	<!-- 수정/삭제를 위해 보이지 않는 form 태그를 만듦 -->
	<form action="" id="detailForm" method="post">
		<input type="hidden" name="bId" value="<%= b.getbId() %>">
	</form>
	
	<script>
		function returnToList(){
			location.href = "<%= contextPath %>/list.bo";
		}
		
		function deleteBoard(){
			$("#detailForm").attr("action", "<%= contextPath %>/delete.bo");
			$("#detailForm").submit();
		}
	</script>
	
	
	<footer>
        <%@include file="../common/footer.jsp"%>
    </footer>
</body>
</html>