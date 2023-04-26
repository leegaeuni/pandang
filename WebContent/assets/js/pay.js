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
				document.querySelector("input[name=buyAddressDetail]").focus(); //상세입력 포커싱
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

let sumPriceTotal = 0;
let sumDeliveryTotal = 0;

showTotal();
function showTotal() {
	// 총 상품금액
	let priceCount = $('.price-count');
	let priceTotal = 0;
	for (let i = 0; i < priceCount.length; i++) {
		let priceCountInteger = parseInt(priceCount.eq(i).text());
		priceTotal += priceCountInteger;
	}
	$('.product-pay').html(priceTotal);
	// 총 배송비
	let deliveryPay = $('.delivery-price');
	let deliveryTotal = 0;
	for (let i = 0; i < deliveryPay.length; i++) {
		let deliveryPayInteger = parseInt(deliveryPay.eq(i).text());
		deliveryTotal += deliveryPayInteger;
	}
	$('.delivery-pay').html(deliveryTotal);
	// 결제 예정 금액
	sumPriceTotal = parseInt($('.product-pay').html(priceTotal).text());
	sumDeliveryTotal = parseInt($('.delivery-pay').html(deliveryTotal).text());
	$('.total-pay').html(sumPriceTotal + sumDeliveryTotal);
	$('.price-zone').html(sumPriceTotal + sumDeliveryTotal + '원');
}

let totalFinal = 0;
totalFinal = parseInt($('.total-pay').html(sumPriceTotal + sumDeliveryTotal).text());

// 결제 api연동

var IMP = window.IMP;
IMP.init("imp80075064"); // 가맹점 식별코드

var today = new Date();
var hours = today.getHours(); // 시
var minutes = today.getMinutes();  // 분
var seconds = today.getSeconds();  // 초
var milliseconds = today.getMilliseconds();
var makeMerchantUid = hours + minutes + seconds + milliseconds;

let buyArray = [];

function requestPay() {
	IMP.request_pay({
		pg: 'html5_inicis', // PG사 코드표에서 선택
		pay_method: 'card', // 결제 방식
		merchant_uid: "IMP" + makeMerchantUid, // 결제 고유 번호
		name: $('.title').text(), // 제품명
		/*amount : totalFinal, // 사용할 가격*/
		amount: 10, // 연결 확인을 위해 사용한 가격 확인 후 지우기

		buyer_email: $('.front-email-address').val() + '@' + $('.back-email-address').val(),
		buyer_name: $('.who-is-put').val(),
		buyer_tel: $('.cell-phone-put').val(),
		buyer_addr: $('.main-address').val() + $('.sub-address').val(),
		buyer_postcode: $('.mail-address').val()
	}, function(rsp) { // callback
		if (rsp.success) {
			console.log(rsp);
			
			let buyInfo = {};
for (let i = 0; i < $('.list-size').val(); i++) {
	buyInfo = {
		storeSystemFile: $('.board-table').find('.basket-img img').eq(i).attr('src'),
		storeNumber: $('.board-table').find('.store-number').eq(i).val(),
		storeTitle: $('.board-table tbody .title').eq(i).text(),
		storePrice: $('.board-table tbody .price').eq(i).text(),
		buyCnt: $('.board-table tbody .count').eq(i).text(),
		buyName: $('.who-is-put').val(),
		buyZoneCode: $('.mail-address').val(),
		buyAddress: $('.main-address').val(),
		buyAddressDetail: $('.sub-address').val(),
		buyPhoneNumber: $('.cell-phone-put').val(),
		memberEmail: $('.front-email-address').val() + '@' + $('.back-email-address').val(),
		buyMsg: $('.delivery-message-area').val()
	};
	buyArray.push(buyInfo);
};

$.ajax({
	url: '/buy/paidOk.bu',
	data: { buyArray: JSON.stringify(buyArray) },
	contentType: 'application/json; charset=utf-8',
	type: 'get',
	traditional: true,
	success: function(result) {
		//페이지 이동									
			window.location.href = "http://localhost:8085/buy/buyListOk.bu";
			}
});	
			// 	console.log(rsp)로 결과 값 출력해봐야함
			// console.log('연결 성공했지 히히');
		} else {
			console.log(rsp);
		}
	});
}

