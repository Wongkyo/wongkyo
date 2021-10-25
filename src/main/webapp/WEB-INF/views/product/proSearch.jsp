<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../fragments/header.jsp"></c:import>

	<br><br>
	<h1  align="center">검색 결과</h1>
	<br><br>
	
	<div align="center">
	<ul>
	<c:forEach items="${proSearch}" var="search">
		<a href="./proSelect?proNum=${search.proNum}"> 
		<img src="../resources/uploadproduct/${search.fileName}" alt="..."></a>
		<h3>${search.proName}<br>${search.proCategory}<br>${search.proPrice}</h3>
	</c:forEach>
	
	

	</ul>
	</div>

</body>
</html>