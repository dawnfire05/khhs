<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="css/bootstrap.css" rel = "stylesheet"/>

<title>경희고등학교 자율 동아리 게시판 사이트</title>
<link href="css/logIn.css" rel="stylesheet"/>
<link href="css/bootstrap.css" rel="stylesheet"/>


</head>
<body>
	<img src="img/lionMark.png"  style = "display: block; margin: 0 auto; margin-left; margin-bottom: 0px; width:137px; height:184.7906976744186px;">
<div class="container-fluid">
<div class="loginbox">
  <h2>경희고등학교</h2>
  <form method="post" action="/userCtrl?action=login">
    <!--작성하지 않아도 문제는 없음-->
    <fieldset>
      <legend style = "margin-top: 0px;">로그인</legend>
      <label for="loginid">아이디(E-mail)</label>
      <input type="text" name="userID" placeholder="아이디(E-mail)을 입력해 주세요" value="dawnfire05">
      <label for="loginpw">비밀번호</label>
      <input type="password" name="pw" placeholder="비밀번호를 입력해 주세요" value = "dawnfire05">
      <ul>
        <li><a href="#">아이디/비밀번호찾기</a></li>
        <li><a href="userRegister.jsp">회원가입</a></li>
      </ul>
      <!--데이터를 서버로 전송-->
      <button type="submit">로그인</button>
    </fieldset>
  </form>
</div>
</div>
	<script src = "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src = "js/bootstrap.js"></script>
</body>
</html>