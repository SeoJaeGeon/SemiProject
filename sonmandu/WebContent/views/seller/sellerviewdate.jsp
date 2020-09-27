<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, member.model.vo.Member, seller.model.vo.* "%>
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>손만두</title>
<!-- jquery 라이브러리 추가 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>손만두</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
        integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css"
        href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">
    <!-- 주소 검색 daum api  -->
   <!--  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
#midmain{
    width: 80%;      
    padding-top: 20px; 
    padding-left: 15px;
    border: 1px solid rgb(255, 255, 255);  
    display : inline-block;  
} 
#midmain-1{   
    width: 30%; 
    padding-left: 15px;
    border: 1px solid rgb(255, 255, 255);  

}
.btn {
            border-color:  rgb(41, 44, 240);
            color: rgb(41, 44, 240);
        }

.btn:hover {
            background: #86baf5;
            color:  rgb(0, 0, 0);
        }


/*================================================*/
       table {
            margin-left: 20px;
            border-bottom: 1px solid hsl(0, 6%, 75%);
            border-top: 1px solid hsl(0, 6%, 75%);
            border-collapse: collapse;
        }

        table th {
            width: 100px;
            height: 80px;
            font-family: 'NanumBarunGothic', sans-serif;
            background: #eeeeee;
            color: #666666;
            padding-left: 10px;
            border-bottom: 1px solid hsl(0, 6%, 75%);

        }

        table tr:nth-child(4) {
            height: 100px;
        }

        table tr {
            border-bottom: 1px solid hsl(0, 6%, 75%);
        }

        table td {
            padding-left: 10px;
            width: 700px;

        }

        .title-style>p {
            padding-left: 12px;
            font-weight: bold;

        }

        #sample4_roadAddress {
            margin-top: 10px;
        }

        #formbutton {
            color: #ffffff;
            font: 12px "Nanum Barun Gothic", sans-serif;
            padding: 8px 13px;
            background: #E95753;
            margin: auto;
            display: inline-block;
        }

        #formsubmit {
            width: 80%;
            height: 50px;
        }

        #formbutton {
            margin: center;
            display: block;

        }

        .delete-form {
            width: 850px;
            height: 50px;
        }

        #delete {
            width: 100px;
            height: 40px;
            float: right;
        }
/*================================================*/
.uploadBtn {
	margin-top: 300px;
	margin-left: 50px;
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

	button {
		height:22px;
		width:100px;
		background:yellowgreen;
		border:yellowgreen;
		color:white;
		border-radius:5px;
	}
	button:hover{
		cursor:pointer;
	}

.uploadBtn {
	margin-top: 300px;
	margin-left: 50px;
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

	button {
		height:22px;
		width:100px;
		background:yellowgreen;
		border:yellowgreen;
		color:white;
		border-radius:5px;
	}
	button:hover{
		cursor:pointer;
	}

/* top 버튼*/
#img1, #img2, #img3 {
	width: 100%;
	height: 500px;
}
</style>
</head>

<body>

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
				<img id="sellpng"
					src="<%= request.getContextPath()  %>/resources/images/duck.png"><br>
					
				<div id="userInfo">
					<label><h5><%= loginUser.getMemName() %>작가님</label></h5><br>
						
       <button id="sidebtn" onclick="location.href='<%= request.getContextPath() %>/home.serll'">작품 소개</button><br><br>
        <button id="sidebtn" onclick="location.href='<%= request.getContextPath() %>/view.sell'">작가 소개</button><br><br>
       <button id="sidebtn" onclick="location.href='<%= loginUser %>/'">다른 사이트 이동</button><br>
					
				</div>
			</div>			

			<div id="midmain">
				<h5>작가 소개</h5>
	                <section>

                    <form class="form-personal" id="updateForm" name="updateForm" action="<%=request.getContextPath()%>/update.me" method="post" novalidate="novalidate">

                        <table class="table-style-head-left">
                            <tbody>
								<tr>
									<th>이름</th>
									<td>
										<div class="input-text size-m">
											<input name="memName"
												value="<%=loginUser.getMemName()%>" required readonly>
										</div>
									</td>
								</tr>

								
								<tr>
                                <%
                                	String emails[] = loginUser.getEmail().split("@");
                                %>
                                    <th>이메일</th>
                                    <td data-email="root">
                                        <span id="new_email" data-email="origin-email"><%= loginUser.getEmail() %></span>

                                        <div data-email="new-email-block" id="newEmail" style="display:none">

                                            <input type='text' value="<%= emails[0]%>" name="email1" style="width:130px" placeholder="이메일" required readonly> @
                                            <input type='text' value="<%= emails[1]%>" name="email_dns" style="width:130px">


                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>전화</th>
                                    <td>
                                        <input type="text" maxlength="11" name="memPhone" value="<%= loginUser.getMemPhone() %>" required readonly>
                                        <span id="cell-phone" data-autt="current-phone"></span>
                                        <!-- <button data-phone="change-phone" class="btn btn-m btn-white" type="button">변경하기</button> -->
                                    </td>
                                </tr>


                            </tbody>
                        </table>
                    </form>
				
                </section>

		</div>

    </div>
    </section>

    
    <footer>
        <%@include file="../common/footer.jsp"%>
    </footer>
 
	<button onclick="topFunction()" id="myBtn" title="Go to top">top</button>

	
	<!-- <button onclick="topFunction()" id="myBtn" title="Go to top">top</button> -->
		


</body>

</html>



