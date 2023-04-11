/**
 * 
 */

// @@@@@@ 이미지 클릭 했을 때 모달 창 띄우기 @@@@@@@@@
$(".snsList").on("click", $('.post-part'), function() {
	$(".modal-box").css("display", "flex");

	$(".modal-background").css("display", "inline-block");
});

// @@@@@@@ 모달 영역 밖으로 클릭하면 모달 창 없애기 @@@@@@@

$(".modal-background").on("click", function() {
	$(".modal-box").css("display", "none");

	$(this).css("display", "none");
});

// @@@@@@@ 모달 신고하기 버튼 누를 시 @@@@@@@@
$(".modal-report-btn").on("click", function() {
	$(".report-path").css("display", "block");

	// 재클릭시 안보이게하기
	if ($(this).data("clicked")) {
		$(".report-path").css("display", "none");
	}
});

// @@@@@@@ 신고하기 버튼 클릭시 색 @@@@@@
$(".report-btn-color").on({
	mouseover: function() {
		$(this).css("color", "rgb(255, 0, 0)");
	},
	mouseout: function() {
		if ($(this).data("clicked") !== true) {
			$(this).css("color", "rgb(0, 0, 0)");
		}
	},
	click: function() {
		if ($(this).data("clicked") !== true) {
			$(this).css("color", "rgb(255, 0, 0)").data("clicked", true);
		} else {
			$(this).css("color", "rgb(0, 0, 0)").data("clicked", false);
		}
	},
});

// @@@@@@ 좋아요 색 변경 테스트 !@@@@@@@@

$(".before-like-btn").on("click", function() {
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
$(".modal-follow-btn").on("click", function() {
	if ($(this).children(".add").css("display") === "block") {
		$(this).children(".add").css("display", "none");
		$(this).children(".done").css("display", "block");
	} else {
		$(this).children(".add").css("display", "block");
		$(this).children(".done").css("display", "none");
	}
});



// @@@@ 팔로우 버튼 
$(".follow-btn-box").on("click", function() {
	if ($(this).children(".follow-btn").css("display") === "block") {
		$(this).children(".follow-btn").css("display", "none");
		$(this).children(".following-btn").css("display", "block");
	} else {
		$(this).children(".follow-btn").css("display", "block");
		$(this).children(".following-btn").css("display", "none");
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

prev.addEventListener("click", function() {
	console.log("!@@@@@@@@@");

	if (currentIdx !== 0) moveSlide(currentIdx - 1);
});

next.addEventListener("click", function() {
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

$(".post-img-next").on("click", function() {
	console.log("currentIdx : " + currentIdx);
	checkEnd();
});

$(".post-img-prev").on("click", function() {
	console.log("currentIdx : " + currentIdx);
	checkEnd();
});








console.log($('.memberNumber').val());

let $commentMemberNubmer = $('.commentMemberNumber');
let $commentMemberName = $('.comment-member-name');



let memberNumber = $('.commentMemberNumber').val();
console.log(memberNumber);


$commentMemberName.on('click', () => {
	window.location.href = '/sns/snsOk.sn?memberNumber=' + memberNumber;
});


let snsNumber = $('.snsNumber').val();



// @@@@@@@@@@@@@ SnsList Ajax@@@@@@@@@@@@@@@@
function showSnsList(result) {
	$(".snsList").html('');
	for (let i = 0; i < result.list.length; i++) {



		if (result.list[i].snsNumber == 0) {
			$('.snsList').html(`<div>
									<h1>아직 등록된 게시글이 없습니다!</h1>
								</div>`
			);
		} else {

			if (i % 3 == 0) {
				$('.snsList').append(`	<div class="post-section">`)
			}

			$('.snsList').append(`
		
							
							
							<div class="post-part">
								<input class="snsNumber" type="hidden"
									value="${result.list[i].snsNumber}"> 
									<img class="post-image" src="/assets/img/SNSPage/03.jpg" />
								<div class="post-info">
									<div class="post-name-box">
										<span class="post-name"> 
										${result.list[i].snsTitle}
										</span>
									</div>
									<div class="date-like-wrap">
										<div class="post-date-box">
											<span class="post-date"> 
											${result.list[i].snsDate}
											</span>
										</div>
										<div class="post-like-cnt-box">
											<span class="heart">♥</span> <span class="like-cnt"> 
											${result.list[i].likeCnt}
											</span>
										</div>
										<div class="post-view-cnt-box">
											<span class="material-symbols-outlined"> visibility </span> <span
												class="view-cnt"> 
												${result.list[i].snsViewCnt}
											</span>
										</div>
									</div>
								</div>
							</div>

		`);


			if (i % 3 == 2) {
				$('snsList').append(`
				</div>
			`);
			}

		}
	}

}

/*$.ajax({
	url: '/sns/snsListOk.sn',
	type: 'get',
	dataType: 'json',
	data: {page: 1},
	success: function(result){
		showSnsList(result);
		thisPage = result.page;
	},
	error: function(a, b, c){
		console.log(c);
	}
	
});*/

let thisPage = 1;
let realEndPage = $('.realEndPage').val();


$('.next').on('click', function() {
	console.log('!!!!2343241342423!');

	if (thisPage != realEndPage) {


		$.ajax({
			url: '/sns/snsListOk.sn',
			data: { page: thisPage + 1 },
			success: function(result) {
				showSnsList(result);
				thisPage = result.page;
				console.log(thisPage);
			}
		});

	}

});



$('.prev').on('click', function() {
	console.log('!!!!!');

	if (thisPage != 1) {

		$.ajax({
			url: '/sns/snsListOk.sn',
			data: { page: thisPage - 1 },
			success: function(result) {
				showSnsList(result);
				thisPage = result.page;
				console.log(thisPage);
			}
		});

	}

});

// @@@@@@@@@@@@@ SnsList Ajax 끝 @@@@@@@@@@@@@@@@

// ajax에서 .post-part 클릭시  snsNumber가져오는 이벤트 

let snsPostNumber;

$('.snsList').on('click', '.post-part', function() {
	snsPostNumber = $(this).children('.snsNumber').val();
	console.log(snsPostNumber);
});




function showSnsPost(result) {
	$('.modal-like-date').html('');
	for (let i = 0; i < result.list.length; i++) {
		if (snsPostNumber == result.list[i].snsNumber) {

			$('.modal-like-date').append(`
			<div class="like-wrap">
						<img class="before-like-btn"
							src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
							alt="heart" />
	

						<!-- 임시 좋아요 수 -->
						<div class="like-cnt">${result.list[i].likeCnt}</div>
						개
						
					</div>
					
					<div class="post-date">${result.list[i].snsDate}</div>
				</div>
			`);


		}

		
	}
	}





$('.snsList').on('click', function() {
	console.log('gegegeg');

	$.ajax({
		url: '/sns/snsReadOk.sn',
		type: 'get',
		dataType: 'json',
		data: { snsPostNumber: snsPostNumber },
		success: function(result) {
			showSnsPost(result);
		},
		error: function(a, b, c) {
			console.log(c);
		}

	});
});
