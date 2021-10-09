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
    if($.trim($('#name').val()) == '') {
        alert("이름을 입력해주세요.");
        return false;
    }
    if($.trim($('#userId').val()) == '') {
        alert("아이디를 입력해주세요.");
        return false;
    }
    if($.trim($('#userPw').val()) == '') {
        alert("비밀번호를 입력해주세요.");
        return false;
    }
 
    if(confirm("회원가입을 하시겠습니까?")){
        alert("회원가입이 완료되었습니다. 감사합니다.");
         $("form").submit();    
    }
}
 
 
/* 아이디 중복 체크 : ajax 비동기처리 */
function idCheck() {
    
    var userId = $("#userId").val();
    
    if(userId.search(/\s/) != -1) { 
        alert("아이디에는 공백이 들어갈 수 없습니다.");        
    } else {             
        if(userId.trim().length != 0) {
            $.ajax({
                async : true, 
                type : 'POST', 
                data: userId,
                url: "/idCheck",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                success: function(count) {    
                    if(count > 0) {
                        alert("해당 아이디 존재");    
                        $("#submit").attr("disabled", "disabled");
                        window.location.reload();
                    } else {
                        alert("사용가능 아이디");
                        $("#submit").removeAttr("disabled");
                    }            
                },
                error: function(error) {
                    alert("아이디를 입력해주세요.");
                }        
            });
        } else {
            alert("아이디를 입력해주세요.");
        }        
    }
}
</script>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" action='<c:url value='/register'/>' method="post" novalidate>
        
          <div class="mb-3">
            <label for="id">아이디</label>
            <button type="button"  onclick="idCheck()" style="border: 1px solid black;float: right; width: 50px;">확인</button>
            <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디 입력" required >
            <form:errors path="id" class="c1"></form:errors>
            <div class="form-group" id= idResult></div>
            <div class="invalid-feedback">
              아이디를 입력해주세요.
            </div>
            
          </div>
        
        
         
            
            <div class="mb-3">
            <label for="address">패스워드</label>
            <input type="text" class="form-control" name="userPw" id="userPw" placeholder="패스워드 입력" required>
            <div class="invalid-feedback">
              패스워드를 입력해주세요.
            </div>
          </div>
          
          
             <div class="mb-3">
            <label for="address">이름</label>
            <input type="text" class="form-control" name="name" id="name" placeholder="이름 입력" required>
            <div class="invalid-feedback">
              패스워드를 입력해주세요.
            </div>
          </div>
          
		 <div class="mb-3">
		    <label for="address2">핸드폰번호<span class="text-muted">&nbsp;</span></label>
			<input type="text" class="form-control" name="phone" id="phone" placeholder="010-0000-0000" required>
			<div class="invalid-feedback">
              핸드폰번호를 입력해주세요.
            </div>
			 </div>
				   
				   
          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>
          
     
          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" name="adress" id="adress" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>
 

          <div class="row">
            
             <div class="col-md-4 mb-3">
              <label for="code">성별</label>
              <input type="text" class="form-control" name="gender" id="gender" placeholder="성별입력" required>
              <div class="invalid-feedback">
                성별을 입력해주세요.
              </div>
            </div>
         
          
            <div class="col-md-4 mb-3">
              <label for="code">생년월일</label>
              <input type="text" class="form-control" name="birth" id="birth" placeholder="8자리 입력" required>
              <div class="invalid-feedback">
                생년월일을 입력해주세요.
              </div>
            </div>
          </div>
         
          </form>
          
    
          <div class="mb-4"></div>
          <button class="btn btn-dark btn-lg btn-block" type="button" id="submit" disabled="disabled" onclick="registerCheck()">가입 완료</button>
        
    
    
   
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