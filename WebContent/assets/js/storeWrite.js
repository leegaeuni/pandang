let $tmpInput = $(".file-input");
let cnt = 1;
let fileLength = 0;
let src = null;
let files = null;

// 드롭다운 버튼 클릭시 리스트가 보인다.
$(".dropdown-btn").on("click", function() {
	if ($(".menu-list").css("display") == "none") {
		$(".menu-list").css("display", "block");
	} else {
		$(".menu-list").css("display", "none");
	}
});

// 리스트 중 하나를 클릭하면 클릭한 리스트의 텍스트가 드롭다운 버튼의 값으로 바뀐다.
$(".list").children().on("click", function(event) {
	$(".menu-list").css("display", "none");
	let category = $(this).text();
	$(".write-category .dropdown-btn").text(category);
	$('.hashtag-number').val($(this).data('hashtag'));
});

$('.btn-next').on('click', function(e){
	if($('.hashtag-number').val()==0){
		e.preventDefault();
		alert('카테고리를 선택하세요');	
	}
})

$(".img-select").on("click", function (e) {
  $(".file-input").click();
});

$tmpInput.on("change", function () {
  files = this.files;
  fileLength = files.length;
  $(".img-cnt-container").html("");

  let $input = $(".input");

  for (let i = 0; i < 10; i++) {
    if (i >= files.length) {
      let dt = new DataTransfer();

      $input[i].files = dt.files;
    } else {
      let dt = new DataTransfer();
      dt.items.add(files[i]);

      $input[i].files = dt.files;
    }
  }
  $(".img-content").attr("src", URL.createObjectURL(files[0]));
  for (let i = 0; i < files.length; i++) {
    $(".img-cnt-container").append(`<div class="img-cnt"></div>`);
  }

  $(".img-selector").css("display", "none");
  $(".img").css("display", "flex");
  $(".img-counter").css("display", "block");
  $(".img-cnt-container")
    .children()
    .first()
    .css("background", "rgb(0, 149, 246)");
  $(".prev").css("display", "none");
  $('.next').css('display', 'flex');
});

$(".modify").on("click", function () {
  $(".img-selector").css("display", "flex");
  $(".img").css("display", "none");
  $(".img-counter").css("display", "none");
  $(".file-input").val("");
  cnt = 1;
});

$(".next").on("click", function () {
  cnt++;
  $(".img-content").attr("src", URL.createObjectURL(files[cnt - 1]));
  if (cnt == fileLength) {
    $(".next").css("display", "none");
  }
  $(".img-cnt").css("background", "rgb(168, 168, 168)");
  switch (cnt) {
    case 2:
      $(".img-cnt-container")
        .children()
        .eq(1)
        .css("background", "rgb(0, 149, 246)");
      $(".prev").css("display", "flex");
      break;
    case 3:
      $(".img-cnt-container")
        .children()
        .eq(2)
        .css("background", "rgb(0, 149, 246)");
      break;
    case 4:
      $(".img-cnt-container")
        .children()
        .eq(3)
        .css("background", "rgb(0, 149, 246)");
      break;
    case 5:
      $(".img-cnt-container")
        .children()
        .eq(4)
        .css("background", "rgb(0, 149, 246)");
      break;
    case 6:
      $(".img-cnt-container")
        .children()
        .eq(5)
        .css("background", "rgb(0, 149, 246)");
      break;
    case 7:
      $(".img-cnt-container")
        .children()
        .eq(6)
        .css("background", "rgb(0, 149, 246)");
      break;
    case 8:
      $(".img-cnt-container")
        .children()
        .eq(7)
        .css("background", "rgb(0, 149, 246)");
      break;
    case 9:
      $(".img-cnt-container")
        .children()
        .eq(8)
        .css("background", "rgb(0, 149, 246)");
      break;
    case 10:
      $(".img-cnt-container")
        .children()
        .eq(9)
        .css("background", "rgb(0, 149, 246)");
      $(".next").css("display", "none");
      break;

    default:
      break;
  }
});

$(".prev").on("click", function () {
  cnt--;
  $(".img-content").attr("src", URL.createObjectURL(files[cnt - 1]));
  if (cnt == fileLength - 1) {
    $(".next").css("display", "flex");
  }
  $(".img-cnt").css("background", "rgb(168, 168, 168)");
  switch (cnt) {
    case 1:
      $(".img-cnt-container")
        .children()
        .eq(0)
        .css("background", "rgb(0, 149, 246)");
      $(".prev").css("display", "none");
      break;
    case 2:
      $(".img-cnt-container")
        .children()
        .eq(1)
        .css("background", "rgb(0, 149, 246)");
      break;
    case 3:
      $(".img-cnt-container")
        .children()
        .eq(2)
        .css("background", "rgb(0, 149, 246)");
      break;
    case 4:
      $(".img-cnt-container")
        .children()
        .eq(3)
        .css("background", "rgb(0, 149, 246)");
      break;
    case 5:
      $(".img-cnt-container")
        .children()
        .eq(4)
        .css("background", "rgb(0, 149, 246)");
      break;
    case 6:
      $(".img-cnt-container")
        .children()
        .eq(5)
        .css("background", "rgb(0, 149, 246)");
      break;
    case 7:
      $(".img-cnt-container")
        .children()
        .eq(6)
        .css("background", "rgb(0, 149, 246)");
      break;
    case 8:
      $(".img-cnt-container")
        .children()
        .eq(7)
        .css("background", "rgb(0, 149, 246)");
      break;
    case 9:
      $(".img-cnt-container")
        .children()
        .eq(8)
        .css("background", "rgb(0, 149, 246)");
      $(".next").css("display", "flex");
      break;

    default:
      break;
  }
});