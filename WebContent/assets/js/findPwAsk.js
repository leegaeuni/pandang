let $checkPw = $("#check-pw-msg");
let $checkPw2 = $("#check-pw-msg2");
let $checkAnswer = $("#check-answer-msg");
let $pwInput = $("#password");
let $pwInput2 = $("#password2");
let $answerInput = $("#answer");

// 답변 ajax를 이용하여 일치, 불일치 판단후 답변 밑 span에 알려주기
$answerInput.on("blur", function () {
  // ajax 이용하여 답변 일치 불일치 확인
	$idInput.on('change', function() {
	
	$.ajax({
		url : '/member/findPwAskOk.me',
		type : 'post',
		data : {memberAnswer : answer},
		success : function(result) {
			$checkAnswer.text(result);
		},
		error : function(a, b, c) {
			console.log(c);
		}
	});
});
});


// 비빌번호 검사
const regex =
  /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+])[a-zA-Z\d!@#$%^&*()_+]{8,}$/;

// 비밀번호 정규식 8자 이상, 영어 숫자 특수문자 하나 이상 포함
$pwInput.on("blur", function () {
  if (regex.test($(this).val())) {
    $checkPw.text("사용 가능한 비밀번호입니다.");
    // 비밀번호 일치 검사(1차 정규식 통과한 후에만 일치 검사)
    $pwInput2.on("blur", function () {
      if ($(this).val() != $pwInput.val()) {
        $checkPw2.text("비밀번호가 일치하지 않습니다.");
      } else {
        $checkPw2.text("비밀번호가 일치합니다.");
      }
    });
  } else {
    $checkPw.html(
      "사용 불가능한 비밀번호입니다. <br>영어, 숫자, 특수문자를 포함하여 8글자 이상 작성하세요!"
    );
  }
});
