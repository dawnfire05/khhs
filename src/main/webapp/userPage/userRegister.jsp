<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript">
//회원가입 유효성검사
//자원을 화면에 로드하게 되면 수행할 동작(==function)
window.onload = function() {
   var join = document.join; //form데이터를 모두 join변수에 저장
   
   // 유효성검사할 부분을 class로 부여했기에 check class 태그를 모두 input에 저장 가져옴
   // 이때 input 한 태그당 배열 인덱스로 받는다.
   var input = document.querySelectorAll('.check');

   // 오류 문구 //errorId : span의 id들(각 요소마다 나타낼 오류를 표시하기 위함)
   // error : class list의 하위 span을 모두 불러냄(일괄 처리를 위함 - 반복문)
   var errorId = [ "schoolNumError", "nameError", "idError", "pwError", "pwCheckError"];
   var error = document.querySelectorAll('.list > span');

   
   // 오류문구 초기화 메서드
   // 오류 표시 후, 사용자가 올바르게 수정을 하면 텍스트가 사라지는 모습을 구현
   function innerReset(error){
      for (var i = 0; i < error.length; i++) {
         error[i].innerHTML = "";
      }
   }

   // 초기화 메서드 호출
   innerReset(error);

// [ 학번 입력문자 유효성검사 ]
   join.schoolNum.onkeydown = function(){ //입력값과 정규식 범위와 같지 않다면
   innerReset(error); // 초기화 메서드 호출   
      var schoolNumLimit = /^[0-9]{4,5}$/; // 정규식(^$--> 문자의미, 01, (6자리중 "1자리"), 0~9--> "5자리")
      if (!schoolNumLimit.test(input[0].value)) { //입력값과 정규식 범위와 같지 않다면
         // pw의 오류 문구삽입 
         document.getElementById(errorId[0]).innerHTML ="	 올바른 형식이 아닙니다. 다시 확인해주세요.";
      }
   }
   
   // [ 이름 입력 유효성검사 ] 
   join.name.onkeydown = function(){ //입력값과 정규식 범위와 같지 않다면
      innerReset(error); // 초기화 메서드 호출
      var nameLimit = /[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ]/; // 정규식 0~9, a~z, A~Z, -, _, .내에서만 입력가능
         if (!nameLimit.test(input[1].value)) {  //입력값과 정규식 범위와 같지 않다면
            // 이메일의 오류 문구삽입
            document.getElementById(errorId[1]).innerHTML =" 	 올바른 형식이 아닙니다. 영문,숫자, (-)(_)(.) 입력만 가능합니다.";
         }
      }
   
   // [ ID 입력문자 유효성검사 ] 
   join.id.onkeydown = function(){
      innerReset(error); // 초기화 메서드 호출
      var idLimit = /^[a-zA-Z0-9-_]{5,20}$/; //정규식 5~20자 (a~z, A~Z, 0~9, -, _만 입력가능)
      if (!idLimit.test(input[2].value)) { //입력값과 정규식 범위와 같지 않다면
         // id의 오류 문구삽입
         document.getElementById(errorId[2]).innerHTML =" 	5~20자의 영문 소대문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";

      }
   }
   // [ PW 입력문자 유효성검사 ]
   join.pw.onkeydown = function(){
      innerReset(error); // 초기화 메서드 호출
      var pwLimit = /^[a-zA-Z0-9~!@#$%^&*()_-]{10,20}$/; //정규식(a~z, A~Z, 0~9, ~!@#$%^&*()_- 만 입력가능)
      if (!pwLimit.test(input[3].value)) { //입력값과 정규식 범위와 같지 않다면
         // pw의 오류 문구삽입
         document.getElementById(errorId[3]).innerHTML ="	 10~20자의 영문 소대문자, 숫자와 특수기호 '~!@#$%^&*()_-'만 사용 가능합니다.";
      }   
   }
   // [ PW 재확인 입력문자 초기화 ]
   //비밀번호 동일여부는 submit 버튼 클릭시 검사해줄 예정
   join.pwCheck.onkeydown = function(){
      // pw의 오류 문구삽입
      innerReset(error);// 오류문구 초기화   
   }

   //submit 실행시 수행할 동작
   join.onsubmit = function() { //join에서 submit이 실행된다면 수행할 함수           
      var errorStr = [  " 학번을",  " 이름을", " 아이디를"," 비밀번호를", " 비밀번호 확인을"];
      
      innerReset(error); // 오류문구 초기화
      
      // [ input 공백확인 ]
      for (var i = 0; i < input.length - 1; i++) { // -1 == submit제외 
         if (!input[i].value) { 
            document.getElementById(errorId[i]).innerHTML = errorStr[i]+ " 입력해 주세요.";
            input[i].focus(); // 포커스 이동
            return false; // 종료 (포커스 이동유지를 위해 false 종료)
         }
      }        
	  }
      //유효성검사) 비밀번호 재확인
      if (join.pw.value != join.pwCheck.value) {
         document.getElementById("pwCheckError").innerHTML = " 	비밀번호가 일치하지 않습니다.";
         join.pwCheck.focus(); // 포커스 이동
         return false;
      }

      // 정규식 변수 모음     
      var idLimit = /^[a-zA-Z0-9-_]{5,20}$/; //정규식(a~z, A~Z, 0~9, -, _만 입력가능)
      var pwLimit = /^[a-zA-Z0-9~!@#$%^&*()_-]{10,20}$/;///[a-zA-Z0-9]{10, 20}/; //정규식(a~z, A~Z, 0~9,~!@#$%^&*()_-특수문자 만 입력가능)
      var schoolNumLimit =  /^[0-9]{5}$/; // 정규식(0~9) 중에서 5자리 입력 
      var nameLimit = /[a-zA-Zㄱ-ㅎㅏ-ㅣ]/; // 정규식 (a~z, A~Z, ㄱ~ㅎ, ㅏ~ㅣ 만 입력가능)

      // [ 학번 유효성검사 ]
      if (!schoolNumLimit.test(input[4].value)) { 
         document.getElementById(errorId[0]).innerHTML = "	 올바른 형식이 아닙니다. 다시 확인해주세요.";
         join.schoolNum.focus(); // 포커스 이동
         return false;
      }

     // [ 이름 유효성검사 ]
      if (!nameLimit.test(input[3].value)) { 
         document.getElementById(errorId[1]).innerHTML = "	 올바른 형식이 아닙니다. 영문, 한글 외 입력은 불가합니다.";
         join.name.focus(); // 포커스 이동
         return false;
      }
     
      // [ ID 유효성검사 ]
      if (!idLimit.test(input[0].value)) {
         document.getElementById(errorId[2]).innerHTML = "	 5~20자의 영문 소대문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
         join.id.focus(); // 포커스 이동
         return false;
      }

      // [ PW 유효성검사 ]
      if (!pwLimit.test(input[1].value)) {
         document.getElementById(errorId[3]).innerHTML = "	 10~20자의 영문 소대문자, 숫자와 특수기호 '~!@#$%^&*()_-'만 사용 가능합니다.";
         //console.log(input[1].value);
         //console.log(pwLimit.test(input[1].value));
         join.pw.focus(); // 포커스 이동
         return false
      }         
    
      // 개인정보 동의박스 체크
      var consentCheck = document.getElementById("check");
      //console.log(consentCheck);
      if(!consentCheck.checked){
         document.getElementById("consentError").innerHTML = " 	개인정보 수집이용 동의를 해주세요.";
         return false;
      }
      
      alert("회원가입이 완료되었습니다.");
		
}
</script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome 5 CDN link to add icons -->
    <title>KHHS 회원가입 창</title>
    <!-- Linking .css file with HTML page -->
    <link rel="stylesheet" href="/userPage/css/signUp.css">
    
</head>
<body>
 <div>
  	<form method ="post" action="/UserCtrl?action=join" >
		<!--  <form action="" method="get"> -->
		
 		<div id="container">
	    	<div class="row_group">
            <img src="img/lionMark.png" style ="display: block; margin-left; margin-top: 10px; width:110px; height:148px;">
     	   <!-- Left section of sign up form 아이디 이름 비번 학번   required autocomplete="off"   -->
						
         	<h1>회원가입</h1>        	    
          	     	    
        	<div class ="userInput">
           	  	<p><label class ="list">학번<span id="schoolNumError"></span></label></p>
          	  	<span class ="box int_id"><input type="text" name="grade" id="schoolNum" class ="int check" 
          	  		 maxlength="5"></span><br>
            </div>
             
             <div class="userInput">
                <p><label class ="list">이름<span id= "nameError"></span></label></p>
                <span class="box int_id"><input type="text" name="name" id="userName" class="int check" 
               		maxlength="20"></span><br>
             </div>
             
             <div class="userIntput">
                <p><label class="list">아이디<span id="idError"></span></label></p>
                <span class="box int_id"><input type="text" name="userID" id="id" name="id" class ="int check"
                	maxlength="20"></span><br>
             </div>
       
             <div class="userInput">
                <p><label class="list">비밀번호</label></p>
                <span class="box int_id"><input type="password" name="pw" id="pw" class="int check" 
                	 maxlength="20"></span><br>
             </div>
             
              <div class ="userInput">
                <p><label class="list">비밀번호 재확인<span id= "pwCheckError"></span></label></p>
                <span class="box int_id"><input type="password" id="pwCheck" class="int check" 
                	 maxlength="20" ></span><br>
             </div>
      		</div>       
                    <!-- 개인정보 수집 동의 -->
             <div class="userInput">
             	 <label class="list" style="font-size:8px">개인정보 수집/이용동의<span id="consentError"></span></label>
             	 <div id="informationConsent">
             		<span id="consentBox">
                		<span id="consentError">개인정보 처리방침</span><br>
                  
                      		<!-- 개인정보 처리방침에 대한 세부내용 생략 -->     
            	 	</span>
                 </div>
               	 <label class="select">동의<input type="radio" id="check" name="check" value="동의" checked></label>
            	 <label class="select">비동의<input type="radio" id="noneCheck"name="check" value="비동의" checked></label>
              	 </div>
            	 <br>
            	 <div class="btn_area">
                 	<input type="submit" value="가입하기" id="btnJoin" class="btn_type btn_primary"><a href="userLogin.jsp"></a>
				 </div>
			</div>
		</form>
	</div>
             <p>이미 회원이신가요? <a href="userLogin.jsp">로그인 하기</a></p><br><br>  <!-- 로그인 페이지로 이동, " " 안에 로그인 페이지 파일 넣기 -->
</body>
</html>