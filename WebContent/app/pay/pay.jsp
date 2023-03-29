<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>pay</title>

    <link
    rel="stylesheet"
    type="text/css"
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
  />
  <link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0"
  />

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pay.css"/>
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
  
    <div class="page-content">
        <!-- 배경화면 -->
        <div class="background">
            <!-- 작은 배경화면 -->
            <div class="inner-wrap">

              <!-- =============================================================== -->
              <!-- 상품주문 내역
              <div class="orderList">
                상품주문 내역 이름
                <div class="orderList-title">
                  <h3>배송상품 주문내역</h3>
                </div>
                상품주문 내역 이름 끝
                <div class="oderList-board">
                  주문내역 창
                  <table class="oder-board" border="1">
                    <thead class="oder-kind">
                      <tr class="oderList-kind">
                        <th class="chk">
                          <input type="checkbox" class="checkbox">
                        </th>
                      </tr>
                    </thead>
                  </table>
                  주문내역 창 끝
                </div>
              </div>
              상품주문 내역 끝 -->


                <table class="board-table">
                  <div class="basket-table">구매내역</div>
                  <thead>
                    <tr>
                      <th class="basket-name1">이미지</th>
                      <th class="basket-name2">상품정보</th>
                      <th class="basket-name3">가격</th>
                      <th class="basket-name4">수량</th>
                      <th class="basket-name5">상품금액</th>
                      <th class="basket-name6">배송비</th>
                      <th class="basket-name7">총가격</th>
                    </tr>
                  </thead>
        
                  <tbody>
                    <tr>
                      <td class="basket-img">
                        <img src="${pageContext.request.contextPath}/assets/img/product/ohdungicushion.jpg" alt="" />
                      </td>
                      <td class="title">오둥이 쿠션</td>
                      <td class="price">29800</td>
                      <td class="count">2</td>
                      <td class="price-count">59600</td>
                      <td class="delivery-price">3000</td>
                      <td class="total-price">62600</td>
                    </tr>
                    <!-- ============================================================= -->
                    
                    <tr>
                      
                      <td class="basket-img">
                        <img src="${pageContext.request.contextPath}/assets/img/product/jrongcalendar.jpg" alt="" />
                      </td>
                      <td class="title">2023 재롱이 달력</td>
                      <td class="price">15000</td>
                      <td class="count">3</td>
                      <td class="price-count">45000</td>
                      <td class="delivery-price">3000</td>
                      <td class="total-price">48000</td>
                    </tr>
                    <tr>
                      <td class="basket-img">
                        <img src="${pageContext.request.contextPath}/assets/img/product/choigosimmouse.jpg" alt="" />
                      </td>
                      <td class="title">최고심 마우스 패드 무지개</td>
                      <td class="price">5000</td>
                      <td class="count">1</td>
                      <td class="price-count">5000</td>
                      <td class="delivery-price">3000</td>
                      <td class="total-price">8000</td>
                    </tr>
                    <!-- ======================================================= -->
                    
                    <tr>
                      <td class="basket-img">
                        <img src="${pageContext.request.contextPath}/assets/img/product/ohdungicushion.jpg" alt="" />
                      </td>
                      <td class="title">오둥이 쿠션</td>
                      <td class="price1">29800</td>
                      <td class="coune-countt">2</td>
                      <td class="pric">59600</td>
                      <td class="delivery-price">3000</td>
                      <td class="total-price">62600</td>
                    </tr>
                    </tbody>
                </table>

                <table class="pay-table">
                  <div class="basket-table">
                    <thead>
                      <tr>
                        <th>총 상품 금액</th>
                        <th>총 배송비</th>
                        <th class="total-pay-th">결제 예정 금액</th>
                      </tr>
                    </thead>
        
                    <tbody>
                      <tr class="txt">
                        <td class="product-pay">2057153</td>
                        <td class="delivery-pay">9000</td>
                        <td class="total-pay">23186163</td>
                      </tr>
                    </tbody>
                  </div>
                </table>

              <!-- ================================================================ -->
              <!-- form 태그 시작 -->
              <form action="#" method="post">
              <!-- 주문 창 -->
                <div class="orderarea">
                  <!-- 창 이름 -->
                  <div class="area-title">
                    <h3>배송 정보</h3>
                    <p class="required-area">
                      <span class="requiredDot">*</span>
                      필수입력사항
                    </p>
                  </div>
                  <!-- 창 이름 끝 -->
                  <!-- 메인 주문 창 -->
                  <div class="main-area">
                    <table border="1" class="ordertable">
                      <!-- 수령자 정보 -->
                    <tbody class="member-info">
                      <!-- 배송지 선택 -->
                      <tr class="choose-place">
                        <th class="choose">배송지 선택</th>
                        <td class="choose-type">
                          <div class="address-type">
                            <!-- name만 나중에 바꾸면 됨, 필요하면 value도 추가 -->
                            <input type="radio" class="type-same" name="information" checked>
                            <label class="type1">회원 정보와 동일</label>
                            <input type="radio" class="type-different" name="information">
                            <label class="type2">새로운 배송지</label>
                            <a href="#" class="look-address">주소록보기</a>
                          </div>
                        </td>
                      </tr>
                      <!-- 배송지 선택 끝 -->
                      <!-- 받는 사람 -->
                      <tr class="who">
                        <th class="receiver">
                          받으시는 분
                          <span class="requiredDot">*</span>
                        </th>
                        <td class="who-is">
                          <input type="text" class="who-is-put" required>
                        </td>
                      </tr>
                      <!-- 받는 사람 끝 -->
                      <!-- 주소 -->
                      <tr class="address">
                        <th class="address-kind">
                          주소
                          <span class="requiredDot">*</span>
                        </th>
                        <td class="address-put-type">
                          <input type="text" class="mail-address" placeholder="우편번호 입력" required id="zoneCode"> <br>
                          <input type="text" class="main-address" required id="addressKakao">
                          <span class="address-number">기본주소</span> <br>
                          <input type="text" class="sub-address" required id="addressDetail" name="addressDetail">
                          <span class="address-number">상세주소</span>
                          <span class="address-number">(배송지 주소를 정확하게 기입 부탁드립니다.)</span>
                        </td>
                      </tr>
                      <!-- 주소 끝 -->
                      <!-- 일반전화 -->
                      <tr class="classic-phone">
                        <th class="classic-phone-number">
                          일반전화
                        </th>
                        <td class="classic-phone-type">
                          <input type="text" class="classic-phone-put" placeholder="숫자만 입력하세요.">
                        </td>
                      </tr>
                      <!-- 일반전화 끝 -->
                      <!-- 휴대전화 -->
                      <tr class="cell-phone">
                        <th class="cell-phone-number">
                          휴대전화
                          <span class="requiredDot">*</span>
                        </th>
                        <td class="cell-phone-type">
                          <input type="text" class="cell-phone-put" placeholder="숫자만 입력하세요." required>
                        </td>
                      </tr>
                      <!-- 휴대전화 끝 -->
                    </tbody>
                    <!-- 수령자 정보 끝 -->
                    <!-- 이메일 -->
                    <tbody class="member-info2">
                      <tr class="email-section">
                        <th class="email">
                          이메일
                          <span class="requiredDot">*</span>
                        </th>
                        <td class="email-type">
                          <input type="text" class="front-email-address" required  id="email1" name="member_email">
                          @
                          <input type="text" class="end-email-address" id="email2" name="member_email" required> 
                          <select class="email-kind" name="select_email" onchange="selectEmail(this)">
                            <option value="" selected>- 이메일 선택 -</option>
                            <option value="1">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="nate.com">nate.com</option>
                            <option value="hotmail.com">hotmail.com</option>
                            <option value="yahoo.com">yahoo.com</option>
                            <option value="empas.com">empas.com</option>
                            <option value="korea.com">korea.com</option>
                            <option value="dreamwiz.com">dreamwiz.com</option>
                            <option value="gmail.com">gmail.com</option>
                          </select>
                          <p class="email-info">이메일을 통해 주문처리과정을 보내드립니다.</p> <br>
                          <p class="email-info2"> 이메일 주소란에는 반드시 수신가능한 이메일 주소를 입력해 주세요.</p>
                        </td>
                      </tr>
                    </tbody>
                    <!-- 이메일 끝 -->
                    <!-- 배송 메시지 -->
                    <tbody class="delivery">
                      <tr class="delivery-message-section">
                        <th class="delivery-name">
                          배송메시지
                        </th>
                        <td class="delivery-message">
                          <textarea cols="70" class="delivery-message-area"></textarea>
                        </td>
                      </tr>
                    </tbody>
                    <!-- 배송 메시지 끝 -->
                    </table>
                  </div>
                  <!-- 메인 주문 창 끝 -->
                </div>
                <!-- 주문 창 끝-->
                <!-- 결제 창 -->
                <div class="payarea">
                  <!-- 두번째 결제 창 -->
                  <div class="second-payarea">
                  <h4 class="final-pay-message">
                    <strong style="font-weight: bold;">최종결제 금액</strong>
                  </h4>
                  <span class="price-zone">
                    23,186,163
                  </span>
                  <div class="pay-button">
                    <a href="#" class="pay-button-tag">결제하기</a>
                  </div>
                  </div>
                  <!-- 두번째 결제 창 끝 -->
                </div>
              </form>
              <!-- form 태그 끝 -->
                <!-- 결제 창 끝 -->
            </div>
            <!-- 작은 배경화면 끝 -->
        </div>
        <!-- 배경화면 끝 -->
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/pay.js"></script>
</body>
</html>