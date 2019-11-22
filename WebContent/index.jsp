<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/menu/top.jsp"></jsp:include>

<div class="container">
  <h3>Welcome my page</h3>
  <p align="middle">
  <iframe width="957" height="538" src="https://www.youtube.com/embed/K5SO9utCez4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
 </p>
 <br>
  <p1 id="hi" >안녕하세요 유경은입니다. 저는 떡볶이를 젤로 좋아합니다.</p1>
  
  
   <form >
    <div class="radio-inline">
      <label><input type="radio" name="optradio" checked>쌀떡볶이</label>
      <img src="image/k1.jpg" class="img-rounded" alt="Cinque Terre" >
    </div>
    <div class="radio-inline">
      <label><input type="radio" name="optradio">밀떡볶이</label>
      <img src="image/k2.jpg" class="img-rounded" alt="Cinque Terre" > 
    </div>
    <div class="radio-inline">
      <label><input type="radio" name="optradio" >유경은쉐프의 떡볶이</label>
       <img src="image/k3.jpg" class="img-rounded" alt="Cinque Terre" > 
    </div>
  </form>
  
  
  
</div>

</body>
</html>