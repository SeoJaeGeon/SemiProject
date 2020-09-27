<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, product.model.vo.*"%>
<%
	ArrayList<Product> pList = (ArrayList<Product>)request.getAttribute("pList");
	int proVal = (int)request.getAttribute("proVal");
	
	int pNo = 0;
	String proImage1 = "";
	String seller = "";
	String productName = "";
	int price = 0;
	int charge = 0;
	int stock = 0;
	int productTime = 0;
	
	for(Product p : pList) {
		if(p.getFileLevel() == 0) {
			pNo = p.getProductId();
			proImage1 = p.getChangeName();
			seller = p.getStoreName();
			productName = p.getProductName();
			price = p.getPrice();
			charge = p.getCharge();
			stock = p.getStock();
			productTime = p.getProductTime();
		}
	}
	
	int mul = price * proVal;
	int sum = mul + charge;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>손만두</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">

<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode1() {
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
</script>
<style>
		#body{
			margin:auto;
		}
        header,
        nav,
        section,
        article,
        aside,
        footer {
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


        .address1{
            width: 300px;
        }

        .address2{
            width: 200px;
        }

        #address_tag{
            width: 100%;
            height: 200px;
        }
        
        #checkProduct{
            width: 100%;
            min-height: 300px;
            text-align: center;
        }

        .btnTag{
            width: 100%;
            height: 80px;
        }
        
        #btnTag1{
            float: left;
            width: 300px;
            height: 50px;
            color: white;
            background-color: #f4511e;
            overflow: hidden;
            margin-top: 15px;
            margin-left: 400px;
        }

        #btnTag2{
            float: right;
            width: 300px;
            height: 50px;
            color: white;
            background-color: #f4511e;
            overflow: hidden;
            margin-top: 15px;
            margin-right: 400px;
        }

        #checkProduct img {
            width: 150px;
            height: 150px;
        }

        #total_price{
            width: 100%;
            height: 70px;
            text-align: right;
            font-size: 30px;
            font-weight: 500;
        }

        #total_price > span {
            margin-right: 30px;
        }
        
        .user_infoTag{
            width: 100%;
            height: 110px;
        }
        
        .user_infoTag input{
            display: block;
            margin-bottom: 5px;
            margin-left:5px; 
            width: 200px;
            height: 30px;
        }
        
        .salChecked{
            width: 100%;
            height: 150px;
        }
        
        .selectBtn{
            width: 200px;
            height: 100%;
            font-size: 30px;
            font-family: 'NanumBarunGothic', sans-serif;
        }
        
        .sBtn1{
            float:left;
        }
        .sBtn2{
            float: right;
        }

        .selectBtn:focus{
            background: red;
        }
		/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

.containerJoin {
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

tr{
	border-bottom : 1px solid gray;
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

	<section id="content">
		<div id="checkProduct">
		<form action="<%= request.getContextPath() %>/pay.pro" method="post">
			<table class="table">
				<thead class="thead-light">
					<tr>
						<th scope="col">상품사진</th>
						<th scope="col">상품명</th>
						<th scope="col">브랜드명</th>
						<th scope="col">수량</th>
						<th scope="col">가격</th>
						<th scope="col">배송비</th>
					</tr>
				</thead>
				<tbody>
				<% if(!pList.isEmpty()) {%>
					<tr>
						<td>
							<img src="<%= contextPath %>/resources/productImg/<%= proImage1 %>" alt="...">
						</td>
						<td><%= productName %></td>
						<td><%= seller %></td>
						<td><%= proVal %>개</td>
						<td><%= mul %>원</td>
						<td><%= charge %>원</td>
					</tr>
				<% } %>
				</tbody>
			</table>
		</div>
		
		<input type="hidden" id="pNo" name="pNo" value="<%=pNo %>">
		<input type="hidden" id="mNum" name="mNum" value="<%= loginUser.getMemNum() %>">
		<input type="hidden" id="productName" name="productName" value="<%=productName %>">
		<input type="hidden" id="sum" name="sum" value="<%=sum %>">
		<%
			System.out.println("============= (jsp)ProductBuyPage.jsp ===============");
			System.out.println("pNo : " + pNo);
			System.out.println("getMemNum : " + loginUser.getMemNum());
			System.out.println("productName : " + productName);
			System.out.println("sum : " + sum);
		%>
		<div id="total_price">
			<span>총 금액 : <b><%= sum %></b>원  (배송비 포함)</span>
			<input type="hidden" name="tPrice" value="sum">
		</div>

		<div class="user_infoTag">
			<input type="text" name="name" id="name" placeholder="이름"> 
			<input type="text" name="phone" id="phone" placeholder="전화번호"> 
			<input type="email" name="email" id="email" placeholder="이메일">
		</div>

		<div id="address_tag">
			<input type="text" id="sample4_postcode" placeholder="우편번호">
			<input type="button" onclick="sample4_execDaumPostcode1()" value="우편번호 찾기"><br> 
			<input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="address1">
			<input type="text" id="sample4_jibunAddress" placeholder="지번주소" class="address1">
			<span id="guide" style="color: #999; display: none"></span><br> 
			<input type="text" id="sample4_extraAddress" placeholder="참고항목" class="address2">
			<input type="text" id="sample4_detailAddress" placeholder="상세주소" class="address2"> 
		</div>
		</form>



		<div class="btnTag">
			<button id="btnTag1"
				onclick="document.getElementById('id04').style.display='block';">주문하기</button>

			<div id="id04" class="modal">
				<div class="modalWrap4" style="overflow: auto">
					<div class="modal-content animate" id="joinForm" name="joinForm">
						<span
							onclick="document.getElementById('id04').style.display='none'"
							class="close" title="Close Modal">&times;</span> <br>
						<h2 align="center">결제방법을 선택해주세요</h2>
						<img src="<%=request.getContextPath()%>/resources/images/logo.jpg">

						<div class="containerJoin">
							<div class="salChecked" type="button">
								<button type="button" class="selectBtn sBtn1" onclick="muBtn();">
									무통장 결제 <input type="hidden" value="무통장" name="sendMoney">
								</button>


								<button type="button" class="selectBtn sBtn2" onclick="cardBuyBtn();">
									카드 결제 <input type="hidden" value="카드" name="creditCard">
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button id="btnTag2" onclick="closeBuy();" type="button">결제취소</button>
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
		
		function cardBuyBtn(){
			$(function(){
		        var IMP = window.IMP; // 생략가능
		        IMP.init('imp07866238'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		        var msg;
		        var mNum = <%= loginUser.getMemNum() %>;		// 주문자 번호
		        var totalSal = <%= sum %>						// 총가격
		        var orderName = $("#name").val();				// 주문자 이름
		        var orderphone = $("#phone").val();				// 주문자 핸드폰
		        var orderEmail = $("#email").val();				// 주문자 이메일
		        var add1 = $("#sample4_postcode").val();		// 우편번호
		       	var add2 = $("#sample4_roadAddress").val();		// 도로명주소
		       	var add3 = $("#sample4_jibunAddress").val();	// 지번주소
		       	var add4 = $("#sample4_extraAddress").val();	// 참고항목
		       	var add5 = $("#sample4_detailAddress").val();	// 상세주소
		       	var productName = $("#productName").val();
		       	
		        var pNo = <%=pNo %>;							// 상품번호
		        var proVal = <%= proVal %>;						// 상품 갯수
		        
		        IMP.request_pay({
		            pg : 'kakaopay',
		            pay_method : 'card',
		            merchant_uid : 'merchant_' + new Date().getTime(),
		            name : productName,
		            amount : <%=sum%>,
		            buyer_email : 'email',
		            buyer_name : 'name',
		            buyer_tel : 'phone',
		            buyer_addr : 'address',
		            buyer_postcode : '123-456'
		            //m_redirect_url : 'http://www.naver.com'
		        }, function(rsp) {
		            if ( rsp.success ) {
		                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		                jQuery.ajax({
		                    url: "pay.pro", //cross-domain error가 발생하지 않도록 주의해주세요
		                    type: 'POST',
		                    dataType: 'json',
		                    data: {
		                        imp_uid : rsp.imp_uid,
		                        mNum : mNum,
		                        totalSal : totalSal,
		                        orderName : orderName,
		                        orderphone : orderphone,
		                        orderEmail : orderEmail,
		                        add1 : add1,
		                        add2 : add2,
		                        add3 : add3,
		                        add4 : add4,
		                        add5 : add5,
		                        pNo : pNo,
		                        proVal : proVal
		                        
		                        //기타 필요한 데이터가 있으면 추가 전달
		                    }
		                }).done(function(data) {
		                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		                    if ( everythings_fine ) {
		                        msg = '결제가 완료되었습니다.';
		                        msg += '\n고유ID : ' + rsp.imp_uid;
		                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                        msg += '\결제 금액 : ' + rsp.paid_amount;
		                        msg += '카드 승인번호 : ' + rsp.apply_num;
		                        
		                        alert(msg);
		                    } else {
		                        //[3] 아직 제대로 결제가 되지 않았습니다.
		                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		                    }
		                });
		                //성공시 이동할 페이지
		                location.href="<%=request.getContextPath()%>/suc.info?name="+orderName;
		            } else {
		                msg = '결제에 실패하였습니다.';
		                msg += '에러내용 : ' + rsp.error_msg;
		                //실패시 이동할 페이지
		                location.href="<%=request.getContextPath()%>/views/payState/payFail.jsp";
		                alert(msg);
		            }
		        });
		        
		    });
		}
		
		function closeBuy(){
			location.href="<%=request.getContextPath()%>/detail.pro?pNo="+<%= pNo %>;
		}
		
		function muBtn(){<%-- 
			var totalSal = <%= sum %>;
			var store = <%= seller %>; --%>
			location.href="<%=request.getContextPath()%>/mu.pro?&total=<%= sum %>";
		}
	</script>
</body>
</html>