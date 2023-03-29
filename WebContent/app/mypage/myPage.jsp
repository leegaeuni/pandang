<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>myPage</title>
  <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
    />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/myPage.css"/>
</head>
<body>

  <div class="header-container">
    <!-- 헤더 영역 시작  -->
    <div class="start-container">
      <a href="#"><img src="${pageContext.request.contextPath}/assets/img/logo.jpg" alt="" class="logo-img" /></a>
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
     <!-- 헤더 영역 종료 -->
  </div>

  <!-- @@@@버튼 영역@@@@  -->
  <!-- <div class="page-btn-box">
    <a href="#" class="prev">
      <span class="material-symbols-outlined"> arrow_back_ios_new </span>
    </a>
    <a href="#" class="next">
      <span class="material-symbols-outlined"> arrow_forward_ios </span>
    </a>
  </div> -->

  <div class="page-content">
    <!-- 배경 -->
   <div class="background">
    <!-- 작은 배경 -->
     <div class="inner-wrapper">
      <!-- 메뉴 바 -->
      <div class="menu">
        <!-- 메뉴 바 이름 -->
        <div class="menu-title">
          <div class="title-text">설정</div>
        </div>
        <!-- 메뉴 종류 -->
        <div class="menu-content">
          <div class="menu-type">
            <div class="type1">
              <!-- <button type="button" class="type1-button">프로필 편집</button> -->
              <a href="#" class="type1-button">프로필 편집</a>
            </div>
            <div class="type2">
              <!-- <button type="button" class="type2-button">장바구니</button> -->
              <a href="#" class="type2-button">장바구니</a>
            </div>
            <div class="type3">
              <!-- <button type="button" class="type3-button">구매내역</button> -->
              <a href="#" class="type3-button">구매내역</a>
            </div>
            <div class="type4">
               <!-- <button type="button" class="type4-button">배송조회</button> -->
               <a href="#" class="type4-button">배송조회</a>
            </div>
          </div>
        </div>
        <!-- 메뉴 종류 -->
      </div>
      <!-- 메뉴 바 -->
      <!-- 편집 창 -->
      <div class="main-content">
        <!-- 개인정보 변경 창 -->
        <form action="#" method="post">
        <div class="main-type">
          <!-- 프로필 편집 창 -->
          <div class="profile">
            <div class="myProfile">내 프로필</div>
            <!-- 프로필 사진 설정 -->
            <div class="profile-image-wrap">
              <div class="image-wrap-image" width="100" height="100">
                <div class="image-wrap-image2" style="width: 100px; height: 100px;">
                  <span class="image"></span>
                </div>
              </div>
              <div class="profile-image-upload">
                <!-- id만 바꾸면 될듯 -->
                <input type="file" id="avatarImage" class="upload">
                <!-- for에 있는 이름도 위에 id랑 동일하게 바꾸면 될듯 -->
                <label class="upload-button" for="avatarImage">
                  <svg type="upload18" viewBox="0 0 18 18" class="sc-iBYQkv lcoBfw">
                    <path d="M9 3V12"></path><path d="M9.00003 2.99997L12 5.99997"></path>
                    <path d="M8.99997 2.99997L5.99997 5.99997"></path>
                    <path d="M3 15H15"></path><path d="M3 11.25V15"></path>
                    <path d="M15 11.25V15"></path>
                    <defs></defs>
                  </svg>
                  프로필 사진 업로드
                </label>
                <div class="label-text">10MB 이내의 이미지 파일을 업로드 해주세요.</div>
              </div>
            </div>
            <!-- 프로필 사진 설정 -->
            <div class="channel">
              <div class="channel-name">
                채널 이름
                <!-- 밑에 span은 필요없다 싶으면 주석처리 해도됨 -->
                <span class="memberdot">*</span>
              </div>
              <label class="name-put">
                <input placeholder="이름 입력란" maxlength="20" class="name-put-place" required name="channel_name">
              </label>
            </div>
            <div class="channel-info">
              <div class="channel-info-name">채널 소개</div>
              <label class="info-name-put">
                <input placeholder="띄어쓰기 포함 20자 이내로 입력해주세요." maxlength="20" class="info-put-place" name="channel_comment">
              </label>
            </div>
          </div>
          <!-- 프로필 편집 창 -->
          <!-- 회원 정보 수정 창 -->
          <div class="member">
            <div class="member-info-change">회원 정보 수정</div>
            <div class="member-id">
              <div class="member-id-name">비밀번호 변경</div>
              <label class="id-change">
                <input type="password" maxlength="12" placeholder="변경할 비밀번호 12자리를 입력해주세요." class="id-put-place" required name="member_id">
              </label>
            </div>
            <div class="member-nickname">
              <div class="member-nickname-name">닉네임 변경</div>
              <label class="nickname-change">
                <input placeholder="변경할 닉네임을 입력해주세요. (2자리 이상 10자리 이하)" minlength="2" maxlength="10" class="nickname-put-change" required name="member_nickname">
              </label>
            </div>
            <div class="member-phone">
              <div class="member-phone-number">전화번호 변경</div>
              <label class="number-change">
                <input placeholder="변경할 전화번호를 입력해주세요.(숫자만 입력)" class="number-put-change" name="membe_phone_number" required>
              </label>
            </div>
            <div class="member-address">
              <div class="member-address-name">주소 변경</div>
              <label class="address-change">
                <input placeholder="우편번호를 입력해주세요." class="address-put-change" required id="zoneCode">
              </label>
              <label class="address-change2">
                <input placeholder="변경할 기본 주소를 입력해주세요." class="address-put-change2" required id="addressKakao">
              </label>
              <label class="address-change3">
                <input placeholder="변경할 상세 주소를 입력해주세요." class="address-put-change3" required id="addressDetail" name="addressDetail">
              </label>
            </div>
            <div class="commit">
              <button type="submit" class="commit-button">변경하기</button>
            </div>
          </div>
          <!-- 회원 정보 수정 창 -->
        </div>
      </form>
      <!-- 개인정보 변경 창 끝 -->
      </div>
      <!-- 편집 창 -->
     </div>
     <!-- 작은 배경 -->
    </div>
    <!-- 배경 -->
  </div>

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
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/myPage.js"></script>
</body>
</html>