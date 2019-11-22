<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "guestbook.GuestDTO" %>
<%@ page import="utility.Utility" %>
<%@ page import = "java.util.*" %>
<jsp:useBean id="dao" class="guestbook.GuestDAO"/>

<%
	String root = request.getContextPath();
	request.setCharacterEncoding("utf-8"); 
	List<GuestDTO> list = null;
	boolean flag = false;
	Iterator<GuestDTO> iter = null;
%>
