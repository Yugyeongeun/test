<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import = "hmember.HmemberDTO" %>
<%@ page import="utility.*" %>
<%@ page import = "java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<jsp:useBean id="dao" class="hmember.HmemberDAO"/>

<%
	String root = request.getContextPath();
	request.setCharacterEncoding("utf-8"); 
	List<HmemberDTO> list = null;
	boolean flag = false;
	Iterator<HmemberDTO> iter = null;
	
	String upDir = application.getRealPath("/hmember/storage");
	String tempDir = application.getRealPath("/hmember/temp");
%>
