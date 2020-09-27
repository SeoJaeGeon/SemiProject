<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#body2 {
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
        /*================================================*/
    #hone {
            font-size: 25px;
            position: relative;
            top : 10px;
            text-align: center;
            color: rgb(66, 66, 66);
            font-weight: blod;
        }
        
       #hone1 {
       		font-size: 20px;
            position: relative;
            top : 10px;
            text-align: center;
            color: rgb(66, 66, 66);
            font-weight: lighter;
       }
        
   	section.back{
         width: 80%;
         position: relative;
         left: 10%;
        }
        
    .back-div {
        width: 100%;
        margin-bottom: 25px;
        }
        
    #trstyle {
        height: 50px;
        border-bottom: 1px solid #eee;
        text-align: center;
        margin:auto;
        }
        
	.outer{
		width:100%;
		height:700px;
		background:white;
		color:black;
		margin:auto;
		margin-top:50px;
	}
	table {
		border:1px solid white;
		margin:auto;
	}

	.tableArea {
		width:1500px;
		height:600px;
		margin:auto;
	}
	button {
		height:22px;
		width:80px;
		background:gray;
		border:gray;
		color:white;
		border-radius:5px;
	}
	
	button:hover{
		cursor:pointer;
	}
	
	#submit {
		height:22px;
		width:80px;
		background:gray;
		border:gray;
		color:white;
		border-radius:5px;
	}
</style>
</head>
<body id="body2">
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
		<br>
		
		 <div class="back-div top">
            <h1 id= "hone">문의사항</h1>
        </div>
	
		<h3 id="hone1" align="center">문의게시판</h2>
		
		<div class="tableArea">
			<form action="<%= request.getContextPath() %>/insert.bo" method="post">
				<table id="table">
					<tr id="trstyle">
						<td>제목</td>
						<td colspan="3"><input type="text" size="75" name="bTitle"></td>
					</tr>	
					<tr id="trstyle">
						<td>내용</td>
						<td colspan="3">
							<textarea rows="15" cols="80" name="bContent" style="resize:none;"></textarea>
						</td>
					</tr>
				</table>
				<br>
				<div align="center">
					<button type="button" onclick="javascript:history.back();">취소하기</button>
					<button id="submit" type="submit">등록하기</button>
				</div>
			</form>
		</div>
	</div>
	
	<footer>
        <%@include file="../common/footer.jsp"%>
    </footer>
</body>
</html>