// 모달 창 여는 js
let storePhoto = document.querySelectorAll(".post-info");
let modalBox = document.querySelector(".modal-box");

for (let i = 0; i < storePhoto.length; i++) {
  storePhoto[i].addEventListener("click", function () {
    modalBox.style.display = "flex";
    console.log(storePhoto);

    // 모달 팔로우 버튼 js
    const button = document.querySelector(".fallow-button2");
    button.addEventListener("click", function () {
      if (button.innerText === "팔로우+") {
        button.innerText = "팔로우 중✔";
      } else {
        button.innerText = "팔로우+";
      }
    });
  });
}

// 모달 좋아요 버튼 js
let likeButtons = document.querySelectorAll(".like");

likeButtons.forEach(function (btn) {
  btn.addEventListener("click", function () {
    if (btn.innerText === "♡") {
      btn.innerText = "♥";
    } else {
      btn.innerText = "♡";
    }
  });
});

// 모달 좋아요 버튼 js
let likeButtons2 = document.querySelectorAll(".like2");

likeButtons2.forEach(function (btn) {
  btn.addEventListener("click", function () {
    if (btn.innerText === "♡") {
      btn.innerText = "♥";
    } else {
      btn.innerText = "♡";
    }
  });
});

// 모달 창 닫는 js
modalBox.addEventListener("click", function (e) {
  if (e.target.tagName == "ARTICLE") {
    modalBox.style.display = "none";
  }
});

// Store_main.html에 게시물 클릭시 모달창 여는 js
var sale = document.getElementById("sale");
post.addEventListener("click", function (event) {
  if (event.target.classList.contains("sale-info")) {
    modalBox.style.display = "flex";
    console.log(storePhoto);
  }
});

// Store_main.html을 'post' 클래스에 부분적으로 불러오는 ajax
function changeContent() {
  var xhr = new XMLHttpRequest();

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      if (xhr.status === 200) {
        document.getElementById("post").innerHTML = xhr.responseText;
      } else {
        alert("데이터를 로드하는데 실패했습니다.");
      }
    }
  };
  xhr.open("GET", "Store_main.html", true);
  xhr.send();
  $(document).ready(function () {
    var currentIndex = 0;

    // Store_main.html 게시물 다음 버튼 js
    $(".next").click(function () {
      var listLength = $(".list-box li").length;
      if (currentIndex < listLength - 1) {
        currentIndex++;
        $(".list-box li").hide();
        $(".list-box li:eq(" + currentIndex + ")").show();
      }
    });

    // Store_main.html 게시물 이전 버튼 js
    $(".prev").click(function () {
      if (currentIndex > 0) {
        currentIndex--;
        $(".list-box li").hide();
        $(".list-box li:eq(" + currentIndex + ")").show();
      }
    });

    // 모달창 안 이미지 슬라이드 js
    let $slideBox = $(".slide-box");
    let $modalImg = $(".modal-img");
    let currentIdx = 0;
    let slideWidth = 771;
    let slideCnt = $modalImg.length;

    checkEnd();

    $(".next2").on("click", function () {
      currentIdx++;
      console.log("currentIdx : " + currentIdx);
      $slideBox.css("left", -(currentIdx * slideWidth));
      checkEnd();
    });

    $(".prev2").on("click", function () {
      console.log("currentIdx : " + currentIdx);
      currentIdx--;
      $slideBox.css("left", -(currentIdx * slideWidth));
      checkEnd();
    });

    // 이미지 최대 개수나 최저 개수 도달시 버튼을 없애는 js
    function checkEnd() {
      if (currentIdx <= 0) {
        $(".prev2").css("display", "none");
      } else {
        $(".prev2").css("display", "block");
      }

      if (currentIdx >= slideCnt - 1) {
        $(".next2").css("display", "none");
      } else {
        $(".next2").css("display", "block");
      }
    }
  });
}

// SNS_mian.html 게시물 버튼 js
$(document).on("click", ".post", function () {
  if ($(this).hasClass("post")) {
  }
});

$(document).ready(function () {
  var currentIndex = 0;

  // 다음
  $(".next").click(function () {
    var listLength = $(".list-box li").length;
    if (currentIndex < listLength - 1) {
      currentIndex++;
      $(".list-box li").hide();
      $(".list-box li:eq(" + currentIndex + ")").show();
    }
  });

  // 이전
  $(".prev").click(function () {
    if (currentIndex > 0) {
      currentIndex--;
      $(".list-box li").hide();
      $(".list-box li:eq(" + currentIndex + ")").show();
    }
  });
});

// SNS_mian.html 모달창 이미지 슬라이드 버튼 js
let $slideBox = $(".slide-box");
let $modalImg = $(".modal-img");
let currentIdx = 0;
let slideWidth = 771;
let slideCnt = $modalImg.length;
var containerWidth = document.querySelector(".slide-box").clientWidth;

checkEnd();

$(".next2").on("click", function () {
  currentIdx++;
  console.log("currentIdx : " + currentIdx);
  $slideBox.css("left", -(currentIdx * slideWidth));
  checkEnd();
});

$(".prev2").on("click", function () {
  console.log("currentIdx : " + currentIdx);
  currentIdx--;
  $slideBox.css("left", -(currentIdx * slideWidth));
  checkEnd();
});

function checkEnd() {
  if (currentIdx <= 0) {
    $(".prev2").css("display", "none");
  } else {
    $(".prev2").css("display", "block");
  }

  if (currentIdx >= slideCnt - 1) {
    $(".next2").css("display", "none");
  } else {
    $(".next2").css("display", "block");
  }
}

// 메인 페이지 팔로우 버튼 js
const button = document.querySelector(".fallow-button");

button.addEventListener("click", function () {
  if (button.innerText === "팔로우+") {
    button.innerText = "팔로우 중✔";
  } else {
    button.innerText = "팔로우+";
  }
});
