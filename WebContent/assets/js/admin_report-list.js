function showReport(result){
	$(".report-list").html('');
			for(let i=0; i<result.length; i++){
				
				$('.report-list').append(`<div class="board-list">
		          <div class="board-list-number">${result[i].reportNumber}</div>
		          <!-- 게시물 제목 클릭하면 밑에 신고 상세내용 보이게 한다. -->
		          <a href="#" class="board-list-title">${result[i].reportTitle}</a>
		          <div class="board-list-author">${result[i].memberId}</div>
		          <div class="board-list-date">${result[i].reportDate}</div>
		        </div>
		
		        <!-- 게시물 제목 클릭 시 신고내용이 보여진다. -->
		        <div class="report-contents-wrap">
		          <div class="report-content">
		            <p>
		              ${result[i].reportContent}
		            </p>
		          </div>
		          <div class="report-btn-wrap">
		            <!-- 클릭 시 해당 회원정보로 이동 -->
		            <a href="#">${result[i].reportedMemberId}</a>
		            <!-- 클릭 시 해당 게시물로 이동 -->
		            <button class="go-post-btn">게시물 보기</button>
		          </div>
		        </div>`)
				
			}
};

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
	$('.board-contents-title').html(`<div class="board-number">번호</div>
          <div class="board-title">제목</div>
          <div class="board-author">작성자</div>
          <div class="board-date">생성일</div>`);
	$('.change-store').removeClass('click');
	$('.change-sns').addClass('click');
	$.ajax({
		url : '/admin/reportSnsAjaxListOk.ad',
		type : 'get',
		dataType : 'json',
		success : showReport,
		error: function(a,b,c){
			console.log(c);
		}
	});
});
 
$(".change-page-member").on('click', function(){
	$(this).css('background-color', '#1bcad3');
	$(".change-page-report").css('background-color', 'black');
	$(this).parent().prev().css("display", "none");
	$('.board-contents-title').html(`<div class="member-number">번호</div>
          <div class="member-id">ID</div>
          <div class="member-author">이름</div>
          <div class="member-status">회원 상태</div>
          <div class="member-control">제재</div>`);
	$ajax.
});

$(".change-sns").on('click', function(){
	$('.change-sns').addClass('click');
	$('.change-store').removeClass('click');
	params.url = '/admin/reportSnsAjaxListOk.ad';
	$.ajax({
		url : '/admin/reportSnsAjaxListOk.ad',
		type : 'get',
		dataType : 'json',
		success : showReport,
		error: function(a,b,c){
			console.log(c);
		}
	});
});



$(".change-store").on('click', function(){
	$('.change-store').addClass('click');
	$('.change-sns').removeClass('click');
	params.url = '/admin/reportStoreListOk.ad';
	$.ajax({
		url : '/admin/reportStoreListOk.ad',
		type : 'get',
		dataType : 'json',
		success : showReport,
		error: function(a,b,c){	
			console.log(c);
		}
	});
});

var params = {
	type : 'get',
	dataType : 'json',
	data : {page : $('.active').text().trim()},
	url : '/admin/reportSnsAjaxListOk.ad',
	success : showReport
};


$('.pagination').on('click', '.number-btn', function(e){
	e.preventDefault();
	$('.number-btn').removeClass('active');
	$(e.target).addClass('active');
	params.data = {page : $(e.target).text().trim()};
	$.ajax(params);
});

/*var stylesheet = $("<link>", {
    rel: "stylesheet",
    type: "text/css",
    href: "${pageContext.request.contextPath}/assets/css/admin_member-list.css"
});
stylesheet.appendTo("head");*/

$('.change-page-member').on('click', function(){
	$('.board-contents-title').html(`<div class="member-number">번호</div>
          <div class="member-id">ID</div>
          <div class="member-author">이름</div>
          <div class="member-status">회원 상태</div>
          <div class="member-control">제재</div>`);
});