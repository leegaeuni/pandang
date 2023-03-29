// 체크박스 전체 선택
function selectAll(selectAll) {
  const checkboxes = document.getElementsByName(
    "basket_product_normal_type_normal"
  );

  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  });
}

// 장바구니 총 가격 구할 때 체크박스 값을 total-price로 받기
// store-price*buy-cnt으로 받지 말기

// 수량변경 버튼 -> 전체 수량이 같이 변경됨... 실패!!
// let quantity = $(".quantity-input").val();
// $(".plus-btn").on("click", function(){
//   $(".quantity-input").val(++quantity);
// });
// $(".minus-btn").on("click", function(){
//   if(quantity > 1){
//     $(".quantity-input").val(--quantity);	
//   }
// });

// 수량 변경 해당 버튼 눌리는 칸만 변하도록
$(".plus-btn").on("click", function(){
  const td = $(this).closest("td");
  let quantity = td.find(".quantity-input").val();
  td.find(".quantity-input").val(++quantity);
});

$(".minus-btn").on("click", function(){
  const td = $(this).closest("td");
  let quantity = td.find(".quantity-input").val();
  if(quantity > 1){
    td.find(".quantity-input").val(--quantity);	
  }
});
