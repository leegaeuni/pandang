<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>order</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/order.css" />
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
          <a href="#"
            ><img src="${pageContext.request.contextPath}/assets/img/logo.jpg" alt="" class="logo-img"
          /></a>
          <!-- 판당 페이지 이동처리 -->
          <a href="#" class="header-list">판당</a>
          <font>·</font>
          <!-- 산당 (스토어) 페이지 이동처리 -->
          <a href="#" class="header-list">산당</a>
          <font>·</font>
          <!-- sns 페이지 이동처리 -->
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
          <!-- 로그인 페이지 이동처리 -->
          <a href="#" class="login">로그인</a>
          <!-- 회원가입 페이지 이동처리 -->
          <a href="#" class="join">회원가입</a>
          <!-- 마이페이지, 로그아웃 이동처리(display none 상태, 로그인시 보여야함) -->
          <a href="#" class="my-page">마이페이지</a>
          <a href="#" class="logout">로그아웃</a>
        </div>
        <!-- 헤더 영역 종료 -->
      </div>

      <!-- ######main##### -->
      <div class="container">
        <table class="board-table">
          <div class="buy-table">구매내역</div>
          <thead>
            <tr>
              <th>주문날짜</th>
              <th>주문번호</th>
              <th>이미지</th>
              <th>상품정보</th>
              <th>가격</th>
              <th>수량</th>
              <th>배송비</th>
              <th>총가격</th>
              <th>배송상태</th>
              <th>택배사</th>
              <th>운송장번호</th>
              <th>취소/반품</th>
            </tr>
          </thead>
          <!-- @@@배송 전-취소만 가능 / 배송 중, 배송완료-반품만 가능@@@-->

          <tbody>
            <tr>
              <td class="buy-date">2023-03-22</td>
              <td class="buy-number">202303220001</td>
              <td class="buy-img">
                <a href="#">
                  <img src="${pageContext.request.contextPath}/assets/img/main/ohdungicushion.jpg" alt="" />
                </a>
              </td>
              <td class="store-title"><a href="#">오둥이 쿠션</a></td>
              <td class="store-price">29800</td>
              <td class="buy-cnt">2</td>
              <td class="post-price">3000</td>
              <td class="buy-total-price">62600</td>
              <td class="buy-status">배송완료</td>
              <td class="post">CJ대한통운</td>
              <td class="post-code">570333954180</td>
              <td class="cancel-return"><button>반품</button></td>
            </tr>

            <tr>
              <td class="buy-date">2023-03-22</td>
              <td class="buy-number">202303220001</td>
              <td class="buy-img">
                <a href="#">
                  <img src="${pageContext.request.contextPath}/assets/img/main/ohdungicushion.jpg" alt="" />
                </a>
              </td>
              <td class="store-title"><a href="#">오둥이 쿠션</a></td>
              <td class="store-price">29800</td>
              <td class="buy-cnt">2</td>
              <td class="post-price">3000</td>
              <td class="buy-total-price">62600</td>
              <td class="buy-status">배송완료</td>
              <td class="post">CJ대한통운</td>
              <td class="post-code">570333954180</td>
              <td class="cancel-return"><button>반품</button></td>
            </tr>

            <tr>
              <td class="buy-date">2023-03-22</td>
              <td class="buy-number">202303220001</td>
              <td class="buy-img">
                <a href="#">
                  <img src="${pageContext.request.contextPath}/assets/img/main/ohdungicushion.jpg" alt="" />
                </a>
              </td>
              <td class="store-title"><a href="#">오둥이 쿠션</a></td>
              <td class="store-price">29800</td>
              <td class="buy-cnt">2</td>
              <td class="post-price">3000</td>
              <td class="buy-total-price">62600</td>
              <td class="buy-status">배송완료</td>
              <td class="post">CJ대한통운</td>
              <td class="post-code">570333954180</td>
              <td class="cancel-return"><button>반품</button></td>
            </tr>

            <tr>
              <td class="buy-date">2023-03-22</td>
              <td class="buy-number">202303220001</td>
              <td class="buy-img">
                <a href="#">
                  <img src="${pageContext.request.contextPath}/assets/img/main/ohdungicushion.jpg" alt="" />
                </a>
              </td>
              <td class="store-title">
                <a href="#"> 오둥이 쿠션 </a>
              </td>
              <td class="store-price">29800</td>
              <td class="buy-cnt">2</td>
              <td class="post-price">3000</td>
              <td class="buy-total-price">62600</td>
              <td class="buy-status">배송완료</td>
              <td class="post">CJ대한통운</td>
              <td class="post-code">570333954180</td>
              <td class="cancel-return"><button>반품</button></td>
            </tr>

            <tr>
              <td class="buy-date">2023-03-22</td>
              <td class="buy-number">202303220001</td>
              <td class="buy-img">
                <a href="#">
                  <img src="${pageContext.request.contextPath}/assets/img/main/jrongcalendar.jpg" alt="" />
                </a>
              </td>
              <td class="store-title"><a href="#">재롱이 달력</a></td>
              <td class="store-price">15000</td>
              <td class="buy-cnt">3</td>
              <td class="post-price">3000</td>
              <td class="buy-total-price">48000</td>
              <td class="buy-status">배송전</td>
              <td class="post">CJ대한통운</td>
              <td class="post-code">570333954180</td>
              <td class="cancel-return"><button>취소</button></td>
            </tr>
          </tbody>
        </table>

        <!-- 구매내역 5개까지 뜨고 6개부터는 다음페이지로 넘어감 -->

        <div class="pagination">
          <ul>
            <!-- ========== 페이징 처리============ -->
            <li><a href="#" class="prev">&lt;</a></li>
            <li><a href="#" class="active">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#" class="next">&gt;</a></li>
            <!-- ========== /페이징 처리 ============ -->
          </ul>
        </div>
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
    </div>
    <script
      src="https://code.jquery.com/jquery-3.6.3.js"
      integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
      crossorigin="anonymous"
    ></script>
    <script src="${pageContext.request.contextPath}/assets/js/order.js"></script>
  </body>
</html>