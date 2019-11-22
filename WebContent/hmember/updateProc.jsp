<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ include file="/ssi/hssi.jsp" %> 

<jsp:useBean id="dto" class="hmember.HmemberDTO" />
<jsp:setProperty name="dto" property="*" />
<%
flag = dao.update(dto);
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
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<h2 class="col-sm-offset col-sm-10">회원수정 확인</h2>
<div class="well well-lg">

<%
if(flag){
	out.print("회원수정 성공");
}else{
	out.print("회원수정 실패");
}

%>
</div>

<button class="btn" onclick="location.href='read.jsp?id=<%=dto.getId()%>'">회원정보</button>
<button class="btn" onclick="history.back()">다시시도</button>
</div>
</body>
</html>