<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, board.model.vo.*"%>
<%
   ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   
   int listCount = pi.getListCount();
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   
   // list.bo로 호출해서 현재 페이지로 fowarding 된 경우 s는 null이므로
   // nullPointerException 방지를 위해 if문 사용
   Search s = (Search)request.getAttribute("s");
   String search = "";
   String searchCondition = "";
   String[] selected = new String[3];
   
   if(s != null){
      search = s.getSearch();
      searchCondition = s.getSearchCondition();
      if(searchCondition.equals("bWriter")){
         selected[0] = "selected";
      }else if(searchCondition.equals("BTitle")){
         selected[1] = "selected";
      }else{
         selected[2] = "selected";
      }
   }

   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@1.0/nanumbarungothicsubset.css">
<style>

	#body {
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

        section.back{
            width: 80%;
            position: relative;
            left: 10%;
        }
        .back-div {
            width: 100%;
            margin-bottom: 25px;
        }
        .bottom {
            border-top : 1px solid black;
        }

        #hone {
            font-size: 25px;
            position: relative;
            top : 10px;
            text-align: center;
            color: rgb(66, 66, 66);
            font-weight: lighter;
        }
        
        table#tb1-notice{
            border-top : 1px solid black;
            border-collapse: collapse;
            width: 100%;
            border-top: 1px solid #e2e0e0;
            padding : 5px 0;
        }
        #trstyle {
            height: 50px;
            border-bottom: 1px solid #eee;
            text-align: center;
        }
        .trst {
            height: 50px;
            border-bottom: 1px, solid #eee;
            font-size: 13px;
            text-align: center;
        }
        .td1 {
            text-align: ceter;
        }
        .td2 {
            text-align: center;
            padding-left: 50px;
        }
        #pageBar {
            width: 100%;
            margin : 40px 0 40px 0;
            text-align: center;
        }
        
        #searchBtn, #insertBtn {
	      height:22px;
	      width:80px;
	      background:white;
	      border:white;
	      color:black;
	      border-radius:5px;
   	} 
  		


    </style>
</head>
<body id="body">
       <header>
			<section id="header-1">
				<%@include file="../common/header1.jsp"%>
			</section>
			<section id="header-2">ㅣ
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
		
		 <section class="back">
        <div class="back-div top">
            <h1 id= "hone">문의사항</h1>
            <br>

        <div class="back-div bottom">
            <table id="listArea">
                <colgroup>
                    <col width="15%">
                    <col width="60%">
                    <col width="15%">
                    <col width="5%">
                    <col width="35%">
                </colgroup>
                <thead>
                    <tr id="trstyle">
                        <th width="100">번호</th>
                        <th width="100">제목</th>
                        <th width="100">작성자</th>
                        <th width="100">조회수</th>
                        <th width="100">작성일</th>
                    </tr>
                </thead>
                 <% if(list.isEmpty()){ %>
                 <tr>
                 	<td colspan="5">등록된 게시글이 없습니다.</td>
                 </tr>
                 <% } else { %>
                 <% for(Board b : list) {%>
                <tbody>
                    <tr class="trst" >
                        <td class="td1"><%= b.getbId() %></td>
                        <td class="td2"><%= b.getbTitle() %></td>
                        <td class="td1"><%= b.getbWriter() %></td>
                        <td class="td1"><%= b.getbCount() %></td>
                        <td class="td1"><%= b.getModifyDate() %></td>
                    </tr>
                </tbody>
                	<% } %>
                <% } %>
            </table>
        </div>
        <!-- 페이징 바 -->
        <div id="pageBar" align="center">
           <!-- 맨 처음으로 (<<) -->
           <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=1'"> &lt;&lt;</button>
        	<!-- 이전페이지로 (<) -->
        	 <!-- 이전 페이지로(<) -->
	         <% if(currentPage == 1) { %>
	            <button disabled> &lt; </button>
	         <% } else if(s == null){ %>
	            <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage - 1 %>'"> &lt; </button>
	         <% } else {%>
	            <button onclick="location.href='<%= contextPath %>/search.bo?currentPage=<%= currentPage - 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &lt; </button>
	         <% } %>
	       		 <!-- 10개의 페이지 목록 -->
	         <% for(int p = startPage; p <= endPage; p++){ %>
	            <% if (p == currentPage) { %>
	               <button disabled> <%= p %></button>
	            <% } else if (s == null){ %>
	               <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= p %>'"> <%= p %> </button>
	            <% } else { %>
	               <button onclick="location.href='<%= contextPath %>/search.bo?currentPage=<%= p %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> <%= p %> </button>
	            <% } %>
	         <% } %>
	          
	         <!-- 다음 페이지로(>) -->
	         <% if(currentPage == maxPage) { %>
	            <button disabled> &gt; </button>
	         <% } else if (s == null){ %>
	            <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage + 1 %>'"> &gt; </button>
	         <% } else { %>
	            <button onclick="location.href='<%= contextPath %>/search.bo?currentPage=<%= currentPage + 1 %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt; </button>
	         <% } %>
	         
	         <!-- 맨 끝으로(>>) -->
	         <% if(s == null){ %>
	         <button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= maxPage %>'"> &gt;&gt; </button>
	         <% } else { %>
	         <button onclick="location.href='<%= contextPath %>/search.bo?currentPage=<%= maxPage %>&searchCondition=<%= searchCondition %>&search=<%= search %>'"> &gt;&gt; </button>
	         <% } %>
	      </div>
	     </div>
    </section>
    <div class="searchArea" align="center">
    	<form action="<%= contextPath %>/search.bo" method="get">
    		<select id="searchCondition" name="searchCondition">
    			<option vlaue="bWriter" <%= selected[0] %>>작성자</option>
    			<option vlaue="bTitle" <%= selected[1] %>>제목</option>
    			<option vlaue="bContent" <%= selected[2] %>>내용</option>			
    		</select>
    		<input type="search" name="search" value="<%= search %>">
    		<button id="searchBtn" type="submit">검색하기</button>
    	<!-- 로그인 된 유저가 있을 경우 게시글 작성 버튼 보이기 -->
            <% if(loginUser != null) { %>
               <button id="insertBtn" type="button" onclick="location.href='<%= contextPath %>/views/board/boardInsertForm.jsp'">작성하기</button>
            <% } %>	
    	</form>
    </div>
   
   <script>
		// 게시글 상세보기 기능
		$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"darkgrey","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				var bId = $(this).parent().children().eq(0).text();
				
				<% if(loginUser != null){ %>
					location.href="<%= contextPath %>/detail.bo?bId="+bId;
				<%} else{ %>
					alert("로그인 후 상세보기가 가능합니다.");
				<% } %>
				
			});
		});
	</script>
  
    
   	<footer>
        <%@include file="../common/footer.jsp"%>
    </footer>

</body>
</html>