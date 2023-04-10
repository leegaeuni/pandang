let storePhoto = document.querySelectorAll(".store-photo-img");
let modalBox = document.querySelector(".modal-box");
// let profilFollowBtn = document.querySelectorAll(".profil-follow-btn");

// @@@@@모달 창 띄우기
for (let i = 0; i < storePhoto.length; i++) {
  storePhoto[i].addEventListener("click", function () {
	let storeNumber = $(this).data('storenumber');
	
	console.log(storeNumber);
    modalBox.style.display = "flex";
    console.log(storePhoto);

/*	$.ajax({
		url : '/',
		type : 'get',
		data : {storeNumber : storeNumber},
		success : function(result){
		}	
	});
	*/
  });
}

modalBox.addEventListener("click", function (e) {
  if (e.target.tagName == "ARTICLE") {
    this.style.display = "none";
  }
});

// @@@@@ 호버 안의 like-btn 하트 회색 -> 빨간색
$(".before-like-btn").on("click", function (e) {
  let $target = $(this);
  //  $(this)는 before-like-btn을 받음
  let src;
  $target.toggleClass("active");
  // .toggleClass()로 선택한 요소에 클래스(Class) 값을 넣었다 뺐다 할 수 있음
  // target에 active이벤트 넣어줌
  if ($target.hasClass("active")) {
    // console.log("!!!!");
    src = "https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png";
  } else {
    src = "https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png";
  }

  toggleImg($target, src);
  e.stopPropagation();
  // e.stopPropagation 는 상위 엘리먼트들로의 이벤트 전파를 중단시킴 여기서는 클릭이벤트
});

function toggleImg(target, src) {
  target.prop("src", src);
  // javascript / jquery를 통해 수정 된 요소의 값을 가져 오는 데 prop()를 사용

  target
    .closest(".store-photo")
    // .closest()는 주어진 CSS 선택자와 일치하는 요소를 찾을 때까지, 자기 자신을 포함해 위쪽(부모 방향, 문서 루트까지)으로 문서 트리를 순회
    // .find(".cnt-like-icon")
    .find(".before-like-btn")
    // find 함수는 배열의 요소를 순차적으로 순회하면서 조건에 일치하는 요소의 값을 즉시 반환. 조건을 일치하는 경우가 없다면, undefined를 반환
    .prop("src", src);
}

// @@@@@핫크리에이터의 profil-follow-btn 누르면 민트색으로 변경
$(".profil-follow-btn").on("click", function () {
  if (
    $(this).children().children("span").css("color") == "rgb(124, 132, 132)"
  ) {
    $(this).children().children("span").css("color", "rgb(42, 197, 198)");
  } else {
    $(this).children().children("span").css("color", "rgb(124, 132, 132)");
  }
});

// 위의 profil-follow-btn와 동일한 작동원리의 코드임
// $(".profil-follow-btn").on("click", function () {
//   if ($(this).children().children("span").css("color") != "rgb(42, 197, 198)") {
//     $(this).children().children("span").css("color", "rgb(42, 197, 198)");
//   } else {
//     $(this).children().children("span").css("color", "rgb(124, 132, 132)");
//   }
// });

// @@@@@스토어의 탭 전환
const tabs = document.querySelectorAll("[data-tab-target]");
const tabcon = document.querySelectorAll("[data-tab-content]");

tabs.forEach((tab) => {
  tab.addEventListener("click", () => {
    const target = document.querySelector(tab.dataset.tabTarget);
    tabcon.forEach((tabc_all) => {
      tabc_all.classList.remove("active");
    });
    target.classList.add("active");
  });
});

// 탭 전환시 민트색으로 색상 변경
$(".tab").on("click", function () {
  $(this).css("color", "rgb(42, 197, 198)");
  $(".tab").not(this).css("color", "rgb(78, 84, 84)");
});

// @@@@@핫크리에이터 슬라이드
let $slideBox = $(".slide-box");
let $slideImg = $(".slide-img");

// 슬라이드 이미지 인덱스번호
let currentIdx = 0;
// 슬라이드 박스 너비
let slideWidth = 1320;
//  총 슬라이드 이미지 수
let slideCnt = $slideImg.length;

checkEnd();

// .next, .prev 버튼 누르면 이동하는 코드
$(".next").on("click", function () {
  // console.log("next!!");
  $slideBox.css("transition", "0.5s ease");

  currentIdx++;
  // console.log("currentIdx : " + currentIdx);
  $slideBox.css("left", -(currentIdx * slideWidth));
  checkEnd();
});

$(".prev").on("click", function () {
  // console.log("prev!!");
  $slideBox.css("transition", "0.5s ease");

  currentIdx--;
  // console.log("currentIdx : " + currentIdx);
  $slideBox.css("left", -(currentIdx * slideWidth));
  checkEnd();
});

// css의 .slide-box{}에 left: 0;, top: 0; 꼭 넣어주기

function checkEnd() {
  if (currentIdx <= 0) {
    $(".prev").css("display", "none");
  } else {
    $(".prev").css("display", "block");
  }
  if (currentIdx >= slideCnt - 1) {
    $(".next").css("display", "none");
  } else {
    $(".next").css("display", "block");
  }
}