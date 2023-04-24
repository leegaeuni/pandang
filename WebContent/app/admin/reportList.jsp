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
	            <li class="change-sns click find">
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
        
        <div class="report-list">
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
			          <input type="hidden" class="reportSnsNumber" value="${report.getReportSnsNumber()}">
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
      	</div>

		<div class="search-wrap">
          <input
            class="search-input"
            type="text"
            placeholder="검색할 제목을 입력하세요."
          />
          <button class="search-btn">검색</button>
        </div>
		
        <!-- 페이징 처리 -->
        <div class="pagination">
          <input class="startPage" type="hidden" name="startPage" value="${startPage }">
          <input class="endPage" type="hidden" name="endPage" value="${endPage }">
          <c:if test="${prev}">
               <li><a href="" class="prev">&lt;</a></li>
            </c:if>
            
            <c:forEach var="i" begin="${startPage}" end="${endPage}">
               <c:choose>
                  <c:when test="${!(i == page) }">
                     <li>
                        <a href="" class='number-btn'>
                           <c:out value="${i}"/>
                        </a>
                     </li>
                  </c:when>
                  <c:otherwise>
                     <li>
                        <a href="#" class="active number-btn">
                           <c:out value="${i}"/>
                        </a>
                     </li>
                  </c:otherwise>
               </c:choose>
            </c:forEach>
            
            <c:if test="${next}">
               <li><a href="" class="next">&gt;</a></li>
            </c:if>
        </div>
      </div>
    </section>
	<div class="modal-box">
		<div class="modal-background"></div>
		
		<div id="modal">
			<div class="slides-wrap">
				<ul class="slide-box">
	
				</ul>
				
				
				<div class="btn-box">
					<!-- 이전 이미지보기와 다음 이미지보기 버튼 -->
					<button class="post-img-prev">&lt</button>
					<button class="post-img-next">&gt</button>
				</div>
				
				
			</div>
			<!-- 모달 댓글창 영역 -->
			
			<div class="comment-container">
				<!-- 게시글 작성자 프로필 박스 -->
				<div class="host-profile">
				
					<div class="host-profile-img-box">
						<a href="#"> 
						<img class="host-profile-img" src="/upload/${snsMemberInfo.getChannelFileSystemName()}" alt="" />
						</a>
					</div>
					
					<div class="host-name-box">
						<span class="host-name"> 
						
						</span>
					</div>
					
					<!-- 프로필 박스 끝 -->
				</div>
				<!-- @@@@@@ 모달 댓글 영역 @@@@@@ -->
				<div class="comment-list">
					<div class="host-comment-content-wrap">
						<span class="host-comment-content"></span>
					</div>
					<div class= "comment">
					
					</div>	

								<!-- @@@@@@ 모달 댓글 영역 끝 @@@@@@ -->
				</div>

				<!-- 모달 좋아요, 게시일 -->
				<div class="modal-like-date">
				
					<div class="like-wrap">
						<img class="before-like-btn"
							src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
							alt="heart" />


						<!-- 임시 좋아요 수 -->
						<div class="like-cnt"></div>
						개
					</div>
					<div class="post-date"></div>
				</div>
				
				<div class="mini-post-content">
					<input class="comment-box" type="text" id= "commentContent" placeholder="댓글을 입력해 주세요" />
					<input type="hidden" class="memberNumber" value="${sessionScope.memberNumber}" />
					<button type="submit" class="submit">게시</button>
				</div>
				
			</div>
		</div>
		
	</div>
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
