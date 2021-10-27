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
<title>New Market ProList</title>
</head>
<body>
	<!-- 상품소개 헤드 부분 -->
	<header class="bg-dark py-2">
      <div class="container px-1 px-lg-1 my-1">
        <div class="text-center text-white">
          <h2 class="display-4 fw-bolder">New Market Product List</h2>                    
        </div>
      </div>
	</header>
	<br><br>
	
	<!-- 상품 리스트 컨테이너 시작 -->
	<div class="container">
		<div class="table100 ver5 m-b-110" >
			<div class="table100-head">
				<!-- 테이블 생성 -->
				<table class="table table-hover">
					<!-- 행 -->
					<thead class="thead">
						<tr class="row100 head">

							<!-- 상품 번호 -->
							<th scope="col" class="text-center">상품번호</th>
							<!-- 회원명 -->
							<th scope="col" class="text-center">회원명</th>
							<!-- 상품명 -->
							<th scope="col" class="text-center">상품명</th>
							<!-- 카테고리 -->
							<th scope="col" class="text-center">카테고리</th>	
						</tr>
					</thead>
					
					<!-- 열 -->					
					<tbody class="tbody">
					<!-- 반복문으로 리스트값을 받아와 data로 데이터 리스트 정렬 -->
					<c:forEach items="${list}" var="data">
						<tr class="row100 body">
							<!-- 상품 전호 오름차순으로 정렬, 링크로 해당번호 상품 이동가능 -->
							<td scope="col" class="text-center"><a href="./proSelect?proNum=${data.proNum}" style="color: black;">${data.proNum}</a></td>
							<!-- 상품 등록한 유저 아이디 -->
							<td scope="col" class="text-center">${data.userId}</td>
							<!-- 상품 이름 링크로 해당번호 상품 이동가능 -->
							<td scope="col" class="text-center"><a href="./proSelect?proNum=${data.proNum}" style="color: gray;">${data.proName}</a></td>
							<!-- 상품 카테고리 -->
							<td scope="col" class="text-center">${data.proCategory}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- 페이징 시작 -->
	<div style="float: right; color: black;" >		
		<ul class="paging" >
			<!-- 이전버튼 -->
		    <c:if test="${paging.prev}">
		        <span><a href='<c:url value="/proList?page=${paging.startPage-1}"/>'>이전</a></span>
		    </c:if>
		    <!-- 페이징 숫자 표기 -->
		    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
		        <span><a href='<c:url value="/proList?page=${num}"/>'>${num}</a></span>
		    </c:forEach>
		    <!-- 다음버튼 -->
		    <c:if test="${paging.next && paging.endPage>0}">
		        <span><a href='<c:url value="/proList?page=${paging.endPage+1}"/>'>다음</a></span>
		    </c:if>
		</ul>
	</div>


		</div>
	</div>
</div>



		<!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
     
</body>
</html>