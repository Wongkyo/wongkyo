<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 자바서버 페이지 표준 태그 라이브러리 사용 -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 폼태그사용 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<!-- 헤어 임포트 -->
<head>
<c:import url="../fragments/header.jsp"></c:import>
  <!-- 공지사항 작성 틀 -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>New Market 공지사항작성</title>
	
  <!-- 스타일적용 -->	
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
  <!-- 공지 등록 스크립트 -->
  <script type="text/javascript">
	function noticeCheck() {
	// confirm 사용 공지사항 등록 여부확인	
    if(confirm("공지사항을 등록하시겠습니까?")){
        // 예 클릭시 상품 등록 진행 
    	alert("공지사항이 등록되었습니다.");
         $("form").submit();    
     	}
 	 }
  </script>

</head>

<body>

  <!-- 공지사항 등록 컨테이너 -->	
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">공지사항등록</h4>
        <!-- 퐄타입 밸류 insertNotice2 post타입으로 받기 멀티파트 이용해서 사진파일 등록 -->
        <form class="validation-form" action='<c:url value='/insertNotice2'/>' method="post" enctype="multipart/form-data" novalidate>
           
           <!-- 제목 입력 -->
           <div class="mb-3">
              <label for="title">제목</label>
              <input type="text" class="form-control" name="title" id="title">           
           </div>
          
          <!-- 내용 입력 -->
           <div class="mb-3">
              <label for="contents">콘텐츠</label>
              <input type="text" class="form-control" name="contents" id="contents">
  		   </div>
     		
     	   <!-- 사진파일등록 -->	
           <div class="login-input-wrap input-password">
              <i class="fas fa-file"></i>
              <input type="file" id="avatar" name="avatar" >
           </div>
         
         </form>
		  
		  <!-- 공지사항 입력 정보 보내기 온클릭으로 자바스크립트 실행 -->	
          <div class="mb-4"></div>
          <button class="btn btn-dark btn-lg btn-block" type="button" id="submit" onclick="noticeCheck()">공지사항 작성</button>
        
	    	</div>
    	</div>
    </div>

	<!-- 푸터 -->   
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; New Market</p>
    </footer>
    
    <!-- 화면 스크립트 -->
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
		<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>