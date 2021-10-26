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
  
<title>회원정보수정</title>

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
	function memberUpdate(){
		alert("수정완료!");
	}
</script> 

  <!-- 회원정보수정 컨테이너 시작!! -->	
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
      	<!-- 회원정보 폼 memberUpdate 컨트롤러 실행 post타입 멀티파트로 사진데이터 받기(미구현) -->
        <h4 class="mb-3">회원정보수정</h4>
        <form class="validation-form" action="memberUpdate"  method="post" enctype="multipart/form-data" >
        
          <!-- 아이디입력 폼 아이디는 수정불가(리드온리) 밸류로 멤버아이디값 주입! -->	 
          <div class="mb-3">
            <label for="id">아이디</label>
            <input type="text" class="form-control"  name="userId" readonly="readonly" value="${member.userId}" placeholder="아이디 입력" required >           
          </div>
        
          <!-- 패스워드 입력 폼  -->
          <div class="mb-3">
            <label for="address">패스워드</label>
            <input type="password"  class="form-control" name="userPw" value="${member.userPw}" placeholder="패스워드 입력" required>
          </div>
                
          <!-- 이름 입력 폼 -->         
          <div class="mb-3">
            <label for="address">이름</label>
            <input type="text" class="form-control" name="name" value="${member.name}" placeholder="이름 입력" required> 
          </div>
         
         <!-- 핸드폰 입력 폼 --> 
		 <div class="mb-3">
		    <label for="address2">핸드폰번호<span class="text-muted">&nbsp;</span></label>
			<input type="text" class="form-control" name="phone" value="${member.phone}" placeholder="010-0000-0000" required>
         </div>
				
		<!-- 이메일 입력 폼 -->		   
   		 <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" name="email" value="${member.email}" placeholder="you@example.com" required>  
         </div>
               
         <!-- 주소 입력 폼 -->      
         <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" name="adress" value="${member.adress}" placeholder="서울특별시 강남구" required>
          </div>

         <!-- 성별 입력 폼 -->    
         <div class="col-md-4 mb-3">
             <label >성별</label>
             <div class="form-control">
              <input type="radio"  name="gender" value="남성" Checked id="gender">남성 &emsp;
              <input type="radio"  name="gender" value="여성" Checked id="gender">여성 &emsp;
             </div>  
         </div>        
          
          <!-- 생년월일 입력 폼 -->   
          <div class="col-md-4 mb-3">
              <label for="code">생년월일</label>
              <input type="text" class="form-control" name="birth" id="birth" placeholder="8자리 입력" required>
          </div>   
   
		 </form>  
        </div>
    </div>
         	<!-- 멤버 사진 파일(미구현) -->
            <div class="login-input-wrap input-password">
                 <i class="fas fa-file"></i>
                 <input type="file" placeholder="Photo Registration(Selection)"  id="avatar" name="avatar" >
            </div>

         <div class="mb-4"></div>
         <!-- 멤버 수정 버튼 (온클릭으로 스크립트 실행) -->
         <button class="btn btn-dark btn-lg btn-block" onclick='memberUpdate()'>수정 완료</button>

    </div>

	<!-- 푸터 -->
   <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; New Market</p>
   </footer>
    
    <!-- 제이쿼리 받아오기 -->
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
  
</body>
</html>