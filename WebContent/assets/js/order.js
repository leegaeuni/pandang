$('.board-table').on('click', '.cancel-return-button', function(e){	
	/*console.log($(e.target).parent().parent().children().eq(1).text());*/
	
	$('.send-buy-number').val($(e.target).parent().parent().children().eq(1).text());
	 

     $(".modal-box").css("display", "flex"); 
     //$(this).css("display", "flex"); 
	
	
  $(".modal-box").on("click", function (e) {
    if (e.target.tagName == "ARTICLE") {
	// .change-status를 누르면 모달이 바뀌니 바뀌기 전 페이지 다시 되돌리기
	   $('.buy-status-change').css("display", "block");
	   $(".buy-status-change-ok-page").css("display", "none");
      $(this).css("display", "none");
    }
  });
  
 $(".change-status").on("click", function () { 
   $('.buy-status-change').css("display", "none");
   $(".buy-status-change-ok-page").css("display", "flex");
  });
  
  $(".cancel").on("click", function () {
  $(".modal-box").css("display", "none");
});


// 모달 위치 조정
//
});

$('.change-status').on('click', function(){
	$.ajax({
		url: '/buy/buyCancelOk.bu',
		data: { buyNumber : $('.send-buy-number').val() },
		type: 'get',
		success: function(result) {
			window.location.href = "http://localhost:8085/buy/buyListOk.bu";	
				}
	});		
});
