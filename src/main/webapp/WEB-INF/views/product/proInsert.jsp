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
  
  <title>New Market 상품등록</title>
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
	//회원가입 유효성 체크 
	function proInsert() {
	// confirm 사용 상품 등록 여부 확인
    if(confirm("상품을 등록하시겠습니까?")){
        // 예 클릭시 상품 등록 진행
    	alert("상품이 등록되었습니다. 감사합니다.");
         $("form").submit();    
    	}
	}
</script>
</head>

<body>
  <!-- 상품 등ㄺ 컨테이너 -->
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">상품등록</h4>
        <!-- 폼타입 밸류는 proInsert2  post 타입으로 멀티파트를 이용해서 사진파일 등록 -->
        <form class="validation-form" action='<c:url value='/proInsert2'/>' method="post" enctype="multipart/form-data" novalidate>
        
          <!-- 아이디 입력 -->
          <div class="mb-3">
            <label for="id">아이디</label>           
         	<!-- 상품을 등록할 시에는 항상 로그인상태로 들어와야하기 때문에 member.userId를 밸류값을 주고 리드온리 속성을 주어서 
         	멤버가 로그인하고 그 아이디로 상품이 저장되게 끔 구현 -->
            <input type="text" class="form-control" name="userId" id="userId" value="${member.userId}" readonly="readonly">                    
          </div>
               
          <!-- 상품명 입력 -->
          <div class="mb-3">
            <label for="address">상품명</label>
            <input type="text" class="form-control" name="proName" id="proName">
          </div>
          
          <!-- 인풋타입을 라디오로 줘서 5가지 카테고리중 택1을 할수있도록 설정 -->
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
          
          <!-- 상품 상세 정보 입력 -->
          <div class="mb-3">
            <label for="address">상품정보</label>
            <input type="text" class="form-control" name="proInfo" id="proInfo">           
          </div>
          
          <!-- 상품 가격 입력 -->
          <div class="mb-3">
            <label for="address">상품가격</label>
            <input type="text" class="form-control" name="proPrice" id="proPrice">          
          </div>
		  
		  <!-- 상품 사진 파일 등록 -->      
          <div class="login-input-wrap input-password">
            <i class="fas fa-file"></i>
            <input type="file" id="avatar" name="avatar" >
          </div>
         
         </form>
          
          <!-- 상품 등록 버튼 클릭시 스크립트 발생 -->    
          <div class="mb-4"></div>
          <button class="btn btn-dark btn-lg btn-block" type="button" id="submit" onclick="proInsert()">상품 등록 완료</button>
        
  	   </div>
   </div>
</div>
    
    <!-- 부트스트랩 js 사용 -->
    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
    
    <!-- 푸터 -->
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; New Market</p>
    </footer>
  		 <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
 
</body>
</html>