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
<title>Product Select Page</title>
</head>

<body>

<!-- 상품 삭제 스크립트 -->
<script type="text/javascript">
	function del(){
		// confirm 삭제 or 취소
		if (!confirm("정말로 삭제하시겠습니까?")) {
			alert("삭제가 취소되었습니다.");
			// 취소시 return으로 삭제 이벤트 발생 중지 
			return;
        } else {
        	// 삭제 클릭시 select한 proNum의 번호를 따라가 proDelete controller 실행/ 상품 삭제
        	location.href="./${proDelete}proDelete?proNum=${vo.proNum}"	
            alert("삭제되었습니다.");        	
        }
	}
</script>
	
	<!-- 상품 이름 -->
	<header class="bg-dark py-2">
      <div class="container px-1 px-lg-1 my-1">
        <div class="text-center text-white">
          <h1>${vo.proName}</h1>  
        </div>                
      </div>       
    </header>
      
      <!-- 상품 상세 정보 -->
      <div>
        <table class="table table-hover">
          <thead>
             <tr>
             	<!-- 클릭한 상품의 번호  -->
	    		<th>상품번호 : ${vo.proNum}</th>
	    		<!-- 클릭한 상품의 가격 -->
	    		<th>상품가격: ${vo.proPrice}</th>
	    		<!-- 클릭한 상품의 등록자 -->
	    		<th>상품등록자: ${vo.userId}</th>
			</tr>
		 </thead> 
             
			<tr>
				<!-- 클릭한 상품 이미지 -->
				<th><img class="img-fluid rounded mb-4 mb-lg-0" 
                src="../resources/uploadproduct/${vo.fileName}" alt="..." 
                 style="max-width: 100%; height: auto;"	/></th>
	    		<!-- 클릭한 상품의 정보 -->
	    		<th>상품정보 : ${vo.proInfo}</th>
	    	</tr>
		</table> 
       </div>
       
   <!-- 상품 수정 및 삭제 -->
   <c:catch>
   		<!-- if문 발생 멤버가 관리자 아이디일때만 버튼 출력 -->
		<c:if test="${member.userId eq 'wong'}">
			<!-- 공지사항 이벤트 발생 noNum에 맞는 번호를 공지사항으로 업데이트 -->
			<a href="./${proUpdate}proUpdate?proNum=${vo.proNum}" class="btn btn-danger">Update</a>
			<!-- 공지사항 삭제 버튼 클릭시 온클릭으로 스크립트 발생  -->
			<a href="/proList" class="btn btn-danger" onclick="del()">Delete</a>
		</c:if>
	</c:catch>
       
       
</body>
</html>