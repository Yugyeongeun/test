<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String id = request.getParameter("id");
%>

<!DOCTYPE html>

<html>
<head>
  <title>hmember</title>
  <meta charset="utf-8">
 <script type="text/javascript">
 	function inCheck(f){
 		if(f.passwd.value.length==0){
 			alert("비밀번호를 입력하세요.")
 			f.passwd.focus();
 			
 			return false;			//입력을 하지 않았을 경우. 메세지.
 		}
 		if(f.repasswd.value.length==0){
 			alert("비밀번호확인을 입력하세요.")
 			f.repasswd.focus();
 			
 			return false;			//비밀번호확인
 		}
 		if(f.passwd.value != f.repasswd.value){
 			alert("비밀번호가 서로 다릅니다.")
 			f.passwd.value="";
 			f.repasswd.value="";
 			f.passwd.focus();		// 비밀번호가 서로 다르진 같은지 확인.
 			return false;			//이 기능은 비밀번호 초기화
 		}
 	}
 </script>
  </head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
	<h1 class="col-sm-offset-2 col-sm-10">비밀번호 변경</h1>
	<form class="form-horizontal" 
			action="updatePwProc.jsp"
			method="post"
			onsubmit="return inCheck(this)"> <!-- inCheck를 자바크립트에 넣어줘야한다. -->
			
		<input type="hidden" name="id" value="<%=id %>">  <!-- 이 히든은 왜 넣어주었을까요? -->
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="passwd">비밀번호</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="passwd" placeholder="Enter password" name="passwd">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="repasswd">비밀번호 확인</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="repasswd" placeholder="Enter repassword" name="repasswd">
			</div>
		</div>
		
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button type="submit" class="btn btn-default">변경</button> 
				<button type="button" class="btn btn-default" onclick="history.back()">취소</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>