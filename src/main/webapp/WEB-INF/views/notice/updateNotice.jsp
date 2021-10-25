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
  <title>공지사항수정</title>

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
	function noticeUpdate(){
		alert("수정완료!");
	}
</script> 


  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">상품정보수정</h4>
        <form class="validation-form" action="updateNotice"  method="post">

      	 	<div class="mb-3">
            <label for="id">공지번호</label>
            <input type="text" class="form-control"  name="noNum" readonly="readonly" value="${vo.noNum}"  required >           
          </div>
		
		<div class="mb-3">
            <label for="code">공지사항 제목</label>
            <input type="text" class="form-control" value="${vo.title}" name="title" placeholder="제목 입력" required>
		</div>
        
        <div class="mb-3">
            <label for="code">공지사항 내용</label>
            <input type="text" class="form-control" value="${vo.contents}" name="contents" placeholder="내용 입력" required>
		</div>
		
	
          <div class="mb-4"></div>
          <button class="btn btn-dark btn-lg btn-block" onclick='noticeUpdate()' >수정 완료</button>
        
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