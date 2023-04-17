let $prevBtn = $(".button1");
let $nextBtn = $(".button2");

let idInput = $("id");
let nameInput = $("#name");
let birthInput = $("#birth");
let phoneNumberInput = $("#phoneNumber");
/*
$nextBtn.on("click", function() {
	$.ajax({
		url: '/member/findPwOk.me',
		type: 'POST',
		data: {
			memberId: $("#id").val(),
			memberName: $("#name").val(),
        	memberBirth: $("#birth").val(),
        	memberPhoneNumber: $("#phoneNumber").val()
		},
		success: function(result) {
			console.log("비밀번호 찾기 질문/답변 페이지 이동");
		},
		error: function(a, b, c) {
			console.log(c);
		}
	});
})
*/