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
  <title>회원정보수정</title>

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
  
  
</head>

<body>
 <script type="text/javascript">
	function memberUpdate(){
		alert("수정완료!");
	}
</script> 
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원정보수정</h4>
        <form class="validation-form" action="memberUpdate"  method="post" >
        
          <div class="mb-3">
            <label for="id">아이디</label>
            <input type="text" class="form-control"  name="userId" readonly="readonly" value="${member.userId}" placeholder="아이디 입력" required >           
          </div>
        
           <div class="mb-3">
            <label for="address">패스워드</label>
            <input type="password"  class="form-control" name="userPw" value="${member.userPw}" placeholder="패스워드 입력" required>
          </div>
                   
             <div class="mb-3">
            <label for="address">이름</label>
            <input type="text" class="form-control" name="name" value="${member.name}" placeholder="이름 입력" required>
            <div class="invalid-feedback">
              패스워드를 입력해주세요.
            </div>
          </div>
          
		 <div class="mb-3">
		    <label for="address2">핸드폰번호<span class="text-muted">&nbsp;</span></label>
			<input type="text" class="form-control" name="phone" value="${member.phone}" placeholder="010-0000-0000" required>
			<div class="invalid-feedback">
              핸드폰번호를 입력해주세요.
            </div>
			 </div>
				   
				   
          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" name="email" value="${member.email}" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>
          
     
          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" name="adress" value="${member.adress}" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>
 

          <div class="row">
            
             <div class="col-md-4 mb-3">
              <label for="code">성별</label>
              <input type="text" class="form-control" name="gender" value="${member.gender}" placeholder="성별입력" required>
              <div class="invalid-feedback">
                성별을 입력해주세요.
              </div>
            </div>
         
          
            <div class="col-md-4 mb-3">
              <label for="code">생년월일</label>
              <input type="text" class="form-control" name="birth" value="${member.birth}" placeholder="8자리 입력" required>
              <div class="invalid-feedback">
                생년월일을 입력해주세요.
              </div>
            </div>
          </div>

          <div class="mb-4"></div>
          <button class="btn btn-dark btn-lg btn-block" onclick='memberUpdate()'>수정 완료</button>
        
    </form>
    
   
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; New Market</p>
    </footer>

  <script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</body>
</html>