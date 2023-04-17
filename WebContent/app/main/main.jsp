<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Main</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>

<body>
	<div class="all-wrap">
		<!-- #######header####### -->
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
			<form action="" class="search">
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

		<!-- 헤더 아래에 모달 창 띄우기 -->
		<article class="modal-box">
			<div class="store-box">
				<form action="" class="store-form"></form>
			</div>
		</article>

		<!-- #######main####### -->
		<div class="page-content">
			<!-- @@@페이지 전체 div@@@ -->
			<!-- #####main-hot-creater##### -->
			<div class="hot-creater">
				<div class="hot-creater-title-wrap">
					<div class="hot-creater-title">판당 HOT 채널</div>
					<br />
					<div class="hot-creater-sub-title">매일 주목할 만한 채널을 소개해드립니다.</div>
				</div>

				<div class="hot-creater-profil-wrap">
					<div class="page-btn-box">
						<div class="prev">
							<span class="material-symbols-outlined">
								arrow_back_ios_new </span>
						</div>
					</div>
					<div class="slides-wrap">
						<ul class="slide-box">
							<!-- 슬라이드는 4명씩 3번 슬라이드 총 12명만  hot-creater-profil에 띄워줌-->
							<!-- @@@hot-creater 슬라이드 첫번째  부분 @@@ -->
							<!-- 페이지 이동 주석은 첫번째 슬라이드에만 적어놓았음-->
							<c:set var="i" value="0"/>
							<c:forEach var="profil" items="${channels}">
							<c:if test="${i % 4 == 0 }">
								<li class="slide-img">
									<div class="hot-creater-profil-all">
							</c:if>
										<div class="hot-creater-profil">
											<div class="profil-photo" name="channel_file_system_name">
												<a href="#"> 
												<%-- <img src="${pageContext.request.contextPath}/assets/img/main/choigosim.jpg" /> --%>
											<c:out value="${profil.getChannelFileSystemName()}"></c:out> 
												</a>
												<!-- 이미지에 a태그 걸어놓음 이미지 누르면 해당 채널로 이동할 수 있도록 -->
											</div>
											<div class="profil-info">
												<div class="profil-info-wrap">
													<div class="profil-channel-name" name="channel_name">
														<c:out value="${profil.getChannelName()}" />
													</div>
													<div class="profil-follow-btn">
														<button>
															<span class="material-symbols-outlined profil-follow-btn">
																person_add </span>
														</button>
													</div>
												</div>
											</div>
											<div class="profil-comment" name="channel_comment">
												<c:out value="${profil.getChannelComment() }" />
											</div>
										</div>
										<!--  -->

										<!-- 이 아래가  hot-creater-profil-all끝-->
										<c:set var="i" value="${i + 1}"/>
										<c:if test="${i % 4 == 0 }">
									</div>
								</li>
								</c:if>
							</c:forEach>
							<!-- @@@hot-creater 슬라이드 첫번째  부분 끝@@@ -->
						</ul>
						<!-- 이 아래가 slides-wrap끝 -->
					</div>
					<!-- 이 아래 div가  hot-creater-profil-wrap끝-->
					<div class="page-btn-box">
						<div class="next">
							<span class="material-symbols-outlined"> arrow_forward_ios
							</span>
						</div>
					</div>
				</div>
				<!-- 이 아래 부분이 hot-creater끝@@@ -->
			</div>

			<!-- #####main-store##### -->
			<div class="store-content">
				<div class="store-nav">
					<div class="store-text-wrap">
						<div class="store-text">새로운 스타일의 상품 발견해보세요.</div>
					</div>

					<div class="store-nav-wrap tabs">
						<span>판매글 :</span>
						<ul>
							<li class="tab" data-tab-target="#tab1">판당 pick</li>
							<li class="tab" data-tab-target="#tab2">최신순</li>
							<li class="tab" data-tab-target="#tab3">팔로잉</li>
						</ul>
					</div>
				</div>


				<div class="content">

					<!-- 첫번째 탭@@@@@@@@@ -->
					<!-- 스토어 각 탭마다 4개씩 3줄 총 12개의 판매상품이 보이도록 -->
					<!-- 첫번째 탭 @@ 판당 픽 -->
					<div class="store-wrap active" id="tab1" data-tab-content
						class="items active">
						<div class="store-wrap-sub">
							<!-- 스토어 첫번째 줄@@@@@ -->
							<div class="store-photo">
								<!-- .store-photo이 .store-photo + .store-info-tap + .store-info-channel을 감싸는부모 div -->
								<!-- .store-photo 스토어 첫번째 상품의 전체 div -->
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/griptok.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<!-- .store-info-tap은 hover시 나오는 상품 이름과 like버튼  -->
											<span>유기견 그립톡</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>

								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>유기견1</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">150</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 방울이 시작@@@@@@@@@ -->
							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />

									<div class="store-info">
										<div class="store-info-tap">
											<span>방울이 친구 키링</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 방울이 끝@@@@@@@@@ -->

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/cup.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>토끼 자개 머그컵</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>토끼</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/bag.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>비건 스토어</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<!-- @@@@@스토어 두번째 줄@@@@@ -->

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/perfume.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비밀정원으로부터의 초대</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>조향사</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>



							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/ohdungicushion.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>오둥이 쿠션</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>오둥이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/jrongcalendar.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>재롱이 달력</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>재롱잔치</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/choigosimmouse.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>무지개 마우스 패드</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>최고심</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<!-- @@@@@스토어 세번째 줄@@@@@ -->

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- store-wrap 끝 -->

					<!-- 두번째 탭@@ 최신순 -->
					<div class="store-wrap" id="tab2" data-tab-content class="items">
						<div class="store-wrap-sub">
							<!-- 스토어 첫번째 줄@@@@@ -->
							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/griptok.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>유기견 그립톡</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>

								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>유기견2</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">150</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 방울이 시작@@@@@@@@@ -->
							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />

									<div class="store-info">
										<div class="store-info-tap">
											<span>방울이 친구 키링</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 방울이 끝@@@@@@@@@ -->

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/cup.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>토끼 자개 머그컵</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>토끼</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/bag.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>비건 스토어</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 스토어 두번째 줄@@@@@ -->

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/perfume.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비밀정원으로부터의 초대</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>조향사</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/ohdungicushion.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>오둥이 쿠션</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>오둥이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/jrongcalendar.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>재롱이 달력</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>재롱잔치</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/choigosimmouse.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>무지개 마우스 패드</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>최고심</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 스토어 세번째 줄@@@@@ -->

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<!-- store-wrap 끝 -->
					</div>

					<!-- 세번째 탭@@ 팔로잉 -->
					<div class="store-wrap" id="tab3" data-tab-content class="items">
						<div class="store-wrap-sub">
							<!-- 스토어 첫번째 줄@@@@@ -->
							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/griptok.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>유기견 그립톡</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>

								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>유기견3</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">150</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 방울이 시작@@@@@@@@@ -->
							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />

									<div class="store-info">
										<div class="store-info-tap">
											<span>방울이 친구 키링</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 방울이 끝@@@@@@@@@ -->

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/cup.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>토끼 자개 머그컵</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>토끼</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/bag.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>비건 스토어</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 스토어 두번째 줄@@@@@ -->

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/perfume.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비밀정원으로부터의 초대</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>조향사</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/ohdungicushion.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>오둥이 쿠션</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>오둥이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/jrongcalendar.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>재롱이 달력</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>재롱잔치</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/choigosimmouse.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>무지개 마우스 패드</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>최고심</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<!-- 스토어 세번째 줄@@@@@ -->

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>

							<div class="store-photo">
								<div class="store-photo-img">
									<img
										src="${pageContext.request.contextPath}/assets/img/main/keyring.jpg" />
									<div class="store-info">
										<div class="store-info-tap">
											<span>비건 숄더백</span>
											<div class="like-btn">
												<button>
													<img class="before-like-btn"
														src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="store-info-channel">
									<div class="store-info-channel-name">
										<span>방울이</span>
									</div>

									<div class="cnt-wrap">
										<div class="cnt-view">
											<div class="cnt-view-icon">
												<span class="material-symbols-outlined"> visibility </span>
											</div>
											<div class="cnt-view-number">1010</div>
										</div>
										<div class="cnt-like">
											<div class="cnt-like-icon">
												<img class="before-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
													alt="heart" /> <img class="after-like-btn"
													src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
													alt="heart" />
											</div>
											<div class="cnt-like-number">50</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- store-wrap 끝 -->
					</div>
				</div>
				<!-- 여기 위에 탭 복붙 -->
			</div>
		</div>
	</div>

	<!-- #######footer####### -->
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
	</div>
	<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>