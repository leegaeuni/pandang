<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


				<!-- 반품모달 시작 -->
				<article class="modal-box">
					<div class="buy-status-change">
						<div class="change-ok-text">정말 반품하시겠습니까?</div>
						<div class="button-wrap">
							<input type="hidden" class="send-buy-number">
							<button class="change-status" type="button">반품신청</button>
							<button class="cancel" type="button">취소</button>
						</div>
					</div>
					<div class="buy-status-change-ok-page">반품신청이 완료됐습니다.</div>
				</article>
				<!-- 반품 모달 끝 -->

				<tbody>
					<c:forEach var="buy" items="${buyList}">
						<tr>
							<td class="buy-date">${buy.getBuyDate()}</td>
							<td class="buy-number">${buy.getBuyNumber()}</td>
							<td class="buy-img"><img
								src="/upload/${buy.getStoreFileSystemName()} alt="
								" 
                  name="storeFileSystemName" /></td>
							<td class="store-title">${buy.getStoreTitle()}</td>
							<td class="store-price">${buy.getStorePrice()}</td>
							<td class="buy-cnt">${buy.getBuyCnt()}</td>
							<td class="post-price">3000</td>
							<td class="buy-total-price">${buy.getStorePrice() * buy.getBuyCnt() + 3000}</td>
							<td class="buy-status" name="buyStatus">${buy.getBuyStatus()}</td>
							<td class="post">${buy.getBuyPost()}</td>
							<td class="post-code">${buy.getBuyPostCode()}</td>
							<td class="cancel-return">
							<c:choose>
								<c:when test="${buy.getBuyStatus() eq '반품신청'}">
									<button type="button" class="cancel-return-button" disabled>반품</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="cancel-return-button" >반품</button>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>


			</table>

			<!-- 구매내역 5개까지 뜨고 6개부터는 다음페이지로 넘어감 -->

			<div class="pagination">
				<ul>
					<!-- ========== 페이징 처리============ -->
					<!--     <li><a href="#" class="prev">&lt;</a></li>
            <li><a href="#" class="active">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#" class="next">&gt;</a></li> -->

					<c:if test="${prev}">
						<li><a
							href="${pageContext.request.contextPath}/buy/buyListOk.bu?page=${startPage - 1}"
							class="prev">&lt;</a></li>
					</c:if>

					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:choose>
							<c:when test="${!(i == page) }">
								<li><a
									href="${pageContext.request.contextPath}/buy/buyListOk.bu?page=${i}">
										<c:out value="${i}" />
								</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="#" class="active"> <c:out value="${i}" />
								</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${next}">
						<li><a
							href="${pageContext.request.contextPath}/buy/buyListOk.bu?page=${endPage + 1}"
							class="next">&gt;</a></li>
					</c:if>
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
	<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/order.js"></script>
</body>
</html>