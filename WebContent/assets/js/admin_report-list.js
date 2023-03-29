$(".board-list-title").on("click", function () {
  if ($(".report-contents-wrap").css("display") == "none") {
    $(".report-contents-wrap").css("display", "block");
  } else {
    $(".report-contents-wrap").css("display", "none");
  }
});
