<%@ page contentType="text/html; charset=UTF-8" %>

<% 
  	request.setCharacterEncoding("utf-8"); 
	String root=request.getContextPath();
	
	String id = (String)session.getAttribute("id");
	
	String grade =(String)session.getAttribute("grade");
	
	String str ="";
	if(id!=null && grade.equals("A")){
		str="관리자페이지 입니다.";
	}else if(id!=null && !grade.equals("A")){
		str = "안녕하세요"+id+"님@.@";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="ajaxError.js"></script>
<title>Insert title here</title>
<style type="text/css">

@import url('https://fonts.googleapis.com/css?family=Do+Hyeon|Nanum+Pen+Script&display=swap&subset=korean');
#hi{
background-color: #FAF4C0;
}
*{

font-family: 'Nanum Pen Script', cursive;
//font-family: 'Do Hyeon', sans-serif;
font-size: 25px;
}
h1{
color:green;
font-size: 45px;
}

</style>
</head>
<body>
<nav class="navbar navbar-inverse" style="background: white;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand"  href="<%=root%>/hmember/list.jsp">떡볶이</a>
    </div>
    <ul class="nav navbar-nav"  >
     <li class = "active"> <a href="<%=root%>/index.jsp"> home </a> </li>
      <li class = "dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">메모<span class = "caret"> </span> </a>
      <ul class = "dropdown-menu">
        <li> <a href="<%=root%>/memo/list.jsp">메모목록</a> </li>
        <li> <a href="<%=root%>/memo/createForm.jsp">메모생성</a> </li>                          
      </ul>
    </li>
    
      
    
    <li class="dropdown"> 
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판<span class = "caret"> </span> </a> 
    <ul class="dropdown-menu">
   		<li> <a href="<%=root%>/guest/list.jsp">게시판 목록</a></li>
   	 	<li> <a href="<%=root%>/guest/createForm.jsp">게시판 생성</a></li>
    	</ul>
   	</li>
    
    <li> <a href="<%=root%>/notice/list.jsp">공지사항<span class = "caret"> </span></a> </li>
   <%if(id==null){ %>
    <li> <a href="<%=root%>/hmember/agreement.jsp"> 회원가입 </a> </li>
    <li> <a href="<%=root%>/hmember/loginForm.jsp"> 로그인 </a> </li>
    
    <%}else{%>
    <li> <a href="<%=root%>/hmember/read.jsp"> 나의정보 </a> </li>
    <li> <a href="<%=root%>/hmember/updateForm.jsp"> 회원수정 </a> </li>
    <li> <a href="<%=root%>/hmember/logout.jsp"> 로그아웃 </a> </li>
    <%} %>
  
  <%   if(id!=null && grade.equals("A")){%>
    <li> <a href="<%=root%>/admin/list.jsp">회원목록</a></li>
     <%} %>
  </ul>   
  
    
    <ul class="nav navbar-nav navbar-right">
      <li><a href="<%=root%>/admin/list.jsp"><span class="glyphicon glyphicon-user"></span> 회원목록</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>

<!-- 상단 메뉴-->
<div class = "container">
 
  <div class = "page-header row">  
   <div class = "col-sm-4">
    <img src = "<%=root%>/images/dd.jpg" class="img 응답 img-thumbnail"alt = "Cinque Terre">
   </div>
   
   <div class = "col-sm-8"> <h1> ▶유경은 홈페이지 만드는중 ◀ </h1> </div>     
      <p id="grade" ><%=str %></p>
  </div>
  
 
   
 
</div> 

</body>
</html>
