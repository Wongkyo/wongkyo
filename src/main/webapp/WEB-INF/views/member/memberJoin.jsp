<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
  <!-- 헤어 가져오기 -->
  <c:import url="../fragments/header.jsp"></c:import>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>New Market 회원가입</title>
  <!--스타일 꾸미기-->
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
		// 이름 입력
	    if($.trim($('#name').val()) == '') {
	        alert("이름을 입력해주세요.");
	        return false;
	    }
		// 아이디 입력
	    if($.trim($('#userId').val()) == '') {
	        alert("아이디를 입력해주세요.");
	        return false;
	    }
		// 비밀번호 입력
	    if($.trim($('#userPw').val()) == '') {
	        alert("비밀번호를 입력해주세요.");
	        return false;
	    }
		// 모두입력시 회원가입 진행
	    if(confirm("회원가입을 하시겠습니까?")){
	        alert("회원가입이 완료되었습니다. 감사합니다.");
	         $("form").submit();    
	    }
		}
 
 
		/* 아이디 중복 체크 : ajax 비동기처리 */
		function idCheck() {	
		    var userId = $("#userId").val();		    
		    if(userId.search(/\s/) != -1) { 
		    	// 아이디 공백시 발생
		        alert("아이디에는 공백이 들어갈 수 없습니다.");        
		    } else {             
		        if(userId.trim().length != 0) {
		            $.ajax({
		                async : true, 
		                type : 'POST', 
		                data: userId,
		                // idCheck controller
		                url: "/idCheck",
		                dataType: "json",
		                contentType: "application/json; charset=UTF-8",
		                success: function(count) {    
		                    if(count > 0) {
		                    	// count 조회해서 아이디가 없으면 0 있으면 1이므로 count가 0보다 크면 아이디 존재
		                        alert("해당 아이디 존재");    
		                        $("#submit").attr("disabled", "disabled");
		                        window.location.reload();
		                    } else {
		                    	// count가 영보다 크지않으므로 아이디 생성 가능
		                        alert("사용가능 아이디");
		                        $("#submit").removeAttr("disabled");
		                    }            
		                },
		                error: function(error) {
		                	// 아이디 입력 하지않았을시 
		                    alert("아이디를 입력해주세요.");
		                }        
		            });
		        } else {
		            alert("아이디를 입력해주세요.");
		        }        
		    }
		}
  </script>

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

</head>

<body>

  <!-- 회원가입 콘테이너 시작 -->	
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <!-- 회원가입 폼! value=register로 회원가입 컨트롤러에서 받아옴 post타입 설정 form-data로 회원사진 파일 추가 -->
        <form class="validation-form" action='<c:url value='/register'/>' method="post" enctype="multipart/form-data" novalidate>
		  <!-- 아이디 입력태그 -->	        
          <div class="mb-3">
            <label for="id">아이디</label>
            <!-- 버튼클릭으로 온클릭 idCheck 발생 자바스크립트로 아이디 중복확인 -->
            <button type="button"  onclick="idCheck()" style="border: 1px solid black;float: right; width: 50px;">확인</button>
            <!-- 아이디 입력폼  -->
            <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디 입력" required >
            <!-- 아이디를 입력하지 않았을 시 발생 -->
            <form:errors path="id" class="c1"></form:errors>
            <div class="form-group" id= idResult></div>
            <div class="invalid-feedback">
              아이디를 입력해주세요.
            </div>            
          </div>
            
          <!-- 패스워드 입력 태그 -->  
          <div class="mb-3">
            <label for="address">패스워드</label>
            <input type="text" class="form-control" name="userPw" id="userPw" placeholder="패스워드 입력" required>
            <div class="invalid-feedback">
              패스워드를 입력해주세요.
            </div>
          </div>
           
          <!-- 이름 입력 태그 -->          
          <div class="mb-3">
            <label for="address">이름</label>
            <input type="text" class="form-control" name="name" id="name" placeholder="이름 입력" required>
            <div class="invalid-feedback">
              이름을 입력해주세요.
            </div>
          </div>
          
          <!-- 핸드폰번호 입력 태그 -->   
		  <div class="mb-3">
		    <label for="address2">핸드폰번호<span class="text-muted">&nbsp;</span></label>
			<input type="text" class="form-control" name="phone" id="phone" placeholder="010-0000-0000" required>
			<div class="invalid-feedback">
              핸드폰번호를 입력해주세요.
            </div>
		  </div>
			
		  <!-- 이메일 입력 태그 -->   		   				   
          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>
            
          <!-- 주소 입력 태그 -->        
          <div class="mb-3">
            <label for="address">주소</label>
            <input type="text" class="form-control" name="adress" id="adress" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
               주소를 입력해주세요.
            </div>
          </div> 

          <div class="row">
           
          <!-- 성별 입력 태그 -->    
          <div class="col-md-4 mb-3">
             <label >성별</label>
             <div class="form-control">
              <input type="radio"  name="gender" value="남성" Checked id="gender">남성 &emsp;
              <input type="radio"  name="gender" value="여성" Checked id="gender">여성 &emsp;
             </div>  
          </div>        
          
          <!-- 생년월일 입력 태그 -->   
          <div class="col-md-4 mb-3">
              <label for="code">생년월일</label>
              <input type="text" class="form-control" name="birth" id="birth" placeholder="8자리 입력" required>
              <div class="invalid-feedback">
                생년월일을 입력해주세요.
              </div>
          </div>
          </div>
         
          <div class="login-input-wrap input-password">
                <i class="fas fa-file"></i>
                <input type="file" placeholder="Photo Registration(Selection)"  id="avatar" name="avatar" >
          </div>
                 
          </form>

          <div class="mb-4"></div>
          <button class="btn btn-dark btn-lg btn-block" type="button" id="submit" disabled="disabled" onclick="registerCheck()">가입 완료</button>
        
   			 </div>
   		 </div>
    </div>
    
    <!-- 푸터 -->  
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; New Market</p>
    </footer>

</body>
</html>