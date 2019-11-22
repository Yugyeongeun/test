<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/hssi.jsp"%>
<%
		String col=Utility.checkNull(request.getParameter("col"));//공백이 있는지 없는지 확인
		String word=Utility.checkNull(request.getParameter("word"));
	 	if(col.equals("total"))word="";  //total일때 word 지움

	 	int nowPage =1;
		int recordPerPage =3;
		
		if(request.getParameter("nowPage") != null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		
		int sno = ((nowPage-1)*recordPerPage)+1;
		int eno = nowPage * recordPerPage;
		Map map = new HashMap();
		map.put("col",col);
		map.put("word",word);
		map.put("sno",sno);
		map.put("eno",eno);
		int total = dao.total(map);
		
		String paging = Utility.paging(total, nowPage, recordPerPage, col, word);
		

		list = dao.list(map);
%>
<!DOCTYPE html>
<html>
<head>
<title>회원목록</title>
<meta charset="utf-8">
<script type="text/javascript">
function read(id){
	var url = "<%=root%>/hmember/read.jsp";
	url +="?id="+id;
	
	location.href=url;
}
</script>
</head>

<body>
	<jsp:include page="/menu/top.jsp" />

	<div class="container">
		<h4 class="col-sm-offset-5 col-sm-10">회원목록</h4>
		<br>

		<form class="form-inline" method="post" action="list.jsp">
			<div class="form-group">
				<select name="col" class="form-control">
					<option value="mname"
					<%if(col.equals("mname")) out.print("selected");%>
					>성명</option>
					<option value="id"
					<%if(col.equals("id")) out.print("selected");%>
					>아이디</option>
					<option value="total"
					<%if(col.equals("total")) out.print("selected");%>
					>전체출력</option>
				</select>
<div class="form-group">
	<input type="text" class="form-control" name="word" required="required" value="<%=word%>">
</div>
				<button class="btn btn-default" >검색</button>
				<button class= "btn btn-default" type="button" onclick="location.href='createForm.jsp'">등록</button>
</div>
</form>
<br>
		<%
			for (int i = 0; i < list.size(); i++) {
				HmemberDTO dto = list.get(i);
		%>
	<table class ="table talbe-bordered">
	<tr>
		<td rowspan="5" class="col-sm-2">
		<img src="<%=root %>/hmember/storage/<%=dto.getFname() %>"
		class="img-founded" width="200px" height="200px">
		</td>
		
		<th class="col-sm-2">아이디</th>
		<td class="col-sm-8"><a href="javascript:read('<%=dto.getId()%>')"><%=dto.getId()%></a></td>
		</tr>
		
		<tr>
		<th  class="col-sm-2">성명</th>
		<td class="col-sm-8"><%=dto.getMname() %></td>
		</tr>
		
		<tr>
		<th  class="col-sm-2">전화번호</th>
		<td class="col-sm-8"><%=dto.getTel() %></td>
		</tr>
		
	
		
		<tr>
		<th  class="col-sm-2">주소</th>
		<td class="col-sm-8">
		(<%=dto.getZipcode() %>)
		<%=dto.getAddress1() %> <%=dto.getAddress2() %>
		
		</td>
		</tr>
		
</table>
		<%
			}
		%>
	</div>
	<%=paging %>
</body>
</html>