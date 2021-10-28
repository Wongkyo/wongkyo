<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 자바서버 페이지 표준 태그 라이브러리 사용 -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 폼태그사용 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 헤더 임포트 -->
<c:import url="../fragments/header.jsp"></c:import>
</head>

<body>
	<!--  추후 어드민에서 관리할 사항 -->
	
	<header class="bg-dark py-2">
            <div class="container px-1 px-lg-1 my-1">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">New Market Member List</h1>                    
                </div>
            </div>
    </header>
	<br><br>
	<div class="container">
		<div>
				<table class="table table-hover">
					<thead class="thead">
						<tr class="row100 head">
							<th scope="col" class="text-center">아이디</th>
							<th scope="col" class="text-center">패스워드</th>
							<th scope="col" class="text-center">이름</th>
							<th scope="col" class="text-center">성별</th>
							<th scope="col" class="text-center">핸드폰</th>
							<th scope="col" class="text-center">주소</th>
							<th scope="col" class="text-center">이메일</th>
							<th scope="col" class="text-center">생년월일</th>
				
						</tr>
					</thead>

					<tbody class="tbody">
						<c:forEach items="${list}" var="data">
							<tr class="row100 body">

								<td scope="col" class="text-center">${data.userId}</td>
								<td scope="col" class="text-center">${data.userPw}</td>
								<td scope="col" class="text-center">${data.name}</td>
								<td scope="col" class="text-center">${data.gender}</td>
								<td scope="col" class="text-center">${data.phone}</td>
								<td scope="col" class="text-center">${data.adress}</td>
								<td scope="col" class="text-center">${data.email}</td>
								<td scope="col" class="text-center">${data.birth}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			<!-- 페이징 시작 -->		
	<div style="float: right; color: black;" >
		<ul class="paging" >
			<!-- 이전버튼 -->
		    <c:if test="${paging.prev}">
		        <span><a href='<c:url value="/memberList?page=${paging.startPage-1}"/>'>이전</a></span>
		    </c:if>
		    <!-- 페이징 숫자 표기 -->
		    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
		        <span><a href='<c:url value="/memberList?page=${num}"/>'>${num}</a></span>
		    </c:forEach>
		    <!-- 다음버튼 -->
		    <c:if test="${paging.next && paging.endPage>0}">
		        <span><a href='<c:url value="/memberList?page=${paging.endPage+1}"/>'>다음</a></span>
		    </c:if>
		</ul>
	</div>	
				
			</div>
			</div>
	   <!-- 푸터 -->
	   <footer class="my-3 text-center text-small">
      		<p class="mb-1">&copy; New Market</p>
   	   </footer>
   	   
	
		<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>