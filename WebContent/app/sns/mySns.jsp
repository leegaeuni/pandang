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
			<a href="#">
			<img src="${pageContext.request.contextPath}/assets/img/logo.jpg" alt=""
				class="logo-img" /></a> 
				<a href="#" class="header-list">판당</a> 
				<font>·</font>
			<a href="#" class="header-list">산당</a> 
			<font>·</font> 
			<a href="#" class="header-list">sns</a>
		</div>
		<div class="search">
			<input type="text" class="search-bar" placeholder="어떤 창작물을 찾으시나요?" />
			<a href="#">
				<button type="button" class="material-symbols-outlined">
					search</button>
			</a>
		</div>
		<div class="login-container">
			<c:choose>
				<c:when test="${empty sessionScope.memberNumber}">
			<a href="#" class="login">로그인</a> 
			<a href="#" class="join">회원가입</a> 
				</c:when>
				
				<c:otherwise>
			<a href="#" class="my-page">마이페이지</a> 
			<a href="#" class="logout">로그아웃</a>
				
				</c:otherwise>
			
			</c:choose>
		
	
		</div>
	</div>
	<!-- 헤더 파트 끝 -->

	<!-- 메인 파트 시작 css = 102~258 -->
	<div id="main-part">
		<div class="info-part">
			<div class="profile-img-wrap">
				<!-- 프로필 이미지 wrap -->
				<div class="profile-img-box">
					<img class="profile-img"
						src="${pageContext.request.contextPath}/assets/img/SNSPage/01.jpeg" />
				</div>
				<!-- 프로필 이미지 wrap 끝 -->
			</div>
			<div class="info-user">
				<!-- 멤버 이름  -->
				<div class="member-name-box">
					<div class="name-follow">
					<input class="memberNumber" type="hidden" value="${snsMemberInfo.getMemberNumber()}"/> 
						<h2 class="info-name">
							<c:out value="${snsMemberInfo.getChannelName()}"></c:out>
						</h2>
						<div class="follow-btn-box">
							<button class="follow-btn">팔로우</button>
							<button class="following-btn">
								팔로잉 <span class="material-symbols-outlined"> check </span>
							</button>
						</div>
					</div>
					<div class="profile-edit-path-box">
						
						<a href="#">
							<button class="profile-edit-path-btn">프로필 편집</button>
						</a>
						
						
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
			<button type="button" id="post">게시글</button>
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
					<li><img class="modal-img"
						src="https://cdn-dantats.stunning.kr/prod/portfolios/440fe107-612d-4c10-b068-d4bc572d2bcb/covers/2DbVojavJ5goYbuG.600.jpg.small?q=70&t=crop&e=0x0&s=598x598" />
					</li>

					<li><img class="modal-img"
						src="${pageContext.request.contextPath}/assets/img/SNSPage/01.jpeg" />
					</li>

					<li><img class="modal-img"
						src="https://cdn-dantats.stunning.kr/prod/portfolios/440fe107-612d-4c10-b068-d4bc572d2bcb/covers/2DbVojavJ5goYbuG.600.jpg.small?q=70&t=crop&e=0x0&s=598x598" />
					</li>

					<li><img class="modal-img"
						src="${pageContext.request.contextPath}/assets/img/SNSPage/01.jpeg" />
					</li>

					<li><img class="modal-img"
						src="${pageContext.request.contextPath}/assets/img/SNSPage/01.jpeg" />
					</li>
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
						<a href="#"> <img class="host-profile-img"
							src="https://cdn-bastani.stunning.kr/prod/users/3dbbdc56-858d-4d0e-b467-1463957476e3/avatar/ZQdoCULUEydS7bnM.image.jpg.small?q=60&t=crop&s=300x300"
							alt="" />
						</a>
					</div>
					<div class="host-name-box">
						<span class="host-name"> <c:out
								value="${snsMemberInfo.getChannelName()}"></c:out>
						</span>
					</div>
					<!-- 프로필 박스 끝 -->
				</div>
				<!-- @@@@@@ 모달 댓글 영역 @@@@@@ -->
				<div class="comment-list">

					<%-- <c:choose>
						<c:when test="${not empty snsCommentList}">
							<c:forEach var="snsCommentList" items="${snsCommentList}"> --%>

								<div class="comment-wrap">
									<div class="comment-member-info-box">
										<div class="comment-member-info">
											<div class="comment-member-profile">
												<a href="#" class="comment-member-img">
												<img class="comment-profile-img"
													src="${pageContext.request.contextPath}/assets/img/SNSPage/01.jpeg"
													alt="" />
												</a>
											</div>
											<div class="comment-member-name-wrap">
												<a href="#" class="comment-member-name">
												<input class="commentMemberNumber" type="hidden" value="${snsMemberInfo.getChannelName()}"/>
												<c:out value="${snsMemberInfo.getMemberNickname()}"></c:out>
												</a>
											</div>
										</div>
										<div class="comment-option">
											<button class="comment-edit" type="button">수정</button>
											<button class="comment-delete" type="button">삭제</button>
										</div>
									</div>
									<div class="comment-content-wrap">
										<span class="comment-content"> <c:out
												value="${snsCommentList.get(1).getSnsCommentContent()}"></c:out>
										</span>
									</div>
									<div class="comment-date">
										<span> <c:out
												value="${snsCommentList.get(1).getSnsCommentDate()}"></c:out>
										</span>
									</div>
								</div>
							<%-- </c:forEach>
						</c:when>

					</c:choose>
 --%>
					<!-- @@@@@@ 모달 댓글 영역 끝 @@@@@@ -->
				</div>

				<!-- 모달 좋아요, 게시일 -->
				<div class="modal-like-date">
					<div class="like-wrap">
						<img class="before-like-btn"
							src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
							alt="heart" />


						<!-- 임시 좋아요 수 -->
						<div class="like-cnt">21</div>
						개
					</div>
					<div class="post-date">2023년 3월 28일</div>
				</div>
				<div class="mini-post-content">
					<input class="comment-box" type="text" placeholder="댓글을 입력해 주세요" />
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
								src="https://cdn-bastani.stunning.kr/prod/users/3dbbdc56-858d-4d0e-b467-1463957476e3/avatar/ZQdoCULUEydS7bnM.image.jpg.small?q=60&t=crop&s=300x300"
								alt="" />
						</div>
					</a> <span class="modal-btn-list">프로필</span>
				</div>
			</div>
			<!-- 팔로우 버튼 -->
			<div class="modal-follow-btn-box modal-btn-box">
				<button type="button" class="modal-follow-btn btn-color"
					id="modal-btn">
					<span class="material-symbols-outlined add"> add </span> <span
						class="material-symbols-outlined done"> done </span>
				</button>
				<span class="modal-btn-list">팔로우</span>
			</div>
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
				<button type="button" class="modal-delete-btn btn-color"
					id="modal-btn">
					<span class="material-symbols-outlined"> delete </span>
				</button>
				<span class="modal-btn-list">삭제하기</span>
			</div>
			<!-- 신고하기 버튼  -->

			<div class="modal-report-btn-wrap modal-btn-box">
				<button type="button" class="modal-report-btn report-btn-color"
					id="modal-btn">
					<span class="material-symbols-outlined"> error </span>
				</button>
				<span class="modal-btn-list">신고하기</span>
			</div>
		</div>
	</div>
	<!-- 모달 파트 끝 -->

	<section id="post">
		<ul class="list-box">
			<li class="silde-part">
				<div class="post-section">
					<!-- 게시글 1개 시작 -->
					<c:choose>
						<c:when test="${not empty sns}">
							<c:forEach var="sns" items="${sns}">

								<div class="post-part">
										<input class="snsNumber" type="hidden" value="${sns.getSnsNumber()}">
									<img class="post-image"
										src="${pageContext.request.contextPath}/assets/img/SNSPage/03.jpg" />
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
												<span class="heart">♥</span> <span class="like-cnt">
													<c:out value="${sns.getLikeCnt()}"></c:out>
												</span>
											</div>
											<div class="post-view-cnt-box">
												<span class="material-symbols-outlined"> visibility </span>
												<span class="view-cnt"> <c:out
														value="${sns.getSnsViewCnt()}"></c:out>
												</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>

					</c:choose>


					<!-- 게시글 1개 끝 -->
					<%-- <div class="post-part">
						<img class="post-image"
							src="${pageContext.request.contextPath}/assets/img/SNSPage/04.jpeg" />
						<span class="post-info"><span
							class="post-name">게시물 명</span> <span class="date-like"> <time
									class="post-date" datetime="">2023년 3월 28일</time>
								<div class="like-count">
									♥<span>#좋아요 개수</span>
								</div>
						</span></span>
					</div>
					<div class="post-part">
						<img class="post-image"
							src="${pageContext.request.contextPath}/assets/img/SNSPage/05.jpg" />
						<span class="post-info"><span
							class="post-name">게시물 명</span> <span class="date-like"> <time
									class="post-date" datetime="">2023년 3월 28일</time>
								<div class="like-count">
									♥<span>#좋아요 개수</span>
								</div>
						</span></span>
					</div> --%>
				</div>
				<div class="post-section">
					<%-- <div class="post-part">
						<img class="post-image"
							src="${pageContext.request.contextPath}/assets/img/SNSPage/06.jpg" />
						<span class="post-info"><span
							class="post-name">게시물 명</span> <span class="date-like"> <time
									class="post-date" datetime="">2023년 3월 28일</time>
								<div class="like-count">
									♥<span>#좋아요 개수</span>
								</div>
						</span></span>
					</div>
					<div class="post-part">
						<img class="post-image"
							src="${pageContext.request.contextPath}/assets/img/SNSPage/07.jpg" />
						<span class="post-info"><span
							class="post-name">게시물 명</span> <span class="date-like"> <time
									class="post-date" datetime="">2023년 3월 28일</time>
								<div class="like-count">
									♥<span>#좋아요 개수</span>
								</div>
						</span></span>
					</div>
					<div class="post-part">
						<img class="post-image"
							src="${pageContext.request.contextPath}/assets/img/SNSPage/08.jpg" />
						<span class="post-info"><span
							class="post-name">게시물 명</span> <span class="date-like"> <time
									class="post-date" datetime="">2023년 3월 28일</time>
								<div class="like-count">
									♥<span>#좋아요 개수</span>
								</div>
						</span></span>
					</div> --%>
				</div>
				<div class="post-section">
					<%-- <div class="post-part">
						<img class="post-image"
							src="${pageContext.request.contextPath}/assets/img/SNSPage/09.jpg" />
						<span class="post-info"><span
							class="post-name">게시물 명</span> <span class="date-like"> <time
									class="post-date" datetime="">2023년 3월 28일</time>
								<div class="like-count">
									♥<span>#좋아요 개수</span>
								</div>
						</span></span>
					</div>
					<div class="post-part">
						<img class="post-image"
							src="${pageContext.request.contextPath}/assets/img/SNSPage/10.jpg" />
						<span class="post-info"><span
							class="post-name">게시물 명</span> <span class="date-like"> <time
									class="post-date" datetime="">2023년 3월 28일</time>
								<div class="like-count">
									♥<span>#좋아요 개수</span>
								</div>
						</span></span>
					</div>
					<div class="post-part">
						<img class="post-image"
							src="${pageContext.request.contextPath}/assets/img/SNSPage/11.jpg" />
						<span class="post-info"><span
							class="post-name">게시물 명</span> <span class="date-like"> <time
									class="post-date" datetime="">2023년 3월 28일</time>
								<div class="like-count">
									♥<span>#좋아요 개수</span>
								</div>
						</span></span>
					</div> --%>
				</div>
				<div class="post-section">
					<%-- <div class="post-part">
						<img class="post-image"
							src="${pageContext.request.contextPath}/assets/img/SNSPage/12.jpg" />
						<span class="post-info"><span
							class="post-name">게시물 명</span> <span class="date-like"> <time
									class="post-date" datetime="">2023년 3월 28일</time>
								<div class="like-count">
									♥<span>#좋아요 개수</span>
								</div>
						</span></span>
					</div>
					<div class="post-part">
						<img class="post-image"
							src="${pageContext.request.contextPath}/assets/img/SNSPage/13.jpg" />
						<span class="post-info"><span
							class="post-name">게시물 명</span> <span class="date-like"> <time
									class="post-date" datetime="">2023년 3월 28일</time>
								<div class="like-count">
									♥<span>#좋아요 개수</span>
								</div>
						</span></span>
					</div>
					<div class="post-part">
						<img class="post-image"
							src="${pageContext.request.contextPath}/assets/img/SNSPage/14.jpg" />
						<span class="post-info"><span
							class="post-name">게시물 명</span> <span class="date-like"> <time
									class="post-date" datetime="">2023년 3월 28일</time>
								<div class="like-count">
									♥<span>#좋아요 개수</span>
								</div>
						</span></span>
					</div> --%>
				</div>
			</li>
		</ul>
	</section>
	<!-- 게시물 파트 끝 -->

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