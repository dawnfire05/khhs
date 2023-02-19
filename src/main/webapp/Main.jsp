<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link href="total.css" rel="stylesheet" type="text/css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<title>메인 화면</title>

</head>
<body>

<% 
		String userID=null;
		if(request.getAttribute("userID")!=null){
			userID=(String)request.getAttribute("userID");
		}
%>
<div class="row no-gutters">
<div class="container" >
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">

    <a class="navbar-brand" href="Main.jsp">경희고등학교</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>


    <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
    
      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link " aria-current="page" href="food.jsp">급식</a>
        </li>
        <li class="nav-item">
          <a class="nav-link " aria-current="page" href="blog.jsp">게시판</a>
        </li>
        </ul>
        
        <%
        	if(userID==null){
        %>
        <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link "  href="#">회원가입</a>
        </li>
        <li class="nav-item">
          <a class="nav-link "  href="userlogin">로그인</a>
        </li>
        </ul>
        <%
        	}else{
        %>
        
        <ul class="navbar-nav">
        <li class="nav-item active">
          ${userID}
        </li>
        <li class="nav-item active">
          <form method="post" action="/userCtrl?action=logout">
          	<input type="submit" value="로그아웃">
          </form>
          
        </li>
        </ul>
        
        <%
        }
        %>
        </div>

        </nav>
	</div>
	</div>
	
<div class="container" style="margin-top : 50px;" >
   
   <div class="row" >
      <div class ="col-5 bg-white border border-secondary rounded-1 shadow-lg" style="margin:auto; height: 550px;">
         
         <div style="margin-top:20%;">
            <h3 class="text-center"> 오늘의 급식 </h3>
            <div class="text-center" > ${food }</div>
         </div>
      
      </div>
      
      <div class="col-3">
      </div>
      
      <div class="col-4">
         <img src="poster.png" class=" rounded-2 " alt="준비중">
      </div>
   </div>
</div>
</body>
</html>