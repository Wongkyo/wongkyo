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

function noticeCheck() {
 
 
    if(confirm("공지사항을 등록하시겠습니까?")){
        alert("공지사항이 등록되었습니다.");
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
        <form class="validation-form" action='<c:url value='/insertNotice2'/>' method="post" enctype="multipart/form-data" novalidate>
        
        
    
            
            <div class="mb-3">
            <label for="address">제목</label>
            <input type="text" class="form-control" name="title" id="title">
           
          </div>
          
             <div class="mb-3">
            <label for="address">콘텐츠</label>
            <input type="text" class="form-control" name="contents" id="contents">
           
          </div>
           

         
          <div class="login-input-wrap input-password">
                        <i class="fas fa-file"></i>
                        <input type="file" id="avatar" name="avatar" >
                    </div>
         


         
         
          </form>
          
    
          <div class="mb-4"></div>
          <button class="btn btn-dark btn-lg btn-block" type="button" id="submit" onclick="noticeCheck()">공지사항 작성</button>
        
    </div>
    </div>
    </div>
    
    
   
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; New Market</p>
    </footer>


</body>
</html>