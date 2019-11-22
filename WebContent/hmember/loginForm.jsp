<%@ page contentType="text/html; charset=UTF-8"%>
<%
String c_id ="";
String c_id_val="";
String c_pw ="";
String c_pw_val="";

Cookie[] cookies = request.getCookies();
Cookie cookie = null;

if(cookies != null){
	for(int i=0;i<cookies.length;i++){
		cookie = cookies[i];
		
		if(cookie.getName().equals("c_id")){
			c_id = cookie.getValue();
			}else if(cookie.getName().equals("c_id_val")){
				c_id_val=cookie.getValue();
			}
	}
}
if(cookies != null){
	for(int i=0;i<cookies.length;i++){
		cookie = cookies[i];
		
		if(cookie.getName().equals("c_pw")){
			c_pw = cookie.getValue();
			}else if(cookie.getName().equals("c_pw_val")){
				c_pw_val=cookie.getValue();
			}
	}
}
%>
<!DOCTYPE html>

<html>
<head>
  <title>로그인 처리</title>
  <meta charset="utf-8">
  <script>
 
  function idFind(){
	  var url="idFindForm.jsp";

	  var wr =  window.open(url,"아이디 찾기","width=500,height=300"); //새창열기
		wr.moveTo((window.screen.width-500)/2, (window.screen.height-300)/2); //창 정중앙으로
	 
  }
  
  
  function pwFind(){
	  var url="pwFindForm.jsp";
	  
	  var wr =  window.open(url,"비밀번호 찾기","width=500,height=300"); //새창열기
		wr.moveTo((window.screen.width-500)/2, (window.screen.height-300)/2); //창 정중앙으로
	  
  }
  
  </script>
  </head>
<body >
<jsp:include page="/menu/top.jsp"/>
<div class="container" >
	<h1 class="col-sm-offset-2 col-sm-10">로그인</h1>
	<form class="form-horizontal" 
			>
		<div class="form-group">
			<label class="control-label col-sm-2" for="email">아이디</label>
			<div class="col-sm-4">
				<input style=text-align:center;type="text" class="form-control" id="id" placeholder="Enter id" name="id"required = "required" value='<%=c_id_val %>'>
			
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="pwd">비밀번호</label>
			<div class="col-sm-4">
				<input type="password" class="form-control" id="pwd" placeholder="Enter password" name="passwd" required = "required" value='<%=c_pw_val %>'>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-6">
				<div class="checkbox">
					<label>
					<% if(c_id.equals("Y")){ %>
					<input type="checkbox" name="c_id" value="Y" checked="checked"> Remember ID
			<% }else{ %>
				<input type = 'checkbox' name='c_id' value ='Y'>ID 저장
				<%
			}
				%>
</label>
				</div>
				<div class="checkbox">
					<label>
					<% if(c_pw.equals("M")){ %>
					<input type="checkbox" name="c_pw" value="M" checked="checked"> Remember pw
			<% }else{ %>
				<input type = 'checkbox' name='c_pw' value ='M'>비번 저장
				<%
			}
				%>
</label>
				</div>
				
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button type="submit" class="btn btn-default">로그인</button>
				<button type="button" class="btn btn-default"
				onclick="location.href='agreement.jsp'">회원가입</button>
				<button type="button" class="btn btn-default"  
				onclick="idFind()">아이디 찾기</button>
				
				<button type="button" class="btn btn-default"
				onclick="pwFind()">비밀번호 찾기</button>
				
			</div>
			
		</div>
		
	</form>
</div>
</body>
</html>