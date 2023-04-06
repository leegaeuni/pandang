// 주소 api
window.onload = function () {
  document.getElementById("zoneCode").addEventListener("click", function () {
    //우편번호 입력칸을 클릭하면
    //카카오 지도 발생
    new daum.Postcode({
      oncomplete: function (data) {
        //선택시 입력값 세팅
        document.getElementById("zoneCode").value = data.zonecode; //우편번호 넣기
        document.getElementById("address").value = data.address; // 주소 넣기
        document.querySelector("input[name=addressDetail]").focus(); //상세입력 포커싱
      },
    }).open();
  });
};

// 주소입력창에 주소를 입력하면 입력창 사라지게 만들기. @@@@@@@@@@@@@@@@@@@@@

let $checkId = $("#check-id-msg");
let $checkPw = $("#check-pw-msg");
let $checkPw2 = $("#check-pw-msg2");
let $checkNickname = $("#check-nickname-msg");

let $idInput = $("#id");
let $pwInput = $("#password");
let $pwInput2 = $("#password2");
let $nicknameInput = $("#nickname");

let $prevBtn = $(".button1");

// 아이디 검사
$idInput.on("blur", function () {
  if ($(this).val() == "") {
    $checkId.text("아이디를 입력하세요.");
  }
});

// 아이디 중복 체크
$idInput.on('change', function() {
	let id = $idInput.val();
	
	$.ajax({
		url : '/member/checkIdOk.me',
		type : 'get',
		data : {memberId : id},
		success : function(result) {
			$checkId.text(result);
		},
		error : function(a, b, c) {
			console.log(c);
		}
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

// 비밀번호 일치 검사(정규식 통과 시에만 일치 검사 하도록 if문 안으로 이동시킴)
// $pwInput2.on("blur", function () {
//   if ($(this).val() != $pwInput.val()) {
//     $checkPw2.text("비밀번호가 일치하지 않습니다.");
//   } else {
//     $checkPw2.text("비밀번호가 일치합니다.");
//   }
// });

// 닉네임 검사
$nicknameInput.on("blur", function () {
  if ($(this).val() == "") {
    $checkNickname.text("닉네임을 입력하세요.");
  }
});

// 닉네임 중복 검사
$nicknameInput.on('change', function() {
	let nickname = $nicknameInput.val();
	
	$.ajax({
		url : '/member/checkNicknameOk.me',
		type : 'get',
		data : {memberNickname : nickname},
		success : function(result) {
			$checkNickname.text(result);
		},
		error : function(a, b, c) {
			console.log(c);
		}
	});
});

// '이전' 버튼 누르면 메인페이지로 이동

