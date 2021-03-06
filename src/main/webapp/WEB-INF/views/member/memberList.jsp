<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<c:import url="../fragments/header.jsp"></c:import>
	
	<div class="container">
		<br>
		<h2>	
		<span	style="border-radius: 15px 15px 15px 15px; border: 3px solid #b4b4b4;
				padding: 0.5em 0.6em; color: black; background-color: #dcdcdc;">회원리스트</span>		
		</h2>
		<br><br>
		<div class="table100 ver5 m-b-110">
			<div class="table100-head">
				<table>
					<thead class="thead">
						<tr class="row100 head">
							<th class="cell100 column1">아이디</th>
							<th class="cell100 column2">패스워드</th>
							<th class="cell100 column3">이름</th>
							<th class="cell100 column4">성별</th>
							<th class="cell100 column5">핸드폰</th>
							<th class="cell100 column6">주소</th>
							<th class="cell100 column7">이메일</th>
							<th class="cell100 column8">생년월일</th>
						</tr>
					</thead>

					<tbody class="tbody">
						<c:forEach items="${list}" var="data">
							<tr class="row100 body">

								<td class="cell100 column1">${data.userId}</td>
								<td class="cell100 column2">${data.userPw}</td>
								<td class="cell100 column3">${data.name}</td>
								<td class="cell100 column4">${data.gender}</td>
								<td class="cell100 column5">${data.phone}</td>
								<td class="cell100 column6">${data.adress}</td>
								<td class="cell100 column7">${data.email}</td>
								<td class="cell100 column8">${data.birth}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			
</div>
</div>
</body>
</html>