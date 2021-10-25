<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html>
<head>
<link href="../../css/styles.css" rel="stylesheet" />
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
        	location.href="./${proDelete}proDelete?proNum=${vo.proNum}"	
            alert("삭제되었습니다.");
        	
        }
	}
</script>
	
<c:import url="../../fragments/header.jsp"></c:import>

	<header class="bg-dark py-2">
            <div class="container px-1 px-lg-1 my-1">
                <div class="text-center text-white">
                 <h1>${vo.proName}</h1>  
         </div>
                
            </div>
       
       </header>
      
      <div>
          <table class="table table-hover">
          <thead>
             <tr>
	    		<th>상품번호 : ${vo.proNum}</th>
	    		<th>상품가격: ${vo.proPrice}</th>
	    		<th>상품등록자: ${vo.userId}</th>
			</tr>
			</thead> 
             
		<tr>
			<th>	<img class="img-fluid rounded mb-4 mb-lg-0" 
                src="../resources/uploadproduct/${vo.fileName}" alt="..." 
                 style="max-width: 100%; height: auto;"	/></th>
	    		<th>상품정보 : ${vo.proInfo}</th>
	    		</tr>
				</table> 
            </div>


</body>
</html>