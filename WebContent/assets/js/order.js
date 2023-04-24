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
var sWidth = window.innerWidth;
    var sHeight = window.innerHeight;
  
    var oWidth = $('.modal-box').width();
    var oHeight = $('.modal-box').height();
  
    var btnOffset = $(this).offset();
    var divLeft = btnOffset.left ;
    var divTop = btnOffset.top + $('.cancel-return-button').outerHeight();
  
    if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
    if( divTop + oHeight > sHeight ) divTop -= oHeight;
  
    // if( divLeft < 0 ) divLeft = 0;
    // if( divTop < 0 ) divTop = 0;
  
    // 각 화면의 window.innerWidth와 window.innerHeight가 달라 화면 배율이 다르면 바꿔야함  
    // console.log(btnOffset);    
    $('.modal-box').css({
  "position": "absolute",
  "left": $(this).offset().left - $('.modal-box').outerWidth()*1.05,
  "top": $(this).offset().top - $('.cancel-return-button').outerHeight()*4
  }).show();
// 모달 위치조절 끝!!

});








$('.change-status').on('click', function(){
	$.ajax({
		url: '/buy/buyCancelOk.bu',
		data: { buyNumber : $('.send-buy-number').val() },
		type: 'get',
		success: function(result) {
			window.location.href = window.location.href;	
				}
	});		
});
