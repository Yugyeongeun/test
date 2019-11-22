<%@ page contentType="text/html; charset=UTF-8" %>

<% 
  request.setCharacterEncoding("utf-8"); 
%>
<!DOCTYPE html>

<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
 <nav class="navbar navbar-inverse" style="background: coral;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Hello</a>
    </div>
    <ul class="nav navbar-nav"  style="background: coral;">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">menu1<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">떡복이</a></li>
          <li><a href="#">피자</a></li>
          <li><a href="#">치킨</a></li>
        </ul>
      </li>
      <li><a href="#">menu2</a></li>
      <li><a href="#">menu3</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>
  

  
  <!-- 상단메뉴 -->
<div class="container">

	<div class="page-hearder row">
		<div class="col-sm-4">
			<img src="menu/images/img2.jpg" class="img-responsive img-thumbnail" alt="Cinque Terre">
		</div>
	<div class="col-sm-8"><h1>HomePage</h1></div>		
		</div>
	<ul class="nav nav-tabs">
		<li class="active"><a href="#">Home</a></li>
		<li class="dropdown">
			<a class="dropdown-toggle" date-toggle="dropdown" href="#">Menu 1<span class="caret"></span></a>
	<ul class="dropdown-menu">
		<li><a href="#">Submenu 1-1</a></li>
		<li><a href="#">Submenu 1-2</a></li>
		<li><a href="#">Submenu 1-3</a></li>
	</ul>
	</li>
		<li><a href="#">Menu 2</a></li>
		<li><a href="#">Menu 3</a></li>
	</ul>
</div>
  
   <form >
    <div class="radio-inline">
      <label><input type="radio" name="optradio" checked>쌀떡볶이</label>
      <img src="k1.jpg" class="img-rounded" alt="Cinque Terre" >
    </div>
    <div class="radio-inline">
      <label><input type="radio" name="optradio">밀떡볶이</label>
      <img src="k2.jpg" class="img-rounded" alt="Cinque Terre" > 
    </div>
    <div class="radio-inline">
      <label><input type="radio" name="optradio" >유경은쉐프의 떡볶이</label>
       <img src="k3.jpg" class="img-rounded" alt="Cinque Terre" > 
    </div>
  </form>
  
  
   <form>
    <div class="form-group">
      <label for="comment">Comment:</label>
      <textarea class="form-control" rows="5" id="comment"></textarea>
    </div>
  </form>
  
</div>
 
</body>
</html>