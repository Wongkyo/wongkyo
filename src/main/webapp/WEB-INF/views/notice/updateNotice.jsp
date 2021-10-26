<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 자바서버 페이지 표준 태그 라이브러리 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 폼태그사용 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<!-- 헤더 임포트 -->
<c:import url="../fragments/header.jsp"></c:import>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>공지사항수정</title>
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
 <!-- 수정완료 스크립트 -->
 <script type="text/javascript">
	function noticeUpdate(){
		alert("수정완료!");
	}
</script> 

  <!-- 공지사항 수정 컨테이너 -->	
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto"> 
      	
      	<!-- 공지정보 수정 updateNotice controller 실행 post타입 -->
        <h4 class="mb-3">공지정보수정</h4>
        <form class="validation-form" action="updateNotice"  method="post">
			
		<!-- 공지번호는 select에서 전달받은 값으로 리드온리로 수정불가 값을 주고 밸류값을 noNum삽입 -->
      	<div class="mb-3">
            <label for="id">공지번호</label>
            <input type="text" class="form-control"  name="noNum" readonly="readonly" value="${vo.noNum}"  required >           
        </div>
		
		<!-- 공지사항 제목 수정 -->
		<div class="mb-3">
            <label for="code">공지사항 제목</label>
            <input type="text" class="form-control" value="${vo.title}" name="title" placeholder="제목 입력" required>
		</div>
		
		<!-- 공지사항 내용 수정 -->        
        <div class="mb-3">
            <label for="code">공지사항 내용</label>
            <input type="text" class="form-control" value="${vo.contents}" name="contents" placeholder="내용 입력" required>
		</div>
		
		<!-- 공지사항 수정값 전달 클릭시 noticeUpdate 스크립트 실행 -->
        <div class="mb-4"></div>
        <button class="btn btn-dark btn-lg btn-block" onclick='noticeUpdate()' >수정 완료</button>
        
    	</form>
    	
     </div>
  </div>
</div>
    
    <!-- 푸터 -->
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; New Market</p>
    </footer>
    <!-- 부트스트랩 JS -->
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

</body>
</html>