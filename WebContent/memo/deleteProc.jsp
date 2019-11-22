<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp"%>
<% request.setCharacterEncoding("utf-8"); 

	int memono = Integer.parseInt(request.getParameter("memono"));
	
	
	flag= dao.delete(memono);
	
	
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>MEMO</title>
  <meta charset="utf-8">
    <script type="text/javascript">
  function listM(){
	  var url = "list.jsp";
	  url += "?col=<%=request.getParameter("col")%>";
	  url += "&word=<%=request.getParameter("word")%>";
	  url += "&nowPage=<%=request.getParameter("nowPage")%>";
  
	  location.href=url;
	  
	  
  }
  </script>
 </head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<div class="well well-lg">
<%
	if(flag){
		out.print("메모삭제 성공");
	}else{
		out.print("메모삭제 실패");
	}
%>
</div>
<button class="btn" type="button" onclick="location.href='./createForm.jsp'">다시등록</button>
<button class="btn" type="button" onclick="listM()">목록</button>
</div>
</body>
</html>






