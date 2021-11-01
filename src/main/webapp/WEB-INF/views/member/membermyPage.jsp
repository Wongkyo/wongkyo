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
<title>membermyPage</title>
</head>

<!-- 멤버 탈퇴 스크립트 -->
<script type="text/javascript">
	function del(){
		//탈퇴 취소시 리턴으로 실행취소
		if (!confirm("정말로 탈퇴하시겠습니까?")) {
			alert("탈퇴가 취소되었습니다.");
			 return;
        } else {
        //탈퇴시 딜리트페이지 컨트롤러 실행 멤버 정보 삭제	
        	location.href="./memberDelete"
            alert("탈퇴되었습니다.");     	
        }
	}
</script>
   
 <body>
        <!-- Responsive-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <!-- 멤버 기능 -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    	<!-- 기본 회원정보 이동 -->
                        <li class="nav-item"><a class="nav-link active" href="#!">회원정보</a></li>
                        <!-- 멤버 수정으로 이동 -->
                        <li class="nav-item"><a class="nav-link active" href="./memberUpdate">회원정보수정</a></li>
                        <!-- 회원탈퇴 온클릭으로 스크립트 실행 -->
                        <li class="nav-item"><a class="nav-link active" href="/" onclick="del()">회원탈퇴</a></li>
                        <!-- 상품 등록 페이지로 이동 -->
                        <li class="nav-item"><a class="nav-link active" href="proInsert">상품등록</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
            	
            	<!-- 내정보  -->
                <div class="col-lg-7">
                <!--  회원사진  -->
                <img class="img-fluid rounded mb-4 mb-lg-0" 
                src="../resources/uploadmember/${member.joinFileVO.fileName}" alt="..." 
                 style="max-width: 100%; height: auto;"	/></div>
                <div class="col-lg-5">
			    
			    <!-- 회원정보 리스트 -->     
			    <h5>아이디: ${member.userId}</h5>
				<h5>이름: ${member.name}</h5>
				<h5>핸드폰: ${member.phone}</h5>
				<h5>주소	: ${member.adress}</h5>
				<h5>이메일: ${member.email}</h5>
				<h5>성별: ${member.gender}</h5>
				<h5>생년월일: ${member.birth}</h5>
				
                </div>
            </div>
         </div>
         
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; New Market</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>

</html>