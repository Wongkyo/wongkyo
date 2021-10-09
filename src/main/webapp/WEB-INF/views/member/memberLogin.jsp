<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<c:import url="../fragments/header.jsp"></c:import>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="css/logcss.css" rel="stylesheet" />
</head>
<body>
<script type="text/javascript">
function handleOnClick(){
	var userId = document.getElementById("userId").value; // userid 의 값을 받아와 넣음.
    var userPw = document.getElementById("userPw").value; // userpw 의 값을 받아와 넣음.


    if(userId == ${member.userId} && userPw == ${member.userPw}) {
      alert("로그인 성공");
      console.log("로그인 성공했습니다.");
    } else {
      alert("로그인 실패");
      console.log("로그인 실패했습니다.");
    }

}
</script>

<div class="sidenav">
         <div class="login-main-text">
            <h2>New Market</h2>
            <h2>Login Page</h2>
            <p>Welcome to the our place</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               
               <c:if test="${member == null}">
               <form action='<c:url value='/memberLogin'/>' method="post">
               
                  <div class="form-group">
                     <label>User Id</label>
                     <input id="userId" name="userId" class="form-control" placeholder="User Id">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input id="userPw" name="userPw" class="form-control" placeholder="Password">
                  </div>
                  
                     
                  &nbsp;
                  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                  
                  <button type="submit" class="btn btn-black">Join</button>
                  
                  <button type="submit" class="btn btn-black">Login</button> 
                  
                  
                </form>  
                </c:if>  
                  
                  
               
                  

              	
              
              
            </div>
         </div>
      </div>

</body>
</html>