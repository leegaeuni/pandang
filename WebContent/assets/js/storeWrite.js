// 드롭다운 버튼 클릭시 리스트가 보인다.
$(".dropdown-btn").on("click", function () {
  if ($(".menu-list").css("display") == "none") {
    $(".menu-list").css("display", "block");
  } else {
    $(".menu-list").css("display", "none");
  }
});

// 리스트 중 하나를 클릭하면 클릭한 리스트의 텍스트가 드롭다운 버튼의 값으로 바뀐다.
$(".list").on("click", function (event) {
  $(".menu-list").css("display", "none");
	let category = $(this).text();
	$(".write-category .dropdown-btn").text(category);
});

