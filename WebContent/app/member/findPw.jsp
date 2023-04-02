<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>비밀번호 찾기</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/findPw.css" />
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
            <h1>비밀번호 변경</h1>
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
              <button type="submit" class="button2">다음</button>
            </div>
          </form>
        </div>
      </div>
    </main>
  </body>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- 스크립트  경로 jsp때 제대로 잡기 -->
  <script src="${pageContext.request.contextPath}/assets/js/findPw.js"></script>
</html>
