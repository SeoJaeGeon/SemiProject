<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member m = (Member) session.getAttribute("loginUser");

	/* String msg = (String)session.getAttribute("msg");
	
	String contextPath = request.getContextPath(); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
 	<!-- 주소 검색 daum api  -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<%-- <script>
	// session 영역에 msg가 있다면 msg alert로 출력
	var msg = '<%= msg %>';
	$(function(){
		if(msg != 'null'){
			alert(msg);
			<% session.removeAttribute("msg"); %>
		} 
	});
</script>	 --%>

<style>
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
	height: 80%;
}

#footer2>p:last-child {
	height: 20%;
	text-align: center;
}

.login {
	text-decoration: none;
	font-weight: 600;
	line-height: 25px;
	color: black;
}

<!--회원 가입 --->
.sellerjoin {
	background-color: white; 
	outline: none ; 
	border: none ;
}

/* Bordered form */
.modal-content {
	border: 3px solid #f1f1f1;
	height: auto;
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
}

.modalWrap2 {
	width: 1600px;
	/*height : 1000px; */
	margin: auto;
}

/* 입력 창 스타일 */
.pname, .psw {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* 체크 박스 */
.check {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* 로고 사진 설정 */
div>form>img {
	width: 450px;
	height: 150px;
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
	overflow: /* auto; */ scroll !important;
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
/* 로그인 끝 */
</style>
<script>

        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function sample_execDaumPostcode() {
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
                    document.getElementById('sample_postcode').value = data.zonecode; //5자리 새 우편번호 사용
                    document.getElementById('sample_roadAddress').value = fullRoadAddr;
                    document.getElementById('sample_jibunAddress').value = data.jibunAddress;

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
    </script>
</head>
<body>

	<%
		if (m == null) {
	%>
	<div id="footer1">
		<a href="#">이용약관</a> | <a href="#">개인정보취급방침</a> | <a href="#">고객센터 | </a>
		
		<button class="login joinbutton" id="sellerjoin" onclick="document.getElementById('id03').style.display='block'"
			style="width: auto; outline:none; border:none; background:white;">판매자 입점 신청</button>

		<div id="id03" class="modal">
			<div class="modalWrap2" style="overflow: auto">
				<form class="modal-content animate" id="joinForm2" name="joinForm2" action="<%=request.getContextPath()%>/insertSeller.me" method="post" onsubmit="return JoinValidate();">

					<span onclick="document.getElementById('id03').style.display='none'" class="close" title="Close Modal">&times;</span> <br>
					<h2 align="center">회원가입</h2>
					<img src="<%=request.getContextPath()%>/resources/images/logo.jpg">

					<div class="containerJoin">

						<input type="text" maxlength="5"  class="pname" name="memName" placeholder="이름">

						<!-- <th>아이디</th> -->
						<input type="text" maxlength="13" class="pname" name="memId" placeholder="아이디">
						 <button id="idCheck2" class="uname" type="button" style='cursor:help; float: right;'>중복확인</button>

						<!-- <th>비밀번호</th> -->
						<input type="password" name="memPwd" class="psw" placeholder="비밀번호 (영문/숫자포함 6자 이상)">

						<!-- <th>비밀번호 확인</th> -->
						<input type="password" name="memPwd2" class="psw" placeholder="비밀번호 확인">
						<label id="pwdResult2"></label> 
						<br>

						<!--  <th>이메일</th> -->

						<input type='text' class="pname" name="email1" style="width: 130px" placeholder="이메일"> @ 
						<input type='text' class="pname" name="email_dns" style="width: 130px" id="eamil_input3">
						<select name="emailaddr" class="pname" style="width: 130px" id="opEmail3">
							<option value="">직접입력</option>
							<option value="daum.net">daum.net</option>
							<option value="empal.com">empal.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
						</select> <br>
						<!--<th>핸드폰 번호</th>-->
						<input type="text" class="pname" name="memPhone" placeholder="휴대전화">
						<br>

						
						<th>주소</th> 
						<input type="text" class="pname" id="sample_postcode" placeholder="우편번호" name="add1">
               			<input type="button" class="pname" onclick="sample_execDaumPostcode()" value="우편번호 찾기" ><br>
		                <input type="text" class="pname" id="sample_roadAddress" placeholder="도로명주소" name="add2">
		                <input type="text" class="pname" id="sample_jibunAddress" placeholder="지번주소" name="add3">
		                <span id="guide" style="color:#999"></span>
		           		<input type="text" class="pname" id="sample_detailAddress" placeholder="상세주소" name="add4">
						
						<th>상점명</th> 
						<input type="text" maxlength="50" class="pname" id="storeName" name="storeName" placeholder="상점명"> <br> 
							<span id="storeName" style="color: #999"></span> <br> <br>
							
						<td>타 판매 사이트 주소</td>
							<td> 
							<input type="text" class="pname" maxlength="50" id="url" name="url" placeholder="url를 입력하세요."> 
							</td>

						<br>
					
						<tr>
						<td>상점 소개 (300자 이내)</td>
						<td colspan="3">
							<textarea rows="12" cols="48" maxlength="300" name="introduction" id="introduction" style="resize:none;"></textarea>
						</td>
						</tr>
						
						<!-- 회원 가입 버튼 -->
							<div align="center">
							<!-- <input type="submit" value="회원가입"> -->
							<button id="joinBtn2" disabled>가입하기</button> 
							<input type="reset" value="취소">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="footer2">
		<p>
			(주)물만두<br> <br> <br> 물만두는 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
			따라서 손만두는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.
		</p>
		<p>Copyright 2020~2020 SMD Information Educational Institute All
			Right Reserved</p>
	</div>
	
	<script>
		$(function() {
			var mode = $("#mode").val();

			console.log(mode);
		});
	</script>
	<%
		} else {
	%>
	<div id="footer1">
		<a href="#">이용약관</a> | <a href="#">개인정보취급방침</a> | <a href="#">고객센터</a>
	</div>
	<div id="footer2">
		<p>
			<br>(주)물만두<br> <br>  물만두는 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
			따라서 손만두는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.
		</p>
		<p>Copyright 2020~2020 SMD Information Educational Institute All
			Right Reserved</p>
	</div>
	<%
		}
	%>
	<script>
	
		function JoinValidate(){
		
		// 아이디 유효성 검사
		if(!/^[a-z][a-z\d]{3,11}$/.test($("#joinForm2 input[name=memId]").val())){
			alert("아이디는 영소문자로 시작해서 4~12자 입력(숫자 포함 가능)");
			$("#joinForm2 input[name=memId]").select();
			
			return false;
		}
		// 비밀번호 일치 여부
		if($("#joinForm2 input[name=memPwd]").val() != $("#joinForm2 input[name=memPwd2]").val()){
			$("#pwdResult2").text("비밀번호 불일치").css("color", "red");
			return false;
		}
		// 이름 유효성 검사
		if(!/^[가-힣]{2,}$/.test($("#joinForm2 input[name=memName]").val())){
			alert("이름은 한글로 2글자 이상 입력");
			$("#joinForm2 input[name=memName]").select();
			return false;
		}
		
		return true;
	}
	
	// ajax 배우고 만들기 (id 중복 검사)
	$(function(){
		// 아이디 중복 시 false, 사용 가능시 true --> 나중에 유효성 검사에 사용할 것
		var isUsable = false;
		
		$("#idCheck2").click(function(){
			
			var memId = $("#joinForm2 input[name='memId']");
			
			console.log(memId);
			if(!memId || memId.val().length < 4){
				alert('아이디는 최소 4자리 이상이어야 합니다.');
				memId.focus();
			}else{
				$.ajax({
					url : "<%= request.getContextPath() %>/idCheck.me",
					type : "post",
					data : {memId:memId.val()},
					success : function(data){
						console.log(data);
						
						if(data == "fail"){
							alert("사용할 수 없는 아이디입니다.");
							memId.focus();
						}else{
							if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")){
								// 해당 input 태그를 readonly로 만들어 더이상 아이디 수정을
								// 못하게 만듦
								memId.prop('readonly', true);
								// 아이디 사용 가능하다는 flag 값 입력
								isUsable = true;
							}else{
								memId.focus();
							}
						}
						
						if(isUsable){
							// 아이디 중복 체크 후 사용 가능한 아이디인 경우
							// 비활성화 속성을 제거하여 가입하기 버튼을 누를 수 있게 처리함
							$("#joinBtn2").removeAttr("disabled");
						}
						
						
					},
					error : function(){
						console.log("서버 통신 안됨");
					}
				});
			}
		});
		
	});
	
	  $("#opEmail3").click(function(){
      	var emailVal2 = $("#opEmail3 option:selected").val();
      	document.getElementById("eamil_input3").value = emailVal2;
      	console.log(emailVal2);
      });
	  
	  
	
</script>
	<!-- <script>
		$(function() {
			var mode = $("#mode").val();

			console.log(mode);
		});
	</script> -->
	
</body>
</html>