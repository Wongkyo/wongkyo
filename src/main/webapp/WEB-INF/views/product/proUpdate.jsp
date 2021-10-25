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
  <title>상품정보수정</title>

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
	function proUpdate(){
		alert("수정완료!");
	}
</script> 


  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">상품정보수정</h4>
        <form class="validation-form" action="proUpdate"  method="post">

      	 	<div class="mb-3">
            <label for="id">상품번호</label>
            <input type="text" class="form-control"  name="proNum" readonly="readonly" value="${vo.proNum}"  required >           
          </div>
		
		<div class="mb-3">
            <label for="code">상품이름</label>
            <input type="text" class="form-control" value="${vo.proName}" name="proName" placeholder="상품이름 입력" required>
		</div>
        
        <div class="mb-3">
            <label for="code">카테고리</label>
            <input type="text" class="form-control" value="${vo.proCategory}" name="proCategory" placeholder="카테고리 입력" required>
		</div>
		
		<div class="mb-3">
            <label for="code">정보</label>
            <input type="text" class="form-control" value="${vo.proInfo}" name="proInfo" placeholder="상품정보 입력" required >
		</div>
		
		<div class="mb-3">
            <label for="code">가격</label>
            <input type="text" class="form-control" value="${vo.proPrice}" name="proPrice" placeholder="상품가격 입력" required >
		</div>
          <div class="mb-4"></div>
          <button class="btn btn-dark btn-lg btn-block" onclick='proUpdate()' >수정 완료</button>
        
    </form>
    </div>
    </div>
    </div>
    
   
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