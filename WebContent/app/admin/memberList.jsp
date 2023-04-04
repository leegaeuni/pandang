<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>member-list</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin_member-list.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
    />
  </head>
  <body>
    <!-- Header -->
    <header>
      <!-- 로고 이미지 -->
      <div class="logo-wrap">
        <a href="#">
          <img src="${pageContext.request.contextPath}/assets/img/logo.jpg" />
        </a>
      </div>
      <!-- 로그아웃 버튼 -->
      <div class="logout-btn">
        <a href="#">로그아웃</a>
      </div>
    </header>

    <!-- Main -->
    <section class="main-container">
      <!-- 왼쪽 사이드 네비게이션바 -->
      <div class="left-nav">
        <nav>
          <ul>
            <li>
              <!-- 클릭하면 신고내역을 띄워준다.(관리자 페이지 로그인 시 기본화면) -->
              <a href="#" class="change-page-report">신고 내역</a>
            </li>
            <li>
              <!-- 클릭하면 회원목록 페이지로 이동. -->
              <a href="#" class="change-page-member">회원 목록</a>
            </li>
          </ul>
        </nav>
      </div>

      <!-- 게시글 목록 -->
      <div class="board-wrap">
        <div class="member-contents-title">
          <div class="member-number">번호</div>
          <div class="member-id">ID</div>
          <div class="member-author">이름</div>
          <div class="member-status">회원 상태</div>
          <div class="member-control">제재</div>
        </div>

		<c:choose>
			<c:when test="${not empty memberList }">
				<c:forEach var="member" items="${memberList }">
					
			        <div class="member-list">
			          <div class="member-list-number">1</div>
			          <div class="member-list-id">sanghoon</div>
			          <div class="member-list-author">문상훈</div>
			          <!-- 관리자가 부여한 상태에 따라 텍스트 변환
			              ex) 활동, 정지 등 -->
			          <div class="member-list-status">활동</div>
			          <div class="member-list-control">
			            <button class="control-btn">탈퇴</button>
			          </div>
			        </div>
					
				</c:forEach>
			</c:when>
		</c:choose>				

        <!-- 검색 창 -->
        <div class="search-wrap">
          <input
            class="search-input"
            type="text"
            placeholder="검색할 ID를 입력하세요."
          />
          <button class="search-btn">검색</button>
        </div>

        <!-- 페이징 처리 -->
        <!-- 페이지 당 게시물 10개 -->
        <div class="pagination">
          <ul>
            <li><a href="#" class="prev">&lt;</a></li>
            <li><a href="#" class="active">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#" class="next">&gt;</a></li>
          </ul>
        </div>
      </div>
    </section>

    <!-- Footer -->
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
  </body>
</html>
