/**
 * 
 */

// @@@@@@ 이미지 클릭 했을 때 모달 창 띄우기 @@@@@@@@@
$(".post-info").on("click", function () {
  $(".modal-box").css("display", "flex");

  $(".modal-background").css("display", "inline-block");
});

// @@@@@@@ 모달 영역 밖으로 클릭하면 모달 창 없애기 @@@@@@@

$(".modal-background").on("click", function () {
  $(".modal-box").css("display", "none");

  $(this).css("display", "none");
});

// @@@@@@@ 모달 신고하기 버튼 누를 시 @@@@@@@@
$(".modal-report-btn").on("click", function () {
  $(".report-path").css("display", "block");

  // 재클릭시 안보이게하기
  if ($(this).data("clicked")) {
    $(".report-path").css("display", "none");
  }
});

// @@@@@@@ 신고하기 버튼 클릭시 색 @@@@@@
$(".report-btn-color").on({
  mouseover: function () {
    $(this).css("color", "rgb(255, 0, 0)");
  },
  mouseout: function () {
    if ($(this).data("clicked") !== true) {
      $(this).css("color", "rgb(0, 0, 0)");
    }
  },
  click: function () {
    if ($(this).data("clicked") !== true) {
      $(this).css("color", "rgb(255, 0, 0)").data("clicked", true);
    } else {
      $(this).css("color", "rgb(0, 0, 0)").data("clicked", false);
    }
  },
});

// @@@@@@ 좋아요 색 변경 테스트 !@@@@@@@@

$(".before-like-btn").on("click", function () {
  if (
    $(this).attr("src") ===
    "https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
  ) {
    $(this).attr(
      "src",
      "https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
    );
  } else {
    $(this).attr(
      "src",
      "https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
    );
  }
});

// @@@@@@@ 모달 팔로우 버튼 클릭 수정 @@@@@@@@
$(".modal-follow-btn").on("click", function () {
  if ($(this).children(".add").css("display") === "block") {
    $(this).children(".add").css("display", "none");
    $(this).children(".done").css("display", "block");
  } else {
    $(this).children(".add").css("display", "block");
    $(this).children(".done").css("display", "none");
  }
});

// @@@@@ 슬라이드 구현 @@@@@@
const slides = document.querySelector(".slide-box");
const slideImg = document.querySelectorAll(".slide-box li");
let currentIdx = 0;
const slideCount = slideImg.length;
const prev = document.querySelector(".post-img-prev");
const next = document.querySelector(".post-img-next");
const slideWidth = 600;
const slideMargin = 100;

//전체 슬라이드 컨테이너 넓이 설정
slides.style.width = (slideWidth + slideMargin) * slideCount + "px";

function moveSlide(num) {
  slides.style.left = -num * 600 + "px";
  currentIdx = num;
}

prev.addEventListener("click", function () {
  console.log("!@@@@@@@@@");

  if (currentIdx !== 0) moveSlide(currentIdx - 1);
});

next.addEventListener("click", function () {
  if (currentIdx !== slideCount - 1) {
    moveSlide(currentIdx + 1);
  }
});

// 이미지 최대 개수나 최저 개수 도달시 버튼을 없애는 js
function checkEnd() {
  if (currentIdx <= 0) {
    console.log("!!!!!!~~");
    $(".post-img-prev").css("display", "none");
  } else {
    $(".post-img-prev").css("display", "block");
  }

  if (currentIdx >= slideCount - 1) {
    $(".post-img-next").css("display", "none");
  } else {
    $(".post-img-next").css("display", "block");
  }
}

checkEnd();

$(".post-img-next").on("click", function () {
  console.log("currentIdx : " + currentIdx);
  checkEnd();
});

$(".post-img-prev").on("click", function () {
  console.log("currentIdx : " + currentIdx);
  checkEnd();
});
