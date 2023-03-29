<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>로그인</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css" />
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
            <h1>로그인</h1>
            <div class="input">
              <label for="id">아이디</label><br />
              <input
                type="text"
                id="id"
                name="memberId"
                placeholder="아이디를 입력하세요"
                required
              />
            </div>
            <div class="input">
              <label for="password">비밀번호</label><br />
              <input
                type="password"
                id="password"
                name="memberPassword"
                placeholder="비밀번호를 입력하세요"
                required
              />
            </div>

            <div class="login-find-container">
              <div class="login-keep-container">
                <input type="checkbox" id="login-keep" name="loginKeep" />
                <label for="login-keep">로그인 유지</label>
              </div>
              <div class="find-container">
                <!-- 아이디 찾기 페이지로 이동 -->
                <a href="#">아이디</a>
                <span>/</span>
                <!-- 질문답변 인증 페이지로 이동 -->
                <a href="#">비밀번호 찾기</a>
              </div>
            </div>
            <div class="join">
              <!-- 회원가입 페이지로 이동 -->
              <a href="#">아직 판당 회원이 아니신가요?</a>
            </div>
          </form>
        </div>
      </div>
    </main>
  </body>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- 스크립트  경로 jsp때 제대로 잡기 -->
  <script src="${pageContext.request.contextPath}/assets/js/login.js"></script>
</html>
