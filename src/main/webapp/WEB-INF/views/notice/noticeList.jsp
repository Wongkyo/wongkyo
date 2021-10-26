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
	<!-- 상단 노티스 헤더 표시 -->
	<header class="bg-dark py-2">
            <div class="container px-1 px-lg-1 my-1">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">New Market Notice</h1>                    
                </div>
            </div>
    </header>
	<br><br>
	
	<!-- 게시판 시작 -->
	<div class="container">
			<div>
				<table class="table table-hover">
					<thead class="thead">
						<tr class="row100 head" >							
							<!-- 게시글 번호 -->
							<th scope="col" class="text-center">게시글 번호</th>
							<!-- 게시글 제목 -->
							<th scope="col" class="text-center">게시글 제목</th>
							<!-- 게시글 내용 -->
							<th scope="col" class="text-center">게시글 내용</th>
							<!-- 게시글 삽입 당시 날짜 -->
							<th scope="col" class="text-center">게시글 날짜</th>
							<!-- 게시글 조회수 클릭시 1씩 상승 -->
							<th scope="col" class="text-center">조회수	</th>
						</tr>
					</thead>

					<tbody class="tbody">
						<!-- 반복문으로 list값을 받아와 data로 데이터 리스트 정렬 -->
						<c:forEach items="${list}" var="data">
							<tr class="row100 body">			
								<!-- 게시글 번호 오름차순 으로 정렬 기준점-->			
								<td scope="col" class="text-center" >${data.noNum}</td>
								<!-- 게시글 번호, 클릭시 해당 번호의 게시글로 이동 -->
								<td scope="col" class="text-center" ><a href="./noticeSelect?noNum=${data.noNum}">${data.title}</a> </td>
								<!-- 게시글 내용 -->
								<td scope="col" class="text-center" >${data.contents}</td>
								<!-- 게시 당일 날짜 -->
								<td scope="col" class="text-center">${data.day}</td>
								<!-- 게시글 조회수 클릭시 1씩 상승 -->		
								<td scope="col" class="text-center" >${data.hit}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>			
	  </div>
	  
	  <ul class="pagination">

				<c:if test="${pager.pre}">
					<li class="page-item"><a class="page-link p" href="#"
						title="${pager.startNum-1}">이전</a></li>
				</c:if>

				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">

					<li class="page-item"><a class="page-link p" href="#"
						title="${i}">${i}</a></li>
				</c:forEach>

				<c:if test="${pager.next}">
					<li class="page-item"><a class="page-link p" href="#"
						title="${pager.lastNum+1}">다음</a></li>
				</c:if>
			</ul>
	  
	  <!-- 푸터 -->
	   <footer class="my-3 text-center text-small">
      		<p class="mb-1">&copy; New Market</p>
   	   </footer>
</body>
</html>