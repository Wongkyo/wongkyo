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
<title>Notice Select Page</title>
</head>

<body>

<!-- 게시판 삭제 스크립트 -->
<script type="text/javascript">
	function del(){
		// confirm으로 삭제 or 취소
		if (!confirm("정말로 삭제하시겠습니까?")) {
			alert("삭제가 취소되었습니다.");
			// 취소시 return으로 삭제 이벤트 발생 중지
			return;
        } else {
        	// 삭제 클릭시 select한 noNum의 번호를 따라가 deleteNotice controller실행 공지사항 삭제
        	location.href="./${deleteNotice}deleteNotice?noNum=${vo.noNum}"	
            alert("삭제되었습니다.");       	
        }
	}
</script>

	<!-- 공지사항 제목 -->
	<header class="bg-dark py-2">
      <div class="container px-1 px-lg-1 my-1">
         <div class="text-center text-white">
           <h1>${vo.title}</h1></div></div>
	</header>
	
		<!-- 공지사항 선택시 태용 -->		
         <div>
         	 <table class="table table-hover">
			 <!-- 공지사항 상세 정보 -->	
         	 <thead>
            	 <tr>
	    			<th>글번호 : ${vo.noNum}</th>
	    			<th>제목 : ${vo.title}</th>
	    			<th>작성일 : ${vo.day}</th>
	    			<th>조회수 : ${vo.hit}</th>	    		
				</tr>
			</thead> 
			
			<!-- 공지사항 이미지 -->
				 <tr>
					<th><img class="img-fluid rounded mb-4 mb-lg-0" 
               		 src="../resources/uploadnotice/${vo.fileName}" alt="..." 
               		  style="max-width: 100%; height: auto;"	/></th>
               		  <!-- 공지사항 내용 -->
              		   <th>${vo.contents}</th>
				 </tr>			
             </table> 
        </div>
                
   <!-- 공지사항 수정 및 삭제 -->
   <c:catch>
   		<!-- if문 발생 멤버가 관리자 아이디일때만 버튼 출력 -->
		<c:if test="${member.userId eq 'wong'}">
			<!-- 공지사항 이벤트 발생 noNum에 맞는 번호를 공지사항으로 업데이트 -->
			<a href="./${updateNotice}updateNotice?noNum=${vo.noNum}" class="btn btn-danger">Update</a>
			<!-- 공지사항 삭제 버튼 클릭시 온클릭으로 스크립트 발생  -->
			<a href="/noticeList" class="btn btn-danger" onclick="del()">Delete</a>
		</c:if>
	</c:catch>

</body>
</html>