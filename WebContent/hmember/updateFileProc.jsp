<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@include file="/ssi/hssi.jsp" %>
<jsp:useBean id = "dto" class="hmember.HmemberDTO"/>
<%
UploadSave upload = new UploadSave(request,-1,-1,tempDir);

String id = upload.getParameter("id");
String oldfile = UploadSave.encode( upload.getParameter("oldfile"));

FileItem fileItem = upload.getFileItem("fname");

if(oldfile!=null && !oldfile.equals("member.jpg")){
	UploadSave.deleteFile(upDir, oldfile); //원본파일 지움
}
String fname = UploadSave.saveFile(fileItem,upDir);

Map map = new HashMap();
map.put("id",id);
map.put("fname",fname);

flag=dao.updateFile(map);
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>memo</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<h1 class="col-sm-offset col-sm-10">사진수정</h1>
<div class="well well-lg">
<%
if(flag){
	out.print("사진수정 성공");
}else{
	out.print("사진수정 실패");
}
%>
</div>
<button class="btn btn-default" onclick="location.href='read.jsp?id=<%=id%>'">나의정보</button>
<button class="btn" onclick="history.back()">다시시도</button>

</div>
</body>
</html>