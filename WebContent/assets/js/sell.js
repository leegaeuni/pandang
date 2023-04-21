

// 택배사 드롭다운 클릭시 자동 입력됨
/*
	onchange="selectPost(this)" >> 함수의 매개변수를 this로 넘겼기 때문에 ele가 this다.
	this는 html의 <select>자기 자신.
*/
function selectPost(ele) {
	let $ele = $(ele);
	let $buyPost = $ele.closest('.buy-post');

	console.log($ele);
	// '1'인 경우 직접입력
	if ($ele.val() == "1") {
		$buyPost.find('#post-select').attr("readonly", false);
		$buyPost.find('#post-select').val("");
	} else {
		$buyPost.find('#post-select').attr("readonly", true);
		$buyPost.find('#post-select').val($ele.val());
	}
}

// 회원아이디 클릭시 회원 정보가 보여진다
$(".member-id").on("click", function() {
	let memberList = $(this).closest('.board-list').next();
	if (memberList.css("display") == "none") {
		memberList.css("display", "block");
	} else {
		memberList.css("display", "none");
	}
});

// 확인 버튼 클릭시 SellOkController로 req를 보낸다.
$('.post-ok>button').on('click', function() {
	let $boardList = $(this).closest('.board-list');
	let buyNumber = $boardList.find('.buy-number').text();
	let buyPost = $boardList.find('#post-select').val();
	let buyPostCode = $boardList.find('.buy-post-code > input').val();

	console.log(buyNumber);
	console.log(buyPost);
	console.log(buyPostCode);

	$.ajax({
		url: '/buy/sellOk.bu',
		type: 'get',
		data: {
			buyNumber: buyNumber,
			buyPost: buyPost,
			buyPostCode: buyPostCode
		},
		success: function() {
			// data 요청을 보낸 후 input값 초기화.
			$boardList.$("#post-select").val("");
			$boardList.$(".buy-post-code > input").val("");
		}
	});
});
