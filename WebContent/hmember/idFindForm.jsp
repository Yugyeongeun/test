<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/ssi/bssi.jsp"%>


<!DOCTYPE html>

<html>
<head>
  <title>아이디 찾기</title>
  <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="./ajaxError.js"></script>
  <script type="text/javascript">
	function idfind(){
		var mname = $("#mname").val();
		
	var url = "idfind.jsp";
		var param = "mname="+mname;
		
		$.get(url, param, function(data, textStatus){
			$("#idfind").text(data);
		})
}

  
  </script>
  
  </head>
<body>
<div class="container">
	<h1 class="col-sm-offset-2 col-sm-10">아이디 찾기</h1>
	<form class="form-horizontal" >
		<div class="form-group">
			<label class="control-label col-sm-2" for="mname">이름을 입력해주세요</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="mname" placeholder="Enter 이름" 
				 value="관리자1" name="mname" required="required">
			</div>
		</div>
		
		

		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button type="button" class="btn btn-default" onclick="idfind()">Submit</button>
				<button type="button" class="btn btn-default" onclick="history.back()">취소</button>
			</div>
		</div>
<div id="idfind"></div>
		
	</form>
</div>
</body>
</html>