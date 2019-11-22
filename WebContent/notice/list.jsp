<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/nssi.jsp"%>
<%
	//검색관리
	String word = Utility.checkNull(request.getParameter("word"));
	String col = Utility.checkNull(request.getParameter("col"));

	if (col.equals("total"))
		word = "";

	//페이징 관련
	int nowPage = 1;
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));

	}

	int recordPerPage = 5; //한 페이지당 보여줄 레코드 갯수

	//디비에서 가져올 순번
	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;
	//최대 5개를 가져오게 됨

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	list = dao.list(map);
	iter = list.iterator();
	int total = dao.total(map);
	
	String id = request.getParameter("id");
	if (id == null)
		id = (String) session.getAttribute("id");

	String grade = (String) session.getAttribute("grade");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function read(no){
	  var url = "<%=root%>/notice/read.jsp";
	  url += "?no="+no;
	  url+="&col=<%=col%>";
	  url+="&word=<%=word%>";
	  
	  url+="&nowPage=<%=nowPage%>";

		location.href = url;
	}
</script>


<title>Insert title here</title>
</head>
<body>

	<jsp:include page="/menu/top.jsp" />
	<div class="container">
		<h3>공지사항</h3>
		<form class="form-inline" action="./list.jsp">
			<div class="form-group">
				<select class="form-control" name="col">
					<option value="wname"
						<%if (col.equals("wname"))
				out.print("selected");%>>성명</option>
					<option value="title"
						<%if (col.equals("title"))
				out.print("selected");%>>제목</option>
					<option value="content"
						<%if (col.equals("content"))
				out.print("selected");%>>내용</option>
					<option value="title_content"
						<%if (col.equals("title_content"))
				out.print("selected");%>>제목+내용</option>
					<option value="total"
						<%if (col.equals("total"))
				out.print("selected");%>>전체출력</option>
				</select>
			</div>
			<div class="form-group">

				<input type="text" class="form-control" placeholder="Enter 검색어"
					name="word" value="<%=word%>">
			</div>

			<button class="btn btn-default">검색</button>
			
			<%
			if (id != null && grade.equals("A")) {
		%>
			<button type="button" class="btn btn-default"
				onclick="location.href='createForm.jsp' ">등록</button>
				<%}%> 
		</form>


		<div class="container">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>아이디</th>

					</tr>
				</thead>
				<tbody>
					<%
						if (list.size() == 0) {
					%>
					<tr>
						<td colspan="6">등록된 글이 없습니다.</td>
					</tr>
					<%
						} else {
							while (iter.hasNext()) {
								NoticeDTO dto = iter.next();
					%>

					<tr>
						<td><%=dto.getNo()%></td>
						<td><a href="javascript:read('<%=dto.getNo()%>')"><%=dto.getTitle()%></a>
						<%
							if (Utility.compareDay(dto.getWdate())) {
						%>
						<img src="<%=root%>/images/new.gif"></td>
						<%
							}
						%>

						<td><%=dto.getId()%></td>
					</tr>
					<%
						}
						}
					%>

				</tbody>

			</table>
		</div>
		<div>
			<%=Utility.paging(total, nowPage, recordPerPage, col, word)%>
		</div>
	</div>
</body>
</html>