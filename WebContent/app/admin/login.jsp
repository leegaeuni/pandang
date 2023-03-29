<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin_login.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
    />
  </head>
  <body>
    <div class="main-container">
      <div class="main-container__location">
        <div class="login-container__location">
          <div class="login-container__wrapper">
            <img src="${pageContext.request.contextPath}/assets/img/logo.jpg" class="logo_img" />
            <p class="login__manager-text">관리자</p>
            <div class="login-form__container">
              <form
                class="login-form"
                action="#"
                name="login-form"
                method="POST"
              >
                <div class="login-form__input-box">
                  <p>아이디</p>
                  <!-- @@ name 속성은 DB테이블 칼럼명과 동일하게 @@ -->
                  <input
                    class="login-form__box"
                    type="text"
                    id="id_info"
                    name="id_info"
                  />
                </div>
                <div class="login-form__input-box">
                  <p>비밀번호</p>
                  <input
                    class="login-form__box"
                    type="password"
                    id="pw_info"
                    name="pw_info"
                  />
                </div>
                <button class="login_btn" type="button">로그인</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
  </body>
</html>
