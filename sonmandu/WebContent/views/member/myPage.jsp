<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>손만두</title>
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
	
    <link rel="stylesheet" type="text/css"
        href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">
    <!-- 주소 검색 daum api  -->
   <!--  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" type="text/css"
        href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">

    <style>
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
            /* background-color: salmon;
            color : white;
            width: 75;
            font-family:돋움; 
            background-color:#eff7f9;
            border: solid #A0DBE4; */
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

        
        /* top 버튼*/
        /* #myBtn {
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
        } */

        /* #myBtn:hover {
            background-color: #555;
        } */
        /* top 버튼*/
		
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
		
		#body{
		margin : auto;
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
        <!--여기다가 써-->
        <!-- div로 써서 display : inline-block 속성 사용-->
        <div id="main">

            <div id="sidenav">
                <h5>&emsp;&emsp;반갑습니다.<input type="text" id="nametext" maxlength="13" name="memId" value="<%= loginUser.getMemName() %>" aline="center" readonly>회원님</h5><br>
                <!-- <a href="#">내 정보</a>
                <a href="#">구매 내역</a>
                <a href="">문의게시판</a> -->
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
						<button id="goQuestions"
							onclick="goBoard();">문의게시판</button>
					</div>
				</div>
			</div>

            <div id="midmain">
                <!-- 회원 정보 관리-->
                <section>
                    <form class="form-personal" id="updateForm" name="updateForm" action="<%=request.getContextPath()%>/update.me" method="post" novalidate="novalidate">
                        <div class="title-style">
                            <p>회원 정보 관리</p>
                             <input type="hidden" maxlength="5" name="memId" value="<%= loginUser.getMemId() %>" >
                        </div>
                        <table class="table-style-head-left">
                            <tbody>
                                <tr>
                                    <th>이름</th>
                                    <td>
                                        <div class="input-text size-m">
                                            <input type="text" maxlength="5" name="memName" value="<%= loginUser.getMemName() %>" required readonly>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>비밀번호</th>
                                    <td>
                                        <input type="password" maxlength="15" name="memPwd" value="<%= loginUser.getMemPwd() %>" readonly>
                                        <button class="btn btn-m btn-white" id="pwdUpdateBtn" onclick="updatePwd();" type="button">변경하기</button>                                    
                                    </td>
                                </tr>
                                <tr>
                                <% String emails[] = loginUser.getEmail().split("@"); %>
                                    <th>이메일</th>
                                    <td data-email="root">
                                        <span id="new_email" data-email="origin-email"><%= loginUser.getEmail() %></span>
                                        <button data-email="change-email" id="showhide" class="btn btn-m btn-white" type="button">변경하기</button>
                                        <div data-email="new-email-block" id="newEmail" style="display:none">
                                            <p class="mt10">변경할 이메일 주소를 입력해주세요. (예.abcd@asbc.me)</p>
                                            <input type='text' value="<%= emails[0]%>" name="email1" style="width:130px" placeholder="이메일"> @
                                            <input type='text' value="<%= emails[1]%>" name="email_dns" style="width:130px" id="email_input2">
                                            <select name="emailaddr" style="width:130px" id="opEmail2">
                                                <option value="">직접입력</option>
                                                <option value="daum.net">daum.net</option>
                                                <option value="empal.com">empal.com</option>
                                                <option value="gmail.com">gmail.com</option>
                                                <option value="hanmail.net">hanmail.net</option>
                                                <option value="msn.com">msn.com</option>
                                                <option value="naver.com">naver.com</option>
                                                <option value="nate.com">nate.com</option>
                                            </select>
                                            <div class="mt5">
                                                <button class="btn btn-m btn-white" data-email="send-email"
                                                    type="button">인증메일 발송</button>
                                            </div>
                                        </div>
                                        <div data-email="send-email-msg" class="sent-email" style="display:none">
                                            <span data-email="insert-new-email" class="c-sub"></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>전화</th>
                                    <td>
                                        <input type="text" maxlength="11" name="memPhone" value="<%= loginUser.getMemPhone() %>" placeholder="(-없이)01012345678">
                                        <span id="cell-phone" data-autt="current-phone"></span>
                                        <!-- <button data-phone="change-phone" class="btn btn-m btn-white" type="button">변경하기</button> -->
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>
                                    <% 
                                    	String address = (loginUser.getAddress() != null) ? loginUser.getAddress() : "";
	
										String[] aArr = address.split("/");
										String add1 = aArr[0]; 
										String add2 = aArr[1];
										String add3 = aArr[2];
										String add4 = aArr[3];
									%>
                                        <input type="text" id="sample4_postcode" placeholder="우편번호"  name="add1" value="<%= add1 %>">
                                        <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
                                        <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="add2" value="<%= add2 %>">
                                        <input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="add3" value="<%= add3 %>">
                                        <span id="guide" style="color:#999"></span>
           								<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="add4" value="<%= add4 %>" > 
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="delete-form">
                            <!--<a hrfe="" class="btn btn-s btn-white">회원탈퇴</a> -->
                            <button type="button" id="delete" class="btn btn-m btn-white" onclick="deleteMember();">탈퇴하기</button>
                        </div>
                        <div class="form-submit" id="formsubmit">
                            <button type="submit" id="formbutton" class="btn-btn-m btn-point">회원 정보 수정하기</button>
                        </div>
                    </form>
				
                </section>

		</div>

    </div>
    </section>

    
    <footer>
        <%@include file="../common/footer.jsp"%>
    </footer>
 

    <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function sample4_execDaumPostcode() {
     
           new daum.Postcode(
                 {
                    oncomplete : function(data) {
                       // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                       // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                       // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                       var roadAddr = data.roadAddress; // 도로명 주소 변수
                       var extraRoadAddr = ''; // 참고 항목 변수

                       // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                       // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                       if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                          extraRoadAddr += data.bname;
                       }
                       // 건물명이 있고, 공동주택일 경우 추가한다.
                       if (data.buildingName !== '' && data.apartment === 'Y') {
                          extraRoadAddr += (extraRoadAddr !== '' ? ', '
                                + data.buildingName : data.buildingName);
                       }
                       // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                       if (extraRoadAddr !== '') {
                          extraRoadAddr = ' (' + extraRoadAddr + ')';
                       }

                       // 우편번호와 주소 정보를 해당 필드에 넣는다.
                       document.getElementById('sample4_postcode').value = data.zonecode;
                       document.getElementById("sample4_roadAddress").value = roadAddr;
                       document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                       // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                       if (roadAddr !== '') {
                          document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                       } else {
                          document.getElementById("sample4_extraAddress").value = '';
                       }

                       var guideTextBox = document.getElementById("guide");
                       // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                       if (data.autoRoadAddress) {
                          var expRoadAddr = data.autoRoadAddress
                                + extraRoadAddr;
                          guideTextBox.innerHTML = '(예상 도로명 주소 : '
                                + expRoadAddr + ')';
                          guideTextBox.style.display = 'block';

                       } else if (data.autoJibunAddress) {
                          var expJibunAddr = data.autoJibunAddress;
                          guideTextBox.innerHTML = '(예상 지번 주소 : '
                                + expJibunAddr + ')';
                          guideTextBox.style.display = 'block';
                       } else {
                          guideTextBox.innerHTML = '';
                          guideTextBox.style.display = 'none';
                       }
                       console.log(roadAddr);
                       console.log(extraRoadAddr);
                       console.log(guideTextBox);
                       
                    }
                 }).open();
        }

        // email 수정 click 속성
        $("#showhide").click(function () {
            console.log(document.getElementById("newEmail").style.display);
            if (document.getElementById("newEmail").style.display == 'block') {
                document.getElementById("newEmail").style.display = 'none';
            } else {
                document.getElementById("newEmail").style.display = 'block';
            }
        });

    </script>

    <script>
       /*  mybutton = document.getElementById("myBtn");
        window.onscroll = function () { scrollFunction() };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                mybutton.style.display = "block";
            } else {
                mybutton.style.display = "none";
            }
        } */

        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }
        
        // 1. 비밀번호 변경 = 새창 띄우기
        function updatePwd(){
      	  window.open("pwdUpdateForm.jsp", "비밀번호 변경창", "width=600, height=430");
        }
        
        // 2. 회원 탈퇴
        function deleteMember(){
      	  var bool = confirm("정말로 탈퇴하시겠습니까?");
      	  
    	  if(bool){
    		  // updateForm 속성 변경
    		  $("#updateForm").attr("action", "<%= request.getContextPath() %>/delete.me");
    		  // 속성 변경 후 submit() 실행
    		   $("#updateForm").submit();
    	  }
        }
        
        function goBoard(){
			location.href = "<%= contextPath %>/list.bo";
		}
      	  
        $("#opEmail2").click(function(){ email_input2
        	var emailVal2 = $("#opEmail2 option:selected").val();
        	
        	document.getElementById("email_input2").value = emailVal2;
        	console.log(emailVal2);
        });
    </script>
	<!-- <button onclick="topFunction()" id="myBtn" title="Go to top">top</button> -->
		
</body>

</html>