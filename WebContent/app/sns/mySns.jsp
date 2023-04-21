<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mySns</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/mySns.css" />
</head>
<body>
	<!-- 헤더 파트 시작  css = 9~97-->
	<div class="header-container">
         <!-- 헤더 영역 시작  -->
         <div class="start-container">
            <!-- 메인페이지 이동처리 -->
            <a href="${pageContext.request.contextPath}/main.main"><img
               src="${pageContext.request.contextPath}/assets/img/logo.jpg" alt=""
               class="logo-img" /></a>
            <!-- 판당 페이지 이동처리 -->
            <div class="pandang-container">
               <a href="${pageContext.request.contextPath}/sns/snsOk.sn" class="header-list">판당</a> <font>·</font>
               <!-- 산당 (스토어) 페이지 이동처리 -->
               <a href="${pageContext.request.contextPath}/store/storeOk.st" class="header-list">산당</a>
            </div>
         </div>
         <form action="${pageContext.request.contextPath}/store/storeSearch.st" class="search">
            <input type="text" name="searchInput" class="search-bar" placeholder="어떤 창작물을 찾으시나요?" />
               <button type="submit" class="material-symbols-outlined">
                  search</button>
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

	<!-- 헤더 파트 끝 -->

	<!-- 메인 파트 시작 css = 102~258 -->
	<div id="main-part">
		<div class="info-part">
			<div class="profile-img-wrap">
				<!-- 프로필 이미지 wrap -->
				<div class="profile-img-box">
					<img class="profile-img"
						src="${pageContext.request.contextPath}/upload/${snsMemberInfo.getChannelFileSystemName()}" />
				</div>
				<!-- 프로필 이미지 wrap 끝 -->
			</div>
			<div class="info-user">
				<!-- 멤버 이름  -->
				<div class="member-name-box">
					<div class="name-follow">
					
						<h2 class="info-name">
							<c:out value="${snsMemberInfo.getChannelName()}"></c:out>
						</h2>
						<div class="follow-btn-box">
						<c:if test="${sessionScope.memberNumber != snsMemberInfo.getMemberNumber()}">
							
							<c:choose>
							<c:when test="${ifFollowed eq 'follow'}">
								<button class="following-btn">
								팔로잉 
									<span class="material-symbols-outlined"> check </span>
								</button>
							 </c:when>
							 <c:otherwise>
							
							<button class="follow-btn">팔로우</button>
							 
							</c:otherwise>
							</c:choose>
							 </c:if>
							
						</div>
					</div>
					
					
					
					<div class="profile-edit-path-box">
					<c:if test="${sessionScope.memberNumber == snsMemberInfo.getMemberNumber()}">
				
						<a href="${pageContext.request.contextPath}/member/mypageOk.me">
							<button class="profile-edit-path-btn">프로필 편집</button>
						</a>
						</c:if>
					</div>
					
				</div>

				<div class="member-cnt">
					<div class="post-cnt-box">
						게시물 <span class="post-cnt"> <c:out
								value="${snsMemberInfo.getSnsCount()}"></c:out>
						</span>
					</div>
					<div class="follower-cnt-box">
						팔로워 <span class="follower-cnt"> <c:out
								value="${snsMemberInfo.getToCount()}"></c:out>
						</span>
					</div>
					<div class="following-cnt-box">
						팔로우 <span class="following-cnt"> <c:out
								value="${snsMemberInfo.getFromCount()}"></c:out>
						</span>
					</div>
				</div>
				<div class="member-info-msg-box">
					<!-- @@@@@ 자동 줄바꿈 처리 추가 @@@@@ -->
					<span> <c:out value="${snsMemberInfo.getChannelComment()}"></c:out>
					</span>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인 파트 끝 -->

	<!-- 메인이랑 거리두기용 클래스 -->
	<div class="nav-line"></div>

	<!-- @@@@@@@ 네비 파트 시작  @@@@@@-->
	<div class="navbar">
		<button type="button" class="prev">
			<span class="material-symbols-outlined"> arrow_back_ios_new </span>
		</button>
		<div class="sns-post-tab">
			<button type="button" id="post-btn">게시글</button>
		</div>
		<div class="store-post-tab">
			<button type="button" id="store">스토어</button>
		</div>
		<button type="button" class="next">
			<span class="material-symbols-outlined"> arrow_forward_ios </span>
		</button>
	</div>
	<!-- @@@@@ 네비 파트 끝 @@@@@ -->

	<!-- @@@@@ 모달 파트 시작 @@@@@-->
	<div class="modal-box">
		<div class="modal-background"></div>
		<div class="report-path">
			<!-- @@@@ 신고하기  @@@@@ -->
			<div class="report-msg">
				<h1>신고 사유를 작성해주세요.</h1>
			</div>
			<!-- @@@@@@@@ 신고 내용 폼 경로처리 @@@@@@ -->
			<form action="" method="post">
				<div class="report-content-box">
					<div class="report-title">
						<input type="text" name="reportTitle" placeholder="제목을 입력해주세요." />
					</div>
					<div class="report-content">
						<textarea name="reportContent" id="report-content"
							placeholder="신고 사유를 500자 이내로 작성해주세요."></textarea>
					</div>
					<div class="report-btn">
						<button type="submit">작성 완료</button>
					</div>
				</div>
			</form>
			<!-- @@@@@ 신고하기 영역 끝 @@@@@ -->
		</div>
		<div id="modal">
			<div class="slides-wrap">
				<ul class="slide-box">
					<%--  <li>
					<img class="modal-img" src="https://cdn-dantats.stunning.kr/prod/portfolios/440fe107-612d-4c10-b068-d4bc572d2bcb/covers/2DbVojavJ5goYbuG.600.jpg.small?q=70&t=crop&e=0x0&s=598x598" />
					</li>

					<li>
					<img class="modal-img" src="${pageContext.request.contextPath}/assets/img/SNSPage/01.jpeg" />
					</li>

					<li>
					<img class="modal-img" src="https://cdn-dantats.stunning.kr/prod/portfolios/440fe107-612d-4c10-b068-d4bc572d2bcb/covers/2DbVojavJ5goYbuG.600.jpg.small?q=70&t=crop&e=0x0&s=598x598" />
					</li>

					<li>
					<img class="modal-img"src="${pageContext.request.contextPath}/assets/img/SNSPage/01.jpeg" />
					</li>

					<li>
					<img class="modal-img" src="${pageContext.request.contextPath}/assets/img/SNSPage/01.jpeg" />
					</li>  --%>
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
						<c:out value="${snsMemberInfo.getChannelName()}"></c:out>
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
		<div id="modal-btn-box-wrap">
			<!-- @@@@@ 프로필 버튼 @@@@ -->
			<div class="modal-profile-btn-box">
				<div class="modal-profile-btn modal-btn-box">
					<a href="#" class="author-info">
						<div class="author-img-back"></div>
						<div class="author-profile">
							<img class="author-profile-img"
								src="/upload/${snsMemberInfo.getChannelFileSystemName()}"
								alt="" />
						</div>
					</a>
					 <span class="modal-btn-list">프로필</span>
				</div>
			</div>
			<!-- 팔로우 버튼 -->
			<c:if test="${sessionScope.memberNumber != snsMemberInfo.getMemberNumber()}">
			<div class="modal-follow-btn-box modal-btn-box">
			<input class="memberNumberFrom" type="hidden" value="${sessionScope.memberNumber}">
			<input class="memberNumberTo" type="hidden" value="${snsMemberInfo.getMemberNumber()}"/>
				<button type="button" class="modal-follow-btn btn-color"
					id="modal-btn">
					<span class="material-symbols-outlined add"> add </span> <span
						class="material-symbols-outlined done"> done </span>
				</button>
				<span class="modal-btn-list">팔로우</span>
			</div>
			</c:if>
			
			<c:if test="${sessionScope.memberNumber == snsMemberInfo.getMemberNumber()}">
			<!-- 수정하기 버튼  -->
			<div class="modal-edit-btn-box modal-btn-box">
				<button type="button" class="modal-edit-btn btn-color"
					id="modal-btn">
					<span class="material-symbols-outlined"> edit </span>
				</button>
				<span class="modal-btn-list">수정하기</span>
			</div>
			<!-- 삭제하기 버튼 -->
			<div class="modal-delete-btn-box modal-btn-box">
				<a href=#>
				
				<button type="button" class="modal-delete-btn btn-color"
					id="modal-btn">
					<span class="material-symbols-outlined"> delete </span>
				</button>
				</a>
				<span class="modal-btn-list">삭제하기</span>
			</div>
			</c:if>
			<!-- 신고하기 버튼  -->
			<c:if test="${sessionScope.memberNumber != snsMemberInfo.getMemberNumber()}">
			<div class="modal-report-btn-wrap modal-btn-box">
				<button type="button" class="modal-report-btn report-btn-color"
					id="modal-btn">
					<span class="material-symbols-outlined"> error </span>
				</button>
				<span class="modal-btn-list">신고하기</span>
			</div>
			</c:if>
		</div>
	</div>
	<!-- 모달 파트 끝 -->

	<section id="post">
		<ul class="list-box">
			<li class="silde-part">
			
				<div class='snsList'>
				<input class="realEndPage" type="hidden" value="${realEndPage}">
				
				<c:choose>
					<c:when test="${not empty snsPostInfo}">

					
						<c:forEach var="sns" items="${snsPostInfo}" varStatus="loopStatus">
						
							<c:if test="${sns.getSnsNumber() == 0}">

								<div>
									<h1>아직 등록된 게시글이 없습니다!</h1>
								</div>

							</c:if>
							
							
							 <c:if test="${loopStatus.index % 3 == 0}">
								<div class="post-section"></div>
							</c:if>



								<div class="post-part">
								<input class="snsNumber" type="hidden"
									value="${sns.getSnsNumber()}"> 
									<input class="storeNumber" type="hidden"
									value="${store.getStoreNumber()}">
									<img class="post-image" src="/upload/${sns.getSnsFileSystemName()}" />
								<div class="post-info">
									<div class="post-name-box">
										<span class="post-name"> <c:out
												value="${sns.getSnsTitle()}"></c:out>
										</span>
									</div>
									<div class="date-like-wrap">
										<div class="post-date-box">
											<span class="post-date"> <c:out
													value="${sns.getSnsDate()}"></c:out>
											</span>
										</div>
										<div class="post-like-cnt-box">
											<span class="heart">♥</span> <span class="like-cnt"> <c:out
													value="${sns.getLikeCnt()}"></c:out>
											</span>
										</div>
										<div class="post-view-cnt-box">
											<span class="material-symbols-outlined"> visibility </span> <span
												class="view-cnt"> <c:out
													value="${sns.getSnsViewCnt()}"></c:out>
											</span>
										</div>
									</div>
								</div>
							</div>
							
						</c:forEach>
						
		
					
					 </c:when>
					
					
				</c:choose>

				</div>
				
			</li>
		</ul>
	</section>
	<!-- 게시물 파트 끝 -->
	<div class="s-modal-background"></div>
	<div class="s-post-modal">
      <div class="s-post-box">
        <div class="s-profile-path">
          <div class="s-profile-modal-img-box">
            <a href="#" id="s-modal-img-box">
              <img
                class="s-profile-modal-img"
                src="/upload/${snsMemberInfo.getChannelFileSystemName()}"
                alt=""
              />
              <div class="s-modal-img-background"></div>
            </a>
          </div>
          <div class="s-profile-modal-member">
            <a href="#" class="hostChannelName">${snsMemberInfo.getChannelName()}</a>
          </div>
          <c:if test="${sessionScope.memberNumber != snsMemberInfo.getMemberNumber()}">
          <div class="s-profile-modal-follow-btn-box">
            <button class="s-profile-modal-follow-btn" type="button">
              팔로우
            </button>
            <button class="s-profile-modal-following-btn" type="button">
              <span class="material-symbols-outlined">done</span>
              <span id="#s-following">팔로잉</span>
            </button>
          </div>
          </c:if>
        </div>
        <div class="s-report-path">
          <!-- @@@@ 신고하기  @@@@@ -->
          <div class="s-report-msg">
            <h1>신고 사유를 작성해주세요.</h1>
          </div>
          <!-- @@@@@@@@ 신고 내용 폼 경로처리 @@@@@@ -->
          <form action="" method="post">
            <div class="s-report-content-box">
              <div class="s-report-title">
                <input
                  type="text"
                  name="reportTitle"
                  placeholder="제목을 입력해주세요."
                />
              </div>
              <div class="s-report-content">
                <textarea
                  name="reportContent"
                  id="report-content"
                  placeholder="신고 사유를 500자 이내로 작성해주세요."
                ></textarea>
              </div>
              <div class="s-report-btn">
                <button type="submit">작성 완료</button>
              </div>
            </div>
          </form>
          <!-- @@@@@ 신고하기 영역 끝 @@@@@ -->
        </div>
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
              <!-- @@@@@@@@@ 모달 게시글 헤더 끝 @@@@@@@@@@ -->
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
          <!-- @@@@@@@@@ 모달 게시글 본문 @@@@@@@@@@ -->
          <p>게시글 작성 테스중</p>
          <p>게시글 작성 테스중</p>
          <p>게시글 작성 테스중</p>
          <img
            src="https://cdn-bastani.stunning.kr/prod/portfolios/16da7ecc-6e99-4388-8825-14c6d4de5f83/contents/VymrA8ubdEQF5EoT.1201%E1%84%83%E1%85%A6%E1%84%87%E1%85%B1_%E1%84%82%E1%85%A1%E1%84%86%E1%85%AE%E1%84%8C%E1%85%A1%E1%84%89%E1%85%AE-%E1%84%91%E1%85%A9%E1%84%89%E1%85%B3%E1%84%90%E1%85%A5_%E1%84%80%E1%85%A1%E1%84%85%E1%85%A9_%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A9%E1%86%BC%E1%84%89%E1%85%A9%E1%84%8C%E1%85%A2_s.jpg"
            alt=""
          />
          <p>게시글 작성 테스중</p>
          <p>게시글 작성 테스중</p>
          <img
            src="https://cdn-bastani.stunning.kr/prod/portfolios/16da7ecc-6e99-4388-8825-14c6d4de5f83/contents/VymrA8ubdEQF5EoT.1201%E1%84%83%E1%85%A6%E1%84%87%E1%85%B1_%E1%84%82%E1%85%A1%E1%84%86%E1%85%AE%E1%84%8C%E1%85%A1%E1%84%89%E1%85%AE-%E1%84%91%E1%85%A9%E1%84%89%E1%85%B3%E1%84%90%E1%85%A5_%E1%84%80%E1%85%A1%E1%84%85%E1%85%A9_%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A9%E1%86%BC%E1%84%89%E1%85%A9%E1%84%8C%E1%85%A2_s.jpg"
            alt=""
          />
          <p>게시글 작성 테스중</p>
          <p>게시글 작성 테스중</p>
          <!-- @@@@@@@@@ 모달 게시글 본문 끝 @@@@@@@@@@ -->
        </div>
        <div class="s-post-comment-box">
          <!-- @@@@@댓글 창@@@@@@@@@ -->
          <div class="s-comment-container">
          <div class="s-commentL">
            <div class="s-comment-list">
              <!-- @@@@@@@@@ 댓글 list @@@@@@@@@@ -->
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
                  <span class="s-comment-content">
                  너무 마음에 드는 작품이에요~~~~
                  </span>
                 
                </div>
              </div>
              <!-- @@@@@@@@@ 댓글 리스트 끝  @@@@@@@@@@ -->
            </div>
            </div>
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
            <!-- @@@@@@@@@ 댓글 작성 form 경로 처리 해야함 @@@@@@ -->
           
              <div class="s-write-area">
                <!-- @@@@@@@@@ 댓글 작성 공간 @@@@@@@@@@ -->
                <div class="s-comment-profile-container">
                  <div class="s-user-profile-wrap">
                    <img
                      class="s-user-profile-img"
                      src="https://cdn-bastani.stunning.kr/prod/users/16da7ecc-6e99-4388-8825-14c6d4de5f83/avatar/klucystudio_face.jpg.small?q=60&t=crop&s=300x300"
                      alt=""
                    />
                  </div>
                </div>
                <label class="s-comment-input-box">
                  <textarea
                    class="s-comment-input-area"
                    placeholder="이 창작물에 대한 댓글을 남겨주세요."
                  ></textarea>
                </label>
                <!-- @@@@@@@@@ 댓글 작성 공간 끝 @@@@@@@@@@ -->
              </div>
              <div class="s-submit-btn-box">
                <!-- @@@@@@@@@ 댓글 작성 버튼 @@@@@@@@@@ -->
                <button class="s-comment-submit-btn" type="submit">
                  댓글 작성
                </button>
                <!-- @@@@@@@@@ 버튼 끝 @@@@@@@@@@ -->
              </div>
            
          </div>
          <!-- @@@@@@@@@ 댓글창 끝 @@@@@@@@@@ -->
        </div>
        <!-- @@@@@@@@@ post 영역 끝 @@@@@@@@@@ -->
      </div>
      <div class="s-post-btn-box-wrap">
        <div class="s-post-btn-box" id="s-profile">
          <div class="s-modal-profile-btn s-btn-wrap-flex">
            <a href="#" class="s-author-info">
              <div class="s-author-img-back"></div>
              <div class="s-author-profile">
                <img
                  class="s-author-profile-img"
                  src="/upload/${snsMemberInfo.getChannelFileSystemName()}"
                  alt=""
                />
              </div>
            </a>
            <span class="s-modal-btn-list">프로필</span>
          </div>
        </div>
        <!-- @@@ 모달 픽시드 팔로우 버튼 내 글일시 안 보여야함 @@@ -->
        <c:if test="${sessionScope.memberNumber != snsMemberInfo.getMemberNumber()}">
        <div class="s-post-btn-box" id="s-follow">
          <div class="s-modal-follow-btn-wrap s-btn-wrap-flex">
            <button type="button" class="s-modal-follow-btn s-btn-color">
              <span class="material-symbols-outlined add"> add </span>
              <span class="material-symbols-outlined done"> done </span>
            </button>
            <span class="s-modal-btn-list">팔로우</span>
          </div>
        </div>
        </c:if>
        <!-- @@@ 팔로우 영역 끝 @@@ -->
        <div class="s-post-btn-box" id="s-like">
          <div class="s-modal-like-btn-wrap s-btn-wrap-flex">
            <button type="button" class="modal-like-btn s-like-btn-color">
              <span class="material-symbols-outlined"> favorite </span>
            </button>
            <span class="s-modal-btn-list">좋아요</span>
          </div>
        </div>
        <!-- @@@ 좋아요 영역 끝 @@@ -->
        <!-- @@@ 모달 픽시드 장바구니 버튼 내 글일시 안 보여야함 @@@ -->
        <c:if test="${sessionScope.memberNumber != snsMemberInfo.getMemberNumber()}">
        <div class="s-post-btn-box" id="s-basket">
          <div class="s-modal-basket-btn-wrap s-btn-wrap-flex">
            <button type="button" class="s-modal-btn s-btn-color">
              <span class="material-symbols-outlined"> shopping_basket </span>
            </button>
            <span class="s-modal-btn-list">장바구니</span>
          </div>
        </div>
        </c:if>
        <!-- @@@ 장바구니 영역 끝 @@@ -->
        <!-- @@@ 모달 픽시드 구매하기 버튼 내 글일시 안 보여야함 @@@ -->
        <c:if test="${sessionScope.memberNumber != snsMemberInfo.getMemberNumber()}">
        <div class="s-post-btn-box" id="s-buy">
          <div class="s-modal-buy-btn-wrap s-btn-wrap-flex">
            <!-- @@@@@ 구매하기 페이지 경로 이동 처리 해야함 @@@@@ -->
            <a href="#">
              <button type="button" class="s-modal-buy-btn s-btn-color">
                <span class="material-symbols-outlined"> attach_money </span>
              </button>
            </a>
            <span class="s-modal-btn-list">구매하기</span>
          </div>
        </div>
        </c:if>
        <!-- @@@ 신고하기 영역 끝 @@@ -->
        <!-- @@@ 모달 픽시드 신고하기 버튼 내 글일시 안 보여야함 @@@ -->
        <c:if test="${sessionScope.memberNumber != snsMemberInfo.getMemberNumber()}">
        <div class="s-post-btn-box" id="s-report">
          <div class="s-modal-report-btn-wrap s-btn-wrap-flex">
            <button type="button" class="s-modal-report-btn s-report-btn-color">
              <span class="material-symbols-outlined"> error </span>
            </button>
            <span class="s-modal-btn-list">신고하기</span>
          </div>
        </div>
        </c:if>
        <!-- @@@ 수정하기 영역 끝 @@@ -->
        <!-- @@@ 모달 픽시드 수정하기 버튼 내 글일시  보여야함 @@@ -->
        <c:if test="${sessionScope.memberNumber == snsMemberInfo.getMemberNumber()}">
        <div class="s-post-btn-box" id="s-edit">
          <div class="s-modal-edit-btn-wrap s-btn-wrap-flex">
            <button type="button" class="s-modal-edit-btn s-btn-color">
              <span class="material-symbols-outlined"> edit </span>
            </button>
            <span class="s-modal-btn-list">수정하기</span>
          </div>
        </div>
        </c:if>
        <!-- @@@ 삭제하기 영역 끝 @@@ -->
        <!-- @@@ 모달 픽시드 삭제하기 버튼 내 글일시  보여야함 @@@ -->
        <c:if test="${sessionScope.memberNumber == snsMemberInfo.getMemberNumber()}">
        <div class="s-post-btn-box" id="s-delete">
          <div class="s-modal-delete-btn-wrap s-btn-wrap-flex">
            <button type="button" class="s-modal-delete-btn s-btn-color">
              <span class="material-symbols-outlined"> delete </span>
            </button>
            <span class="s-modal-btn-list">삭제하기</span>
          </div>
        </div>
        </c:if>
      </div>
    </div>


	<!-- 푸터 시작 css = 822~857 -->
	<div id="footer-container">
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/mySns.js"></script>
	
</body>
</html>