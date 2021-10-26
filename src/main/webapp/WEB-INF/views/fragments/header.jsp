<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 자바서버 페이지 표준 태그 라이브러리 사용 -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!-- 폼태그사용 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Market</title>
<meta charset="utf-8" />
	<!-- 부트스트랩 적용 -->
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
 	<!-- 전체 헤더에 적용할 속성들 -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
            	<!-- 홈화면으로 이동링크(홈마크) -->
                <a class="navbar-brand" href="/">New Market</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    	<!-- 홈화면 이동링크 -->
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">홈</a></li>
                        <!-- 공지사항 이동링크 -->
                        <li class="nav-item"><a class="nav-link" href="/noticeList">공지사항</a></li>                   
                        <!-- 상품 드랍다운 이동 선택 -->
                        <li class="nav-item dropdown">
                        	<!-- 분류 선택시 드랍다운으로 종류별 상품 리스트 출력 -->
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">분류</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <!-- 전체상품 리스트로 이동 -->
                                <li><a class="dropdown-item" href="proList">전체 상품</a></li>
                                <li><hr class="dropdown-divider"/></li>
                                <!-- 가전제품 리스트로 이동 -->
                                <li><a class="dropdown-item" href="proCategory/proAppliances">가전</a></li>
                                <!-- 의류제품 리스트로 이동 -->
                                <li><a class="dropdown-item" href="proCategory/proClothing">의류</a></li>
                                <!-- 생필품 리스트로 이동 -->
                                <li><a class="dropdown-item" href="proCategory/proNecessity">생필품</a></li>
                                <!-- 잡화 리스트로 이동 -->
                                <li><a class="dropdown-item" href="proCategory/proMerchandise">잡화</a></li>
                                <!-- 음식 리스트로 이동 -->
                                <li><a class="dropdown-item" href="proCategory/proFood" >음식</a></li>
                            </ul>
                        </li>
                    </ul>
                       
                    <!-- 관리자 로그인 -->     
                    <c:catch>
                    <!-- 멤버 아이디가 "웡"일시 관리자 페이지 출력 -->
					<c:if test="${member.userId eq 'wong'}">
					<!-- 관리자페이지 링크 -->
					<a href="/memberAdmin" class="btn  btn-dark" role="button">관리자페이지</a>
					</c:if>
					</c:catch>
					
					<!-- 검색폼(미구현) -->
                    <div class="search_input" id="search_input_box"> 
                     <div class="container "> 
   						<form action="/proSearch" method="get" class="d-flex justify-content-between search-inner"> 
    						<input type="text" class="form-control" name="search" id="search" value="" placeholder="상품 검색"> 
    						<input class="btn btn-search" type="submit" value="검색"> 
    					</form> 
    			 	 </div> 
    				</div>
                      
                    <form class="d-flex">
                    
                    <!-- 로그인이 안되어있을시 회원가입 및 로그인 버튼 출력 -->
              		<c:if test="${empty member}">
              		<!-- 회원가입 페이지로 이동 -->
                    <a href="/memberJoin" class="btn btn-outline-dark">회원가입</a>
                    &nbsp;&nbsp;
                    <!-- 로그인 페이지로 이동 -->
                    <a href="/memberLogin" class="btn btn-outline-dark">로그인</a>                       
                    </c:if>
                    
                    <!-- 로그인을 해서 멤버정보가 있을시 마이페이지와 로그아웃 버튼 출력 -->
                    <c:if test="${not empty member}">
                    <h6>${member.userId}님</h6>               
                    <!-- 마이페이지로 이동 -->    
                    <a href="/membermyPage" class="btn btn-outline-dark">마이페이지</a>
                    &nbsp;&nbsp;
                    <!-- 클릭 즉시 로그아웃 -->
                    <a href="/memberLogout" class="btn btn-outline-dark">로그아웃</a>                                        
                    </c:if>
                                    
                    </form>              
                    
                </div>
            </div>            
        </nav>
</header>
</body>
</html>