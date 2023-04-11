
// 버튼 클릭 시 특정 영역을 텍스트 박스로 변경하는 함수
function toggleTextBox() {
  var target = document.getElementById("text-area");
  var textBox = document.getElementById("text-box");

  target.style.display = "none";
  textBox.style.display = "block";
  textBox.value = target.innerHTML;
}

// 파일 첨부 시 이미지 미리보기 함수 
let $fileInput = $('#img-file');
let $fileList = $('.file-list');
let $cnt = $('.cnt');

console.log($fileInput);

$fileInput.on('change', function() {
	let files = this.files;
	console.log(files);

	$fileList.html('');

	if (files.length > 5) {
		let dt = new DataTransfer();
		files = dt.files;

		alert("파일은 최대 5개 까지만 첨부 가능합니다.")
		$cnt.text(files.length);
		return;
	}

	for (let i = 0; i < files.length; i++) {
		let src = URL.createObjectURL(files[i]);

		$fileList.append(`
         <li>
            <div class="show-img-box">
               <img src=${src}>
            </div>
            <div class="btn-box">
               <button type='button' class='img-cancel-btn' data-name='${files[i].name}'>삭제</button>
            </div>
         </li>
      `);
	}

	$cnt.text(files.length);

	$('.img-cancel-btn').on('click', function() {

		$(this).parent().parent().remove();

		let fileName = $(this).data('name');
		let dt = new DataTransfer();


		for (let i = 0; i < files.length; i++) {
			if (files[i].name !== fileName) {
				dt.items.add(files[i]);
			}
		}

		files = dt.files;
		
		console.log(files);
		$cnt.text(files.length);
	});
});

<<<<<<< HEAD
$('.btn-cancel').on('click', () => {
	window.location.href = '/store/storeOk.st';
});
=======
$('.cancel-btn').on('click', () => {
	window.location.href = '/board/boardListOk.bo';
});

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

>>>>>>> 507ce7a6a4a062cb1b1d2e9b88c40148106eb806
