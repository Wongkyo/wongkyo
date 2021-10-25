<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Market</title>
<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
   	<meta name="description" content="" />
    <meta name="author" content="" />
    <title>헤더</title>      
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
</head>
<body>

<header>
 <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="/">New Market</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">홈</a></li>
                        <li class="nav-item"><a class="nav-link" href="/noticeList">공지사항</a></li>                   
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">분류</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="proList">전체 상품</a></li>
                                <li><hr class="dropdown-divider"/></li>
                                <li><a class="dropdown-item" href="proCategory/proAppliances">가전</a></li>
                                <li><a class="dropdown-item" href="proCategory/proClothing">의류</a></li>
                                <li><a class="dropdown-item" href="proCategory/proNecessity">생필품</a></li>
                                <li><a class="dropdown-item" href="proCategory/proMerchandise">잡화</a></li>
                                <li><a class="dropdown-item" href="proCategory/proFood" >음식</a></li>
                            </ul>
                        </li>
                    </ul>
                       
                    <!-- 관리자 로그인 -->     
                    <c:catch>
					<c:if test="${member.userId eq 'wong'}">
					<a href="/memberAdmin" class="btn  btn-dark" role="button">관리자페이지</a>
					</c:if>
					</c:catch>
					
					<!-- 검색폼 -->
                    <div class="search_input" id="search_input_box"> 
                     <div class="container "> 
   						<form action="/proSearch" method="get" class="d-flex justify-content-between search-inner"> 
    						<input type="text" class="form-control" name="search" id="search" value="" placeholder="상품 검색"> 
    						<input class="btn btn-search" type="submit" value="검색"> 
    					</form> 
    			 	 </div> 
    				</div>
                      
                    <form class="d-flex">
                    
              		<c:if test="${empty member}">
                    <a href="/memberJoin" class="btn btn-outline-dark">회원가입</a>
                    &nbsp;&nbsp;
                    <a href="/memberLogin" class="btn btn-outline-dark">로그인</a>                       
                    </c:if>
                    
                    <c:if test="${not empty member}">
                    
                   <h6>${member.userId}님</h6>
                    
                    <a href="/membermyPage" class="btn btn-outline-dark">마이페이지</a>
                    &nbsp;&nbsp;
                    <a href="/memberLogout" class="btn btn-outline-dark">로그아웃</a>      
                                     
                    </c:if>
                                    
                    </form>              
                    
                </div>
            </div>            
        </nav>
</header>
</body>
</html>