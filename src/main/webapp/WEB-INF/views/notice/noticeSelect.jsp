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

	<script type="text/javascript">
	function del(){
		if (!confirm("정말로 삭제하시겠습니까?")) {
			alert("삭제가 취소되었습니다.");
			 return;
        } else {
        	location.href="./${deleteNotice}deleteNotice?noNum=${vo.noNum}"	
            alert("삭제되었습니다.");
        	
        }
	}
</script>

<c:import url="../fragments/header.jsp"></c:import>

	<header class="bg-dark py-2">
            <div class="container px-1 px-lg-1 my-1">
                <div class="text-center text-white">
                  <h1>${vo.title}</h1></div></div>s
</header>
         <div>
          <table class="table table-hover">
          <thead>
             <tr>
	    		<th>글번호 : ${vo.noNum}</th>
	    		<th>제목 : ${vo.title}</th>
	    		<th>작성일 : ${vo.day}</th>
	    		<th>조회수 : ${vo.hit}</th>
	    		
			</tr>
			</thead> 
			
			<tr>
			<th><img class="img-fluid rounded mb-4 mb-lg-0" 
                src="../resources/uploadnotice/${vo.fileName}" alt="..." 
                 style="max-width: 100%; height: auto;"	/></th>
                 <th>${vo.contents}</th>
			</tr>
			
             </table> 
               </div>
                


                  <c:catch>
					<c:if test="${member.userId eq 'wong'}">
					<a href="./${updateNotice}updateNotice?noNum=${vo.noNum}" class="btn btn-danger">Update</a>
	<a href="/noticeList" class="btn btn-danger" onclick="del()">Delete</a>
					</c:if>
					</c:catch>
	
	


</body>
</html>