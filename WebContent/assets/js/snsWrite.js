let $tmpInput = $(".file-input");
let cnt = 1;
let fileLength = 0;
let src = null;
let files = null;
$tmpInput.on("change", function () {
  files = this.files;
  console.log(files);
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
  $(".img").css("display", "block");
  $(".img-counter").css("display", "block");
  $(".return").css("display", "block");
  $(".img-cnt-container")
    .children()
    .first()
    .css("background", "rgb(0, 149, 246)");
  $(".prev").css("display", "none");
  $('.next').css('display', 'flex');
});

$(".return").on("click", function () {
  $(".img-selector").css("display", "flex");
  $(".img").css("display", "none");
  $(".img-counter").css("display", "none");
  $(".return").css("display", "none");
  $(".file-input").val("");
});

$(".img-select").on("click", function (e) {
  $(".file-input").click();
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
