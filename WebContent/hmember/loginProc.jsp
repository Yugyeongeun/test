<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file ="/ssi/hssi.jsp" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("passwd"); //name의 값으로 읽어야해 pw 아님.

	Map map = new HashMap();
	map.put("id", id);
	map.put("pw", pw); //dao에서  pw로 받았기 때문에
	
	flag = dao.loginCheck(map); //true or false 받아오기 
	
	//회원인 사람들이 보는 페이지 =! 회원이 아닌 사람들이s 보는페이지
	if(flag){
		String grade = dao.getGrade(id);
		session.setAttribute("id", id);//set으로 저장	/저장한 아이디가 내가 쓴 아이디랑 같은지 확인
		session.setAttribute("grade", grade);
		
		
		//Cookie 저장 , Checkbox는 선택하지 않으면 null임
		 Cookie cookie = null; 
         
	      String c_id = request.getParameter("c_id"); // Y, 아이디 저장 여부 
	      String c_pw = request.getParameter("c_pw");
	         
	      if (c_id != null){  // 처음에는 값이 없음으로 null 체크로 처리
	        cookie = new Cookie("c_id", "Y");    // 아이디 저장 여부 쿠키 
	        cookie.setMaxAge(120);               // 2 분 유지 
	        response.addCookie(cookie);          // 쿠키 기록 
	     
	        cookie = new Cookie("c_id_val", id); // 아이디 값 저장 쿠키  
	        cookie.setMaxAge(120);               // 2 분 유지 
	        response.addCookie(cookie);          // 쿠키 기록  
	           
	      }else{ 
	        cookie = new Cookie("c_id", "");     // 쿠키 삭제 
	        cookie.setMaxAge(0); 
	        response.addCookie(cookie); 
	           
	        cookie = new Cookie("c_id_val", ""); // 쿠키 삭제 
	        cookie.setMaxAge(0); 
	        response.addCookie(cookie); 
	      
		}
	      
	      if (c_pw != null){  // 처음에는 값이 없음으로 null 체크로 처리
		        cookie = new Cookie("c_pw", "M");    // 아이디 저장 여부 쿠키 
		        cookie.setMaxAge(120);               // 2 분 유지 
		        response.addCookie(cookie);          // 쿠키 기록 
		     
		        cookie = new Cookie("c_pw_val", pw); // 아이디 값 저장 쿠키  
		        cookie.setMaxAge(120);               // 2 분 유지 
		        response.addCookie(cookie);          // 쿠키 기록  
		           
		      }else{ 
		        cookie = new Cookie("c_pw", "");     // 쿠키 삭제 
		        cookie.setMaxAge(0); 
		        response.addCookie(cookie); 
		           
		        cookie = new Cookie("c_pw_val", ""); // 쿠키 삭제 
		        cookie.setMaxAge(0); 
		        response.addCookie(cookie); 
		      
			}
	
	}
	
%>
<!DOCTYPE html>

<html>
<head>
  <title>로그인 처리</title>
  <meta charset="utf-8">
  </head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="container">
	<h1 class="col-sm-offset-2 col-sm-10">로그인 처리</h1>
	<div class="well well-lg">
	<%
		if(flag){
			out.print("로그인 성공");
		}else{
			out.print("아이디 or 비밀번호를 잘못입력하셨거나 <br> ");
			out.print("회원아님. 회원가입바람");
		}
	%>	
	</div>
		<button class="btn btn-default" onclick="location.href='../index.jsp'">홈</button>
		<button class="btn btn-default" onclick="history.back()">다시시도</button>
</div>
</body>
</html>




