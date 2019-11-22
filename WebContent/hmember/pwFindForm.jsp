<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/hssi.jsp"%>
<!DOCTYPE html>

<html>
<head>
  <title>비번 폼</title>
  <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
function pwfind(){
	var mname = $("#mname").val();
	
var url = "pwfind.jsp";
	var param = "mname="+mname;
	
	$.get(url, param, function(data, textStatus){
		$("#pwfind").text(data);
	})
}
</script>
  </head>
<body>

<div class="container">
	<h1 class="col-sm-offset-2 col-sm-10">아이디 찾기</h1>
	<form class="form-horizontal" 
			>
			
			<div class="form-group">
			<label class="control-label col-sm-2" for="pwd">Id를을 입력하세요:</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="id" value="user3" name="id">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="name">이름을입력하세요</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="name" value="우디" name="name">
			</div>
		</div>
		
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button type="button" class="btn btn-default" onclick="pwfind">Submit</button>
				<button class="btn btn-default" onclick="history.back()">다시시도</button>
			</div>
		</div>
		<div id="pwfind"></div>
	</form>
</div>
</body>
</html>