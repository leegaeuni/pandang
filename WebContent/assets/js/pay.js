// 라디오 버튼 
$(document).ready(function() {
	$('#submit').click(function() {
		$("input:radio[name=infroamtion]:checked")[0].checked = false;
	});
});

// 이메일 
function selectEmail(ele) {
	let $ele = $(ele);
	let $member_email = $('#email2');

	console.log($ele);
	// '1'인 경우 직접입력
	if ($ele.val() == "1") {
		$member_email.attr('readonly', false);
		$member_email.val('');
	} else {
		$member_email.attr('readonly', true);
		$member_email.val($ele.val());
	}
}

//주소 api
window.onload = function() {
	document.getElementById("zoneCode").addEventListener("click", function() {
		//우편번호 입력칸을 클릭하면
		//카카오 지도 발생
		new daum.Postcode({
			oncomplete: function(data) {
			//선택시 입력값 세팅
			document.getElementById("zoneCode").value = data.zonecode; //우편번호 넣기
			document.getElementById("addressKakao").value = data.address; // 주소 넣기
			document.querySelector("input[name=addressDetail]").focus(); //상세입력 포커싱
		},
		}).open();
});
};

// 라디오 버튼 클릭시
$(document).ready(function() {
	// different 라디오 버튼 클릭 시 새로운 주소누르면 text값 지우기
	$('.type-different').click(function() {
		$('.who-is-put').val(''); // input 요소의 value 값을 빈 문자열로 설정
		$('.mail-address').val('');
		$('.main-address').val('');
		$('.sub-address').val('');
		$('.classic-phone-put').val('');
		$('.cell-phone-put').val('');
		$('.front-email-address').val('');
		$('.back-email-address').val('');
	});
	// same 라디오 버튼 클릭 시 DB정보 text에 띄우기
		$('.type-same').click(function() {		
		let prevValueWho = $('.who-is-put').attr('value');
		$('.who-is-put').val(prevValueWho);
		let prevValueMail = $('.mail-address').attr('value');
		$('.mail-address').val(prevValueMail);		
		let prevValueMain = $('.main-address').attr('value');
		$('.main-address').val(prevValueMain);		
		let prevValueSub = $('.sub-address').attr('value');
		$('.sub-address').val(prevValueSub);			
		let prevValueCellPhone = $('.cell-phone-put').attr('value');
		$('.cell-phone-put').val(prevValueCellPhone);		
		let prevValueFrontEmail = $('.front-email-address').attr('value');
		$('.front-email-address').val(prevValueFrontEmail);		
		let prevValueBackEmail = $('.back-email-address').attr('value');
		$('.back-email-address').val(prevValueBackEmail);				
	});		
	});
	

showTotal();
function showTotal(){
	// 총 상품금액
	let priceCount = $('.price-count');
	let priceTotal = 0;
	for(let i = 0; i <priceCount.length; i++){
		let priceCountInteger = parseInt(priceCount.eq(i).text()) ;
		priceTotal += priceCountInteger;
		console.log("#####");
		console.log(priceCountInteger);	
		console.log("#####total");
		console.log(priceTotal);
	}
	$('.product-pay').html(priceTotal);
	
	// 총 배송비
	let deliveryPay = $('.delivery-price');
	let deliveryTotal = 0;
	for(let i = 0; i <deliveryPay.length; i++){
		let deliveryPayInteger = parseInt(deliveryPay.eq(i).text()) ;
		deliveryTotal += deliveryPayInteger;
		console.log("#####");
		console.log(deliveryPayInteger);	
		console.log("#####total");
		console.log(deliveryTotal);
	}
		$('.delivery-pay').html(deliveryTotal);
	// 결제 예정 금액
	let sumPriceTotal = 0;
	let sumDeliveryTotal = 0;	
	sumPriceTotal = parseInt($('.product-pay').html(priceTotal).text());
	console.log("여기를 봐!!");	
	console.log(sumPriceTotal);
	sumDeliveryTotal = parseInt($('.delivery-pay').html(deliveryTotal).text());
	console.log(sumDeliveryTotal);
	
	$('.total-pay').html(sumPriceTotal+sumDeliveryTotal);	
	$('.price-zone').html(sumPriceTotal+sumDeliveryTotal+'원');	
}

