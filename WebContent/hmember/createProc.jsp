<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi/hssi.jsp"%>
<jsp:useBean id = "dto" class="hmember.HmemberDTO"/>
<%
	UploadSave upload = (UploadSave)request.getAttribute("upload");
	dto.setId(upload.getParameter("id"));
	
	dto.setPasswd(upload.getParameter("passwd"));
	dto.setTel(upload.getParameter("tel"));
	dto.setZipcode(upload.getParameter("zipcode"));
	
	//한글로 인코딩 필요
	dto.setMname(UploadSave.encode(upload.getParameter("mname")));
	dto.setAddress1(UploadSave.encode(upload.getParameter("address1")));
	dto.setAddress2(UploadSave.encode(upload.getParameter("address2")));	
	
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int)fileItem.getSize(); //long형이어서 int로 형변환 필요
	
	String fname = UploadSave.saveFile(fileItem, upDir); //storage폴더에 업로드 파일 저장
	
	if(size>0){
		dto.setFname(fname);
	}else{
		dto.setFname("member.jpg");
	}
	
	flag = dao.create(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<div class="well well-lg">
<%
if(flag){
	out.print("회원가입 성공");
}else{
	out.print("회원가입 실패");
}
%>

</div>

<button onclick="location.href='loginForm.jsp'" class="btn btn-default">로그인</button>
<button onclick="location.href='../index.jsp'" class="btn btn-default">홈</button>
</div>
</body>
</html>