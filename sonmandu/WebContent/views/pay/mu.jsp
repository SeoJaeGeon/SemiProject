<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int price = (Integer)request.getAttribute("price");
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
    <h1 align="center">해당 계좌로 입금 바랍니다.</h1>
    <table align="center" id="successLog">
            <tr>
                <th>국민은행</th>
                <td>595101-01-358160</td>
            </tr>
            <tr>
                <th>IBK기업은행</th>
                <td>XXX-XXXXXX-XX-XXX</td>
            </tr>
            <tr>
                <th>NH농협은행</th>
                <td>302-0471-9609-21</td>
            </tr>
            <tr>
                <th>신한은행</th>
                <td>110-389-245042</td>
            </tr>
            <tr>
                <th>우리은행</th>
                <td>XXXX-XXX-XXXXXX</td>
            </tr>
            <tr>
                <th>KEB하나은행</th>
                <td>XXX-XXXXXX-XXXXX</td>
            </tr>
            <tr>
                <th>카카오뱅크</th>
                <td>XXXX-XX-XXXXXXX</td>
            </tr>
            <tr>
                <th>입급 금액  (예금주 명 : (주)손만두 )</th>
                <td><%=price%> 원</td>
            </tr>
    </table><br>
    <button id="returnHome" onclick="returnHome();">돌아가기</button>
    
    <script>
    	function returnHome(){
    		location.href="<%=request.getContextPath()%>";
    	}
    </script>
</body>
</html>