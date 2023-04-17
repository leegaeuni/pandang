let $prevBtn = $(".button1");
let $nextBtn = $(".button2");

let nameInput = $("#name");
let birthInput = $("#birth");
let phoneNumberInput = $("#phoneNumber");

let checkIdMsg = $(".id-msg");

// 이름, 생년월일, 전화번호 input에 정보입력.
// '다음' 버튼 클릭하면 3개의 값이 DB의 회원정보와 일치하는지 확인.
// 일치하면 .id-msg에 "아이디는 {memberId} 입니다."라는 텍스트 표시.
// 일치하지 않으면 "입력하신 정보와 일치하는 회원이 없습니다."라는 텍스트 표시.


$nextBtn.on("click", function() {
	
	$.ajax({
	  url: '/member/findIdOk.me',
      type: 'POST',
      data: {
        memberName: $("#name").val(),
        memberBirth: $("#birth").val(),
        memberPhoneNumber: $("#phoneNumber").val()
      },
      success: function(result) {
		console.log("abd");
        $(".id-msg").text("아이디는 " + result + "입니다.");
		// 아이디찾기 성공 후 '로그인'/'비밀번호찾기' 버튼을 누르면 해당 url에 memberId 추가
		$(".login-btn").attr("href", "/member/login.me?memberId=" + result);
		$(".changePw-btn").attr("href", "/member/findPw.me?memberId=" + result);
		},
		error: function(a, b, c) {
			console.log(c);
		}

	});
});
