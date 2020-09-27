<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");

	String msg = (String)session.getAttribute("msg");

	String contextPath = request.getContextPath();
%>

<!-- 네이버 로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
	 <!-- 주소 검색 daum api  -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	// session 영역에 msg가 있다면 msg alert로 출력
	var msg = '<%= msg %>';
	$(function(){
		if(msg != 'null'){
			alert(msg);
			<% session.removeAttribute("msg"); %>
		} 
	});
</script>

<style>
* {
	font-family: 'NanumBarunGothic', sans-serif;
}

#modalWrap {
	width: 1300px !important;
	height: 450px !important;
	margin: auto !important;
}

#modalWrap1 {
   width: 1500px;
/* height : 1000px;*/   
	margin: auto;
}

.login {
	text-decoration: none;
	font-weight: 600;
	line-height: 25px;
	color: black;
}

.login:hover {
	color: red;
}

#header-3mini1 {
	width: 90%;
	height: 50%;
	padding-left : 50px;
}

#header-3mini2 {
	/* width: 100%; */
	height: 50%;
	padding : 5px;
	position: relative;
}

#header-3mini1>a {
	padding: 10px 18px 15px;
}

.login {
	text-decoration: none;
	font-weight: 600;
	line-height: 25px;
	text-align: center;
	color: black;
}

.login:hover {
	text-decoration: none;
	color: red;
}

.profile_links1 {
	width: 80px;
	height: 68px;
	position: absolute;
	bottom: 0;
	left: 0;
}

.profile_links1>* {
	display: inline-block;
	width: 100%;
	height: 100%;
	margin-left: 2px;
}

.profile_links2 {
	width: 75px;
	height: 70px;
	position: absolute;
	bottom: 0;
	right: 0;
}

.profile_links2>* {
	display: inline-block;
	width: 100%;
	height: 100%;
	margin-left: 2px;
}

.modal-content {
	border: 3px solid #f1f1f1;
	height: auto;
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
	height: 100%;
}

/* 입력 창 스타일 */
#uname, #psw {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* 입력 창 스타일 */
.uname, .psw {
   width: 100%;
   padding: 12px 20px;
   margin: 8px 0;
   display: inline-block;
   border: 1px solid #ccc;
   box-sizing: border-box;
}


/* 로고 사진 설정 */
form>div>img {
	width: 200px;
	height: 100px;
}

.logo {
	width: 100%;
   height: 80px;
}

/*버튼 스타일 */
.form-button {
	/* background-color: red; */
	color: black;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

.containerlogin, .containerJoin {
	padding: 16px;
}
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: /* auto; */ scroll !important; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* (x) 닫기 버튼 */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* 로그인 화면 켜질 때 애니매니션 */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}
}

#logoutBtn{
	margin-left: 100px;
}

.loginOption{
	background-color: white;
    outline: none;
    border: none;
    margin-top : 30px;
}

.insertOption{
	background-color: white;
    outline: none;
    border: none;
}

 #basketimg {
	background-color: white;
    outline: none;
    border: none;
    /* width : 100px; */
   /*  margin-right : 30px; */
}

#myPage {
	background-color: white;
    outline: none;
    border: none;
    width : 110px; 
   /*  margin-right : 30px; */
}

.logoutBtn{
	background-color: white;
    outline: none;
    border: none;
    margin-left:35px;
    margin-top : 30px;
}

/* .modal-backdrop{
	position : none !important;
} */

// Modal background
.modal-backdrop {
  position: fixed !important; 
  top: 0;
  left: 0;
  z-index: $zindex-modal-backdrop;
  width: 100vw;
  height: 100vh;
  background-color: $modal-backdrop-bg;

  // Fade for backdrop
  &.fade { opacity: 0; }
  &.show { opacity: $modal-backdrop-opacity; }
}

</style>
</head>
<body>
	<div class="modal-backdrop" hidden id="hid"></div>
	<%
		if (loginUser == null) {
	%>
	<div id="header-3mini1">
		<button class="login loginOption" onclick="document.getElementById('id01').style.display='block'"
			style="width: auto;">로그인</button>
		<!-- <button type="button" class="modal-btn" data-toggle="modal" data-target="#id01"></button> -->
		<!-- 로그인 -->
		<div id="id01" class="modal">
			<div id="modalWrap">
				<form class="modal-content animate"
					action="<%=request.getContextPath()%>/login.me" method="post">
					<div class="imgcontainer">
						<span
							onclick="document.getElementById('id01').style.display='none'"
							class="close" title="Close Modal">&times;</span> <img
							src="<%=request.getContextPath()%>/resources/images/logo.jpg">
						<!-- <h1>로고</h1> -->
					</div>

					<div class="containerlogin">
						<!-- <label for="uname"><b>아이디</b></label> -->
						<input type="text" placeholder="ID" id="uname" name="memId"
							required>

						<!-- <label for="psw"><b>비밀번호</b></label> -->
						<input type="password" placeholder="Password" id="psw"
							name="memPwd" required>

						<button onclick="loginCheck();" class="form-button" type="submit">Login</button>
						
						<!-- <div id="naverIdLogin"></div> -->
						<br>
						
						<label> <input type="checkbox" id="store">아이디 저장
						</label> <label> <input type="checkbox" checked="checked"
							name="remember">로그인유지
						</label>
					</div>

					<div class="containerlogin" style="background-color: #f1f1f1">
						<a href="#">비밀번호 찾기</a> &nbsp; <a href="#">회원가입</a>
					</div>

				</form>
			</div>
		</div>
		
		<!-- 회원 가입 -->
       <button class="login insertOption" onclick="document.getElementById('id02').style.display='block'" style="width:auto;">회원 가입</button>
    <!-- <button type="button" class="modal-btn" data-toggle="modal" data-target="#id01"></button> -->

    <div id="id02" class="modal">
		 <div class="modalWrap1" style="overflow:auto">
        <form class="modal-content animate" id="joinForm" name="joinForm" action="<%=request.getContextPath()%>/insert.me" method="post" onsubmit="return joinValidate();">

            <span onclick="document.getElementById('id02').style.display='none'" class="close"
                title="Close Modal">&times;</span> <br>
            <h2 align="center">회원가입</h2>
           <!--  <img src="/resources/images/logo.jpg"> -->
           <img src="<%=request.getContextPath()%>/resources/images/logo.jpg" class="logo"> 
           
            <div class="containerJoin">

                <input type="text" maxlength="5" class="uname" name="memName" placeholder="이름">

                <!-- <th>아이디</th> -->

                <input type="text" maxlength="13" class="uname" name="memId" placeholder="아이디">
               <!--  <a href='#' style='cursor:help; float: right;'> ID 중복 검사</a> -->
                <button id="idCheck" class="uname" type="button" style='cursor:help; float: right;'>중복확인</button>

                <!-- <th>비밀번호</th> -->
                <input type="password" class="psw" name="memPwd" placeholder="비밀번호 (영문/숫자포함 6자 이상)">

                <!-- <th>비밀번호 확인</th> -->
                <input type="password" class="psw" name="memPwd2" placeholder="비밀번호 확인">
				<label id="pwdResult"></label>
				<br>
				
                <!--  <th>이메일</th> -->

                <input type='text' class="uname" name="email1" style="width:130px" placeholder="이메일"> @
                <input type='text' class="uname" name="email_dns" style="width:130px" id="eamil_input">
                <select name="emailaddr" class="uname" style="width:130px" id="opEmail">
                    <option value="">직접입력</option>
                    <option value="daum.net">daum.net</option>
                    <option value="empal.com">empal.com</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="hanmail.net">hanmail.net</option>
                    <option value="naver.com">naver.com</option>
                    <option value="nate.com">nate.com</option>
                </select>
                <br>
                <!--<th>핸드폰 번호</th>-->
                <input type="text"  maxlength="11" class="uname" name="memPhone" placeholder="휴대전화">
                
                <th>주소</th>
                <input type="text" class="uname" id="sample4_postcode" placeholder="우편번호" name="add1">
                <input type="button" class="uname" onclick="sample4_execDaumPostcode2()" value="우편번호 찾기" ><br>
                <input type="text" class="uname" id="sample4_roadAddress" placeholder="도로명주소" name="add2">
                <input type="text" class="uname" id="sample4_jibunAddress" placeholder="지번주소" name="add3">
                <span id="guide" style="color:#999"></span>
           		<input type="text" class="uname" id="sample4_detailAddress" placeholder="상세주소" name="add4">
				
                <div align="center">
                    <!-- <input type="submit" value="회원가입"> -->
                    <button id="joinBtn" disabled>가입하기</button>
                    <input type="reset" value="취소">
                </div>
            </div>
        </form>
        </div>
    </div>
   </div>
	<div id="header-3mini2">
		<div class="profile_links2" type="button">
			<button id="basketimg" onclick="basketSelectBtn();">장바구니</button>
		</div>
	</div>
	
	<%} else if(loginUser.getDivision().equals("M2")) { %>
		<div id="header-3mini1">
		<button type="button" class="logoutBtn" onclick="location.href = '<%= request.getContextPath() %>/logout.me'">로그아웃</button>
	</div>
	
	<div id="header-3mini2">
		<div class="profile_links1" type="button">
			<%-- <a href="<%=request.getContextPath()%>">  --%>
			<button id="myPage" onclick="location.href='<%= request.getContextPath() %>/main.sell'">판매자 페이지</button>
		</div>
		<div class="profile_links2" type="button">
			<%-- <button id="basketimg" onclick="location.href='<%= request.getContextPath() %>/views/member/basketimg.jsp'">장바구니</button> --%>
			<button id="basketimg" onclick="basketSelectBtn();">장바구니</button>
		</div>
	</div>
	<%
		} else if(loginUser.getDivision().equals("M1")) {
	%>
	<div id="header-3mini1">
		<button type="button" class="logoutBtn"
		onclick="location.href = '<%= request.getContextPath() %>/logout.me'">로그아웃</button>
	</div>
	<div id="header-3mini2">
		<div class="profile_links1" type="button">
			<button id="myPage" onclick="location.href='<%= request.getContextPath() %>/views/member/myPage.jsp'">마이페이지</button>
		</div>			
		<div class="profile_links2" type="button">
			<%-- <button id="basketimg" onclick="location.href='<%= request.getContextPath() %>/views/member/basketimg.jsp'">장바구니</button> --%>
			<button id="basketimg" onclick="basketSelectBtn();">장바구니</button>
		</div>
	</div>
	<%
		}
	%>
	
	<script>
	function validate(){
		if($("#memId").val().trim().length == 0){
			alert("아이디를 입력하세요");
			$("#memId").focus();
			return false;
		}
		
		if($("memPwd").val().trim().length == 0){
			alert("비밀번호를 입력하세요");
			$("#memPwd").focus();
			return false;
		}
		
		return true;
	}
	function joinValidate(){
		
		// 아이디 유효성 검사
		if(!/^[a-z][a-z\d]{3,11}$/.test($("#joinForm input[name=memId]").val())){
			alert("아이디는 영소문자로 시작해서 4~12자 입력(숫자 포함 가능)");
			$("#joinForm input[name=memId]").select();
			
			return false;
		}
		// 비밀번호 일치 여부
		if($("#joinForm input[name=memPwd]").val() != $("#joinForm input[name=memPwd2]").val()){
			$("#pwdResult").text("비밀번호 불일치").css("color", "red");
			return false;
		}
		// 이름 유효성 검사
		if(!/^[가-힣]{2,}$/.test($("#joinForm input[name=memName]").val())){
			alert("이름은 한글로 2글자 이상 입력");
			$("#joinForm input[name=memName]").select();
			return false;
		}
		
		return true;
	}
	

	$(function(){
		var isUsable = false;
		
		$("#idCheck").click(function(){
			var memId = $("#joinForm input[name='memId']");
			
			if(!memId || memId.val().length < 4){
				alert('아이디는 최소 4자리 이상이어야 합니다.');
				memId.focus();
			}else{
				$.ajax({
					url : "<%= contextPath %>/idCheck.me",
					type : "post",
					data : {memId:memId.val()},
					success : function(data){
						console.log(data);
						
						if(data == "fail"){
							alert("사용할 수 없는 아이디입니다.");
							memId.focus();
						}else{
							if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")){
								memId.prop('readonly', true);
								isUsable = true;
							}else{
								memId.focus();
							}
						}
						
						if(isUsable){
							$("#joinBtn").removeAttr("disabled");
						}
						
						
					},
					error : function(){
						console.log("서버 통신 안됨");
					}
				});
			}
		});
		
	});
	
	  function basketSelectBtn(){
		   <% if(loginUser != null) {%>
		   		location.href = "<%= request.getContextPath() %>/selectList.bas";
		   <% } else { %>
		   		alert("로그인해주세요.")
		   <% } %>
	   }
	
</script>
	
	
	
	<script>

        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function sample4_execDaumPostcode2() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }
                    // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                    if (fullRoadAddr !== '') {
                        fullRoadAddr += extraRoadAddr;
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새 우편번호 사용
                    document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                    document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if (data.autoRoadAddress) {
                        //예상되는 도로명 주소에 조합형 주소를 추가한다.
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                    } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                    } else {
                        document.getElementById('guide').innerHTML = '';
                    }
                }
            }).open();
        }
        
        $("#opEmail").click(function(){
        	var emailVal = $("#opEmail option:selected").val();
        	document.getElementById("eamil_input").value = emailVal;
        	console.log(emailVal);
        });
    </script>
    
<!--     <script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "yfzXI4hpdc7Snw19hD9L",
			callbackUrl: "http://localhost:8800/sonmandu/",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60 } /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script> -->
<!-- // 네이버아이디로로그인 초기화 Script -->


</body>
</html>