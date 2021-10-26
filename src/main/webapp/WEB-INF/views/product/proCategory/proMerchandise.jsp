<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 자바서버 페이지 표준 태그 라이브러리 사용 -->        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 폼태그사용 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<!-- 스타일 링크 -->
<link href="../css/styles.css" rel="stylesheet" />
<!-- 헤더 임포트 -->
<c:import url="../../fragments/header.jsp"></c:import>
<meta charset="UTF-8">
<title>promerchandise List</title>
</head>

<body>
	<!-- merchandise 소개 헤드 부분 -->	
	<header class="bg-dark py-2">
      <div class="container px-1 px-lg-1 my-1">
        <div class="text-center text-white">
           <h2 class="display-4 fw-bolder">New Market merchandise List</h2>                    
        </div>
      </div>
	</header>
        
        <br><br>
        
    <!-- 상품리스트 컨테이너 시작 -->    
	<div class="container">
		<div class="table100 ver5 m-b-110">
			<div class="table100-head">
				<!-- 테이블 생성 -->
				<table class="table table-hover">
					<!-- 행 -->
					<thead class="thead">
						<tr class="row100 head">
							<!-- 상품 사진  -->
							<th scope="col" class="text-center">상품사진</th>
							<!-- 상품 번호 -->
							<th scope="col" class="text-center">상품번호</th>
							<!-- 회원명 -->
							<th scope="col" class="text-center">회원명</th>
							<!-- 상품명 -->
							<th scope="col" class="text-center">상품명</th>
							<!-- 카테고리 -->
							<th scope="col" class="text-center">카테고리</th>
							<!-- 상품정보 -->
							<th scope="col" class="text-center">상품정보</th>
							<!-- 상품가격 -->
							<th scope="col" class="text-center">상품가격</th>
						</tr>
					</thead>

					<!-- 열 -->					
					<tbody class="tbody">
					<!-- 반복문으로 리스트값을 받아와 merchandise로 데이터 리스트 정렬 -->
					<c:forEach items="${merchandise}" var="merchandise">
						<tr class="row100 body">
							<!-- 상품 사진-->
							<td scope="col" class="text-center"><img class="img-fluid rounded mb-4 mb-lg-0" 
												                src="../resources/uploadproduct/${merchandise.fileName}" alt="..." 
												                  width="60" height="60"	/></td>
							<!-- 상품 전호 오름차순으로 정렬, 링크로 해당번호 상품 이동가능 -->
							<td scope="col" class="text-center"><a href="./cateSelect?proNum=${merchandise.proNum}">${merchandise.proNum}</a></td>
							<!-- 상품 등록한 유저 아이디 -->
							<td scope="col" class="text-center">${merchandise.userId}</td>
							<!-- 상품 이름 링크로 해당번호 상품 이동가능 -->
							<td scope="col" class="text-center"><a href="./cateSelect?proNum=${merchandise.proNum}">${merchandise.proName}</a></td>
							<!-- 상품 카테고리 -->
							<td scope="col" class="text-center">${merchandise.proCategory}</td>
							<!-- 상품 정보 -->
							<td scope="col" class="text-center">${merchandise.proInfo}</td>
							<!-- 상품 가격 -->
							<td scope="col" class="text-center">${merchandise.proPrice}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
 		</div>
	</div>
</div>

</body>
</html>