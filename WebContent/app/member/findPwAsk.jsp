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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/findPwAsk.css" />
  </head>
  <body>
    <main>
      <div class="main-wrapper">
        <div class="main-container">
          <!-- form 태그 action 지정하기 -->
          <form action="${pageContext.request.contextPath}/member/findPwAskOk.me" method="post">
            <div class="logo-pandang">
              <img src="${pageContext.request.contextPath}/assets/img/logo.jpg" alt="" />
            </div>
            <h1>비밀번호 변경</h1>
            <!-- db에서 memberAsk 가져와서 input에 넣기 -->
            <div class="input">
              <label for="ask">질문</label><br />
              <input
                type="text"
                id="ask"
                name="memberAsk"
                value="${memberAsk}"
                readonly
              />
            </div>
            <div class="input">
              <label for="answer">답변</label><br />
              <input
                type="text"
                id="answer"
                name="memberAnswer"
                placeholder="답변을 입력하세요"
                required
              /><br>
              <!-- 답변 불일치시 뜨는 메세지 -->
              <span class="check-msg" id="check-answer-msg"></span>
            </div>
            <!-- 평소엔 #pw disply:none, 답변 일치 시 disply:none 삭제-->
            <div class="input" id="pw">
              <label for="password">비밀번호</label><br />
              <input
                type="password"
                id="password"
                name="memberPassword"
                placeholder="비밀번호를 입력하세요"
                required
              /><br />
              <!-- 비밀번호 문제 시 뜨는것 -->
              <span class="check-msg" id="check-pw-msg"></span>
            </div>
            <div class="input" id="pw">
              <label for="password">비밀번호 확인 </label><br />
              <input
                type="password"
                id="password2"
                placeholder="비밀번호를 입력하세요"
                required
              /><br />
              <!-- ajax 비밀번호 불일치 시 뜨는 것 -->
              <span class="check-msg" id="check-pw-msg2"></span>
            </div>
            <div class="button-container">
              <button type="button" class="button1">이전</button>
              <button type="submit" class="button2">변경</button>
            </div>
          </form>
        </div>
      </div>
    </main>
  </body>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- 스크립트  경로 jsp때 제대로 잡기 -->
  <script src="${pageContext.request.contextPath}/assets/js/findPwAsk.js"></script>
</html>
