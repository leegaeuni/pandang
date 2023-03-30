<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pandang.com/userpage_SNS=#</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/SNS_main.css" />
  </head>
  <body>
    <!-- 헤더 파트 시작  css = 9~97-->
    <div class="header-container">
      <!-- 헤더 영역 시작  -->
      <div class="start-container">
        <a href="#"><img src="${pageContext.request.contextPath}/assets/img/main_logo.jpg" alt="" class="logo-img" /></a>
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
        <a href="#" class="login">로그인</a>
        <a href="#" class="join">회원가입</a>
        <a href="#" class="my-page">마이페이지</a>
        <a href="#" class="logout">로그아웃</a>
      </div>
    </div>
    <!-- 헤더 파트 끝 -->

    <!-- 메인 파트 시작 css = 102~258 -->
    <div id="main-part">
      <div class="info-part">
        <div class="pic-part">
          <div class="pic-space">
            <span class="proflie-pic">
              <!-- 사진 누르면 프로필 사진 수정할수 있도록 버튼으로 수정(필요없음 없애도됨) -->
              <button type = "button" class="modify-profile"><img class="profile-img" src="${pageContext.request.contextPath}/assets/img/01.jpeg" /></button>
            </span>
          </div>
        </div>
        <section class="info-user">
          <div class="first-block">
            <h2 class="info-name">홍길동</h2>
            <!-- 인증마크는 없애거나 다른 이미지로 대체해도됨 -->
            <span class="sign-mark">
              <img class="sign-img" src="${pageContext.request.contextPath}/assets/img/02.png" />
            </span>
            <div class="button-sidebar">
              <button class="fallow-button" type="button">팔로우+</button>
            </div>
          </div>
          <ul class="second-block">
            <div class="post-part2">
              게시물
              <span post-cost ="#포스트 수" > 개</span>
            </div>
            <div class="fallower-part">
              팔로워
              <span fallower-cost ="#팔로워 수" > 명</span>
            </div>
            <div class="fallow-part">
              팔로우
              <span fallow-cost ="#팔로우 수" > 개</span>
            </div>
          </ul>
          <div class="third-part">
            <span class="user-name">홍길동</span>
            <span class="intro-post">
              안녕하세요 홍길동 입니다. <br />
              홍길동 유튜브 링크 바로가기
            </span>
            <div class="link-post">
              <a
                class="site-link"
                href="youtube.com/channel/UCcl16CxYqlbKQJVCfdhSJVw"
                >youtube.com/channel/UCcl16CxYqlbKQJVCfdhSJVw</a
              >
            </div>
          </div>
        </section>
      </div>
      <!-- 메인 파트 끝 -->
      
      <!-- 네비 파트 시작 css = 263~373 -->
      <!-- 메인이랑 거리두기용 클래스 -->
      <div class="nav-line"></div>
      <section class="navbar">
        <a href="#이전 게시물 상자" class="prev">&lt</a>
        <button class="nav-button" onclick="location.reload()">게시물</button>
        <!-- ajax로 스토어 html을 부분적으로 가져오게 만들었음, 수정필요하면 store_main.html 수정-->
        <button class="nav-button" onclick="changeContent()">스토어</button>
        <a href="#다음 게시물 상자" class="next">&gt</a>
        </div>
      </section>
      <!-- 네비 파트 끝 -->

      <!-- 모달 파트 시작 css =  378~718-->
      <article class="modal-box">
        <section id = "modal">
          <div class="post-btn"> 
            <a href="#이전 게시물" class="prev3">&lt</a>
            <a href="#다음 게시물" class="next3">&gt</a>
          </div>
          <div class="slides-wrap">
            <ul class="slide-box">
              <li>
                <img class="modal-img" src="${pageContext.request.contextPath}/assets/img/01.jpeg"></img>
              </li>
              <li>
                <img class="modal-img" src="${pageContext.request.contextPath}/assets/img/01.jpeg"></img>
              </li>
              <li>
                <img class="modal-img" src="${pageContext.request.contextPath}/assets/img/01.jpeg"></img>
              </li>
              <li>
                <img class="modal-img" src="${pageContext.request.contextPath}/assets/img/01.jpeg"></img>
              </li>
              <li>
                <img class="modal-img" src="${pageContext.request.contextPath}/assets/img/01.jpeg"></img>
              </li>
            </ul>
            <div class="btn-box">
              <!-- 이전 이미지보기와 다음 이미지보기 버튼 -->
              <button class="prev2">&lt</button>
              <button class="next2">&gt</button>
            </div>
          </div>
          <div class = "comment">
            <!-- 일정 글자 수가 넘어가면 박스를 뚫어버리는 현상때문에 디스플레이를 넣지 않았음, 필요시 수정 -->
            <div class = "mini-host-profile">
            <div class="profile">
              <div class="tooltip-container">
                <a href="#유저 SNS페이지" class="tooltip-trigger"><img class= "mini-pic" src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt=""></a>
                <div class="tooltip">
                  <div class = top-box>
                  <img src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt="mini-user-profile">
                    <div class = "middle-box">
                  <span userId = "#아이디">userId</span>
                  <span username = "#유저이름">username</span>
                </div>
                  <div class = "buttom-box">
               
                  </div>
                </div>
                  <div class ="comment-line"></div>
                  <ul class="second-block">
                    <div class="post-part2">
                      게시물
                      <span post-cost ="#포스트 수" > 개</span>
                    </div>
                    <div class="fallower-part">
                      팔로워
                      <span fallower-cost ="#팔로워 수" > 명</span>
                    </div>
                    <div class="fallow-part">
                      팔로우
                      <span fallow-cost ="#팔로우 수" > 개</span>
                    </div>
                  </ul>
                </div>
              </div>
            </div>
            <a href="#유저SNS" class= "mini-user-name">username</a>
            <button class="fallow-button2" type="button">팔로우+</button>
              </div>
          <div class = "comment-list">
            <li>  
              <div class = "mini-user-profile">
                <div class="profile">
                  <div class="tooltip-container">
                    <a href="#유저 SNS페이지" class="tooltip-trigger"><img class= "mini-pic" src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt=""></a>
                    <div class="tooltip">
                      <div class = top-box>
                        <img src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt="mini-user-profile">
                        <div class = "middle-box">
                      <span userId = "#아이디">userId</span>
                      <span username = "#유저이름">username</span>
                    </div>
                      <div class = "buttom-box">
                    
                      </div>
                    </div>
                      <div class ="comment-line"></div>
                      <ul class="second-block">
                        <div class="post-part2">
                          게시물
                          <span post-cost ="#포스트 수" > 개</span>
                        </div>
                        <div class="fallower-part">
                          팔로워
                          <span fallower-cost ="#팔로워 수" > 명</span>
                        </div>
                        <div class="fallow-part">
                          팔로우
                          <span fallow-cost ="#팔로우 수" > 개</span>
                        </div>
                      </ul>
                    </div>
                  </div>
                </div>
                <a href="#유저SNS" class= "mini-user-name">username</a>
             
                  </div>
            <span class = "comment-write">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</span>
            <div class ="option">
              <a class = "modify" href="#수정"><img class= "modify-img" src="${pageContext.request.contextPath}/assets/img/22.png" alt=""></a>
              <button class = "delete" type="button"></button>
                  <a class = "report" href="#신고"><img class= "report-img" src="${pageContext.request.contextPath}/assets/img/24.png" alt=""></a>
            </div>
            <div class ="comment-line"></div>
            </li>
            <li>
              <div class = "mini-user-profile">
                <div class="profile">
                  <div class="tooltip-container">
                    <a href="#유저 SNS페이지" class="tooltip-trigger"><img class= "mini-pic" src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt=""></a>
                    <div class="tooltip">
                      <div class = top-box>
                      <img src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt="mini-user-profile">
                        <div class = "middle-box">
                      <span userId = "#아이디">userId</span>
                      <span username = "#유저이름">username</span>
                    </div>
                      <div class = "buttom-box">
                      
                      </div>
                    </div>
                      <div class ="comment-line"></div>
                      <ul class="second-block">
                        <div class="post-part2">
                          게시물
                          <span post-cost ="#포스트 수" > 개</span>
                        </div>
                        <div class="fallower-part">
                          팔로워
                          <span fallower-cost ="#팔로워 수" > 명</span>
                        </div>
                        <div class="fallow-part">
                          팔로우
                          <span fallow-cost ="#팔로우 수" > 개</span>
                        </div>
                      </ul>
                    </div>
                  </div>
                </div>
                <a href="#유저SNS" class= "mini-user-name">username</a>
                 
                  </div>
            <span class = "comment-write">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</span>
            <div class ="option">
              <a class = "modify" href="#수정"><img class= "modify-img" src="${pageContext.request.contextPath}/assets/img/22.png" alt=""></a>
              <button class = "delete" type="button"></button>
                  <a class = "report" href="#신고"><img class= "report-img" src="${pageContext.request.contextPath}/assets/img/24.png" alt=""></a>
            </div>
            <div class ="comment-line"></div>
            </li>
            <div class = "mini-user-profile">
              <div class="profile">
                <div class="tooltip-container">
                  <a href="#유저 SNS페이지" class="tooltip-trigger"><img class= "mini-pic" src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt=""></a>
                  <div class="tooltip">
                    <div class = top-box>
                    <img src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt="mini-user-profile">
                      <div class = "middle-box">
                    <span userId = "#아이디">userId</span>
                    <span username = "#유저이름">username</span>
                  </div>
                    <div class = "buttom-box">
                    
                    </div>
                  </div>
                    <div class ="comment-line"></div>
                    <ul class="second-block">
                      <div class="post-part2">
                        게시물
                        <span post-cost ="#포스트 수" > 개</span>
                      </div>
                      <div class="fallower-part">
                        팔로워
                        <span fallower-cost ="#팔로워 수" > 명</span>
                      </div>
                      <div class="fallow-part">
                        팔로우
                        <span fallow-cost ="#팔로우 수" > 개</span>
                      </div>
                    </ul>
                  </div>
                </div>
              </div>
              <a href="#유저SNS" class= "mini-user-name">username</a>
              
                </div>
          <span class = "comment-write">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</span>
          <div class ="option">
            <a class = "modify" href="#수정"><img class= "modify-img" src="${pageContext.request.contextPath}/assets/img/22.png" alt=""></a>
            <button class = "delete" type="button"></button>
                <a class = "report" href="#신고"><img class= "report-img" src="${pageContext.request.contextPath}/assets/img/24.png" alt=""></a>
          </div>
          <div class ="comment-line"></div>
            </li>
            <li>
              <div class = "mini-user-profile">
                <div class="profile">
                  <div class="tooltip-container">
                    <a href="#유저 SNS페이지" class="tooltip-trigger"><img class= "mini-pic" src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt=""></a>
                    <div class="tooltip">
                      <div class = top-box>
                      <img src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt="mini-user-profile">
                        <div class = "middle-box">
                      <span userId = "#아이디">userId</span>
                      <span username = "#유저이름">username</span>
                    </div>
                      <div class = "buttom-box">
                    
                      </div>
                    </div>
                      <div class ="comment-line"></div>
                      <ul class="second-block">
                        <div class="post-part2">
                          게시물
                          <span post-cost ="#포스트 수" > 개</span>
                        </div>
                        <div class="fallower-part">
                          팔로워
                          <span fallower-cost ="#팔로워 수" > 명</span>
                        </div>
                        <div class="fallow-part">
                          팔로우
                          <span fallow-cost ="#팔로우 수" > 개</span>
                        </div>
                      </ul>
                    </div>
                  </div>
                </div>
                <a href="#유저SNS" class= "mini-user-name">username</a>
                  
                  </div>
            <span class = "comment-write">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</span>
            <div class ="option">
              <a class = "modify" href="#수정"><img class= "modify-img" src="${pageContext.request.contextPath}/assets/img/22.png" alt=""></a>
              <button class = "delete" type="button"></button>
                  <a class = "report" href="#신고"><img class= "report-img" src="${pageContext.request.contextPath}/assets/img/24.png" alt=""></a>
            </div>
            <div class ="comment-line"></div>
            </li>
            <li>
              <div class = "mini-user-profile">
                <div class="profile">
                  <div class="tooltip-container">
                    <a href="#유저 SNS페이지" class="tooltip-trigger"><img class= "mini-pic" src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt=""></a>
                    <div class="tooltip">
                      <div class = top-box>
                      <img src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt="mini-user-profile">
                        <div class = "middle-box">
                      <span userId = "#아이디">userId</span>
                      <span username = "#유저이름">username</span>
                    </div>
                      <div class = "buttom-box">
                        
                      </div>
                    </div>
                      <div class ="comment-line"></div>
                      <ul class="second-block">
                        <div class="post-part2">
                          게시물
                          <span post-cost ="#포스트 수" > 개</span>
                        </div>
                        <div class="fallower-part">
                          팔로워
                          <span fallower-cost ="#팔로워 수" > 명</span>
                        </div>
                        <div class="fallow-part">
                          팔로우
                          <span fallow-cost ="#팔로우 수" > 개</span>
                        </div>
                      </ul>
                    </div>
                  </div>
                </div>
                <a href="#유저SNS" class= "mini-user-name">username</a>
                
                  </div>
            <span class = "comment-write">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</span>
            <div class ="option">
              <a class = "modify" href="#수정"><img class= "modify-img" src="${pageContext.request.contextPath}/assets/img/22.png" alt=""></a>
              <button class = "delete" type="button"></button>
                  <a class = "report" href="#신고"><img class= "report-img" src="${pageContext.request.contextPath}/assets/img/24.png" alt=""></a>
            </div>
            <div class ="comment-line"></div>
            </li>
            <li>
              <div class = "mini-user-profile">
                <div class="profile">
                  <div class="tooltip-container">
                    <a href="#유저 SNS페이지" class="tooltip-trigger"><img class= "mini-pic" src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt=""></a>
                    <div class="tooltip">
                      <div class = top-box>
                      <img src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt="mini-user-profile">
                        <div class = "middle-box">
                      <span userId = "#아이디">userId</span>
                      <span username = "#유저이름">username</span>
                    </div>
                      <div class = "buttom-box">
                    
                      </div>
                    </div>
                      <div class ="comment-line"></div>
                      <ul class="second-block">
                        <div class="post-part2">
                          게시물
                          <span post-cost ="#포스트 수" > 개</span>
                        </div>
                        <div class="fallower-part">
                          팔로워
                          <span fallower-cost ="#팔로워 수" > 명</span>
                        </div>
                        <div class="fallow-part">
                          팔로우
                          <span fallow-cost ="#팔로우 수" > 개</span>
                        </div>
                      </ul>
                    </div>
                  </div>
                </div>
                <a href="#유저SNS" class= "mini-user-name">username</a>
               
                  </div>
            <span class = "comment-write">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</span>
            <div class ="option">
              <a class = "modify" href="#수정"><img class= "modify-img" src="${pageContext.request.contextPath}/assets/img/22.png" alt=""></a>
              <button class = "delete" type="button"></button>
                  <a class = "report" href="#신고"><img class= "report-img" src="${pageContext.request.contextPath}/assets/img/24.png" alt=""></a>
            </div>
            <div class ="comment-line"></div>
            </li>
          </div>
          <div class = "mini-post-info">
            <button class = "like2">♡</button>
            <div class = "like-count">좋아요 <span>#좋아요 개수</span></div>
          </div>
          <time class = "post-date" datetime="">2023년 3월 28일</time>
          <div class="mini-post-content">
            <input class = "comment-box" type="text" placeholder="댓글을 입력해 주세요" />
            <button type="submit" class = "submit">게시</button>
        </div>
       </div>
        </section>
            <section id = "modal-btn-box">
        <div class="modal-btn-profile">
          <div class="tooltip-container">
            <a href="#유저 SNS페이지" class="tooltip-trigger"><img class= "mini-pic2" src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt=""></a>
            <div class="tooltip">
              <div class = top-box>
              <img src="${pageContext.request.contextPath}/assets/img/01.jpeg" alt="mini-user-profile">
                <div class = "middle-box">
              <span userId = "#아이디">userId</span>
              <span username = "#유저이름">username</span>
            </div>
              <div class = "buttom-box">
              </div>
            </div>
              <div class ="comment-line"></div>
              <ul class="second-block">
                <div class="post-part2">
                  게시물
                  <span post-cost ="#포스트 수" > 개</span>
                </div>
                <div class="fallower-part">
                  팔로워
                  <span fallower-cost ="#팔로워 수" > 명</span>
                </div>
                <div class="fallow-part">
                  팔로우
                  <span fallow-cost ="#팔로우 수" > 개</span>
                </div>
              </ul>
            </div>          
          </div>
          <span userID = "#프로필">프로필</span>       
        </div>
        <div class="post-modify">
          <img class= "mini-pic3" src= "${pageContext.request.contextPath}/assets/img/22.png" alt="mini-user-profile">
          <span modify = "#게시물 수정">수정</span>
        </div>
        <div class="post-delete">
          <img class= "mini-pic4" src= "${pageContext.request.contextPath}/assets/img/23.png" alt="mini-user-profile">
          <span modify = "#게시물 삭제">삭제</span>
        </div>                
       </section>        
      </article>
      <!-- 모달 파트 끝 -->

      <!-- 게시물 파트 시작 css = 722~817 -->
      <!-- 5페이지까지 구현-->
      <section id="post">       
        <ul class="list-box">
          <li class = "silde-part">
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/03.jpg">
            <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/04.jpeg">
            <span class="post-info"><span class = "post-name">게시물 명</span>
            <span class = "date-like">
            <time class = "post-date" datetime="">2023년 3월 28일</time>
            <div class = "like-count">♥<span>#좋아요 개수</span></div>
          </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/05.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/06.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/07.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/08.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/09.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/10.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/11.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/12.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/13.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/14.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
      </li>
      <li class = "silde-part">
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/15.png">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/04.jpeg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/05.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/06.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/07.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/08.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/09.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/10.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/11.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/12.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/13.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/14.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
      </li>
      <li class = "silde-part">
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/16.png">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/04.jpeg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/05.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/06.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/07.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/08.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/09.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/10.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/11.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/12.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/13.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/14.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
      </li>
      <li class = "silde-part">
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/17.png">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/04.jpeg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/05.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/06.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/07.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/08.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/09.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/10.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/11.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/12.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/13.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/14.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
      </li>
      <li class = "silde-part">
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/18.png">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/04.jpeg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/05.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/06.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/07.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/08.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/09.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/10.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/11.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
        </div>
        <div class="post-section">
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/12.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/13.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
          <div class="post-part">
            <img class = "post-image" src="${pageContext.request.contextPath}/assets/img/14.jpg">
                <span class="post-info"><span class = "post-name">게시물 명</span>
              <span class = "date-like">
              <time class = "post-date" datetime="">2023년 3월 28일</time>
              <div class = "like-count">♥<span>#좋아요 개수</span></div>
            </span></span>
          </div>
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
    <script
    src="https://code.jquery.com/jquery-3.6.3.js"
    integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
    crossorigin="anonymous"
  ></script>
    <script src="${pageContext.request.contextPath}/assets/SNS_main.js"></script>
  </body>
</html>
