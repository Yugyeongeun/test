<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/hssi.jsp"%>
<%



String mname = request.getParameter("name");
String id = request.getParameter("id");


Map map = new HashMap();
map.put("mname", mname);
map.put("id", id);


String passwd =dao.Searchpw(map);

if(passwd != null){
	out.print("비밀번호 "+passwd+"입니다.");
}else{
	out.print("비번을 찾을 수 없습니다.");
	}

%>
