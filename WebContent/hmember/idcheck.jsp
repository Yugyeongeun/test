<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="hmember.HmemberDAO"/>
<%
String id = request.getParameter("id");

boolean flag = dao.duplicateId(id);
 String str = "";
 if(flag){
	 str=id+"는 중복되어 사용할 수 없습니다.";
 }else{
	 str=id+"는 중복 아님, 사용 가능";
 }
 out.print(str);

%>