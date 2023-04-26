
// th의 체크박스 선택시 전체 체크박스 선택 
/*function selectAll(selectAll) {
	$('input[name="basket-product"]').prop('checked', selectAll.checked);
}*/

// 버튼으로 숫자 변환하면 상품금액 바뀜
$(".plus-btn").on("click", function() {
	const td = $(this).closest("td");
	let quantity = td.find(".quantity-input").val();
	td.find(".quantity-input").val(++quantity);
	const price = parseInt(td.prev(".store-price").text()); // 상품 가격
	let storeTotalPrice = td.next(".store-total-price");
	storeTotalPrice.text(price * quantity); // 상품 금액
	let buyTotalPrice = td.next().next().next(".buy-total-price"); // 총 가격
	buyTotalPrice.text(parseInt(storeTotalPrice.text()) + 3000); // 총 가격 업데이트
});

$(".minus-btn").on("click", function() {
	const td = $(this).closest("td");
	let quantity = td.find(".quantity-input").val();
	if (quantity > 1) {
		td.find(".quantity-input").val(--quantity);
		const price = parseInt(td.prev(".store-price").text()); // 상품 가격
		let storeTotalPrice = td.next(".store-total-price");
		storeTotalPrice.text(price * quantity); // 상품 금액
		let buyTotalPrice = td.next().next().next(".buy-total-price"); // 총 가격
		buyTotalPrice.text(parseInt(storeTotalPrice.text()) + 3000); // 총 가격 업데이트
	}
});

// 체크된 상품의 가격 합계를 구함
$('input[type="checkbox"]').on('change', function() {
	// 체크시 콘솔에 뜨는지 확인
	/*if (this.checked) {
		console.log('체크됨');
		
	} else {
		console.log('체크 해제됨');
	
	}*/
	// 총 상품금액
	let finalProductPay = $(".final-product-pay");
	let checkedProductTotal = 0;
	// 총 배송비
	let finalPostPay = $(".final-post-pay")
	let checkedPostTotal = 0;
	// 결제 예정금액
	let finalTotalPay = $(".final-total-pay")
	let checkedTotal = 0;

	$("input[name='basket-product']:checked").each(function() {
		let tr = $(this).closest("tr");
		// 총 상품금액
		let price = parseInt(tr.find(".store-price").text()); // 1개당 상품 가격
		let quantity = parseInt(tr.find(".quantity-input").val()); // 상품 개수
		checkedProductTotal += price * quantity;
		// 총 배송비
		let post = parseInt(tr.find(".post-price").text());
		checkedPostTotal += post;
		// 결제예정금액
		let buyTotalPrice = parseInt(tr.find(".buy-total-price").text());
		checkedTotal += buyTotalPrice;
	});
	// 구한 합계를 final-product-pay에 표시, 총 상품금액
	finalProductPay.text(checkedProductTotal);
	finalPostPay.text(checkedPostTotal);
	finalTotalPay.text(checkedTotal);		
});

// @@@@@여기서부터 ajax@@@@@

// 장바구니 삭제
$('.basket-list').on('click', '.delete', function() {
	/*console.log('delete버튼 클릭만 확인');*/
	// 여러개 삭제시 배열이므로 valArr 변수 사용해서 배열받기
	// each(function({}) 사용해서 클릭한 val 받기
	let valArr = [];
	$(".store-number:checked").each(function(){
		let val = $(this).val();		
		valArr.push(val);
	})	;
	// 삭제 버튼 클릭시 해당 tr 삭제
	$(".store-number:checked").closest("tr").remove();
	
	$.ajax({
		url: "/basket/basketDeleteOk.ba",
		type: "get",
		traditional: true,
		// 위의 traditional: true써야 list로 받을 수 있음
		data: {
			storeNumber: valArr,
			memberNumber: $('.member-number').val()
		},
		success: function() {
			/*console.log('ajax성공시 출력');*/
		},
		error: function(a,b,c) {
			console.log(c);
		}

	});
});
// 각각 체크박스 선택
$('.board-table').on('change', '.store-number', function(e){
	/*console.log($(e.target).parent().parent().next().next().next().next().children().children().eq(1).val());*/
	if($(e.target).is(':checked')){
		$(e.target).next().html(`<input type='hidden' name='buyCnt' value='${
			$(e.target).parent().parent().next().next().next().next().children().children().eq(1).val()
		}'>`);
	}else{
		$(e.target).next().html('');
	}
});

$('.board-table').on('click', '.check-all', function(e){
		if($(e.target).is(':checked')){
		$(e.target).parent().parent().parent().parent().next().children().children().children().children().eq(1).html(`<input type='hidden' name='buyCnt' value='${
			$(e.target).parent().parent().parent().parent().next().children().children().next().next().next().next().children().children().eq(1).val()
		}'>`);
	}else{
		$(e.target).parent().parent().parent().parent().next().children().children().children().children().eq(1).html('');
	}
});


$('.board-table').on('click', '.plus-btn', function(e){
	let buyCnt = $(e.target).parent().parent().parent().parent().prev().prev().prev().prev().children().children().eq(1).children().val();
	$(e.target).parent().parent().parent().parent().prev().prev().prev().prev().children().children().eq(1).children().val(++buyCnt);
	/*console.log($(e.target).parent().parent().parent().parent().prev().prev().prev().prev().children().children().eq(1).children());*/
});

$('.board-table').on('click', '.minus-btn', function(e){
	let buyCnt = $(e.target).parent().parent().parent().parent().prev().prev().prev().prev().children().children().eq(1).children().val();
	if(buyCnt>1){
	$(e.target).parent().parent().parent().parent().prev().prev().prev().prev().children().children().eq(1).children().val(--buyCnt);
	}
});
// 체크박스 전체선택
$('.check-all').click(function(){
		var checked = $('.check-all').is(':checked');
		
		if(checked){
			$('.store-number').prop('checked',false);
			$('.store-number').click();
		}else{
			$('.store-number').prop('checked',true);
			$('.store-number').click();
		}
	});
	
// 체크박스 선택 안 하면 구매 페이지로 이동 불가	
function check() {
  let checkedBox = document.querySelectorAll('input[name="basket-product"]:checked').length;

  console.log(checkedBox);
  if (checkedBox === 0) {
    alert('구매할 상품을 하나 이상 선택해주세요.');
	document.querySelector('button[type="submit"]').disabled = true;
    return false;
	
  }
}

