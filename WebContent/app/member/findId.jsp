<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>아이디 찾기</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/findId.css" />
  </head>
  <body>
    <main>
      <div class="main-wrapper">
        <div class="main-container">
          <!-- form 태그 action 지정하기 -->
          <form action="" method="post">
            <div class="logo-pandang">
              <img src="${pageContext.request.contextPath}/assets/img/logo.jpg" alt="" />
            </div>
            <h1>아이디 찾기</h1>
            <div class="input">
              <label for="name">이름</label><br />
              <input
                type="text"
                id="name"
                name="memberName"
                placeholder="이름을 입력하세요"
                required
              />
            </div>
            <div class="input">
              <label for="birth">생년월일</label><br />
              <input
                type="text"
                id="birth"
                name="memberBirth"
                placeholder="생년월일(8자)을 입력하세요"
                required
              />
            </div>
            <div class="input">
              <label for="phoneNumber">전화번호</label><br />
              <input
                type="text"
                id="phoneNumber"
                name="memberPhoneNumber"
                placeholder="전화번호를 입력하세요"
                required
              />
            </div>
            <div class="button-container">
              <button type="button" class="button1">이전</button>
              <button type="button" class="button2">다음</button>
            </div>
            <!-- 인증 성공시 아이디 ajax로 표시 -->
            <span class="id-msg">아이디는 asdf입니다.</span>
            <!-- 평소엔 display:none 아이디 표시되면 disply:flex -->
            <div class="login-find-container">
              <!-- 로그인 페이지로 이동후 아이디 input칸에 찾은 아이디 띄워주기 -->
              <a href="#">로그인</a>
              <!-- 비밀번호 변경 페이지로 이동후 아이디 input칸에 찾은 아이디 띄워주기 -->
              <a href="#">비밀번호 변경</a>
            </div>
          </form>
        </div>
      </div>
    </main>
  </body>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- 스크립트  경로 jsp때 제대로 잡기 -->
  <script src="${pageContext.request.contextPath}/assets/js/findId.js"></script>
</html>
