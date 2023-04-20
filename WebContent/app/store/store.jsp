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
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/store.css" />
    <title>store</title>
  </head>
  <body>
    <div class="container-wrap">
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

      <div class="main-container">
        <!-- 메인 영역 시작 -->
        <div class="categori-container">
          <div class="categori-msg">
            <h1>원하는 카테고리의 창작물을 찾아보세요!</h1>
          </div>
          <div class="categori-list">
            <button type="button" class="design categori click">디자인</button>
            <button type="button" class="stationery-toys categori">
              문구/완구
            </button>
            <button type="button" class="accessories categori">악세사리</button>
            <button type="button" class="fashion categori">패션</button>
            <button type="button" class="beauty categori">뷰티</button>
            <button type="button" class="pet categori">애완용품</button>
            <button type="button" class="living categori">리빙/홈</button>
            <button type="button" class="food categori">음식</button>
          </div>
        </div>
        <div class="channel-container">
          <!-- 채널 컨테이너 영역 시작 -->
          <div class="choice-list-box">
            <div class="choice-container">
              <button type="button" class="pandang-pick choice-list">
                판당pick
              </button>
              <button type="button" class="recommand choice-list">
                추천순
              </button>
              <button type="button" class="new choice-list">최신순</button>
              <button type="button" class="free choice-list">무료</button>
            </div>
            <div class="page-btn-box">
              <button type="button" class="prev">
                <span class="material-symbols-outlined">
                  arrow_back_ios_new
                </span>
              </button>
              <button type="button" class="next">
                <span class="material-symbols-outlined">
                  arrow_forward_ios
                </span>
              </button>
            </div>
            <!-- 채널 컨테이너 영역 종료 -->
          </div>
        </div>
        
        
        
        
        
        <!-- 모달창 작업 -->

        <div class="post-modal">
          <div class="post-box">
            <div class="profile-path">
              <div class="profile-modal-img-box">
                <a href="#" id="modal-img-box">
                  <img
                    class="profile-modal-img"
                    src="https://cdn-bastani.stunning.kr/prod/users/f4852320-5cea-4a09-9b2f-7e496b710e43/avatar/ah7M8e7fB5v6Dbif.414_2unday.png.small?q=60&t=crop&s=300x300"
                    alt=""
                  />
                  <div class="modal-img-background"></div>
                </a>
              </div>
              <div class="profile-modal-member">
                <a href="#">leegaeun0923</a>
              </div>
              <div class="profile-modal-follow-btn-box">
                <button class="profile-modal-follow-btn" type="button">
                  팔로우
                </button>
                <button class="profile-modal-following-btn" type="button">
                  <span class="material-symbols-outlined">done</span>
                  <span id="#following">팔로잉</span>
                </button>
              </div>
            </div>
            <div class="report-path">
              <!-- @@@@ 신고하기  @@@@@ -->
              <div class="report-msg">
                <h1>신고 사유를 작성해주세요.</h1>
              </div>
              <!-- @@@@@@@@ 신고 내용 폼 경로처리 @@@@@@ -->
              <form action="" method="post">
                <div class="report-content-box">
                  <div class="report-title">
                    <input
                      type="text"
                      name="reportTitle"
                      placeholder="제목을 입력해주세요."
                    />
                  </div>
                  <div class="report-content">
                    <textarea
                      name="reportContent"
                      id="report-content"
                      placeholder="신고 사유를 500자 이내로 작성해주세요."
                    ></textarea>
                  </div>
                  <div class="report-btn">
                    <button type="submit">작성 완료</button>
                  </div>
                </div>
              </form>
              <!-- @@@@@ 신고하기 영역 끝 @@@@@ -->
            </div>
            <div class="post-header-container">
              <div class="post-header-box">
                <div class="post-header">
                  <!-- @@@@@ 모달 게시글 헤더 @@@@@@@@@ -->
                  <div class="post-title">임시 게시글 제목</div>
                  <div class="post-date-categori-box">
                    <div class="post-date">2023.3.23</div>
                    <div>l</div>
                    <div class="post-categori">패션</div>
                  </div>
                  <!-- @@@@@@@@@ 모달 게시글 헤더 끝 @@@@@@@@@@ -->
                </div>
                <div class="post-information">
                  <!-- @@@@@@@@@ 게시글 조회, 좋아요, 댓글 수 @@@@@@@@@@ -->
                  <div class="post-view-cnt">
                    <span class="material-symbols-outlined"> visibility </span>
                    <div class="view-cnt">32</div>
                  </div>
                  <div class="post-like-cnt">
                    <span class="material-symbols-outlined"> favorite </span>
                    <div class="p-like-cnt">77</div>
                  </div>
                  <div class="post-comment-cnt">
                    <span class="material-symbols-outlined"> chat_bubble </span>
                    <div class="comment-cnt">33</div>
                  </div>
                  <!-- @@@@@@@@@ 모달 조회,좋아요,댓글 수 끝 @@@@@@@@@@ -->
                </div>
              </div>
            </div>
            <div class="post">
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
            <div class="post-comment-box">
              <!-- @@@@@댓글 창@@@@@@@@@ -->
              <div class="comment-container">
                <div class="comment-list">
                  <!-- @@@@@@@@@ 댓글 list @@@@@@@@@@ -->
                  <a herf="#" class="comment-user-profile-shortcuts">
                    <div class="comment-user-profile-wrap">
                      <img
                        src="https://cdn-bastani.stunning.kr/prod/users/3dbbdc56-858d-4d0e-b467-1463957476e3/avatar/ZQdoCULUEydS7bnM.image.jpg.small?q=60&t=crop&s=300x300"
                        alt=""
                      />
                    </div>
                  </a>
                  <div class="text-wrap">
                    <div class="comment-member-info">
                      <a href="#" class="member-id">leeegaeun0923</a>
                      <div class="box"></div>
                      <div class="comment-date">4일 전</div>
                      <!-- @@@@ 댓글 작성자와 로그인 한사람 일치할시 보여야함 @@@ 
                      display : flex로 변경되게 해주세요 
                    일단은 none 처리  -->
                      <div class="comment-edit-delete-btn-box">
                        <button class="comment-edit-btn">수정</button>

                        <button class="comment-delete-btn">삭제</button>
                      </div>
                    </div>
                    <div class="height-box"></div>
                    <div class="comment">
                      <span class="comment-content"
                        >너무 마음에 드는 작품이에요~~~~
                      </span>
                      <!-- @@@@@@ 댓글 수정 form 경로처리 @@@@@@ -->
                      <form action="" method="post">
                        <div class="comment-edit-box">
                          <textarea name="" id="comment-edit">
                          <span class="comment-content"
                          >너무 마음에 드는 작품이에요~~~~
                        </span>
                      </textarea
                          >
                        </div>
                        <div class="edit-btn-box">
                          <button type="submit" class="edit-btn">
                            수정 완료
                          </button>
                        </div>
                      </form>
                      <!-- 댓글 수정 form 영역 끝 -->
                    </div>
                  </div>
                  <!-- @@@@@@@@@ 댓글 리스트 끝  @@@@@@@@@@ -->
                </div>
                <div class="comment-list">
                  <a herf="#" class="comment-user-profile-shortcuts">
                    <div class="comment-user-profile-wrap">
                      <img
                        src="https://cdn-bastani.stunning.kr/prod/users/3dbbdc56-858d-4d0e-b467-1463957476e3/avatar/ZQdoCULUEydS7bnM.image.jpg.small?q=60&t=crop&s=300x300"
                        alt=""
                      />
                    </div>
                  </a>
                  <div class="text-wrap">
                    <div class="comment-member-info">
                      <a href="#" class="member-id">leeegaeun0923</a>
                      <div class="box"></div>
                      <div class="comment-date">4일 전</div>
                    </div>
                    <div class="height-box"></div>
                    <div class="comment">
                      <span class="comment-content"
                        >댓글 늘어나면 영역 늘어나는지 테스트중
                      </span>
                    </div>
                  </div>
                </div>
                <!-- @@@@@@@@@ 댓글 작성 form 경로 처리 해야함 @@@@@@ -->
                <form action="" method="post" id="comment-form">
                  <div class="write-area">
                    <!-- @@@@@@@@@ 댓글 작성 공간 @@@@@@@@@@ -->
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
                    <!-- @@@@@@@@@ 댓글 작성 공간 끝 @@@@@@@@@@ -->
                  </div>
                  <div class="submit-btn-box">
                    <!-- @@@@@@@@@ 댓글 작성 버튼 @@@@@@@@@@ -->
                    <button class="comment-submit-btn" type="submit">
                      댓글 작성
                    </button>
                    <!-- @@@@@@@@@ 버튼 끝 @@@@@@@@@@ -->
                  </div>
                </form>
              </div>
              <!-- @@@@@@@@@ 댓글창 끝 @@@@@@@@@@ -->
            </div>
            <!-- @@@@@@@@@ post 영역 끝 @@@@@@@@@@ -->
          </div>
          <div class="post-btn-box-wrap">
            <div class="post-btn-box" id="profile">
              <div class="modal-profile-btn btn-wrap-flex">
                <a href="#" class="author-info">
                  <div class="author-img-back"></div>
                  <div class="author-profile">
                    <img
                      class="author-profile-img"
                      src="https://cdn-bastani.stunning.kr/prod/users/3dbbdc56-858d-4d0e-b467-1463957476e3/avatar/ZQdoCULUEydS7bnM.image.jpg.small?q=60&t=crop&s=300x300"
                      alt=""
                    />
                  </div>
                </a>
                <span class="modal-btn-list">프로필</span>
              </div>
            </div>
            <!-- @@@ 모달 픽시드 팔로우 버튼 내 글일시 안 보여야함 @@@ -->
            <div class="post-btn-box" id="follow">
              <div class="modal-follow-btn-wrap btn-wrap-flex">
                <button type="button" class="modal-follow-btn btn-color">
                  <span class="material-symbols-outlined add"> add </span>
                  <span class="material-symbols-outlined done"> done </span>
                </button>
                <span class="modal-btn-list">팔로우</span>
              </div>
            </div>
            <!-- @@@ 팔로우 영역 끝 @@@ -->
            <div class="post-btn-box" id="'like">
              <div class="modal-like-btn-wrap btn-wrap-flex">
                <button type="button" class="modal-like-btn like-btn-color">
                  <span class="material-symbols-outlined"> favorite </span>
                </button>
                <span class="modal-btn-list">좋아요</span>
              </div>
            </div>
            <!-- @@@ 좋아요 영역 끝 @@@ -->
            <!-- @@@ 모달 픽시드 장바구니 버튼 내 글일시 안 보여야함 @@@ -->
            <div class="post-btn-box" id="basket">
              <div class="modal-basket-btn-wrap btn-wrap-flex">
                <button type="button" class="modal-btn btn-color">
                  <span class="material-symbols-outlined">
                    shopping_basket
                  </span>
                </button>
                <span class="modal-btn-list">장바구니</span>
              </div>
            </div>
            <!-- @@@ 장바구니 영역 끝 @@@ -->
            <!-- @@@ 모달 픽시드 구매하기 버튼 내 글일시 안 보여야함 @@@ -->
            <div class="post-btn-box" id="buy">
              <div class="modal-buy-btn-wrap btn-wrap-flex">
                <!-- @@@@@ 구매하기 페이지 경로 이동 처리 해야함 @@@@@ -->
                <a href="#">
                  <button type="button" class="modal-buy-btn btn-color">
                    <span class="material-symbols-outlined">
                      attach_money
                    </span>
                  </button>
                </a>
                <span class="modal-btn-list">구매하기</span>
              </div>
            </div>
            <!-- @@@ 신고하기 영역 끝 @@@ -->
            <!-- @@@ 모달 픽시드 신고하기 버튼 내 글일시 안 보여야함 @@@ -->
            <div class="post-btn-box" id="report">
              <div class="modal-report-btn-wrap btn-wrap-flex">
                <button type="button" class="modal-report-btn report-btn-color">
                  <span class="material-symbols-outlined"> error </span>
                </button>
                <span class="modal-btn-list">신고하기</span>
              </div>
            </div>
            <!-- @@@ 수정하기 영역 끝 @@@ -->
            <!-- @@@ 모달 픽시드 수정하기 버튼 내 글일시  보여야함 @@@ -->
            <div class="post-btn-box" id="edit">
              <div class="modal-edit-btn-wrap btn-wrap-flex">
                <button type="button" class="modal-edit-btn btn-color">
                  <span class="material-symbols-outlined"> edit </span>
                </button>
                <span class="modal-btn-list">수정하기</span>
              </div>
            </div>
            <!-- @@@ 삭제하기 영역 끝 @@@ -->
            <!-- @@@ 모달 픽시드 삭제하기 버튼 내 글일시  보여야함 @@@ -->
            <div class="post-btn-box" id="delete">
              <div class="modal-delete-btn-wrap btn-wrap-flex">
                <button type="button" class="modal-delete-btn btn-color">
                  <span class="material-symbols-outlined"> delete </span>
                </button>
                <span class="modal-btn-list">삭제하기</span>
              </div>
            </div>
          </div>
        </div>

        <!-- 모달창 작업 종료  -->






        <div class="post-container">
        <c:choose>
					<c:when test="${not empty storeList}">
						<c:forEach var="store" items="${storeList}">
          <div class="post-box-container">    
            <div class="post-img-container">
              <div class="post-img-box-wrap">
                <img
                  class="post-img"
                  src="${pageContext.request.contextPath}/upload/${store.getStoreFileSystemName()}"
                  alt=""
                />
                <div class="post-img-back"></div>
                <button type="button" class="like-btn">좋아요</button>
                <div class="modal-background"></div>
                <div class="modal-test"></div>
              </div>
            </div>
             <div class="post-title-box">${store.getStoreTitle() }</div>
            <div class="writer-container">
              <div class="channel-profile-box">
                <a href="#" class="profile-img-box">
                  <img
                    class="profile-img"
                    src="${pageContext.request.contextPath}/upload/${store.getChannelFileSystemName() }"
                    alt=""
                  />
                </a>
              </div>
              <div class="writer-box">
                <a href="" class="writer-name">${store.getMemberNickname() }</a>
              </div>
              <font>·</font>
              <div class="follow-btn-box">
                <button type="button" class="follow-btn">
                  <span class="follow">팔로우</span>
                  <!-- 팔로우 버튼 누를 시 팔로잉 으로 떠야함 일단은 display none처리 했음 -->
                  <img
                    class="following"
                    src="https://cdn.loud.kr/LOUD_IMG/main/ico-check-follow.png"
                    alt=""
                  />
                  <span class="following">팔로잉</span>
                </button>
              </div>
              <div class="like-wrap">
                <img
                  class="before-like-btn"
                  src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
                  alt="heart"
                />
                <!-- 게시글에 좋아요 누를 시 하트 색이 하트로 변경됨 일단은 display none처리 했음 -->
                <img
                  class="after-like-btn"
                  src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
                  alt="heart"
                />
                <!-- 임시 좋아요 수 -->
                <div class="like-cnt">${store.getStoreLikeCnt() }</div>
              </div>         
            </div>               
          </div>
               	</c:forEach>
					</c:when>      
					</c:choose>            
            <!-- 게시글 영역 종료 -->           
          </div>
          <!-- 게시글 영역 종료 -->          	
        </div>
        <!-- 메인 영역 종료 -->        	
      </div>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
		let tempRealEnd = '${realEndPage}';    
    </script>
    <script src="${pageContext.request.contextPath}/assets/js/store.js"></script>
  </body>
</html>
