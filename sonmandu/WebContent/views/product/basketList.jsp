<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, product.model.vo.*"%>
<%
	ArrayList<Basket> bList = (ArrayList<Basket>)request.getAttribute("bList");
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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
        crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
        crossorigin="anonymous"></script>
<style>
        header,
        nav,
        section,
        article,
        aside,
        footer {
            box-sizing: border-box;

            display: block;
        }
		#body{
			margin : auto;
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


        
        
        #checkProduct{
            width: 100%;
            min-height: 300px;
            text-align: center;
        }

        .btnTag{
            width: 100%;
            height: 80px;
        }
        
        .btnBox{
            width: 300px;
            height: 50px;
            color: white;
            background-color: #f4511e;
            overflow: hidden;
            margin-top: 15px;
        }

        .delBtn{
            margin-bottom: 9px;
            font-size: 20px;
            color: white;
            background-color: #f4511e;
        }

        .btnBox:first-child{
            float: left;
            margin-left: 400px;
        }

        .btnBox:last-child{
            float: right;
            margin-right: 400px;
        }

        #checkProduct img {
            width: 150px;
            height: 150px;
        }

        #total_price{
            width: 100%;
            height: 60px;
            font-size: 30px;
            font-weight: 500;
        }
        #total_price > button{
            margin-left: 50px;
        }
        #total_price > span {
            float: right;
            margin-right: 30px;
        }

        .input_BaVal{
            width: 50px;
        }

        .checkSel{
            width: 20px;
            height: 20px;
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
            <table class="table">
                <thead class="thead-light">
                    <tr>
                        <th><input type="checkbox" name="checkAll" id="th_checkAll" onclick="checkAll();" /></th>
                        <th scope="col">상품사진</th>
                        <th scope="col">상품명</th>
                        <th scope="col">브랜드명</th>
                        <th scope="col">수량</th>
                        <th scope="col">가격</th>
                        <th scope="col">배송비</th>
                    </tr>
                </thead>
                <tbody>
                	<% int sum = 0; %>
                	<% int total = 0; %>
                	<% String pNoList = ""; %>
                	<% String pQuantityList = ""; %>
                <% if(!bList.isEmpty()) {%>
                	<% for(Basket b : bList) {%>
                    <tr>
                    	<% sum = b.getPrice() * b.getQuantity(); %>
                        <td class="checkSel"><input type="checkbox" name="checkRow" value="<%= b.getBasketId() %>" id="checkId"/></td>
                        <td name="bImg">
							<img src="<%= contextPath %>/resources/productImg/<%=b.getChangeName()%>">
						</td>
                        <td name="bTitle"><%= b.getProductName() %></td>
                        <td name="bBrand"><%= b.getStoreName() %></td>
                        <td name="bNumber"><span><%=b.getQuantity()%></span>개</td>
                        <td name="bPrice"><span class="ba_price"><%= sum %></span>원</td>
                        <td name="bCharge"><span class="ba_price"><%= b.getCharge() %></span>원</td>
                        <% pNoList += b.getProductId() + ","; %>
                        <% pQuantityList += b.getQuantity() + ","; %> 
                        <% total += sum+b.getCharge(); %>
                    </tr>
                 	<% } %>
                 <% } else { %>
                 	<tr>
                        <td colspan="7">장바구니에 아무것도 담기지 않았어요.~</td>
                    </tr>
                 <% } %>
                </tbody>
            </table>
        </div>

        <div id="total_price">
            <button onclick="deleteAction();" class="delBtn">삭제하기</button>
            <span>총 금액 : <b><%= total %></b>원</span>
        </div>

        <div class="btnTag">
            <button type="button" class="btnBox btnTag1" onclick="goPay();">구매하기</button>
            <button type="button" class="btnBox btnTag2" onclick="goMain();">메인으로</button>
        </div>

    </section>

    <footer>
		<%@include file="../common/footer.jsp"%>
	</footer>

    <button onclick="topFunction()" id="myBtn" title="Go to top">top</button>

    <script>
        mybutton = document.getElementById("myBtn");
        window.onscroll = function () { scrollFunction() };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                mybutton.style.display = "block";
            } else {
                mybutton.style.display = "none";
            }
        }

        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }

        function checkAll() {
            if ($("#th_checkAll").is(':checked')) {
                $("input[name=checkRow]").prop("checked", true);
            } else {
                $("input[name=checkRow]").prop("checked", false);
            }
        }

        function deleteAction() {
            var checkRow = "";
            
            $("#checkId:checked").each(function () {
                checkRow = checkRow + $(this).val() + ",";
            });
            checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기

            if (checkRow == '') {
                alert("삭제할 대상을 선택하세요.");
                return false;
            }
            

            if (confirm("정보를 삭제 하시겠습니까?")) {
            	location.href = "<%= contextPath %>/delete.bas?checkRow="+checkRow;
            }
            
            alert("장바구니 삭제를 완료했어요~~");
        }
        
        function goMain(){
        	location.href = "<%= contextPath %>";
        }
        
        function goPay(){
        	location.href = "<%= contextPath %>/buy.bas?pNoList=<%=pNoList%>&pQuantityList=<%=pQuantityList%>"
        }

    </script>
</body>
</html>