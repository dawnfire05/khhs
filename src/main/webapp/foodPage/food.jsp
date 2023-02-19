<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="total.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

<title>오늘의 급식</title>
</head>
<body>
<div class="row no-gutters">
<div class="container" >
	<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="Main.jsp">경희고등학교</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
   </div>
    <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
    
    
      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link " aria-current="page" href="food.jsp">급식</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " aria-current="page" href="blog.jsp">게시판</a>
        </li>
        </ul>
        
        <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link "  href="#">회원가입</a>
        </li>
        <li class="nav-item">
          <a class="nav-link "  href="#">로그인</a>
        </li>
        </ul>
        
        </div>

        </nav>
	</div>
	</div>
	
<div class="container">
<div class="table-responsive">
<table class="table table-bordered border-dark" style="margin-top:30px;">
 <thead >
     <tr class="text-center table-info">
     <th scope="col" style="width:300px">월</th>
     <th scope="col" style="width:300px">화</th>
     <th scope="col" style="width:300px">수</th>
     <th scope="col" style="width:300px">목</th>
     <th scope="col" style="width:300px">금</th>
   </tr>
 </thead>
 <tr>
 
 <c:set var="flag" value="false"/>
 
 <c:forEach var="i" begin="1" end ="${date1}" step="1">
 	<th scope="col" style="width:300px"></th>
 </c:forEach>
 
 <c:forEach var="i" begin="1" end ="${date}" step="1">
 	<th scope="col" style="width:300px">${food[i-1]}</th>
 </c:forEach>
 
 </tr>
 
 <c:forEach var="i" begin="1" end = "4" step="1">
 <c:if test="${not flag}">
 	<tr>
 	<c:forEach var="j" begin="0" end="4" step="1">
 		<c:if test="${empty food}">
 			<c:set var="flag" value="true"/>
 		</c:if>
 		 <th scope="col" style="width:300px">${food[i*5+j+date1]}</th>
 	</c:forEach>
 	</tr>
</c:if>
</c:forEach>

</table>
</div>
</div>

</body>
</html>