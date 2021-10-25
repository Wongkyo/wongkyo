<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<c:import url="../fragments/header.jsp"></c:import>

	<header class="bg-dark py-2">
            <div class="container px-1 px-lg-1 my-1">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">New Market Notice</h1>
                    
                </div>
            </div>
        </header>
	<br><br>
	
	<div class="container">

	
			<div>
				<table class="table table-hover">
					<thead class="thead">
						<tr class="row100 head" >
							<th scope="col" class="text-center">게시글 사진</th>
							
							<th scope="col" class="text-center">게시글 번호</th>
							
							<th scope="col" class="text-center">게시글 제목</th>
							
							<th scope="col" class="text-center">게시글 내용</th>
							
							<th scope="col" class="text-center">게시글 날짜</th>
							
							<th scope="col" class="text-center">조회수	</th>
						</tr>
					</thead>

					<tbody class="tbody">
						<c:forEach items="${list}" var="data">
							<tr class="row100 body">
			
								<td scope="col" class="text-center" ><img class="img-fluid rounded mb-4 mb-lg-0" 
                src="../resources/uploadnotice/${data.fileName}" alt="..." 
                 width="60" height="60"	/></td>
							
								<td scope="col" class="text-center" >${data.noNum}</td>

								<td scope="col" class="text-center" ><a href="./noticeSelect?noNum=${data.noNum}">${data.title}</a> </td>

								<td scope="col" class="text-center" >${data.contents}</td>

								<td scope="col" class="text-center">${data.day}</td>

								<td scope="col" class="text-center" >${data.hit}</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			

</div>
</body>
</html>