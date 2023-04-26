//주소 api
window.onload = function () {
  document.getElementById("zoneCode").addEventListener("click", function () {
    //우편번호 입력칸을 클릭하면
    //카카오 지도 발생
    new daum.Postcode({
      oncomplete: function (data) {
        //선택시 입력값 세팅
        document.getElementById("zoneCode").value = data.zonecode; //우편번호 넣기
        document.getElementById("addressKakao").value = data.address; // 주소 넣기
        document.querySelector("input[name=memberAddressDetail]").focus(); //상세입력 포커싱
      },
    }).open();
  });
};


// 이미지 넣기
let $fileInput = $('#avatarImage');
let $fileProfile = $('.myProfileImg');

/*console.log($fileInput);*/

// 파일을 변경 시 원래 선택된 파일 미리보기 제거하기
$fileProfile.html('');

/*console.log('aaa')
console.log($fileProfile.prop('src'))*/

// 바꾼 이미지 화면에 보여주기
$fileInput.on('change', function(){
	let files = this.files;
	/*console.log(this.files)*/
	
	let src = URL.createObjectURL(files[0]);
	$fileProfile.prop('src', src)

})