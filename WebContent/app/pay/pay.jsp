<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  		<!-- 추가 수정부분 -->       
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
  
    <div class="page-content">
        <!-- 배경화면 -->
        <div class="background">
            <!-- 작은 배경화면 -->
            <div class="inner-wrap">

                <table class="board-table">
                  <div class="basket-table">구매하기</div>
                  <thead>
                    <tr class="pay-title">
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
                  <c:choose>
                  	<c:when test="${not empty payList }">
                  		<input type="hidden" value="${payList.size()}" class="list-size">
	                  	<c:forEach var="pay" items="${payList}">
		                    <tr>
		                      <td class="basket-img">
	 	                        <input type="hidden" class="store-number" name="storeNumber" value="${pay.getStoreNumber() }">
		                        <img src="${pageContext.request.contextPath}/upload/${pay.getStoreFileSystemName()}" alt="" />
		                      </td>
		                      <td class="title">${pay.getStoreTitle() }</td>
		                      <td class="price">${pay.getStorePrice() }</td>
		                      
		                      <td class="count" name="buyCnt">${pay.getBasketCnt()}</td>
		                      <td class="price-count">${pay.getStorePrice() * pay.getBasketCnt() }</td>
		                      <td class="delivery-price">3000</td>
		                      <td class="total-price">${pay.getStorePrice() * pay.getBasketCnt() +3000}</td>
		                    </tr>
	                  	</c:forEach>
                  	</c:when>
                  </c:choose>
                    <!-- ============================================================= -->
                    
                    
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
                      <tr class="pay-total">
                        <td class="product-pay">0</td>
                        <td class="delivery-pay">0</td>
                        <td class="total-pay">0</td>
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
                    <h3 class="post-info-text">배송 정보</h3>
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
                            <!-- <a href="#" class="look-address">주소록보기</a> -->
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
                          <input type="text" class="who-is-put" name="buyName" value="${payMember.getMemberName()}" required>
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
                          <input type="text" class="mail-address" placeholder="우편번호 입력" required id="zoneCode"
                           name="buyZoneCode" value="${payMember.getMemberZoneCode()}"> <br>
                          <input type="text" class="main-address" required id="addressKakao"
                           name="buyAddress" value="${payMember.getMemberAddress()}">
                          <span class="address-number">기본주소</span> <br>
                          <input type="text" class="sub-address" required id="addressDetail" 
                           name="buyAddressDetail" value="${payMember.getMemberAddressDetail()}"
                          >
                          <!-- name="addressDetail"지움 -->
                          <span class="address-number">상세주소</span>
                          <span class="address-number-text">(배송지 주소를 정확하게 기입 부탁드립니다.)</span>
                        </td>
                      </tr>
                      <!-- 주소 끝 -->
                      <!-- 일반전화 -->
                      <tr class="classic-phone">
                        <th class="classic-phone-number">
                          일반전화
                        </th>
                        <td class="classic-phone-type">
                          <input type="text" class="classic-phone-put"
                          placeholder="숫자만 입력하세요." >
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
                          <input type="text" class="cell-phone-put" placeholder="숫자만 입력하세요." 
                           name="buyPhoneNumber" value="${payMember.getMemberPhoneNumber()}"
                          required>
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
                          <input type="text" class="front-email-address" required  id="email1" name="member_email" value="${emailFront}">
                          @
                          <input type="text" class="back-email-address" id="email2" name="member_email" value="${emailBack}" required> 
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
                          <textarea cols="70" class="delivery-message-area" name="buyMsg"></textarea>
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
                    0
                  </span>
                  <div class="pay-button">
                    <button class="pay-button-tag" onclick="requestPay()" type="button">결제하기</button>
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
    <!-- 결제 api용 스크립트 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <!-- 결제 api용 스크립트 끝! -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/pay.js"></script>
</body>
</html>