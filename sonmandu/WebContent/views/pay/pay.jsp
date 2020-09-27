<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="product.model.vo.* , java.util.*"%>
<%
	Payment pay = (Payment)request.getAttribute("pay");

	String name = pay.getOrderName();
	String phone = pay.getOrderPhone();
	String email = pay.getOrderEmail();
	String address = pay.getOrderAddress();
	String paySelect = pay.getPaySelect();
	Date payDate = pay.getPayDate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>손만두</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">
<style>
        #successLog {
            border-collapse: collapse;
            width: 800px;
            height: 500px;
            font-family: 'NanumBarunGothic', sans-serif;
        }

        #successLog th {
            border: 5px orangered solid;
            width: 20%;
            font-size: 20px;
        }

        #successLog td{
            border: 5px orangered solid;
            width: 80%;
            padding-left: 10px;
            font-size: 18px;
        }

        #returnHome{
            display: block;
            margin: auto;
            width: 400px;
            height: 50px;
            font-family: 'NanumBarunGothic', sans-serif;
            font-size: 15px;
            color: white;
            background: red;
        }

        #returnHome:hover{
            background: orangered;
        }
    </style>
</head>

<body>
    <h1 align="center">상품 구매에 성공하였습니다.</h1>
    <table align="center" id="successLog">
            <tr>
                <th>주문자 이름</th>
                <td><%= name %></td>
            </tr>
            <tr>
                <th>주문자 핸드폰</th>
                <td><%= phone %></td>
            </tr>
            <tr>
            	<th>주문자 이메일</th>
            	<td><%= email %></td>
            </tr>
            <tr>
                <th>주문자 주소</th>
                <td><%= address %></td>
            </tr>
            <tr>
                <th>결제날짜</th>
                <td><%= payDate %></td>
            </tr>
            <tr>
                <th>결제수단</th>
                <td><%= paySelect %></td>
            </tr>
    </table><br>
    <button id="returnHome" onclick="returnHome();">홈 으로 돌아가기</button>
    
    <script>
    	function returnHome(){
    		location.href="<%=request.getContextPath()%>";
    	}
    </script>
</body>
</html>