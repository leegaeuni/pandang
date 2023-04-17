/**
 * 
 */

// @@@@@@ 이미지 클릭 했을 때 모달 창 띄우기 @@@@@@@@@
$('.snsList').on('click', $('.post-part') ,function(){
	if($('#store').css('color') ==  'rgb(42, 197, 198)'){
		 $(".s-post-modal").css("display", "flex");

  		$(".s-modal-background").css("display", "inline-block");
	} else {
		$(".modal-box").css("display", "flex");

		$(".modal-background").css("display", "inline-block");
	}
});
// @@@@@@@ 모달 영역 밖으로 클릭하면 모달 창 없애기 @@@@@@@

$(".modal-background").on("click", function() {
	$(".modal-box").css("display", "none");

	$(this).css("display", "none");
});

$('.s-modal-background').on('click', function(){
	$('.s-post-modal').css('display', 'none');
	$(this).css('display', 'none');
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

// @@@@@@ 좋아요 @@@@@@@@

$(".modal-like-date").on("click", '.before-like-btn' ,function() {	
	if (
		$(this).attr("src") ===
		"https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
	) {
		$(this).attr(
			"src",
			"https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
		);

		$.ajax({
			url: '/sns/snsLikeOk.sn',
			data: {
				snsNumber: snsNumber,
				memberNumber: memberNumber
			},
			success: function() {
				$.ajax({
					url: '/sns/snsReadOk.sn',
					type: 'get',
					dataType: 'json',
					data: { snsPostNumber: snsPostNumber },
					success: function(result) {
						showSnsLikeDate(result);
					},
					error: function(a, b, c) {
						console.log(c);
					}

				});

			}
		});


	} else {
		$(this).attr(
			"src",
			"https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
		);

		$.ajax({
			url: '/sns/snsLikeDeleteOk.sn',
			data: {
				snsNumber: snsNumber,
				memberNumber: memberNumber
			},
			success: function() {
				$.ajax({
					url: '/sns/snsReadOk.sn',
					type: 'get',
					dataType: 'json',
					data: { snsPostNumber: snsPostNumber },
					success: function(result) {
						showSnsLikeDate(result);
					},
					error: function(a, b, c) {
						console.log(c);
					}

				});

			}
		});

	}
});

let memberNumberFrom = $('.memberNumberFrom').val();
let memberNumberTo = $('.memberNumberTo').val();

// @@@@@@@ 모달 팔로우 버튼 클릭 수정 @@@@@@@@
$(".modal-follow-btn").on("click", function() {
	console.log($('.memberNumberFrom').val());
	console.log($('.memberNumberTo').val());
	
	
	
	if ($(this).children(".add").css("display") === "block") {
		$(this).children(".add").css("display", "none");
		$(this).children(".done").css("display", "block");
		
		$.ajax({
		url: '/sns/snsFollowOk.sn',
		type: 'get',
		data: { 
				memberNumberFrom : memberNumberFrom,
				memberNumberTo : memberNumberTo
				 },
		success: function() {
			console.log('gegege');
		},
		error: function(a, b, c) {
			console.log(c);
		}

		});
		
	} else {
		$(this).children(".add").css("display", "block");
		$(this).children(".done").css("display", "none");
		
		$.ajax({
		url: '/sns/snsFollowDeleteOk.sn',
		type: 'get',
		data: { 
				memberNumberFrom : memberNumberFrom,
				memberNumberTo : memberNumberTo
				 },
		success: function() {
			console.log('~~~~');
		},
		error: function(a, b, c) {
			console.log(c);
		}

		});
	}
});



// @@@@ 팔로우 버튼 
$(".follow-btn-box").on("click", function() {
	if ($(this).children(".follow-btn").css("display") === "block") {
		$(this).children(".follow-btn").css("display", "none");
		$(this).children(".following-btn").css("display", "block");
		
		$.ajax({
		url: '/sns/snsFollowOk.sn',
		type: 'get',
		data: { 
				memberNumberFrom : memberNumberFrom,
				memberNumberTo : memberNumberTo
				 },
		success: function() {
			console.log('gegege');
		},
		error: function(a, b, c) {
			console.log(c);
		}

		});
		
	} else {
		$(this).children(".follow-btn").css("display", "block");
		$(this).children(".following-btn").css("display", "none");
		
		$.ajax({
		url: '/sns/snsFollowDeleteOk.sn',
		type: 'get',
		data: { 
				memberNumberFrom : memberNumberFrom,
				memberNumberTo : memberNumberTo
				 },
		success: function() {
			console.log('~~~~');
		},
		error: function(a, b, c) {
			console.log(c);
		}

		});
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
				$('.snsList').append(`
				</div>
			`);
			}

		}
	}

}

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
let snsNumber;

$('.snsList').on('click', '.post-part', function() {
	snsPostNumber = $(this).children('.snsNumber').val();
	snsNumber = $(this).children('.snsNumber').val();

	console.log(snsPostNumber);
	console.log(snsNumber);
});



// 모달창 좋아요, 게시글 작성일 함수
function showSnsLikeDate(result) {

	$('.modal-like-date').html('');
	for (let i = 0; i < result.list.length; i++) {
		if (snsPostNumber == result.list[i].snsNumber) {

			$('.modal-like-date').append(`
			<div class="like-wrap">
						<img class="before-like-btn"
							src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
							alt="heart" />

					
						<div class="like-cnt">${result.list[i].likeCnt}</div>
						개
					</div>
					<div class="post-date">${result.list[i].snsDate}</div>
			`);
		}


	}
}

// 모달 게시글 작성자 함수
function showPostHost(result) {
	$('.host-name-box').html('');

	for (let i = 0; i < result.list.length; i++) {
		if (snsPostNumber == result.list[i].snsNumber) {
			$('.host-name-box').append(`
					<span class="host-name"> 
					 ${result.list[i].channelName}
					</span>
	`);
		}
	}
}

// 모달 게시글 콘텐츠 함수
function showPostContent(result) {
	$('.host-comment-content').html('');
	for (let i = 0; i < result.list.length; i++) {
		if (snsPostNumber == result.list[i].snsNumber) {

			$('.host-comment-content').append(`
					
					
							${result.list[i].snsContent}
						
				`);

		}
	}
}

// 모달 게시글 댓글 함수


function showPostComment(result) {
	$('.comment').html('');
	let text = '';
	for (let i = 0; i < result.list.length; i++) {
		if (snsPostNumber == result.list[i].snsNumber && result.list[i].snsCommentNumber != 0) {

			/*$('.comment').append(`
								<div class="comment-wrap">
									<div class="comment-member-info-box">
										<div class="comment-member-info">
											<div class="comment-member-profile">
												 <a href="#" class="comment-member-img"> <img
													class="comment-profile-img"
													src="/assets/img/SNSPage/01.jpeg"
													alt="" />
												</a> 
											</div>
											<div class="comment-member-name-wrap">
												<a href="" class="comment-member-name"> 
										
												${result.list[i].channelName}
						
												</a>
											</div>
										</div>
										<div class="comment-option">
											<button class="comment-edit" type="button">수정</button>
											<button class="comment-delete" type="button">삭제</button>
										</div>
									</div>



									<div class="comment-content-wrap">
										<span class="comment-content"> 
										${result.list[i].snsCommentContent}
										</span>
									</div>
									<div class="comment-date">
										<span> 
										${result.list[i].snsCommentDate}
										</span>
									</div>
									</div>
			
				`);*/
			text += `
				<div class="comment-wrap">
									<div class="comment-member-info-box">
										<div class="comment-member-info">
											<div class="comment-member-profile">
												 <a href="#" class="comment-member-img"> <img
													class="comment-profile-img"
													src="/assets/img/SNSPage/01.jpeg"
													alt="" />
												</a> 
											</div>
											<div class="comment-member-name-wrap">
												<a href="" class="comment-member-name"> 
										
												${result.list[i].channelName}
						
												</a>
											</div>
										</div>
				
				`
			if (memberNumber == result.list[i].memberNumber) {
				text += `
					<div class="comment-option">
						<button class="comment-edit" type="button" data-number="${result.list[i].snsCommentNumber}">수정</button>
						<button class="comment-delete" type="button" data-number="${result.list[i].snsCommentNumber}">삭제</button>
					</div>
					
					<div class="comment-edit-option">
						<button class="comment-modify" type="button" data-number="${result.list[i].snsCommentNumber}">수정 완료 </button>
					</div>
					`

			}

			text += `
				</div>



									<div class="comment-content-wrap">
										<span class="comment-content"> 
										${result.list[i].snsCommentContent}
										</span>
									</div>
									<div class="comment-date">
										<span> 
										${result.list[i].snsCommentDate}
										</span>
									</div>
									</div>
				`;



		}
	}
	$('.comment').html(text);

}




$('.snsList').on('click', function() {

	$.ajax({
		url: '/sns/snsReadOk.sn',
		type: 'get',
		dataType: 'json',
		data: { snsPostNumber: snsPostNumber },
		success: function(result) {
			showSnsLikeDate(result);
			showPostHost(result);
			showPostContent(result);
		},
		error: function(a, b, c) {
			console.log(c);
		}

	});
});

// 댓글 url 변경 


$('.snsList').on('click', function() {

	$.ajax({
		url: '/sns/snsCommentOk.snc',
		type: 'get',
		dataType: 'json',
		data: { snsNumber: snsNumber },
		success: function(result) {
			showPostComment(result);
		},
		error: function(a, b, c) {
			console.log(c);
		}

	});
});

// 댓글 작성 

let memberNumber = $('.memberNumber').val();

$('.submit').on('click', function() {
	console.log('@@@@@@@@@');
	console.log($('#commentContent').val());
	console.log($('.memberNumber').val());

	$.ajax({

		url: "/sns/snsCommentInsertOk.snc",
		type: "get",
		data: {
			snsNumber: snsNumber,
			memberNumber: memberNumber,
			snsCommentContent: $('#commentContent').val()
		},
		success: function() {
			$('#commentContent').val('');
			$.ajax({
				url: '/sns/snsCommentOk.snc',
				type: 'get',
				dataType: 'json',
				data: { snsNumber: snsNumber },
				success: function(result) {
					showPostComment(result);
				},
				error: function(a, b, c) {
					console.log(c);
				}

			});
		},
		error: function(a, b, c) {
			console.log(c);
		}

	});

});

// 댓글 삭제 
$('.comment').on('click', '.comment-delete', function() {

	let snsCommentNumber = $(this).data('number');

	$.ajax({
		url: "/sns/snsCommentDeleteOk.snc",
		type: 'get',
		data: { snsCommentNumber: snsCommentNumber },
		success: function() {
			// 댓글 갱신
			$.ajax({
				url: '/sns/snsCommentOk.snc',
				type: 'get',
				dataType: 'json',
				data: { snsNumber: snsNumber },
				success: function(result) {
					showPostComment(result);
				},
				error: function(a, b, c) {
					console.log(c);
				}

			});

			console.log('success!!');
		}
	});
});

// 댓글 수정
$('.comment').on('click', '.comment-edit', function() {


	let $parent = $(this).closest('.comment-wrap');
	console.log($parent);

	let $children = $parent.find('.comment-option, .comment-edit-option');
	console.log($children);

	$children.eq(0).hide();
	$children.eq(1).show();

	let $content = $(this).parent().parent().next().children();
	console.log($content);

	$content.replaceWith(`<textarea class='modify-content'> </textarea>`);

});


// 댓글 수정 완료 처리
$('.comment').on('click', '.comment-modify', function() {
	let snsCommentNumber = $(this).data('number');
	console.log($('.modify-content').val());

	$.ajax({
		url: '/sns/snsCommentUpdateOk.snc',
		type: 'get',
		data: {
			snsCommentNumber: snsCommentNumber,
			snsCommentContent: $('.modify-content').val()
		},
		success: function() {
			$.ajax({
				url: '/sns/snsCommentOk.snc',
				type: 'get',
				dataType: 'json',
				data: { snsNumber: snsNumber },
				success: function(result) {
					showPostComment(result);
				},
				error: function(a, b, c) {
					console.log(c);
				}

			});
		}
	});
});

// 게시글 삭제
$('.modal-delete-btn-box').on('click', function() {
	
	$(".modal-box").css("display", "none");
	
	$.ajax({
		url: '/sns/snsPostDeleteOk.sn',
		type: 'get',
		data: { snsNumber: snsNumber },
		success: function() {
			$.ajax({
				url: '/sns/snsListOk.sn',
				data: { page: thisPage },
				success: function(result) {
					showSnsList(result);
					thisPage = result.page;
					console.log(thisPage);
				}
			});

			
		},
		error: function(a, b, c) {
			console.log(c);
		}

	});

});


$('#store').on('click',function(){
	$(this).css('color', ' rgb(42, 197, 198)');
	$('#post-btn').css('color', '#5b696f');
	
	
	$.ajax({
		url: "/sns/snsStoreListOk.sn",
		type : 'get',
		data : {page : thisPage},
		success : function(result){
			console.log('!!!!!!');
			showStoreList(result);
		}
		
	});
	
});

$('#post-btn').on('click', function(){
	$(this).css('color', ' rgb(42, 197, 198)');
	$('#store').css('color', '#5b696f');
	$.ajax({
		url:'/sns/snsListOk.sn',
		type: 'get',
		data:  {page : thisPage},
		success : function(result){
			showSnsList(result);
		}
		
	});
});

function showStoreList(result){
	$(".snsList").html('');
	for (let i = 0; i < result.list.length; i++) {



		if (result.list[i].storeNumber == 0) {
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
								<input class="storeNumber" type="hidden"
									value="${result.list[i].storeNumber}"> 
									<img class="post-image" src="/assets/img/SNSPage/03.jpg" />
								<div class="post-info">
									<div class="post-name-box">
										<span class="post-name"> 
										${result.list[i].storeTitle}
										</span>
									</div>
									<div class="date-like-wrap">
										<div class="post-date-box">
											<span class="post-date"> 
											${result.list[i].storeDate}
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
												${result.list[i].storeViewCnt}
											</span>
										</div>
									</div>
								</div>
							</div>

		`);


			if (i % 3 == 2) {
				$('.snsList').append(`
				</div>
			`);
			}

		}
	}

}




