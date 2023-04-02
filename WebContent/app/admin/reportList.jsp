<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>report-list (default)</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin_report-list.css" />
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
        <a href="${pageContext.request.contextPath}/admin/logoutOk.ad">로그아웃</a>
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
            <div>
	            <li class="change-sns">
	            sns
	            </li>
	            <li class="change-store">
	            store
	            </li>
            </div>
            <li>
              <!-- 클릭하면 회원목록 페이지로 이동. -->
              <a href="#" class="change-page-member">회원 목록</a>
            </li>
          </ul>
        </nav>
      </div>

      <!-- 번호, 제목, 작성자, 생성일 -->
      <!-- 게시글 목록 -->
      <div class="board-wrap">
        <div class="board-contents-title">
          <div class="board-number">번호</div>
          <div class="board-title">제목</div>
          <div class="board-author">작성자</div>
          <div class="board-date">생성일</div>
        </div>
        
      <c:choose>
      	<c:when test="${not empty reportList}">
      		<c:forEach var="report" items="${reportList}">
      			
		        <div class="board-list">
		          <div class="board-list-number">${report.getReportNumber() }</div>
		          <!-- 게시물 제목 클릭하면 밑에 신고 상세내용 보이게 한다. -->
		          <a href="#" class="board-list-title">${report.getReportTitle() }</a>
		          <div class="board-list-author">${report.getMemberId() }</div>
		          <div class="board-list-date">${report.getReportDate() }</div>
		        </div>
		
		        <!-- 게시물 제목 클릭 시 신고내용이 보여진다. -->
		        <div class="report-contents-wrap">
		          <div class="report-content">
		            <p>
		              ${report.getReportContent()}
		            </p>
		          </div>
		          <div class="report-btn-wrap">
		            <!-- 클릭 시 해당 회원정보로 이동 -->
		            <a href="#">${report.getReportedMemberId()}</a>
		            <!-- 클릭 시 해당 게시물로 이동 -->
		            <button class="go-post-btn">게시물 보기</button>
		          </div>
		        </div>
        
      		</c:forEach>
      	</c:when>
      	<c:otherwise>
                  <tr>
                     <td colspan="5" align="center">등록된 게시물이 없습니다.</td>
                  </tr>
        </c:otherwise>
      </c:choose>

        <!-- 페이징 처리 -->
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
    <script src="${pageContext.request.contextPath}/assets/js/admin_report-list.js"></script>
  </body>
</html>
