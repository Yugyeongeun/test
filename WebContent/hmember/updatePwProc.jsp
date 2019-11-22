<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@include file="/ssi/hssi.jsp" %>
<jsp:useBean id="dto" class="hmember.HmemberDTO"/>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("passwd");
	
	Map map = new HashMap();
	map.put("id",id);
	map.put("pw",pw);
	
	flag=dao.updatePw(map);
	
	
%>

<!DOCTYPE html> 
<html> 
<head>
  <title>memo</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<h2 class="col-sm-offset-2 col-sm-10">비밀번호 변경확인</h2>
<div class="well well-lg">
<%
   if(flag){
   out.print("비밀번호를 변경했습니다.");
   }else{
   out.print("비밀번호 변경을 실패했습니다.");
   }
 
%>
 
</div>
<button class="btn" onclick="location.href='loginForm.jsp'">로그인</button>
<button class="btn" onclick="history.back()">다시시도</button>
 
 
 
</div>
</body> 
</html> 
 