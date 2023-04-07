// 체크박스 전체 선택
/*function selectAll(selectAll) {
	const checkboxes = document.getElementsByName(
		"basket_product_normal_type_normal"
	);

	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	});
}*/


function selectAll(selectAll) {
  $('input[name="basket-product"]').prop('checked', selectAll.checked);
}

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
	if (this.checked) {
		console.log('체크됨');
	} else {
		console.log('체크 해제됨');
	}
	// 총 상품금액
	let finalProductPay = $(".final-product-pay");
	let checkedProductTotal = 0;
	// 총 배송비
	let finalPostPay =$(".final-post-pay")
	let checkedPostTotal=0;
	// 결제 예정금액
	let finalTotalPay=$(".final-total-pay")
	let checkedTotal=0;
		
	$("input[name='basket-product']:checked").each(function() {
		let tr = $(this).closest("tr");
		// 총 상품금액
		let price = parseInt(tr.find(".store-price").text()); // 1개당 상품 가격
		let quantity = parseInt(tr.find(".quantity-input").val()); // 상품 개수
		console.log(price, quantity);
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

// 삭제 버튼 클릭 이벤트 
$(".delete").click(function() {
  // 체크된 체크박스를 찾아서 삭제
  $("input[name='basket-product']:checked").closest("tr").remove();
});





