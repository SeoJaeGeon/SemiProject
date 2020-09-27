<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>손만두</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
        crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <style>
        #navi{
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        #navi>li{
            float: left;
            width: 20%;
        }

        #navi li a{
            display: block;
            text-decoration: none;
            text-align: center;
            color: black;
            font-weight: bold;
            font-size: 20px;
            line-height: 40px;
        }

        #navi li a:hover{
            color:red;
        }
    </style>
</head>
<body>
	<ul id="navi">
        <li><a href="<%= request.getContextPath() %>/list.pro?cate_key=C1">악세사리</a></li>
        <li><a href="<%= request.getContextPath() %>/list.pro?cate_key=C2">공예품</a></li>
        <li><a href="<%= request.getContextPath() %>/list.pro?cate_key=C3">베이커리</a></li>
        <li><a href="<%= request.getContextPath() %>/list.pro?cate_key=C4">에어팟 케이스</a></li>
        <li><a href="<%= request.getContextPath() %>/list.pro?cate_key=C5">기타</a></li>
    </ul>
</body>
</html>