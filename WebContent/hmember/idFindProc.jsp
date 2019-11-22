<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/hssi.jsp"%>
<%
String mname = request.getParameter("name");



Map map = new HashMap();
map.put("mname", mname);



String id =dao.Search(map);



%>
<!DOCTYPE html>

<html>
<head>
  <title>아이디 찾기</title>
  <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  </head>
<body>

<div class="container">
	<h1 class="col-sm-offset-2 col-sm-10">아이디 찾기</h1>
<div class="well well-lg col-sm-offest-1 col-sm-4">
<br>
입력된 이름: <%=mname %><br><br>
<%
if(id != null){
	out.print("아이디는 "+id+"입니다.");
}else{
	out.print("아이디를 찾을 수 없습니다.");
	}
%>

</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button  class="btn btn-default" onclick="location.href='findIdForm.jsp'">다시시도</button>
				<button  class="btn btn-default" onclick="window.close()">닫기</button>
			</div>
		</div>

</div>
</body>
</html>