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
        document.querySelector("input[name=addressDetail]").focus(); //상세입력 포커싱
      },
    }).open();
  });
};