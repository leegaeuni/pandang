
let reportSnsNumber;
let reportMemberId;
function showReport(result) {
	$(".report-list").html('');
	for (let i = 0; i < result.list.length; i++) {

		$('.report-list').append(`<div class="board-list">
		          <div class="board-list-number">${result.list[i].reportNumber}</div>
					
		          <!-- 게시물 제목 클릭하면 밑에 신고 상세내용 보이게 한다. -->
		          <a href="#" class="board-list-title">${result.list[i].reportTitle}</a>
		          <div class="board-list-author">${result.list[i].memberId}</div>
		          <div class="board-list-date">${result.list[i].reportDate}</div>
		        </div>
		
		        <!-- 게시물 제목 클릭 시 신고내용이 보여진다. -->
		        <div class="report-contents-wrap">
		          <div class="report-content">
		            <p>
		              ${result.list[i].reportContent}
		            </p>
		          </div>
		          <div class="report-btn-wrap">
					<input type="hidden" class="reportSnsNumber" value="${result.list[i].reportSnsNumber}">
		            <!-- 클릭 시 해당 회원정보로 이동 -->
		            <a href="#">${result.list[i].reportedMemberId}</a>
					
		            <!-- 클릭 시 해당 게시물로 이동 -->
		            <button class="go-post-btn">게시물 보기</button>
		          </div>
		        </div>`)

	}
};

function showPagination(result) {
	$('.pagination').html('');
	$('.pagination').append(`<input class="startPage" type="hidden" name="startPage" value="${result.startPage}">`)
	$('.pagination').append(`<input class="endPage" type="hidden" name="endPage" value="${result.endPage}">`)
	if (result.prev) {
		$('.pagination').append(`<li><a href="" class="prev">&lt;</a></li>`);
	};
	for (let i = result.startPage; i < result.endPage + 1; i++) {
		if (!(i == result.page)) {
			$('.pagination').append(`<li>
	                        <a href="" class='number-btn'>
	                           ${i}
	                        </a>
	                     </li>`);
		} else {
			$('.pagination').append(`<li>
	                        <a href="#" class="active number-btn">
	                           ${i}
	                        </a>
	                     </li>`);
		}
	};

	if (result.next) {
		$('.pagination').append(`<li><a href="" class="next">&gt;</a></li>`);
	};

};

function showMember(result) {
	$('.report-list').html('');
	for (let i = 0; i < result.list.length; i++) {
		if (result.list[i].memberStatus == 1) {
			$('.report-list').append(`<div class="member-list">
				          <div class="member-list-number">${result.list[i].memberNumber}</div>
				          <div class="member-list-id">${result.list[i].memberId}</div>
				          <div class="member-list-author">${result.list[i].memberName}</div>
				          <!-- 관리자가 부여한 상태에 따라 텍스트 변환
				              ex) 활동, 정지 등 -->
				          <div class="member-list-status">활동</div>
				          <div class="member-list-control">
				            <button class="control-btn">정지</button>
				          </div>
				        </div>`);
		} else if (result.list[i].memberStatus == 2) {
			$('.report-list').append(`<div class="member-list">
				          <div class="member-list-number">${result.list[i].memberNumber}</div>
				          <div class="member-list-id">${result.list[i].memberId}</div>
				          <div class="member-list-author">${result.list[i].memberName}</div>
				          <!-- 관리자가 부여한 상태에 따라 텍스트 변환
				              ex) 활동, 정지 등 -->
				          <div class="member-list-status">정지</div>
				          <div class="member-list-control">
				            <button class="control-btn">복구</button>
				          </div>
				        </div>`);
		} else if (result.list[i].memberStatus == 3) {
			$('.report-list').append(`<div class="member-list">
				          <div class="member-list-number">${result.list[i].memberNumber}</div>
				          <div class="member-list-id">${result.list[i].memberId}</div>
				          <div class="member-list-author">${result.list[i].memberName}</div>
				          <!-- 관리자가 부여한 상태에 따라 텍스트 변환
				              ex) 활동, 정지 등 -->
				          <div class="member-list-status">탈퇴</div>
				          <div class="member-list-control">
				            <button class="control-btn">복구</button>
				          </div>
				        </div>`);
		}
	}
};

let params = {
	type: 'get',
	dataType: 'json',
	data: { page: $('.active').text().trim() },
	url: '/admin/reportSnsAjaxListOk.ad',
	success: showReport
};

let findParams = {
	type: 'get',
	dataType: 'json',
	data: {
		page: 1,
		input: $('.search-input').val().trim()
	},
	success: function(result) {
		showReport
	}
};

$(".report-list").on("click", ".board-list-title", function(e) {
	if ($(e.target).parent().next().css("display") == "none") {
		$(e.target).parent().next().css("display", "block");
	} else {
		$(e.target).parent().next().css("display", "none");
	}
});

$(".change-page-report").on('click', function() {
	$(this).css('background-color', '#1bcad3');
	$(".change-page-member").css('background-color', 'black');
	$(this).parent().next().css("display", "block");
	$('.board-contents-title').html(`<div class="board-number">번호</div>
          <div class="board-title">제목</div>
          <div class="board-author">작성자</div>
          <div class="board-date">생성일</div>`);
	$('.change-store').removeClass('click find');
	$('.change-sns').addClass('click find');
	$('.change-page-member').removeClass('find');
	$('.search-input').attr('placeholder', '검색할 제목을 입력하세요.');
	$.ajax({
		url: '/admin/reportSnsAjaxListOk.ad',
		type: 'get',
		dataType: 'json',
		data: { page: 1 },
		success: function(result) {
			showReport(result);
			showPagination(result);
		},
		error: function(a, b, c) {
			console.log(c);
		}
	});
});

$(".change-page-member").on('click', function() {
	$(this).css('background-color', '#1bcad3');
	$(".change-page-report").css('background-color', 'black');
	$(this).parent().prev().css("display", "none");
	$('.board-contents-title').html(`<div class="member-number">번호</div>
          <div class="member-id">ID</div>
          <div class="member-author">이름</div>
          <div class="member-status">회원 상태</div>
          <div class="member-control">제재</div>`);
	$('.search-input').attr('placeholder', '검색할 ID를 입력하세요.');
	$('.change-sns').removeClass('find');
	$('.change-store').removeClass('find');
	$(this).addClass('find');
	$('.board-contents-title').html(`<div class="member-number">번호</div>
          <div class="member-id">ID</div>
          <div class="member-author">이름</div>
          <div class="member-status">회원 상태</div>
          <div class="member-control">제재</div>`);
	params.url = '/admin/memberListOk.ad';
	$.ajax({
		url: '/admin/memberListOk.ad',
		type: 'get',
		data: { page: 1 },
		dataType: 'json',
		success: function(result) {
			showMember(result);
			showPagination(result);
		}
	});
});

$(".change-sns").on('click', function() {
	$('.change-sns').addClass('click find');
	$('.change-store').removeClass('click find');
	$('.change-page-member').removeClass('find');
	params.url = '/admin/reportSnsAjaxListOk.ad';
	$.ajax({
		url: '/admin/reportSnsAjaxListOk.ad',
		type: 'get',
		data: { page: 1 },
		dataType: 'json',
		success: function(result) {
			showReport(result);
			showPagination(result);
		},
		error: function(a, b, c) {
			console.log(c);
		}
	});
});



$(".change-store").on('click', function() {
	$('.change-store').addClass('click find');
	$('.change-sns').removeClass('click find');
	$('.change-page-member').removeClass('find');
	params.url = '/admin/reportStoreListOk.ad';
	$.ajax({
		url: '/admin/reportStoreListOk.ad',
		type: 'get',
		data: { page: 1 },
		dataType: 'json',
		success: function(result) {
			showReport(result);
			showPagination(result);
		},
		error: function(a, b, c) {
			console.log(c);
		}
	});
});





$('.pagination').on('click', '.number-btn', function(e) {
	e.preventDefault();
	$('.number-btn').removeClass('active');
	$(e.target).addClass('active');
	params.data = { page: $(e.target).text().trim() };
	$.ajax(params);
});

$(".pagination").on('click', '.next', function(e) {
	e.preventDefault();
	params.data = { page: Number($('.endPage').val()) + 1 };
	$.ajax({
		url: params.url,
		data: params.data,
		type: 'get',
		dataType: 'json',
		success: function(result) {
			showReport(result);
			showPagination(result);
		}
	});
});

$(".pagination").on('click', '.prev', function(e) {
	e.preventDefault();
	console.log($('.endPage').val());
	params.data = { page: Number($('.startPage').val()) - 1 };
	$.ajax({
		url: params.url,
		data: params.data,
		type: 'get',
		dataType: 'json',
		success: function(result) {
			showReport(result);
			showPagination(result);
		}
	});
});

$('.report-list').on('click', '.control-btn', function(e) {
	if ($(e.target).text() == '정지') {
		$.ajax({
			url: '/admin/memberBanOk.ad',
			type: 'get',
			data: { memberNumber: $(e.target).parent().parent().children().first().text() },
			success: function() {
				$(e.target).parent().prev().text('정지');
				$(e.target).text('복구');
			},
			error: function(a, b, c) {
				console.log(c);
			}
		});
	} else if ($(e.target).text() == '복구') {
		$.ajax({
			url: '/admin/memberRestoreOk.ad',
			type: 'get',
			data: { memberNumber: $(e.target).parent().parent().children().first().text() },
			success: function() {
				$(e.target).parent().prev().text('활동');
				$(e.target).text('정지');
			},
			error: function(a, b, c) {
				console.log(c);
			}
		});
	}
});
let findUrl = '';
$('.search-btn').on('click', function() {
	if ($('.change-page-member').hasClass('find')) {
		$.ajax({
			url: '/admin/findMemberOk.ad',
			type: 'get',
			data: { page: 1, input: $('.search-input').val().trim() },
			dataType: 'json',
			success: function(result) {
				showMember(result);
				showPagination(result);
				$('.search-input').val('');
			},
			error: function(a, b, c) {
				console.log(c);
			}
		});

	} else if ($('.change-sns').hasClass('find')) {
		$.ajax({
			url: '/admin/findSnsOk.ad',
			type: 'get',
			data: { page: 1, input: $('.search-input').val().trim() },
			dataType: 'json',
			success: function(result) {
				showReport(result);
				showPagination(result);
				$('.search-input').val('');
			},
			error: function(a, b, c) {
				console.log(c);
			}
		});

	} else if ($('.change-store').hasClass('find')) {
		$.ajax({
			url: '/admin/findStoreOk.ad',
			type: 'get',
			data: { page: 1, input: $('.search-input').val().trim() },
			dataType: 'json',
			success: function(result) {
				showReport(result);
				showPagination(result);
				$('.search-input').val('');
			},
			error: function(a, b, c) {
				console.log(c);
			}
		});

	}
});

/**
 * 
 */

let memberNumber = $('.memberNumber').val();
let memberNumberFrom = $('.memberNumberFrom').val();
let memberNumberTo = $('.memberNumberTo').val();
let hostMemberNumber = $('#hostMemberNumber').val();




// @@@@@@ 이미지 클릭 했을 때 모달 창 띄우기 @@@@@@@@@
$('.report-list').on('click', '.go-post-btn', function(e) {
	
 reportSnsNumber = $(e.target).prev().prev().val();
 reportMemberId = $(e.target).prev().text();
	

	$(".modal-box").css("display", "flex");

	$(".modal-background").css("display", "inline-block");

	

	$.ajax({
		url: '/sns/snsFileReadOk.sn',
		type: 'get',
		dataType: 'json',
		data: { snsNumber: reportSnsNumber },
		success: function(result) {
			showSnsFile(result);
		},
		error: function(a, b, c) {
			console.log(c);
		}

	});


	currentIdx = 0;
	$.ajax({
		url: '/sns/snsReadOk.sn',
		type: 'get',
		dataType: 'json',
		data: {
			snsNumber: reportSnsNumber,
			memberNumber: memberNumber,
			memberId : reportMemberId
		},
		success: function(result) {
			showSnsLikeDate(result);
			showPostContent(result);
			showSnsHost();
			$('.host-profile-img').attr('src', `/upload/${result.list.channelFileSystemName}`);
		},
		error: function(a, b, c) {
			console.log(c);
		}

	});
	
	$.ajax({
		url: '/sns/snsCommentOk.snc',
		type: 'get',
		dataType: 'json',
		data: { snsNumber: reportSnsNumber },
		success: function(result) {
			showPostComment(result);
		},
		error: function(a, b, c) {
			console.log(c);
		}

	});

});
// @@@@@@@ 모달 영역 밖으로 클릭하면 모달 창 없애기 @@@@@@@

$(".modal-background").on("click", function() {
	$(".modal-box").css("display", "none");

	$(this).css("display", "none");
});


// ajax에서 .post-part 클릭시  snsNumber가져오는 이벤트 

let snsNumber;
let storeNumber;

function showSnsHost(){
	$('.host-name').text(reportMemberId);
}

// 모달창 좋아요, 게시글 작성일 함수
function showSnsLikeDate(result) {

	$('.modal-like-date').html('');

	if (reportSnsNumber == result.list.snsNumber) {

		if (result.likeTest === "") {
			$('.modal-like-date').append(`
			<div class="like-wrap">
	
						<img class="before-like-btn"
							src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
							alt="heart" />

					
						<div class="like-cnt">${result.list.likeCnt}</div>
						개
					</div>
					<div class="post-date">${result.list.snsDate}</div>
			`);
		}
		else {

			$('.modal-like-date').append(`
			<div class="like-wrap">
					
						<img class="before-like-btn"
							src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
							alt="heart" />

						<div class="like-cnt">${result.list.likeCnt}</div>
						개
					</div>
					<div class="post-date">${result.list.snsDate}</div>
			`);

		}

	}



}


// 모달 게시글 콘텐츠 함수
function showPostContent(result) {
	$('.host-comment-content').html('');

	if (reportSnsNumber == result.list.snsNumber) {

		$('.host-comment-content').append(`
					
					
							${result.list.snsContent}
						
				`);

	}

}

// 모달 게시글 댓글 함수


function showPostComment(result) {
	$('.comment').html('');
	let text = '';
	for (let i = 0; i < result.list.length; i++) {
		if (reportSnsNumber == result.list[i].snsNumber && result.list[i].snsCommentNumber != 0) {


			text += `
				<div class="comment-wrap">
									<div class="comment-member-info-box">
										<div class="comment-member-info">
											<div class="comment-member-profile">
												 <a href="/sns/snsOk.sn?memberNumber=${result.list[i].memberNumber}" class="comment-member-img"> <img
													class="comment-profile-img"
													src="/upload/${result.list[i].channelFileSystemName}"
													alt="" />
												</a> 
											</div>
											<div class="comment-member-name-wrap">
												<a href="/sns/snsOk.sn?memberNumber=${result.list[i].memberNumber}" class="comment-member-name"> 
										
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






function showSnsFile(result) {

	$('.slide-box').html('');
	for (let i = 0; i < result.length; i++) {
		$('.slide-box').append(`
			<li>
				<img class="modal-img" src="/upload/${result[i]}"/>
			</li>
		`);
	}

	let slides = document.querySelector(".slide-box");
	let slideImg = document.querySelectorAll(".slide-box li");
	let currentIdx = 0;
	const slideCount = slideImg.length;
	const slideWidth = 600;
	const slideMargin = 100;

	//전체 슬라이드 컨테이너 넓이 설정
	slides.style.width = (slideWidth + slideMargin) * slideCount + "px";

	// 이미지 최대 개수나 최저 개수 도달시 버튼을 없애는 js
	function checkEnd() {
		if (currentIdx <= 0) {
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

		currentIdx++;
		$('.slide-box').children().css('display', 'none');
		$('.slide-box').children().eq(currentIdx).css('display', 'block');


		checkEnd();
	});

	$(".post-img-prev").on("click", function() {
		currentIdx--;
		$('.slide-box').children().css('display', 'none');
		$('.slide-box').children().eq(currentIdx).css('display', 'block');

		checkEnd();
	});




}


