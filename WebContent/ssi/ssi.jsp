<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "memo.MemoDTO" %>
<%@ page import="utility.Utility" %>
<%@ page import = "java.util.*" %>
<jsp:useBean id="dao" class="memo.MemoDAO"/>
<%   
String root = request.getContextPath();
	request.setCharacterEncoding("utf-8"); 
	List<MemoDTO> list = null;
	boolean flag = false;
	Iterator<MemoDTO> iter = null;
	
%>
