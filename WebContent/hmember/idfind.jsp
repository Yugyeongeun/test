<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/hssi.jsp"%>
<%
String mname = request.getParameter("mname");


Map map = new HashMap();
map.put("mname", mname);

String id= dao.Search(map);


if(id != null){
	out.print("아이디는 "+id+"입니다.");
}else{
	out.print("아이디를 찾을 수 없습니다.");
	}

%>
