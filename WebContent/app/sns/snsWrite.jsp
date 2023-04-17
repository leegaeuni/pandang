<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/snsWrite.css" />
    <title>SNS 작성 페이지</title>
  </head>
  <body>

    <div class="header-container">

         <!-- 헤더 영역 시작  -->
         <div class="start-container">
            <!-- 메인페이지 이동처리 -->
            <a href="${pageContext.request.contextPath}/main"><img
               src="${pageContext.request.contextPath}/assets/img/logo.jpg" alt=""
               class="logo-img" /></a>
            <!-- 판당 페이지 이동처리 -->
            <div class="pandang-container">
               <a href="${pageContext.request.contextPath}/sns/snsOk.sn" class="header-list">판당</a> <font>·</font>
               <!-- 산당 (스토어) 페이지 이동처리 -->
               <a href="${pageContext.request.contextPath}/store/storeOk.st" class="header-list">산당</a>
            </div>
         </div>

         <form class="search">

            <input type="text" class="search-bar" placeholder="어떤 창작물을 찾으시나요?" />
            <a href="#">
               <button type="button" class="material-symbols-outlined">
                  search</button>
            </a>

         </form>

         <div class="login-container">
            <c:choose>
               <c:when test="${empty sessionScope.memberNumber}">
                  <a href="${pageContext.request.contextPath}/member/login.me" class="login">로그인</a> 
                  <a href="${pageContext.request.contextPath}/member/join.me" class="join">회원가입</a> 
               </c:when>
               <c:otherwise>
                  <a href="${pageContext.request.contextPath}/member/mypageOk.me" class="my-page">마이페이지</a> 
                  <a href="${pageContext.request.contextPath}/member/logoutOk.me" class="logout">로그아웃</a>
               </c:otherwise>
            </c:choose>
         </div>
         <!-- 헤더 영역 종료 -->
      </div>

    <main>
      <div class="main-container">
        <h1>
          <svg
            aria-label="돌아가기"
            class="x1lliihq x1n2onr6 return"
            color="rgb(0, 0, 0)"
            fill="rgb(0, 0, 0)"
            height="24"
            role="img"
            viewBox="0 0 24 24"
            width="24"
          >
            <title>돌아가기</title>
            <line
              fill="none"
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              x1="2.909"
              x2="22.001"
              y1="12.004"
              y2="12.004"
            ></line>
            <polyline
              fill="none"
              points="9.276 4.726 2.001 12.004 9.276 19.274"
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
            ></polyline>
          </svg>
          <span>새 게시물 만들기</span>
        </h1>
        <div class="sns-container">
          <div class="img-container">
            <div class="img-selector">
              <svg
                aria-label="이미지나 동영상과 같은 미디어를 나타내는 아이콘"
                class="x1lliihq x1n2onr6"
                color="rgb(38, 38, 38)"
                fill="rgb(38, 38, 38)"
                height="77"
                role="img"
                viewBox="0 0 97.6 77.3"
                width="96"
              >
                <title>이미지나 동영상과 같은 미디어를 나타내는 아이콘</title>
                <path
                  d="M16.3 24h.3c2.8-.2 4.9-2.6 4.8-5.4-.2-2.8-2.6-4.9-5.4-4.8s-4.9 2.6-4.8 5.4c.1 2.7 2.4 4.8 5.1 4.8zm-2.4-7.2c.5-.6 1.3-1 2.1-1h.2c1.7 0 3.1 1.4 3.1 3.1 0 1.7-1.4 3.1-3.1 3.1-1.7 0-3.1-1.4-3.1-3.1 0-.8.3-1.5.8-2.1z"
                  fill="currentColor"
                ></path>
                <path
                  d="M84.7 18.4 58 16.9l-.2-3c-.3-5.7-5.2-10.1-11-9.8L12.9 6c-5.7.3-10.1 5.3-9.8 11L5 51v.8c.7 5.2 5.1 9.1 10.3 9.1h.6l21.7-1.2v.6c-.3 5.7 4 10.7 9.8 11l34 2h.6c5.5 0 10.1-4.3 10.4-9.8l2-34c.4-5.8-4-10.7-9.7-11.1zM7.2 10.8C8.7 9.1 10.8 8.1 13 8l34-1.9c4.6-.3 8.6 3.3 8.9 7.9l.2 2.8-5.3-.3c-5.7-.3-10.7 4-11 9.8l-.6 9.5-9.5 10.7c-.2.3-.6.4-1 .5-.4 0-.7-.1-1-.4l-7.8-7c-1.4-1.3-3.5-1.1-4.8.3L7 49 5.2 17c-.2-2.3.6-4.5 2-6.2zm8.7 48c-4.3.2-8.1-2.8-8.8-7.1l9.4-10.5c.2-.3.6-.4 1-.5.4 0 .7.1 1 .4l7.8 7c.7.6 1.6.9 2.5.9.9 0 1.7-.5 2.3-1.1l7.8-8.8-1.1 18.6-21.9 1.1zm76.5-29.5-2 34c-.3 4.6-4.3 8.2-8.9 7.9l-34-2c-4.6-.3-8.2-4.3-7.9-8.9l2-34c.3-4.4 3.9-7.9 8.4-7.9h.5l34 2c4.7.3 8.2 4.3 7.9 8.9z"
                  fill="currentColor"
                ></path>
                <path
                  d="M78.2 41.6 61.3 30.5c-2.1-1.4-4.9-.8-6.2 1.3-.4.7-.7 1.4-.7 2.2l-1.2 20.1c-.1 2.5 1.7 4.6 4.2 4.8h.3c.7 0 1.4-.2 2-.5l18-9c2.2-1.1 3.1-3.8 2-6-.4-.7-.9-1.3-1.5-1.8zm-1.4 6-18 9c-.4.2-.8.3-1.3.3-.4 0-.9-.2-1.2-.4-.7-.5-1.2-1.3-1.1-2.2l1.2-20.1c.1-.9.6-1.7 1.4-2.1.8-.4 1.7-.3 2.5.1L77 43.3c1.2.8 1.5 2.3.7 3.4-.2.4-.5.7-.9.9z"
                  fill="currentColor"
                ></path>
              </svg>
              <button class="img-select" type="button">사진 선택</button>
              <input
                type="file"
                name="file-input"
                class="file-input"
                accept=".jpg, .jpeg, .png"
                multiple
              />
            </div>

            <div class="img">
              <img src="../img/test1.jpg" alt="" class="img-content" />
            </div>
            <div class="img-counter">
              <div class="img-cnt-container"></div>
              <div class="prev">
                <svg
                  aria-label="왼쪽 방향 아이콘"
                  class="_ab6-"
                  color="rgb(255, 255, 255)"
                  fill="rgb(255, 255, 255)"
                  height="16"
                  role="img"
                  viewBox="0 0 24 24"
                  width="16"
                >
                  <polyline
                    fill="none"
                    points="16.502 3 7.498 12 16.502 21"
                    stroke="currentColor"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                  ></polyline>
                </svg>
              </div>
              <div class="next">
                <svg
                  aria-label="오른쪽 방향 아이콘"
                  class="_ab6-"
                  color="rgb(255, 255, 255)"
                  fill="rgb(255, 255, 255)"
                  height="16"
                  role="img"
                  viewBox="0 0 24 24"
                  width="16"
                >
                  <polyline
                    fill="none"
                    points="8 3 17.004 12 8 21"
                    stroke="currentColor"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                  ></polyline>
                </svg>
              </div>
            </div>
          </div>
          <div class="content-container">
            <div class="profile">
              <img src="${pageContext.request.contextPath}/upload/${channelFileSystemName}" alt="" class="profile-img" />
              <div class="member-nickname">${channelName }</div>
            </div>
            <!-- 게시글 작성 시 경로 작성 -->
            <form action="${pageContext.request.contextPath}/sns/snsWriteOk.sn" class="sns-content-area" method='post' enctype="multipart/form-data">
              <input
                type="text"
                class="sns-title"
                name="snsTitle"
                placeholder="제목 입력"
              />
              <textarea
                name="snsContent"
                id="sns-content"
                cols="30"
                rows="10"
                placeholder="문구 입력..."
              ></textarea>
              <div class="button-container">
                <button type="submit" class="submit-button">공유하기</button>
              </div>
              <div class="input-container">
                <input type="file" name="file1" id="" class="input" /><br />
                <input type="file" name="file2" id="" class="input" /><br />
                <input type="file" name="file3" id="" class="input" /><br />
                <input type="file" name="file4" id="" class="input" /><br />
                <input type="file" name="file5" id="" class="input" /><br />
                <input type="file" name="file6" id="" class="input" /><br />
                <input type="file" name="file7" id="" class="input" /><br />
                <input type="file" name="file8" id="" class="input" /><br />
                <input type="file" name="file9" id="" class="input" /><br />
                <input type="file" name="file10" id="" class="input" /><br />
              </div>
            </form>
          </div>
        </div>
      </div>
    </main>

    <!-- @@@@푸터@@@@ -->
    <div class="footer-container">
      <!-- 푸터 영역 시작 -->
      <div class="footer-logo">
        <h1>Pandang</h1>
      </div>
      <div class="name">
        <p>Gwangin Park</p>
        <p>Duksoo Kim</p>
        <p>Gaeun Lee</p>
        <p>Yeseul Kim</p>
        <p>Yeonjae Chung</p>
        <p>Geonhee Lee</p>
      </div>
      <div class="information">
        <p>주식회사 코나우딩요</p>
        <p>대표 박광인</p>
        <p>서울특별시 강남구</p>
        <p>사업자번호 123-45-67890</p>
        <p>통신판매업 신고: 2022-서울강남-0000</p>
        <p>전화: +82(0)07 1111 2222-3</p>
      </div>
      <!-- 푸터 영역 종료 -->
    </div>
  </body>
  <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/snsWrite.js"></script>
</html>

