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
<title>New Market Search Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>

<body>
	
	<!-- 검색 창 상단 -->
	<br><br>
	<header class="bg-dark py-2">
      <div class="container px-1 px-lg-1 my-1">
        <div class="text-center text-white">
          <!-- 검색한 값 -->
          <h1>"${productVO.search}" 검색결과</h1>  
        </div>                
      </div>       
    </header>
	<br><br>
	
	<!-- 검색한 결과 리스트  -->
	<div class="container">
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
			<!-- 반복문으로 리스트값을 받아와 search로 데이터 리스트 정렬 -->
			<c:forEach items="${search}" var="search">
				<tr class="row100 body">
					<!-- 상품 전호 오름차순으로 정렬, 링크로 해당번호 상품 이동가능 -->
					<td scope="col" class="text-center"><a href="./proSelect?proNum=${search.proNum}" style="color: black;">${search.proNum}</a></td>
					<!-- 상품 등록한 유저 아이디 -->
					<td scope="col" class="text-center">${search.userId}</td>
					<!-- 상품 이름 링크로 해당번호 상품 이동가능 -->
					<td scope="col" class="text-center"><a href="./proSelect?proNum=${search.proNum}" style="color: gray;">${search.proName}</a></td>
					<!-- 상품 카테고리 -->
					<td scope="col" class="text-center">${search.proCategory}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>