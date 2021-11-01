<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 자바서버 페이지 표준 태그 라이브러리 사용 -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 폼태그사용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<!-- 헤더 임포트 -->
<c:import url="../fragments/header.jsp"></c:import>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 css 적용 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="css/logcss.css" rel="stylesheet" />
</head>

<body>

<!-- 로그인 스크립트 바생 -->
<script type="text/javascript">
function login(){
		memberLogin.submit();
	}
</script>

<!-- 로그인 페이지 시작 -->
	<div class="sidenav">
		 <!-- 로그인 문구  -->
         <div class="login-main-text">
            <h2>New Market</h2>
            <h2>Login Page</h2>
            <p>Welcome to the our place</p>
         </div>
      </div>
      
      <!--  메인 로그인  -->
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               
               <!-- 멤버가 널일시 실행 -->
               <c:if test="${member == null}">
               <!-- 컨트롤러에서 memberLogin가져오기 post타입 -->
               <form action='<c:url value='/memberLogin'/>' method="post">
					
				  <!-- 아이디 입력 태그 -->	               
                  <div class="form-group">
                     <label>User Id</label>
                     <input id="text" name="userId" class="form-control" placeholder="User Id">
                  </div>
                  
                  <!-- 패스워드 입력 태그 -->
                  <div class="form-group">
                     <label>Password</label>
                     <input id="password" name="userPw" class="form-control" placeholder="Password" type="password">
                  </div>
                 
                 <!-- 공백 -->
                 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                 
                 <!-- 회원가입 페이지로 이동 -->
                 <button type="button" class="btn btn-black" onclick = "location.href = 'memberJoin' ">Join</button>
                  
                  <!-- 멤버 로그인 실행 (온클릭으로 자바스크립트 실행) -->
                 <button type="submit" class="btn btn-black" onclick="login()">Login</button> 
                                   
                </form>  
                </c:if>  
             
            </div>
         </div>
      </div>
        <span id="msg"></span>
		<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>