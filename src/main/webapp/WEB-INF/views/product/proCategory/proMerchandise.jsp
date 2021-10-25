<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link href="../css/styles.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../../fragments/header.jsp"></c:import>
	
	<header class="bg-dark py-2">
            <div class="container px-1 px-lg-1 my-1">
                <div class="text-center text-white">
                    <h2 class="display-4 fw-bolder">New Market merchandise List</h2>                    
                </div>
            </div>
	</header>
        <br><br>
        
	<div class="container">

		<div class="table100 ver5 m-b-110">
			<div class="table100-head">
				<table class="table table-hover">
					<thead class="thead">
						<tr class="row100 head">
							<th scope="col" class="text-center">상품사진</th>
							<th scope="col" class="text-center">상품번호</th>
							<th scope="col" class="text-center">회원명</th>
							<th scope="col" class="text-center">상품명</th>
							<th scope="col" class="text-center">카테고리</th>
							<th scope="col" class="text-center">상품정보</th>
							<th scope="col" class="text-center">상품가격</th>
						</tr>
					</thead>

					<tbody class="tbody">
						<c:forEach items="${merchandise}" var="merchandise">
							<tr class="row100 body">

								<td scope="col" class="text-center"><img class="img-fluid rounded mb-4 mb-lg-0" 
												                src="../resources/uploadproduct/${merchandise.fileName}" alt="..." 
												                  width="60" height="60"	/></td>
							<td scope="col" class="text-center"><a href="./cateSelect?proNum=${merchandise.proNum}">${merchandise.proNum}</a></td>
							<td scope="col" class="text-center">${merchandise.userId}</td>
							<td scope="col" class="text-center"><a href="./cateSelect?proNum=${merchandise.proNum}">${merchandise.proName}</a></td>
							<td scope="col" class="text-center">${merchandise.proCategory}</td>
							<td scope="col" class="text-center">${merchandise.proInfo}</td>
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