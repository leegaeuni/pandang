function searchParam(key) {
  return new URLSearchParams(location.search).get(key);
};

function isEmpty(str){
		
		if(typeof str == "undefined" || str == null || str == "")
			return true;
		else
			return false ;
	}

// @@@@@@@@@@ 선택된 카테고리만 css 부여하는 js @@@@@@@@@@@@
$(".categori").on("click", function () {
  $(this).css("background-color", "rgb(50, 50, 50)");
  $(this).css("color", "white");

  $(".categori").not(this).css("background-color", "white");
  $(".categori").not(this).css("color", "black");
});

// @@@@@좋아요 버튼 누를시에 색상 변경 흰색->빨간색 빨간색->흰색@@@@@@@@@@
$('.post-container').on("click",".like-btn", function () {  
  if ($(this).hasClass("active")) {
    // 이미 클릭한 경우
    $(this).removeClass("active");
    $(this).css("background-image", "");
    $(this)
      .parent()
      .parent()
      .siblings()
      .find(".before-like-btn")
      .attr(
        "src",
        "https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
      );
  } else {
    // 처음 클릭하는 경우
    $(this).addClass("active");
    $(this).css(
      "background-image",
      "url(https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png)"
    );
    $(this)
      .parent()
      .parent()
      .siblings()
      .find(".before-like-btn")
      .attr(
        "src",
        "https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
      );
  }
});

// @@@@@@@ 팔로우 팔로잉 버튼 @@@@@@@@@@@@

$(".post-container").on("click", '.follow-btn', function () {
  if ($(this).children(".follow").css("display") != "none") {
    $(this).children(".follow").css("display", "none");
    $(this).children(".following").css("display", "inline-block");
  } else {
    $(this).children(".follow").css("display", "inline-block");
    $(this).children(".following").css("display", "none");
  }
});

// @@@@@@ 헤더 카테고리 선택시 색상 변경 @@@@@@@
$(".header-list").on("click", function () {
  $(this).css("color", "rgb(42, 197, 198)");

  $(".header-list").not(this).css("color", "#5b696f");
});

// @@@@@@ 판당픽 / 추천순 / 최신순 / 무료  클릭시 색상 변경@@@@@@@
$(".choice-list").on("click", function () {
  $(this).css("color", "rgb(42, 197, 198)");

  $(".choice-list").not(this).css("color", "#5b696f");
});

// @@@@@@@@@@@ 모달 창 좋아요 버튼 누를 시 하트색 변경 @@@@@@@@@@@@@
$(".like-btn-color").on({
  mouseover: function () {
    $(this).css("color", "rgb(255, 0, 0)");
  },
  mouseout: function () {
    if ($(this).data("clicked") !== true) {
      $(this).css("color", "rgb(0, 0, 0)");
    }
  },
  click: function () {
    if ($(this).data("clicked") !== true) {
      $(this).css("color", "rgb(255, 0, 0)").data("clicked", true);
	  $(".heart").css("color", "rgb(255, 0, 0)");
    } else {
      $(this).css("color", "rgb(0, 0, 0)").data("clicked", false);
	  $(".heart").css("color", "rgb(0, 0, 0)");
    }
  },
});

// @@@@@@@ 모달 팔로우 버튼 클릭 수정 @@@@@@@@
$(".modal-follow-btn").on("click", function () {
  if ($(this).children(".add").css("display") === "flex") {
    $(this).children(".add").css("display", "none");
    $(this).children(".done").css("display", "flex");
  } else {
    $(this).children(".add").css("display", "flex");
    $(this).children(".done").css("display", "none");
  }
});

// @@@@@ 모달 프로필 hover 시에 나오는 모달 @@@@@@
$("#profile").on("mouseover", function () {
  $(this).css("width", "100%");
  $(".profile-path").css("display", "block");
});

$(".profile-path").on("mouseleave", function () {
  $(".profile-path").css("display", "none");
});

// @@@@@ 모달 프로필 이미지 백그라운드 @@@@@
$("#modal-img-box").on({
  mouseover: function () {
    $(".modal-img-background").css("display", "block");
  },
  mouseout: function () {
    $(".modal-img-background").css("display", "none");
  },
});

//@@@@@ 모달 안에 모달 팔로우 버튼 @@@@@@
$(".profile-modal-follow-btn").on("click", function () {
  if ($(this).css("display") === "block") {
    $(this).css("display", "none");
    $(".profile-modal-following-btn").css("display", "flex");
  }

  $(".profile-modal-following-btn").on("click", function () {
    if ($(this).css("display") === "flex") {
      $(this).css("display", "none");
      $(".profile-modal-follow-btn").css("display", "block");
    }
  });
});

// @@@@@@ 댓글 수정 버튼 누를 시 @@@@@@@@@@
$(".comment-edit-btn").on("click", function () {
  $(this)
    .parent()
    .parent()
    .parent()
    .parent(".comment-list")
    .css("height", "300px");

  $(".comment-edit-box").css("display", "block");
  $(".edit-btn-box").css("display", "flex");

  // 작성 돼 있던 댓글 숨기기
  $(this)
    .parent()
    .parent()
    .siblings(".comment")
    .children(".comment-content")
    .css("display", "none");
});

// @@@@@@@ 모달 신고하기 버튼 누를 시 @@@@@@@@
$(".modal-report-btn").on("click", function () {
  $(".report-path").css("display", "block");

  // 재클릭시 안보이게하기
  if ($(this).data("clicked")) {
    $(".report-path").css("display", "none");
  }
});

// @@@@@@@ 신고하기 버튼 클릭시 색 @@@@@@
$(".report-btn-color").on({
  mouseover: function () {
    $(this).css("color", "rgb(255, 0, 0)");
  },
  mouseout: function () {
    if ($(this).data("clicked") !== true) {
      $(this).css("color", "rgb(0, 0, 0)");
    }
  },
  click: function () {
    if ($(this).data("clicked") !== true) {
      $(this).css("color", "rgb(255, 0, 0)").data("clicked", true);
    } else {
      $(this).css("color", "rgb(0, 0, 0)").data("clicked", false);
    }
  },
});



//처음 페이지 설정
$(document).ready(function(){
	$('.pandang-pick').click();
    $('.prev').prop('disabled', true);
});

function showStore(result) {
	console.log(result.list)
	$('.post-container').html('');
			for(let i=0; i<result.list.length; i++){	
				if(isEmpty(result.list[i].storeFileSystemName)){
					
					$('.post-container').append(`<div class="post-box-container">    
		            <div class="post-img-container">
		              <div class="post-img-box-wrap">
		                <img
		                  class="post-img"
		                  src="/assets/img/default.png"
		                  alt=""
		                />
		                <div class="post-img-back" data-num="${result.list[i].storeNumber}"></div>
		                <button type="button" class="like-btn">좋아요</button>
		                <div class="modal-background"></div>
		                <div class="modal-test"></div>
		              </div>
		            </div>
		             <div class="post-title-box">${result.list[i].storeTitle}</div>
		            <div class="writer-container">
		              <div class="channel-profile-box">
		                <a href="#" class="profile-img-box">
		                  <img
		                    class="profile-img"
		                    src="/upload/${result.list[i].channelFileSystemName }"
		                    alt=""
		                  />
		                </a>
		              </div>
		              <div class="writer-box">
		                <a href="" class="writer-name">${result.list[i].memberNickname}</a>
		              </div>
		              <font>·</font>
		              <div class="follow-btn-box">
		                <button type="button" class="follow-btn">
		                  <span class="follow">팔로우</span>
		                  <!-- 팔로우 버튼 누를 시 팔로잉 으로 떠야함 일단은 display none처리 했음 -->
		                  <img
		                    class="following"
		                    src="https://cdn.loud.kr/LOUD_IMG/main/ico-check-follow.png"
		                    alt=""
		                  />
		                  <span class="following">팔로잉</span>
		                </button>
		              </div>
		              <div class="like-wrap">
		                <img
		                  class="before-like-btn"
		                  src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
		                  alt="heart"
		                />
		                <!-- 게시글에 좋아요 누를 시 하트 색이 하트로 변경됨 일단은 display none처리 했음 -->
		                <img
		                  class="after-like-btn"
		                  src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
		                  alt="heart"
		                />
		                <!-- 임시 좋아요 수 -->
		                <div class="like-cnt">${result.list[i].storeLikeCnt}</div>
		              </div>         
		            </div>               
		          </div>`)
					$('.post-img-box-wrap').css('border', '1px solid rgb(200,200,200)')
				}else{
					$('.post-img-box-wrap').css('border', 'none');
					$('.post-container').append(`<div class="post-box-container">    
		            <div class="post-img-container">
		              <div class="post-img-box-wrap">
		                <img
		                  class="post-img"
		                  src="/upload/${result.list[i].storeFileSystemName}"
		                  alt=""
		                />
		                <div class="post-img-back" data-num="${result.list[i].storeNumber}"></div>
		                <button type="button" class="like-btn">좋아요</button>
		                <div class="modal-background"></div>
		                <div class="modal-test"></div>
		              </div>
		            </div>
		             <div class="post-title-box">${result.list[i].storeTitle}</div>
		            <div class="writer-container">
		              <div class="channel-profile-box">
		                <a href="#" class="profile-img-box">
		                  <img
		                    class="profile-img"
		                    src="/upload/${result.list[i].channelFileSystemName }"
		                    alt=""
		                  />
		                </a>
		              </div>
		              <div class="writer-box">
		                <a href="" class="writer-name">${result.list[i].memberNickname}</a>
		              </div>
		              <font>·</font>
		              <div class="follow-btn-box">
		                <button type="button" class="follow-btn">
		                  <span class="follow">팔로우</span>
		                  <!-- 팔로우 버튼 누를 시 팔로잉 으로 떠야함 일단은 display none처리 했음 -->
		                  <img
		                    class="following"
		                    src="https://cdn.loud.kr/LOUD_IMG/main/ico-check-follow.png"
		                    alt=""
		                  />
		                  <span class="following">팔로잉</span>
		                </button>
		              </div>
		              <div class="like-wrap">
		                <img
		                  class="before-like-btn"
		                  src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png"
		                  alt="heart"
		                />
		                <!-- 게시글에 좋아요 누를 시 하트 색이 하트로 변경됨 일단은 display none처리 했음 -->
		                <img
		                  class="after-like-btn"
		                  src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
		                  alt="heart"
		                />
		                <!-- 임시 좋아요 수 -->
		                <div class="like-cnt">${result.list[i].storeLikeCnt}</div>
		              </div>         
		            </div>               
		          </div>`)
				}
	}
};

let currentPage = 1;
let tempRealEnd = $('.realEndPage').value;
let maxPage = tempRealEnd;
var url = '/store/storeAjaxOk.st';
var data = {hashtagNumber: 1, currentPage: currentPage};

function categori() {
  $.ajax({
    url: url,
    type: 'get',
    data: data,
    dataType: 'json',
    success: function(result) {
      showStore(result);
		maxPage = result.realEndPage;
    }
  });
}

$('.design').on('click', function() {
  $(this).parent().children().removeClass('click');
  $(this).addClass('click');
  $('.pandang-pick').click();
  currentPage = 1;
	data.currentPage=1;
  url = '/store/storeAjaxOk.st';
  data.hashtagNumber = 1;
  categori();
});

$('.stationery-toys').on('click', function() {
  $(this).parent().children().removeClass('click');
  $(this).addClass('click');
  $('.pandang-pick').click();
  currentPage = 1;
	data.currentPage=1;
  data.hashtagNumber = 2;
  categori();
});

$('.accessories').on('click', function() {
  $(this).parent().children().removeClass('click');
  $(this).addClass('click');
  $('.pandang-pick').click();
  currentPage = 1;
	data.currentPage=1;
  url = '/store/storeAjaxOk.st';
  data.hashtagNumber = 3;
  categori();
});

$('.fashion').on('click', function() {
  $(this).parent().children().removeClass('click');
  $(this).addClass('click');
  $('.pandang-pick').click();
  currentPage = 1;
	data.currentPage=1;
  url = '/store/storeAjaxOk.st'; 
  data.hashtagNumber = 4; 
  categori();
});

$('.beauty').on('click', function() {
  $(this).parent().children().removeClass('click');
  $(this).addClass('click');
  $('.pandang-pick').click();
  currentPage = 1;
	data.currentPage=1;
  url = '/store/storeAjaxOk.st'; 
  data.hashtagNumber = 5;
  categori();
});

$('.pet').on('click', function() {
  $(this).parent().children().removeClass('click');
  $(this).addClass('click');
  $('.pandang-pick').click();
  currentPage = 1;
	data.currentPage=1;
  url = '/store/storeAjaxOk.st';
  data.hashtagNumber = 6;
  categori();
});

$('.living').on('click', function() {
  $(this).parent().children().removeClass('click');
  $(this).addClass('click');
  $('.pandang-pick').click();
  currentPage = 1;
	data.currentPage=1;
  url = '/store/storeAjaxOk.st';
  data.hashtagNumber = 7;
  categori();
});

$('.food').on('click', function() {
  $(this).parent().children().removeClass('click');
  $(this).addClass('click');
  $('.pandang-pick').click();
  currentPage = 1;
  data.currentPage=1;
  url = '/store/storeAjaxOk.st';
  data.hashtagNumber = 8;
  categori();
});


/*==========================================*/


/*판당 pick*/
$('.pandang-pick').on('click', function() {
  if (!$(this).hasClass('click')) {
    $(this).parent().children().removeClass('click');
    $(this).addClass('click');
    url = '/store/storeAjaxOk.st';
    currentPage = 1;
	data.currentPage=1;
    categori();
  }
});

$('.recommand').on('click', function() {
  if (!$(this).hasClass('click')) {
    $(this).parent().children().removeClass('click');
    $(this).addClass('click');
    url = '/store/storeAjaxLikeOk.st';
    currentPage = 1;
	data.currentPage=1;
    categori();
  }
});

/*최신순*/
$('.new').on('click', function() {
  if (!$(this).hasClass('click')) {
    $(this).parent().children().removeClass('click');
    $(this).addClass('click');
    url = '/store/storeAjaxDateOk.st';
    currentPage = 1;
	data.currentPage=1;
    categori();
  }
});

$('.free').on('click', function() {
  if (!$(this).hasClass('click')) {
    $(this).parent().children().removeClass('click');
    $(this).addClass('click');
    url = '/store/storeAjaxFreeOk.st';
    currentPage = 1;
	data.currentPage=1;
    categori();
  }
});

/*====================================================*/




$('.next').on('click', function() {
  if (currentPage < maxPage) {
    currentPage++;
	data.currentPage++;
	if(new URLSearchParams(location.search).has('searchInput')){
		$.ajax({
			url : '/store/storeSearchAjax.st',
			type : 'get',
			data : {searchInput : searchParam('searchInput'), page : currentPage},
			dataType : 'json',
			success : showStore
		});
	}else{
	    categori();
	}
  }
  if (currentPage == maxPage) {
    $(this).prop('disabled', true);
  }
  if (currentPage > 1) {
    $('.prev').prop('disabled', false);
  }

});

$('.prev').on('click', function(){
  if (currentPage > 1) {
    currentPage--;
	data.currentPage--;
	if(new URLSearchParams(location.search).has('searchInput')){
		$.ajax({
			url : '/store/storeSearchAjax.st',
			type : 'get',
			data : {searchInput : searchParam('searchInput'), page : currentPage},
			dataType : 'json',
			success : showStore
		});
	   }else{
		    categori();
		}
  }
  if (currentPage == 1) {
    $(this).prop('disabled', true);
  }
  if (currentPage < maxPage) {
    $('.next').prop('disabled', false);
  }
});

let $modifyBtn = $('.modal-edit-btn');
let $deleteBtn = $('.modal-delete-btn');

$modifyBtn.on('click', () => {
	window.location.href = '/store/storeUpdate.st';
});

$deleteBtn.on('click', () => {
	window.location.href = '/store/storeDeleteOk.st'
});



let storeNumber = 0;
let memberNumber = $('.j-login-number').val();
// @@@@@@ 이미지 클릭 했을 때 모달 창 띄우기 @@@@@@@@@

$('.post-container').on('click', '.post-img-back', function(e){
	$(".post-modal").css("display", "flex");
    $(this).closest('.post-img-box-wrap').find(".modal-background").css("display", "inline-block");
  	

	console.log($(e.target).data('num'));
   storeNumber = $(e.target).data('num');
   $.ajax({
      url : '/store/storeModalOk.st',
      type : 'get',
      data : {storeNumber : storeNumber},
      dataType : 'json',
      success : function(result){
        insertDataModal(result);
         getStoreComment();
         getStoreFile();

      }
   });
   
   /*밖에다가 댓글과 게시물이미지 ajax를 만들것*/
   
   function getStoreComment(){
      $.ajax({
            url: '/storeComment/storeCommentListOk.stc',
            type: 'get',
            dataType: 'json',
            data: { storeNumber: storeNumber },
            success: function(result) {
               showStoreComment(result);
            },
            error: function(a, b, c) {
               console.log(c);
            }

         });
   }
   
   function getStoreFile(){
      $.ajax({
         url:'/file/storeFileOk.stf',
         type:'get',
         dataType:'json',
         data: {storeNumber : storeNumber},
         success: function(result){
            
            let text = '';
            
            for(let i=0; i<result.length; i++){
               text += `
                  <img
                         src="/upload/${result[i].storeFileSystemName}"
                         alt=""
                       />
               `;
            }
               
            $('.post').append(text);
         }
      });
   }
   
   function showStoreComment(result){
   $('.comment-list').html('');
   let text = '';
   for (let i = 0; i < result.length; i++) {
      if (storeNumber == result[i].storeNumber && result[i].storeCommentNumber != 0) {
         
         text += `<div class="comment-list">
              <!-- @@@@@@@@@ 댓글 list @@@@@@@@@@ -->
              <a herf="#" class="comment-user-profile-shortcuts">
                <div class="comment-user-profile-wrap">
                  <img
                    src="https://cdn-bastani.stunning.kr/prod/users/3dbbdc56-858d-4d0e-b467-1463957476e3/avatar/ZQdoCULUEydS7bnM.image.jpg.small?q=60&t=crop&s=300x300"
                    alt=""
                  />
                </div>
              </a>
              <div class="text-wrap">
                <div class="comment-member-info">
                  <a href="#" class="member-id">${result[i].memberNickname}</a>
                  <div class="box"></div>
                  <div class="comment-date">${result[i].storeCommentDate}</div>
                  `

            if(memberNumber == result[i].memberNumber){
               text += `
               
               <div class="comment-edit-delete-btn-box">
                    <button class="comment-edit-btn" data-number="${result[i].storeCommentNumber}">수정</button>

                    <button class="comment-delete-btn"  data-number="${result[i].storeCommentNumber}">삭제</button>
                  </div>

                <div class="edit-btn-box">
                      <button type="submit" class="edit-btn" data-number="${result[i].storeCommentNumber}">
                        수정 완료
                      </button>
                  </div>`
            }
            
            text += `
               </div>
            <div class="height-box"></div>
                <div class="comment">
                  <span class="comment-content">
               ${result[i].storeCommentContent}
                  </span>
                 
                  
                </div>
              </div>
              <!-- @@@@@@@@@ 댓글 리스트 끝  @@@@@@@@@@ -->
            </div>`;
      }
   }
   $('.comment-list').html(text);
}

/* store 모달 댓글 작성 */
$('.comment-submit-btn').on('click', function() {
   
   $.ajax({

      url: "/storeComment/storeCommentWriteOk.stc",
      type: "get",
      data: {
         storeNumber: storeNumber,
         memberNumber: memberNumber,
         storeCommentContent: $('.comment-input-area').val()
      },
      success: function() {
         $('.comment-input-area').val('');
         getStoreComment();
      },
      error: function(a, b, c) {
         console.log(c);
      }

   });

});

// store 댓글 삭제
$('.comment-container').on('click', '.comment-delete-btn', function() {

   let storeCommentNumber = $(this).data('number');

   $.ajax({
      url: "/storeComment/storeCommentDeleteOk.stc",
      type: 'get',
      data: { storeCommentNumber: storeCommentNumber },
      success: function() {
         // 댓글 갱신
         $.ajax({
            url: '/storeComment/storeCommentListOk.stc',
            type: 'get',
            dataType: 'json',
            data: { storeNumber: storeNumber },
            success: function(result) {
               showStoreComment(result);
            },
            error: function(a, b, c) {
               console.log(c);
            }

         });

         console.log('success!!');
      }
   });
});


// store 댓글 수정

$('.comment-container').on('click', '.comment-edit-btn', function() {


   let $parent = $(this).closest('.comment-list');
   console.log($parent);

    let $children = $parent.find('.comment-edit-delete-btn-box, .edit-btn-box');
   console.log($children);

   $children.eq(0).hide();
   $children.eq(1).show();

   let $content = $(this).closest('.comment-list').find('.comment-content');
   console.log($content);

   $content.replaceWith(`<textarea class='modify-content'> </textarea>`);

});


$('.comment-container').on('click', '.edit-btn', function() {
   let storeCommentNumber = $(this).data('number');
   console.log($('.modify-content').val());

   $.ajax({
      url: '/storeComment/storeCommentUpdateOk.stc',
      type: 'get',
      data: {
         storeCommentNumber: storeCommentNumber,
         storeCommentContent: $('.modify-content').val()
      },
      success: function() {
         $.ajax({
            url: '/storeComment/storeCommentListOk.stc',
            type: 'get',
            dataType: 'json',
            data: { storeNumber: storeNumber },
            success: function(result) {
               showStoreComment(result);
            },
            error: function(a, b, c) {
               console.log(c);
            }

         });
      }
   });
});
   
});

/*=================================================*/

function insertDataModal(result){
   $('.post-title').text(result.storeTitle);
   $('.post-date').text(result.storeDate);
   $('.post-categori').text(result.hashtagName);
   $('.view-cnt').text(result.storeViewCnt);
   $('.p-like-cnt').text(result.likeCount);
   $('.comment-cnt').text(result.commentCount);
   $('.post').text(result.storeContent);
   //$('.author-profile-img').attr('src', '')
   $('.profile-modal-member > a').text(result.channelName);
}

function showModal(result){
$('.store-photo-img').html('');
$('.store-photo-img')(`<div class="post-box">
            <div class="profile-path">
              <div class="profile-modal-img-box">
                <a href="#" id="modal-img-box">
                  <img
                    class="profile-modal-img"
                    src="https://cdn-bastani.stunning.kr/prod/users/f4852320-5cea-4a09-9b2f-7e496b710e43/avatar/ah7M8e7fB5v6Dbif.414_2unday.png.small?q=60&t=crop&s=300x300"
                    alt=""
                  />
                  <div class="modal-img-background"></div>
                </a>
              </div>
              <div class="profile-modal-member">
                <a href="#">leegaeun0923</a>
              </div>
              <div class="profile-modal-follow-btn-box">
                <button class="profile-modal-follow-btn" type="button">
                  팔로우
                </button>
                <button class="profile-modal-following-btn" type="button">
                  <span class="material-symbols-outlined">done</span>
                  <span id="#following">팔로잉</span>
                </button>
              </div>
            </div>
            <div class="report-path">
              @@@@ 신고하기  @@@@@
              <div class="report-msg">
                <h1>신고 사유를 작성해주세요.</h1>
              </div>
              <!-- @@@@@@@@ 신고 내용 폼 경로처리 @@@@@@ -->
              <form action="" method="post">
                <div class="report-content-box">
                  <div class="report-title">
                    <input
                      type="text"
                      id="report-title"
                      placeholder="제목을 입력해주세요."
                    />
                  </div>
                  <div class="report-content">
                    <textarea
                      name="reportContent"
                      id="report-content"
                      placeholder="신고 사유를 500자 이내로 작성해주세요."
                    ></textarea>
                  </div>
                  <div class="report-btn">
                    <button type="submit">작성 완료</button>
                  </div>
                </div>
              </form>
             <!--  @@@@@ 신고하기 영역 끝 @@@@@ -->
            </div>
            <div class="post-header-container">
              <div class="post-header-box">
                <div class="post-header">
                  <!-- @@@@@ 모달 게시글 헤더 @@@@@@@@@ -->
                  <div class="post-title">임시 게시글 제목</div>
                  <div class="post-date-categori-box">
                    <div class="post-date">2023.3.23</div>
                    <div>l</div>
                    <div class="post-categori">패션</div>
                  </div>
                 <!--  @@@@@@@@@ 모달 게시글 헤더 끝 @@@@@@@@@@ -->
                </div>
                <div class="post-information">
                  <!-- @@@@@@@@@ 게시글 조회, 좋아요, 댓글 수 @@@@@@@@@@ -->
                  <div class="post-view-cnt">
                    <span class="material-symbols-outlined"> visibility </span>
                    <div class="view-cnt">32</div>
                  </div>
                  <div class="post-like-cnt">
                    <span class="material-symbols-outlined"> favorite </span>
                    <div class="p-like-cnt">77</div>
                  </div>
                  <div class="post-comment-cnt">
                    <span class="material-symbols-outlined"> chat_bubble </span>
                    <div class="comment-cnt">33</div>
                  </div>
                  <!-- @@@@@@@@@ 모달 조회,좋아요,댓글 수 끝 @@@@@@@@@@ -->
                </div>
              </div>
            </div>
            <div class="post">
             <!--  @@@@@@@@@ 모달 게시글 본문 @@@@@@@@@@ -->
              <p>게시글 작성 테스중</p>
              <p>게시글 작성 테스중</p>
              <p>게시글 작성 테스중</p>
              <img
                src="https://cdn-bastani.stunning.kr/prod/portfolios/16da7ecc-6e99-4388-8825-14c6d4de5f83/contents/VymrA8ubdEQF5EoT.1201%E1%84%83%E1%85%A6%E1%84%87%E1%85%B1_%E1%84%82%E1%85%A1%E1%84%86%E1%85%AE%E1%84%8C%E1%85%A1%E1%84%89%E1%85%AE-%E1%84%91%E1%85%A9%E1%84%89%E1%85%B3%E1%84%90%E1%85%A5_%E1%84%80%E1%85%A1%E1%84%85%E1%85%A9_%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A9%E1%86%BC%E1%84%89%E1%85%A9%E1%84%8C%E1%85%A2_s.jpg"
                alt=""
              />
              <p>게시글 작성 테스중</p>
              <p>게시글 작성 테스중</p>
              <img
                src="https://cdn-bastani.stunning.kr/prod/portfolios/16da7ecc-6e99-4388-8825-14c6d4de5f83/contents/VymrA8ubdEQF5EoT.1201%E1%84%83%E1%85%A6%E1%84%87%E1%85%B1_%E1%84%82%E1%85%A1%E1%84%86%E1%85%AE%E1%84%8C%E1%85%A1%E1%84%89%E1%85%AE-%E1%84%91%E1%85%A9%E1%84%89%E1%85%B3%E1%84%90%E1%85%A5_%E1%84%80%E1%85%A1%E1%84%85%E1%85%A9_%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A9%E1%86%BC%E1%84%89%E1%85%A9%E1%84%8C%E1%85%A2_s.jpg"
                alt=""
              />
              <p>게시글 작성 테스중</p>
              <p>게시글 작성 테스중</p>
              <!-- @@@@@@@@@ 모달 게시글 본문 끝 @@@@@@@@@@ -->
            </div>
            <div class="post-comment-box">
              <!-- @@@@@댓글 창@@@@@@@@@ -->
              <div class="comment-container">
                <div class="comment-list">
                 <!-- @@@@@@@@@ 댓글 list @@@@@@@@@@ -->
                  <a herf="#" class="comment-user-profile-shortcuts">
                    <div class="comment-user-profile-wrap">
                      <img
                        src="https://cdn-bastani.stunning.kr/prod/users/3dbbdc56-858d-4d0e-b467-1463957476e3/avatar/ZQdoCULUEydS7bnM.image.jpg.small?q=60&t=crop&s=300x300"
                        alt=""
                      />
                    </div>
                  </a>
                  <div class="text-wrap">
                    <div class="comment-member-info">
                      <a href="#" class="member-id">leeegaeun0923</a>
                      <div class="box"></div>
                      <div class="comment-date">4일 전</div>
<!--                       @@@@ 댓글 작성자와 로그인 한사람 일치할시 보여야함 @@@ 
                      display : flex로 변경되게 해주세요  -->
                    일단은 none 처리 
                      <div class="comment-edit-delete-btn-box">
                        <button class="comment-edit-btn">수정</button>

                        <button class="comment-delete-btn">삭제</button>
                      </div>
                    </div>
                    <div class="height-box"></div>
                    <div class="comment">
                      <span class="comment-content"
                        >너무 마음에 드는 작품이에요~~~~
                      </span>
                     <!--  @@@@@@ 댓글 수정 form 경로처리 @@@@@@ -->
                      <form action="" method="post">
                        <div class="comment-edit-box">
                          <textarea name="" id="comment-edit">
                          <span class="comment-content"
                          >너무 마음에 드는 작품이에요~~~~
                        </span>
                      </textarea
                          >
                        </div>
                        <div class="edit-btn-box">
                          <button type="submit" class="edit-btn">
                            수정 완료
                          </button>
                        </div>
                      </form>
                      댓글 수정 form 영역 끝
                    </div>
                  </div>
                 <!--  @@@@@@@@@ 댓글 리스트 끝  @@@@@@@@@@ -->
                </div>
                <div class="comment-list">
                  <a herf="#" class="comment-user-profile-shortcuts">
                    <div class="comment-user-profile-wrap">
                      <img
                        src="https://cdn-bastani.stunning.kr/prod/users/3dbbdc56-858d-4d0e-b467-1463957476e3/avatar/ZQdoCULUEydS7bnM.image.jpg.small?q=60&t=crop&s=300x300"
                        alt=""
                      />
                    </div>
                  </a>
                  <div class="text-wrap">
                    <div class="comment-member-info">
                      <a href="#" class="member-id">leeegaeun0923</a>
                      <div class="box"></div>
                      <div class="comment-date">4일 전</div>
                    </div>
                    <div class="height-box"></div>
                    <div class="comment">
                      <span class="comment-content"
                        >댓글 늘어나면 영역 늘어나는지 테스트중
                      </span>
                    </div>
                  </div>
                </div>
              <!--   @@@@@@@@@ 댓글 작성 form 경로 처리 해야함 @@@@@@ -->
                <form action="" method="post" id="comment-form">
                  <div class="write-area">
                    <!-- @@@@@@@@@ 댓글 작성 공간 @@@@@@@@@@ -->
                    <div class="comment-profile-container">
                      <div class="user-profile-wrap">
                        <img
                          class="user-profile-img"
                          src="https://cdn-bastani.stunning.kr/prod/users/16da7ecc-6e99-4388-8825-14c6d4de5f83/avatar/klucystudio_face.jpg.small?q=60&t=crop&s=300x300"
                          alt=""
                        />
                      </div>
                    </div>
                    <label class="comment-input-box">
                      <textarea
                        class="comment-input-area"
                        placeholder="이 창작물에 대한 댓글을 남겨주세요."
                      ></textarea>
                    </label>
                   <!--  @@@@@@@@@ 댓글 작성 공간 끝 @@@@@@@@@@ -->
                  </div>
                  <div class="submit-btn-box">
                    <!-- @@@@@@@@@ 댓글 작성 버튼 @@@@@@@@@@ -->
                    <button class="comment-submit-btn" type="submit">
                      댓글 작성
                    </button>
                    <!-- @@@@@@@@@ 버튼 끝 @@@@@@@@@@ -->
                  </div>
                </form>
              </div>
              <!-- @@@@@@@@@ 댓글창 끝 @@@@@@@@@@ -->
            </div>
            <!-- @@@@@@@@@ post 영역 끝 @@@@@@@@@@ -->
          </div>
          <div class="post-btn-box-wrap">
            <div class="post-btn-box" id="profile">
              <div class="modal-profile-btn btn-wrap-flex">
                <a href="#" class="author-info">
                  <div class="author-img-back"></div>
                  <div class="author-profile">
                    <img
                      class="author-profile-img"
                      src="https://cdn-bastani.stunning.kr/prod/users/3dbbdc56-858d-4d0e-b467-1463957476e3/avatar/ZQdoCULUEydS7bnM.image.jpg.small?q=60&t=crop&s=300x300"
                      alt=""
                    />
                  </div>
                </a>
                <span class="modal-btn-list">프로필</span>
              </div>
            </div>
            <!-- @@@ 모달 픽시드 팔로우 버튼 내 글일시 안 보여야함 @@@ -->
            <div class="post-btn-box" id="follow">
              <div class="modal-follow-btn-wrap btn-wrap-flex">
                <button type="button" class="modal-follow-btn btn-color">
                  <span class="material-symbols-outlined add"> add </span>
                  <span class="material-symbols-outlined done"> done </span>
                </button>
                <span class="modal-btn-list">팔로우</span>
              </div>
            </div>
            <!-- @@@ 팔로우 영역 끝 @@@ -->
            <div class="post-btn-box" id="'like">
              <div class="modal-like-btn-wrap btn-wrap-flex">
                <button type="button" class="modal-like-btn like-btn-color">
                  <span class="material-symbols-outlined"> favorite </span>
                </button>
                <span class="modal-btn-list">좋아요</span>
              </div>
            </div>
<!--             @@@ 좋아요 영역 끝 @@@
            @@@ 모달 픽시드 장바구니 버튼 내 글일시 안 보여야함 @@@ -->
            <div class="post-btn-box" id="basket">
              <div class="modal-basket-btn-wrap btn-wrap-flex">
                <button type="button" class="modal-btn btn-color">
                  <span class="material-symbols-outlined">
                    shopping_basket
                  </span>
                </button>
                <span class="modal-btn-list">장바구니</span>
              </div>
            </div>
<!--             @@@ 장바구니 영역 끝 @@@
            @@@ 모달 픽시드 구매하기 버튼 내 글일시 안 보여야함 @@@ -->
            <div class="post-btn-box" id="buy">
              <div class="modal-buy-btn-wrap btn-wrap-flex">
                <!-- @@@@@ 구매하기 페이지 경로 이동 처리 해야함 @@@@@ -->
                <a href="#">
                  <button type="button" class="modal-buy-btn btn-color">
                    <span class="material-symbols-outlined">
                      attach_money
                    </span>
                  </button>
                </a>
                <span class="modal-btn-list">구매하기</span>
              </div>
            </div>
<!--             @@@ 신고하기 영역 끝 @@@
            @@@ 모달 픽시드 신고하기 버튼 내 글일시 안 보여야함 @@@ -->
            <div class="post-btn-box" id="report">
              <div class="modal-report-btn-wrap btn-wrap-flex">
                <button type="button" class="modal-report-btn report-btn-color">
                  <span class="material-symbols-outlined"> error </span>
                </button>
                <span class="modal-btn-list">신고하기</span>
              </div>
            </div>
<!--             @@@ 수정하기 영역 끝 @@@
            @@@ 모달 픽시드 수정하기 버튼 내 글일시  보여야함 @@@ -->
            <div class="post-btn-box" id="edit">
              <div class="modal-edit-btn-wrap btn-wrap-flex">
                <button type="button" class="modal-edit-btn btn-color">
                  <span class="material-symbols-outlined"> edit </span>
                </button>
                <span class="modal-btn-list">수정하기</span>
              </div>
            </div>
<!--             @@@ 삭제하기 영역 끝 @@@
            @@@ 모달 픽시드 삭제하기 버튼 내 글일시  보여야함 @@@ -->
            <div class="post-btn-box" id="delete">
              <div class="modal-delete-btn-wrap btn-wrap-flex">
                <button type="button" class="modal-delete-btn btn-color">
                  <span class="material-symbols-outlined"> delete </span>
                </button>
                <span class="modal-btn-list">삭제하기</span>
              </div>
            </div>
          </div>`)
};

// @@@@@@@ 모달 영역 밖으로 클릭하면 모달 창 없애기 @@@@@@@

$(".post-container").on("click",'.modal-background', function () {
  $(".post-modal").css("display", "none");

  $(this).css("display", "none");
});

$('.report-btn').on('click', function(){	
	
	$.ajax({
		url: '/store/storeReportOk.st',
		type: 'get',
		data: {
			reportNumber: storeNumber,
			reportTitle: $('#reportTitle').val(),
			reportContent: $('#report-content').val()	
		},
	success: function(response) {
			alert("신고가 성공적으로 접수되었습니다.");
			window.location.href = "/store/storeOk.st";
		},
		error: function() {
			alert("오류가 발생했습니다. 다시 시도해주세요.");
		}
	});
	
});