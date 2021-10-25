<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>


<!DOCTYPE html>
<html>
<c:import url="../fragments/header.jsp"></c:import>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>New Market 회원가입</title>

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;

  
      background-color: black;
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
 
 <script type="text/javascript">
/* 회원가입 유효성 체크 */
function registerCheck() {
 
 
    if(confirm("상품을 등록하시겠습니까?")){
        alert("상품이 등록되었습니다. 감사합니다.");
         $("form").submit();    
    }
}
 

</script>
 
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">상품등록</h4>
        <form class="validation-form" action='<c:url value='/proInsert2'/>' method="post" enctype="multipart/form-data" novalidate>
        
        
          <div class="mb-3">
            <label for="id">아이디</label>           
            <input type="text" class="form-control" name="userId" id="userId" value="${member.userId}" readonly="readonly">                    
          </div>
    
            
            <div class="mb-3">
            <label for="address">상품명</label>
            <input type="text" class="form-control" name="proName" id="proName">
           
          </div>
          
          <div class="mb-3">
            <label>카테고리</label>
            <div class="form-control">
            <input type="radio"  name="proCategory" value="가전" Checked id="proCategory">가전 &emsp;
			<input type="radio" name="proCategory" value="의류" Checked id="proCategory">의류&emsp;
			<input type="radio"  name="proCategory" value="생필품" Checked id="proCategory">생필품&emsp;
			<input type="radio"  name="proCategory" value="잡화" Checked id="proCategory">잡화&emsp;
			<input type="radio" name="proCategory" value="음식" Checked id="proCategory">음식&emsp;
			</div>
          </div>
          
          <div class="mb-3">
            <label for="address">상품정보</label>
            <input type="text" class="form-control" name="proInfo" id="proInfo">
           
          </div>
          
          <div class="mb-3">
            <label for="address">상품가격</label>
            <input type="text" class="form-control" name="proPrice" id="proPrice">
           
          </div>
           

         
          <div class="login-input-wrap input-password">
                        <i class="fas fa-file"></i>
                        <input type="file" id="avatar" name="avatar" >
                    </div>
         


         
         
          </form>
          
    
          <div class="mb-4"></div>
          <button class="btn btn-dark btn-lg btn-block" type="button" id="submit" onclick="registerCheck()">상품 등록 완료</button>
        
    </div>
    </div>
    </div>
    
    
   
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; New Market</p>
    </footer>


</body>
</html>