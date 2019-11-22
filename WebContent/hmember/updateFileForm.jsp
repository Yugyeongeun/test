<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
<%@ include file="/ssi/hssi.jsp"%>
<%
String id = request.getParameter("id");
String oldfile = request.getParameter("oldfile");
%>
<!DOCTYPE html> 
<html> 
<head>
  <title>사진수정</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body> 
<jsp:include page="/menu/top.jsp"/>
<div class="container">
<h1 class="col-sm-offset-2 col-sm-10">사진수정</h1>
<form class="form-horizontal" 
      action="updateFileProc.jsp"
      method="post"
      enctype="multipart/form-data"
      >
<input type="hidden" name="id" value="<%=id %>">
<input type="hidden" name="oldfile" value="<%=oldfile %>">

  <div class="form-group">
    <label class="control-label col-sm-2" for="oldfile">원본파일</label>
    <div class="col-sm-6">
           <img src="<%=root %>/hmember/storage/<%=oldfile %>" class="img-rounded" width="200px" height="200px">
   
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="fname">변경파일</label>
    <div class="col-sm-6">
    <input type="file" name="fname" class="form-control" 
    accept=".png,.jpg,.gif" required="required">
    </div>
  </div>
  
   <div class="form-group">
   <div class="col-sm-offset-2 col-sm-5">
    <button class="btn">수정</button>
    <button type="button" class="btn" onclick="history.back()">취소</button>
   </div>
 </div>
</form>
</div>
</body> 
</html> 
 