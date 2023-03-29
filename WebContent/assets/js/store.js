/**
 * 
 */
// @@@@@@@@@@ 선택된 카테고리만 css 부여하는 js @@@@@@@@@@@@
$(".categori").on("click", function () {
  $(this).css("background-color", "rgb(50, 50, 50)");
  $(this).css("color", "white");

  $(".categori").not(this).css("background-color", "white");
  $(".categori").not(this).css("color", "black");
});

// @@@@@좋아요 버튼 누를시에 색상 변경 흰색->빨간색 빨간색->흰색@@@@@@@@@@
$(".like-btn").on("click", function () {
  if ($(this).hasClass("active")) {
    // 이미 클릭한 경우
    $(this).removeClass("active");
    $(this).css("background-image", "");
    $(this)
      .parent()
      .parent()
      .siblings()
      .find(".before-like-btn")
      .attr(
        "src",
        "https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
      );
  } else {
    // 처음 클릭하는 경우
    $(this).addClass("active");
    $(this).css(
      "background-image",
      "url(https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png)"
    );
    $(this)
      .parent()
      .parent()
      .siblings()
      .find(".before-like-btn")
      .attr(
        "src",
        "https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
      );
  }
});

// @@@@@@ 이미지 클릭 했을 때 모달 창 띄우기 @@@@@@@@@
$(".post-img-back").on("click", function () {
  $(".post-modal").css("display", "flex");

  $(".modal-background").css("display", "inline-block");
});

// @@@@@@@ 모달 영역 밖으로 클릭하면 모달 창 없애기 @@@@@@@

$(".modal-background").on("click", function () {
  $(".post-modal").css("display", "none");

  $(this).css("display", "none");
});

// @@@@@@@ 팔로우 팔로잉 버튼 @@@@@@@@@@@@

$(".follow-btn").on("click", function () {
  if ($(this).children(".follow").css("display") != "none") {
    $(this).children(".follow").css("display", "none");
    $(this).children(".following").css("display", "inline-block");
  } else {
    $(this).children(".follow").css("display", "inline-block");
    $(this).children(".following").css("display", "none");
  }
});

// @@@@@@ 헤더 카테고리 선택시 색상 변경 @@@@@@@
$(".header-list").on("click", function () {
  $(this).css("color", "rgb(42, 197, 198)");

  $(".header-list").not(this).css("color", "#5b696f");
});

// @@@@@@ 판당픽 / 추천순 / 최신순 / 무료  클릭시 색상 변경@@@@@@@
$(".choice-list").on("click", function () {
  $(this).css("color", "rgb(42, 197, 198)");

  $(".choice-list").not(this).css("color", "#5b696f");
});

// @@@@@@@@@@@ 모달 창 좋아요 버튼 누를 시 하트색 변경 @@@@@@@@@@@@@
$(".like-btn-color").on({
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

// @@@@@@@ 모달 팔로우 버튼 클릭 수정 @@@@@@@@
$(".modal-follow-btn").on("click", function () {
  if ($(this).children(".add").css("display") === "flex") {
    $(this).children(".add").css("display", "none");
    $(this).children(".done").css("display", "flex");
  } else {
    $(this).children(".add").css("display", "flex");
    $(this).children(".done").css("display", "none");
  }
});

// @@@@@ 모달 프로필 hover 시에 나오는 모달 @@@@@@
$("#profile").on("mouseover", function () {
  $(this).css("width", "100%");
  $(".profile-path").css("display", "block");
});

$(".profile-path").on("mouseleave", function () {
  $(".profile-path").css("display", "none");
});

// @@@@@ 모달 프로필 이미지 백그라운드 @@@@@
$("#modal-img-box").on({
  mouseover: function () {
    $(".modal-img-background").css("display", "block");
  },
  mouseout: function () {
    $(".modal-img-background").css("display", "none");
  },
});

//@@@@@ 모달 안에 모달 팔로우 버튼 @@@@@@
$(".profile-modal-follow-btn").on("click", function () {
  if ($(this).css("display") === "block") {
    $(this).css("display", "none");
    $(".profile-modal-following-btn").css("display", "flex");
  }

  $(".profile-modal-following-btn").on("click", function () {
    if ($(this).css("display") === "flex") {
      $(this).css("display", "none");
      $(".profile-modal-follow-btn").css("display", "block");
    }
  });
});

// @@@@@@ 댓글 수정 버튼 누를 시 @@@@@@@@@@
$(".comment-edit-btn").on("click", function () {
  $(this)
    .parent()
    .parent()
    .parent()
    .parent(".comment-list")
    .css("height", "300px");

  $(".comment-edit-box").css("display", "block");
  $(".edit-btn-box").css("display", "flex");

  // 작성 돼 있던 댓글 숨기기
  $(this)
    .parent()
    .parent()
    .siblings(".comment")
    .children(".comment-content")
    .css("display", "none");
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
