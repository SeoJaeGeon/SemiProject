<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String msg = (String)request.getAttribute("msg");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery 라이브러리 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	var msg = "<%= msg%>";
	
	if(msg != "null"){
		alert(msg);
	}
	
	// 비밀번호가 성공적으로 변경 되었다면 해당 창 종료
	if(msg == "성공적으로 비밀번호를 변경하였습니다.") {
		window.close();
	}
</script>
<style>
   h3 {
      text-align: center;
   }
   table {
      margin:auto;
   }
   td {
      text-align:center;
   }
   button {
      height : 22px;
      width : 100px;
      background : white;
      border : yellowgreen;
      color : black;
      border-radius:5px;
   }
   button:hover {
      cursor:pointer;
   }
   
   /* 입력 창 스타일 */
	#memPwd, #newPwd, #newPwd2 {
		width: 100%;
		padding: 12px 20px;
		margin: 8px 0;
		display: inline-block;
		border: 1px solid #ccc;
		box-sizing: border-box;
	}
   
</style>
</head>
<body>
   <h3>비밀번호 변경</h3>
   <br>
   <form id="updatePwdForm" action="<%= request.getContextPath() %>/updatePwd.me" method="post" onsubmit="return checkPwd();">
      <table>
         <tr>
            <td><label>현재 비밀번호</label></td>
            <td width="50"></td>
            <td><input type="password" name="memPwd" id="memPwd" maxlength="15"></td>
         </tr>
         <tr>
            <td><label>변경할 비밀번호</label></td>
            <td width="50"></td>
            <td><input type="password" name="newPwd" id="newPwd" maxlength="15"></td>
         </tr>
         <tr>
            <td><label>변경할 비밀번호 확인</label></td>
            <td width="50"></td>
            <td><input type="password" name="newPwd2" id="newPwd2" maxlength="15"></td>
         </tr>
      </table>
      <br><br>
      <div class="btns" align="center">
         <button id="updatePwdBtn">변경하기</button>
      </div>
   </form>
   
   <script>
      function checkPwd(){
         var memPwd = $("#memPwd");
         var newPwd = $("#newPwd");
         var newPwd2 = $("#newPwd2");
         
         if(userPwd.val().trim() == "" || newPwd.val().trim() == "" 
               || newPwd2.val().trim() == ""){
            alert("비밀번호를 입력해주세요");
            return false;
         }
         
         if(newPwd.val() != newPwd2.val()){
            alert("비밀번호가 다릅니다.");
            newPwd2.select();
            return false;
         }
         
         return true;
      }
   </script>
   
   
   

</body>
</html>

