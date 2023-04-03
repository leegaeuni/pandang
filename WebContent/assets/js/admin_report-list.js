$(".board-list-title").on("click", function () {
  if ($(this).parent().next().css("display") == "none") {
    $(this).parent().next().css("display", "block");
  } else {
    $(this).parent().next().css("display", "none");
  }
});

$(".change-page-report").on('click',function(){
	$(this).css('background-color', '#1bcad3');
	$(".change-page-member").css('background-color', 'black');
    $(this).parent().next().css("display", "block");
});

$(".change-page-member").on('click', function(){
	$(this).css('background-color', '#1bcad3');
	$(".change-page-report").css('background-color', 'black');
	$(this).parent().prev().css("display", "none");
});

$(".change-sns").on('click', function(){
	$(this).css({'background' : 'gray' , 'color' : 'white'});
	$(".change-store").css({'background' : 'white' , 'color' : 'black' });
});

$(".change-store").on('click', function(){
	$(this).css({'background' : 'gray' , 'color' : 'white'});
	$(".change-sns").css({'background' : 'white' , 'color' : 'black' });
});