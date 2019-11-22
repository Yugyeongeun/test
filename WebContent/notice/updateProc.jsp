<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/ssi/nssi.jsp"%>
<jsp:useBean id="dto" class="notice.NoticeDTO"/>
<jsp:setProperty name="dto" property="*"/>
<%
	Map map = new HashMap();	
	map.put("no", dto.getNo());
	map.put("passwd", dto.getPasswd());
	
	boolean pflag = dao.passCheck(map);
	flag = false;
	
	if(pflag){
		flag = dao.update(dto);
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script type="text/javascript">
  function listb(){
	  var url = "list.jsp";
	  url += "?col=<%=request.getParameter("col")%>";
	  url += "&word=<%=request.getParameter("word")%>";
	  url += "&nowPage=<%=request.getParameter("nowPage")%>";
  
	  location.href=url;
  }
  </script>
<title>update</title>
</head>
<body>

</body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
	
	<div class="well well-lg">
		<%
			if(!pflag){
				out.print("비밀번호 오류입니다.");
			}else if(flag){
				out.print("글 수정을 성공했습니다.");
			}else{
				out.print("글 수정을 실패했습니다.");
			}
		
		%>
	</div>
	<%
		if(!pflag){
	%>
	<button class="btn btn-default" onclick="history.back()">다시시도</button>
	
	<% } %>
	
	<button class="btn btn-default" onclick= "location.href='createForm.jsp'">다시등록</button>
	<button class="btn btn-default" onclick= "listb()">목록</button>
	
</div>
</body>
</html>