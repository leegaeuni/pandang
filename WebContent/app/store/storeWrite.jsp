<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/storeWrite.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@900&display=swap" rel="stylesheet">
  </head>
  <body>
    <div class="header-container">
      <!-- 헤더 영역 시작  -->
      <div class="start-container">
        <a href="#"
          ><img
            src="${pageContext.request.contextPath}/assets/img/logo.jpg"
            alt=""
            class="logo-img"
        /></a>
        <a href="#" class="header-list">판당</a>
        <font>·</font>
        <a href="#" class="header-list">산당</a>
        <font>·</font>
        <a href="#" class="header-list">sns</a>
      </div>
      <div class="search">
        <input
          type="text"
          class="search-bar"
          placeholder="어떤 창작물을 찾으시나요?"
        />
        <a href="#">
          <button type="button" class="material-symbols-outlined">
            search
          </button>
        </a>
      </div>
      <div class="login-container">
        <a href="#" class="new-upload__btn">새로운 작업 업로드</a>
        <!-- Header Icons -->
        <a href="#">
          <i class="fa-solid fa-briefcase fa-lg"></i>
        </a>
        <a href="#">
          <i class="fa-solid fa-envelope fa-lg"></i>
        </a>
        <a href="#">
          <i class="fa-solid fa-bell fa-lg"></i>
        </a>
        <a href="#">
          <img
            class="profile-btn"
            src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbpFVEm%2FbtrDFJ0y6ay%2FQxkvQdVw0b8FbizouorSqK%2Fimg.jpg"
            alt=""
          />
        </a>
      </div>
    </div>

    <!-- Main -->
    <div class="main-container">
      <div class="write-wrap">
        <div class="title">
          <div class="write-title">
            <input type="text" placeholder="상품명을 입력하세요" />
          </div>
          <div class="write-price">
            <input type="number" placeholder="가격을 입력하세요" />
            <span>원</span>
          </div>
        </div>
        <div class="write-content__wrap">
          <div class="contents">
            <form id="write-form" action="${pagetContext.request.contextPath}/store/storeWrite.sw" method="post" enctype="multipart/form-data">      
           <div id="text-area">
           <textarea id="text-box" style="display:none"></textarea>  
          <p>콘텐츠를 선택하여 업로드를 시작하세요.</p>     
            <div class="tools">
              <div class="tool-wrap">
               <input type="file" id="img-file" name="boardFile"
         accept=".jpg, .jpeg, .png" multiple />
                <label for="img-file" class="custom-file-upload"><div class="image">
                  <img src="${pageContext.request.contextPath}/assets/img/add_image.png" />
                </div></label>
                <div class="text">이미지</div>
                 <div class="img-controller-box">
   			   <ul class="file-list">

    		  </ul>
 			  </div>
              </div>
              <div class="tool-wrap">
                 <button onclick="toggleTextBox()"><div class="image">
                 <img src="${pageContext.request.contextPath}/assets/img/add_text.png" />
                </div></button>
                <div class="text">텍스트</div>
              </div>
              <div class="tool-wrap">
                <div class="image">
                  <img src="${pageContext.request.contextPath}/assets/img/add_video.png" />
                </div>
                <div class="text">동영상</div>
              </div>
              <div class="tool-wrap">
                <div class="image">
                  <img src="${pageContext.request.contextPath}/assets/img/add_grid.png" />
                </div>
                <div class="text">이미지 그리드</div>
              </div>
            </div>
          </div>
         </form>
        </div>
      </div>
      </div>
      <!-- 오른쪽 버튼 박스 -->
      <div class="add-btn__container">
        <div class="add-btn__wrap">
             <label for="img-file" class="custom-file-upload"><div class="images">
            <img src="${pageContext.request.contextPath}/assets/img/add_image.png" />
            <div class="text">이미지 추가</div>
          </div></label>
            <button onclick="toggleTextBox()"><div class="images">
         <img src="${pageContext.request.contextPath}/assets/img/add_text.png" />
            <div class="text">텍스트 추가</div>
          </div></button>
          <div class="images">
            <img src="${pageContext.request.contextPath}/assets/img/add_video.png" />
            <div class="text">동영상 추가</div>
          </div>
          <div class="images">
            <img src="${pageContext.request.contextPath}/assets/img/add_grid.png" />
            <div class="text">이미지 그리드 추가</div>
          </div>
        </div>
        <div class="button-wrap">
          <button type = "submit" class="btn-next">다음</button>
          <button class="btn-cancel">취소</button>
        </div>
      </div>
    </div>

    <!-- @@@@푸터@@@@ -->
    <div class="footer-container">
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
    </div>
    <!-- 푸터 영역 종료 -->
    <script
      src="https://kit.fontawesome.com/9df4873843.js"
      crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/storeWrite.js"></script>
  </body>
</html>
