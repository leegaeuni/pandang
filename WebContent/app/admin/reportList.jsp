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
    <link rel="stylesheet"
   		href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  </head>
  <body>
    <!-- Header -->
    <header>
      <!-- 로고 이미지 -->
      <div class="logo-wrap">
        <a href="${pageContext.request.contextPath}/admin.ad">
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
			            <span class="go-member-btn">${report.getReportedMemberId()}</span>
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
	
	<!-- store 모달 -->
	
	<div class="s-post-modal-background"></div>
	
	<div class="s-post-modal">
		<div class="s-post-box">
            <div class="s-post-header-container">
              <div class="s-post-header-box">
                <div class="s-post-header">
                  <!-- @@@@@ 모달 게시글 헤더 @@@@@@@@@ -->
                  <div class="s-post-title">임시 게시글 제목</div>
                  <div class="s-post-date-categori-box">
                    <div class="s-post-date">2023.3.23</div>
                    <div>l</div>
                    <div class="s-post-categori">패션</div>
                  </div>
                 <!--  @@@@@@@@@ 모달 게시글 헤더 끝 @@@@@@@@@@ -->
                </div>
                <div class="s-post-information">
                  <!-- @@@@@@@@@ 게시글 조회, 좋아요, 댓글 수 @@@@@@@@@@ -->
                  <div class="s-post-view-cnt">
                    <span class="material-symbols-outlined"> visibility </span>
                    <div class="s-view-cnt">32</div>
                  </div>
                  <div class="s-post-like-cnt">
                    <span class="material-symbols-outlined"> favorite </span>
                    <div class="s-p-like-cnt">77</div>
                  </div>
                  <div class="s-post-comment-cnt">
                    <span class="material-symbols-outlined"> chat_bubble </span>
                    <div class="s-comment-cnt">33</div>
                  </div>
                  <!-- @@@@@@@@@ 모달 조회,좋아요,댓글 수 끝 @@@@@@@@@@ -->
                </div>
              </div>
            </div>
            <div class="s-post">
            	<div class="s-post-img"></div>
            	<div class="s-post-content"></div>
            </div>
            <div class="s-post-comment-box">
              <!-- @@@@@댓글 창@@@@@@@@@ -->
              <div class="s-comment-container">
              <div class="s-commentL">
                <!-- <div class="s-comment-list">
                 @@@@@@@@@ 댓글 list @@@@@@@@@@
                  <a herf="#" class="s-comment-user-profile-shortcuts">
                    <div class="s-comment-user-profile-wrap">
                      <img
                        src="https://cdn-bastani.stunning.kr/prod/users/3dbbdc56-858d-4d0e-b467-1463957476e3/avatar/ZQdoCULUEydS7bnM.image.jpg.small?q=60&t=crop&s=300x300"
                        alt=""
                      />
                    </div>
                  </a>
                  <div class="s-text-wrap">
                    <div class="s-comment-member-info">
                      <a href="#" class="s-member-id">leeegaeun0923</a>
                      <div class="s-box"></div>
                      <div class="s-comment-date">4일 전</div>
                      @@@@ 댓글 작성자와 로그인 한사람 일치할시 보여야함 @@@ 
                      display : flex로 변경되게 해주세요 
                    일단은 none 처리 
                      <div class="s-comment-edit-delete-btn-box">
                        <button class="s-comment-edit-btn">수정</button>

                        <button class="s-comment-delete-btn">삭제</button>
                      </div>
                      <div class="s-edit-btn-box">
                      <button type="submit" class="s-edit-btn">
                        수정 완료
                      </button>
                  </div>
                    </div>
                    <div class="s-height-box"></div>
                    <div class="s-comment">
                      <span class="s-comment-content"
                        >너무 마음에 드는 작품이에요~~~~
                      </span>
                      @@@@@@ 댓글 수정 form 경로처리 @@@@@@
                      <form action="" method="post">
                        <div class="s-comment-edit-box">
                          <textarea name="" id="comment-edit">
                          <span class="comment-content"
                          >너무 마음에 드는 작품이에요~~~~
                        </span>
                      </textarea
                          >
                        </div>
                        <div class="s-edit-btn-box">
                          <button type="submit" class="s-edit-btn">
                            수정 완료
                          </button>
                        </div>
                      </form>
                      댓글 수정 form 영역 끝
                    </div>
                  </div>
                  @@@@@@@@@ 댓글 리스트 끝  @@@@@@@@@@
                </div> -->
                <!-- <div class="s-comment-list">
                  <a herf="#" class="s-comment-user-profile-shortcuts">
                    <div class="s-comment-user-profile-wrap">
                      <img
                        src="https://cdn-bastani.stunning.kr/prod/users/3dbbdc56-858d-4d0e-b467-1463957476e3/avatar/ZQdoCULUEydS7bnM.image.jpg.small?q=60&t=crop&s=300x300"
                        alt=""
                      />
                    </div>
                  </a>
                  <div class="s-text-wrap">
                    <div class="s-comment-member-info">
                      <a href="#" class="s-member-id">leeegaeun0923</a>
                      <div class="s-box"></div>
                      <div class="s-comment-date">4일 전</div>
                    </div>
                    <div class="s-height-box"></div>
                    <div class="s-comment">
                      <span class="s-comment-content"
                        >댓글 늘어나면 영역 늘어나는지 테스트중
                      </span>
                    </div>
                  </div>
                </div> -->
                </div>
              <!--   @@@@@@@@@ 댓글 작성 form 경로 처리 해야함 @@@@@@ -->
                <!-- <form action="" method="post" id="comment-form">
                  <div class="write-area">
                    @@@@@@@@@ 댓글 작성 공간 @@@@@@@@@@
                    <div class="comment-profile-container">
                      <div class="user-profile-wrap">
                        <img
                          class="user-profile-img"
                          src="https://cdn-bastani.stunning.kr/prod/users/16da7ecc-6e99-4388-8825-14c6d4de5f83/avatar/klucystudio_face.jpg.small?q=60&t=crop&s=300x300"
                          alt=""
                        />
                      </div>
                    </div>
                    <label class="comment-input-box">
                      <textarea
                        class="comment-input-area"
                        placeholder="이 창작물에 대한 댓글을 남겨주세요."
                      ></textarea>
                    </label>
                    @@@@@@@@@ 댓글 작성 공간 끝 @@@@@@@@@@
                  </div>
                  <div class="submit-btn-box">
                    @@@@@@@@@ 댓글 작성 버튼 @@@@@@@@@@
                    <button class="comment-submit-btn" type="submit">
                      댓글 작성
                    </button>
                    @@@@@@@@@ 버튼 끝 @@@@@@@@@@
                  </div>
                </form> -->
              
             </div>
              <!-- @@@@@@@@@ 댓글창 끝 @@@@@@@@@@ -->
            </div>
            <!-- @@@@@@@@@ post 영역 끝 @@@@@@@@@@ -->
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
