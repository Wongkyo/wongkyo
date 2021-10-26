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

  <title>상품정보수정</title>
  
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
</head>

<body>

<!-- 수정완료 스크립트 -->  	
<script type="text/javascript">
	function proUpdate(){
		// 수정 버튼 클릭시 출력
		alert("수정완료!");
	}
</script> 

  <!-- 상품 수정 컨테이너 -->
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
       
		<!-- 상품정보 수정 proUpdate controller 실행 post타입 -->       
        <h4 class="mb-3">상품정보수정</h4>
        <form class="validation-form" action="proUpdate"  method="post">
		
		 <!-- 상품 번호는 수정불가값으로 밸류값으로 proNum을 삽입하고 리드온리로 수정불가하게 만들고 값 입력 -->
      	 <div class="mb-3">
            <label for="id">상품번호</label>
            <input type="text" class="form-control"  name="proNum" readonly="readonly" value="${vo.proNum}"  required >           
         </div>
		
		 <!-- 상품이름 수정 -->
		 <div class="mb-3">
            <label for="code">상품이름</label>
            <input type="text" class="form-control" value="${vo.proName}" name="proName" placeholder="상품이름 입력" required>
		 </div>
        
         <!-- 카테고리 수정  -->
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
		
		 <!-- 상품 정보 수정 -->
		 <div class="mb-3">
            <label for="code">정보</label>
            <input type="text" class="form-control" value="${vo.proInfo}" name="proInfo" placeholder="상품정보 입력" required >
		 </div>
		
		 <!-- 상품 가격 수정 -->
		 <div class="mb-3">
            <label for="code">가격</label>
            <input type="text" class="form-control" value="${vo.proPrice}" name="proPrice" placeholder="상품가격 입력" required >
	 	 </div>
	 	 
	 	 <!-- 상품 수정 버튼 -->
         <div class="mb-4"></div>
         <button class="btn btn-dark btn-lg btn-block" onclick='proUpdate()' >수정 완료</button>
        
    	</form>
   </div>
 </div>
</div>
    
    <!-- 푸터 -->
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; New Market</p>
    </footer>
    
 	<!-- 부트스트랩 -->
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</body>
</html>