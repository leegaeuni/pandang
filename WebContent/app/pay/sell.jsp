<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>판매내역</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/sell.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<div class="all-wrap">
		<div class="header-container">
			<!-- 헤더 영역 시작  -->
			<div class="start-container">
				<!-- 메인페이지 이동처리 -->
				<a href="${pageContext.request.contextPath}/main.main"><img
					src="${pageContext.request.contextPath}/assets/img/logo.jpg" alt=""
					class="logo-img" /></a>
				<!-- 판당 페이지 이동처리 -->
				<div class="pandang-container">
					<a href="${pageContext.request.contextPath}/sns/snsOk.sn"
						class="header-list">판당</a> <font>·</font>
					<!-- 산당 (스토어) 페이지 이동처리 -->
					<a href="${pageContext.request.contextPath}/store/storeOk.st"
						class="header-list">산당</a>
				</div>
			</div>
			<form
				action="${pageContext.request.contextPath}/store/storeSearch.st"
				class="search">
				<input type="text" name="searchInput" class="search-bar"
					placeholder="어떤 창작물을 찾으시나요?" />
				<button type="submit" class="material-symbols-outlined">
					search</button>
			</form>
			<div class="login-container">
				<c:choose>
					<c:when test="${empty sessionScope.memberNumber}">
						<a href="${pageContext.request.contextPath}/member/login.me"
							class="login">로그인</a>
						<a href="${pageContext.request.contextPath}/member/join.me"
							class="join">회원가입</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/member/mypageOk.me"
							class="my-page">마이페이지</a>
						<a href="${pageContext.request.contextPath}/member/logoutOk.me"
							class="logout">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- 헤더 영역 종료 -->
		</div>

		<div class="board-wrap">
			<!-- board-contents-title와 board-list의 개수와 가로 비율을 맞춰 테이블 형식으로 사용함-->
			<div class="sell-board">판매내역</div>

			<div class="board-title">
				<div class="title-buy-number">주문번호</div>
				<div class="title-buy-date">주문날짜</div>
				<div class="title-store-title">상품정보</div>
				<div class="title-member-id">회원아이디</div>
				<div class="title-total-price">총 결제금액</div>
				<div class="title-buy-post">택배사</div>
				<div class="title-buy-post-code">운송장번호</div>
				<div class="title-post-ok">확인</div>
			</div>

			<!-- 게시물 목록 -->

			<c:choose>
				<c:when test="${not empty salesDetail}">
					<c:forEach var="sales" items="${salesDetail}">
						<div class="board-list">
							<div class="buy-number">${sales.getBuyNumber()}</div>
							<div class="buy-date">${sales.getBuyDate()}</div>
							<div class="store-title">${sales.getStoreTitle()}</div>
							<div class="member-id">${sales.getMemberId()}</div>
							<div class="total-price">${sales.getStorePrice()*sales.getBuyCnt()+3000}</div>
							<div class="buy-post">
								<input type="text" id="post-select" /> <select name=""
									onchange="selectPost(this)" required>
									<option class="select-option" value="" selected>택배사 선택</option>
									<option value="우체국택배">우체국택배</option>
									<option value="CJ대한통운">CJ대한통운</option>
									<option value="한진택배">한진택배</option>
									<option value="롯데택배">롯데택배</option>
									<option value="로젠택배">로젠택배</option>
									<option value="1">택배사 직접 입력</option>
								</select>
							</div>
							<div class="buy-post-code">
								<input type="text" name="" required />
							</div>
							<div class="post-ok">
								<button type="button">확인</button>
							</div>
						</div>
						<!-- 구매자의 회원정보 -->
						<div class="sell-info-wrap">
							<div class="sell-info-wrap-sub">
								<div class="member-info-wrap">
									<div class="buy-name">구매자 : ${sales.getMemberName()}</div>
									<div class="buy-phone-number">휴대폰번호 :
										${sales.getMemberPhoneNumber()}</div>
									<div class="member-emeil">이메일 : ${sales.getMemberEmail()}</div>
									<div class="buy-zone-code">우편번호 :
										${sales.getMemberZoneCode()}</div>
									<div class="buy-address">주소 : ${sales.getMemberAddress()}</div>
									<div class="buy-address-detail">상세주소 :
										${sales.getMemberAddressDetail()}</div>
									<div class="buy-msg">배송메시지 : ${sales.getBuyMsg()}</div>
								</div>
								<div class="buy-info-wrap">
									<div class="store-price">상품가격 : ${sales.getStorePrice()}</div>
									<div class="buy-cnt">수량 : ${sales.getBuyCnt()}</div>
									<div class="store-total">총 상품금액 :
										${sales.getStorePrice()*sales.getBuyCnt()}</div>
									<div class="post-cost">배송비 : 3000</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" align="center">판매된 내역이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			<!-- 회원아이디 클릭 시 구매정보가 보여진다. -->
			<!-- 구매내역을 받아오기만 하고 따로 입력하는 부분은 없어서  구매자이름 : 구매자로 하나로 묶음-->
			<!-- 받아올 때 구매자 : $[sell.get~~]이렇게 적어도 에러 안남 -->
			<!-- 구매자이름 : 부분 div앞으로 빼면 줄이 바뀌어 나와서 
            '구매자 : //$[sell.get~~]'로 사용하기 싫으면 div 각각 추가로 생성해서 가로배열로 만들어야함 -->
			<!-- 구매페이지에서 작성한 email을 받는 칼럼 없음 -->

			<!-- 페이징 처리 10개씩 나오도록-->
			<!-- 			<div class="pagination">
				<ul>
					<li><a href="#" class="prev">&lt;</a></li>
					<li><a href="#" class="active">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#" class="next">&gt;</a></li>
				</ul>
			</div> -->
			<!-- 페이징 처리 -->
			<div class="pagination">
				<ul>
					<c:if test="${prev}">
						<li><a
							href="${pageContext.request.contextPath}/buy/sell.bu?page=${startPage - 1}"
							class="prev">&lt;</a></li>
					</c:if>

					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:choose>
							<c:when test="${!(i == page) }">
								<li><a
									href="${pageContext.request.contextPath}/buy/sell.bu?page=${i}">
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
							href="${pageContext.request.contextPath}/buy/sell.bu?page=${endPage + 1}"
							class="next">&gt;</a></li>
					</c:if>
				</ul>
			</div>
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
	</div>

	<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/assets/js/sell.js"></script>
</body>
</html>
