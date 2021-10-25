<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
   
    <c:import url="../fragments/header.jsp"></c:import>
<head>
<meta charset="UTF-8">
<title>membermyPage</title>

<body>
<script type="text/javascript">
	function del(){
		if (!confirm("정말로 탈퇴하시겠습니까?")) {
			alert("탈퇴가 취소되었습니다.");
			 return;
        } else {
        	location.href="./memberDelete"
            alert("탈퇴되었습니다.");
        	
        }
	}
</script>
 </head>
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" href="#!">회원정보</a></li>
                        <li class="nav-item"><a class="nav-link active" href="./memberUpdate">회원정보수정</a></li>
                        <li class="nav-item"><a class="nav-link active" href="" onclick="del()">회원탈퇴</a></li>
                        <li class="nav-item"><a class="nav-link active" href="proInsert">상품등록</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
            
                <div class="col-lg-7">
                <img class="img-fluid rounded mb-4 mb-lg-0" 
                src="../resources/uploadmember/${member.joinFileVO.fileName}" alt="..." 
                 style="max-width: 100%; height: auto;"	/></div>
                <div class="col-lg-5">
                 
    <h5>아이디: ${member.userId}</h5>
	<h5>비밀번호: ${member.userPw}</h5>
	<h5>이름: ${member.name}</h5>
	<h5>핸드폰: ${member.phone}</h5>
	<h5>주소	: ${member.adress}</h5>
	<h5>이메일: ${member.email}</h5>
	<h5>성별: ${member.gender}</h5>
	<h5>생년월일: ${member.birth}</h5>
	

	
	
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



</body>
</html>