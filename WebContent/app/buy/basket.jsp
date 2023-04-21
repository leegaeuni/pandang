<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>basket</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/basket.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
    />
  </head>
  <body>
    <div class="all-wrap">
      <!-- #######header####### -->
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
  		<!-- 추가 수정부분 -->       
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

      <!-- ######main##### -->
      <div class="container">
      
      <form id="edit-form" action="${pagetContext.request.contextPath}/buy/pay.bu" method="post"
			>
      
        <table class="board-table">
          <div class="basket-table">장바구니</div>
          <thead>
            <tr>
              <th class="check-box">
                <label>
                  <input
                    type="checkbox"
                    name="basket-product-all"
                    value="selectall"
                    onclick="selectAll(this)"
                  />
                </label>
              </th>
              <th>이미지</th>
              <th>상품정보</th>
              <th class="th-store-price">가격</th>
              <th class="th-buy-cnt">수량</th>
              <th class="th-store-total-price">상품금액</th>
              <th class="th-post-price">배송비</th>
              <th class="th-buy-total-price">총가격</th>
            </tr>
          </thead>

          <tbody>
          
          	
           <c:forEach var="basket" items="${basketList}">
          <!-- items="${basketList}"는 BasketController에서 List<BasketVO>의 변수로 선언한 basketList임 -->
            <tr>
              <td class="check-box">
                <label>
                  <input
                    type="checkbox"
                    class="store-number"
                    name="basket-product"
                    value="${basket.getStoreNumber() }"
                  />
                  <div class='hidden'></div>
                </label>
              </td>
              <td class="basket-img">
                  <img src="/upload/${basket.getStoreFileSystemName()} alt="" 
                  name="storeFileSystemName"
                  />
                
              </td>
              <td class="store-title" name="storeTitle" >${basket.getStoreTitle()}</td>
              <td class="store-price" name="storePrice" >${basket.getStorePrice()}</td>
              <td class="buy-cnt">
                <div class="quantity-wrap">
                	<%-- <input class="store-number" type="hidden" value="${basket.getStoreNumber() }"> --%>
                	<input class="member-number" type="hidden" value="${basket.getMemberNumber() }">
                	
                    <input type="text" class="quantity-input" value="${basket.getBasketCnt()}" name="basketCnt">
                    <!-- <input type="text" class="quantity-input" value="1" readonly>이면
                      +,- 버튼을 이용해야지만 숫자가 변경됨 -->
                  <div class="quantity-btn">                    
                    <span>
                      <button type="button" class="plus-btn">+</button>
                      <button type="button" class="minus-btn">-</button>
                    </span>
                  </div>
                  
                </div>              
                </td>
              <td class="store-total-price">${basket.getStorePrice() * basket.getBasketCnt()}</td>
              <td class="post-price">3000</td>
              <td class="buy-total-price">${basket.getStorePrice() * basket.getBasketCnt() + 3000}</td>
              
              
            </tr>
            </c:forEach> 
    		
  
            
            
            
          </tbody>
        </table>
        
        
        <div class="basket-list">
        <div class="delete-order">
          <div class="check-product">선택상품</div>
          <div class="delete"><button type="button">삭제하기</button></div>
        </div>
        </div>
        

        <!-- 장바구니에서 결제하고 나면 장바구니에 담았던 상품 삭제되어야 함 -->

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
              <tr>
                <td class="final-product-pay">0</td>
                <td class="final-post-pay">0</td>
                <td class="final-total-pay">0</td>
              </tr>
            </tbody>
          </div>
        </table>
        <div class="pay-box">
          <div class="pay-all">
            <button type="submit">상품 주문</button>
          </div>
          <%-- <div class="pay-check">
            <a href="${pageContext.request.contextPath}/buy/payOk.bu"><button type="button">선택상품 주문</button></a>
          </div> --%>
        </div>

      <!-- #####footer##### -->
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
      </form>
    </div>
    <script
      src="https://code.jquery.com/jquery-3.6.3.js"
      integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
      crossorigin="anonymous"
    ></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/basket.js"></script>
  </body>
</html>