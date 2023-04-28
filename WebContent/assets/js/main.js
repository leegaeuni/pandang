function getStoreList(result){
   $(".store-wrap-sub").html('');
	console.log(result);
         for(let i=0; i<result.length; i++){
            let img = '';
            if(result[i].isLike == 0){
               img = `<img class="before-like-btn"
                                          src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png" />`;
            }else {
               img = `<img class="before-like-btn active"
                                       src="https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png"
                                       alt="heart" />`;
            }
            
            $('.store-wrap-sub').append(`<div class="store-photo">
                        <div class="store-photo-img" data-storeNumber="${result[i].storeNumber}">
                           <img
                              src="/upload/${result[i].storeFileSystemName}" />
                           <div class="store-info">
                              <div class="store-info-tap">
                                 <!-- .store-info-tap은 hover시 나오는 상품 이름과 like버튼  -->
                                 <span>
                                    ${result[i].storeTitle}
                                 </span>
                                 <div class="like-btn">
                                    <button>
                                       ${img}
                                    </button>
                                 </div>
                              </div>
                           </div>
                        </div>
                     
                        <div class="store-info-channel">
                           <div class="store-info-channel-name">
                              <span>
                                 ${result[i].channelName}
                              </span>
                           </div>

                           <div class="cnt-wrap">
                              <div class="cnt-view">
                                 <div class="cnt-view-icon">
                                    <span class="material-symbols-outlined"> visibility </span>
                                 </div>
                                 <div class="cnt-view-number">
                                    ${result[i].storeViewCnt}
                                 </div>
                              </div>
                              <div class="cnt-like">
                                 <div class="cnt-like-icon">
                                    ${img}
                                 </div>
                                 <div class="cnt-like-number">
                                    ${result[i].likeCnt}
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>`)
            
         }
}

let storeNumber = 0;
let memberNumber = $('.j-login-number').val();
// @@@@@@ 이미지 클릭 했을 때 모달 창 띄우기 @@@@@@@@@

$('.store-wrap-sub').on('click', '.store-info', function(e){
   $(".post-modal").css("display", "flex");
    $(".modal-background").css("display", "inline-block");
   storeNumber = $(e.target).parent().parent().data('storenumber');
   $.ajax({
      url : '/store/storeUpdateViewCntOk.st',
      type : 'get',
      data : {storeNumber : storeNumber},
      dataType : 'json',
      success : function(result){
         getStoreComment();
         getStoreFile();
         insertDataModal(result);
		 $('html, body').scrollTop(0);
      }
   });
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
   };
   
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
               
            $('.post-img').append(text);
         }
      });
   };
   
   function showStoreComment(result){
   $('.s-commentL').html('');
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
   $('.s-commentL').html(text);
};

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
   

/*=================================================*/

function insertDataModal(result){
   $('.post-title').text(result.storeTitle);
   $('.post-date').text(result.storeDate);
   $('.post-categori').text(result.hashtagName);
   $('.view-cnt').text(result.storeViewCnt);
   $('.p-like-cnt').text(result.likeCount);
   $('.comment-cnt').text(result.commentCount);
   $('.post-content').text(result.storeContent);
   //$('.author-profile-img').attr('src', '')
   $('.profile-modal-member > a').text(result.channelName);
}


// @@@@@@@ 모달 영역 밖으로 클릭하면 모달 창 없애기 @@@@@@@

$(".modal-background").on("click", function () {
  $(".post-modal").css("display", "none");
  $(".report-path").css("display", "none");	
  $(this).css("display", "none");
});


function closeModal(result){
   $('.post-modal').html('');
};

// @@@@@@@ 팔로우 팔로잉 버튼 @@@@@@@@@@@@

$(".follow-btn").on("click", function () {
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
    } else {
      $(this).css("color", "rgb(0, 0, 0)").data("clicked", false);
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



// @@@@@ 호버 안의 like-btn 하트 회색 -> 빨간색
$(".store-wrap-sub").on("click",".before-like-btn" , function (e) {
  let $target = $(e.target);
  //  $(this)는 before-like-btn을 받음
  let src;
  $target.toggleClass("active");
  // .toggleClass()로 선택한 요소에 클래스(Class) 값을 넣었다 뺐다 할 수 있음
  // target에 active이벤트 넣어줌
  if ($target.hasClass("active")) {
    // console.log("!!!!");
    src = "https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-red-fill.png";
  } else {
    src = "https://cdn.loud.kr/prod/LOUD_IMG/designer/new/heart-gray-fill.png";
  }

   likeAjax(e.target);

  toggleImg($target, src);
  e.stopPropagation();
  // e.stopPropagation 는 상위 엘리먼트들로의 이벤트 전파를 중단시킴 여기서는 클릭이벤트
});

// 좋아요 버튼 ajax
function likeAjax(target){
   let storeNumber = $(target).closest('.store-photo').find('.store-photo-img').data('storenumber');
   
   $.ajax({
      url : '/main/likeOk.main',
      type : 'get',
      data : {storeNumber : storeNumber},
      success : function(result){
          $(target).closest('.store-photo').find('.cnt-like-number').text(result);
      }
   });
}


function toggleImg(target, src) {
  target.prop("src", src);
  // javascript / jquery를 통해 수정 된 요소의 값을 가져 오는 데 prop()를 사용

  target
    .closest(".store-photo")
    // .closest()는 주어진 CSS 선택자와 일치하는 요소를 찾을 때까지, 자기 자신을 포함해 위쪽(부모 방향, 문서 루트까지)으로 문서 트리를 순회
    // .find(".cnt-like-icon")
    .find(".before-like-btn")
    // find 함수는 배열의 요소를 순차적으로 순회하면서 조건에 일치하는 요소의 값을 즉시 반환. 조건을 일치하는 경우가 없다면, undefined를 반환
    .prop("src", src);
}

// @@@@@핫크리에이터의 profil-follow-btn 누르면 민트색으로 변경
$(".follow-span").on("click", function () {
	let followNumber = $(this).data('num');
	
	updateFollow(followNumber, this);
});

function updateFollow(followNumber, target){
   $.ajax({
		url : '/main/mainFollowOk.main',
		type : 'get',
		data : {
			followNumber : followNumber
		},
		success : function(result){
			if(result == 'insert'){
				$(target).css("color", "rgb(42, 197, 198)");
			}else{
				$(target).css("color", "rgb(124, 132, 132)");
			}
		}
	});
}

// 탭 전환시 민트색으로 색상 변경
$(".tab").on("click", function () {
  $(this).css("color", "rgb(42, 197, 198)");
  $(".tab").not(this).css("color", "rgb(78, 84, 84)");
});

// @@@@@핫크리에이터 슬라이드
let $slideBox = $(".slide-box");
let $slideImg = $(".slide-img");

// 슬라이드 이미지 인덱스번호
let currentIdx = 0;
// 슬라이드 박스 너비
let slideWidth = 1100;
//  총 슬라이드 이미지 수
let slideCnt = $slideImg.length;

checkEnd();

// .next, .prev 버튼 누르면 이동하는 코드
$(".next").on("click", function () {
  // console.log("next!!");
  $slideBox.css("transition", "0.5s ease");

  currentIdx++;
  // console.log("currentIdx : " + currentIdx);
  $slideBox.css("left", -(currentIdx * slideWidth));
  checkEnd();
});

$(".prev").on("click", function () {
  // console.log("prev!!");
  $slideBox.css("transition", "0.5s ease");

  currentIdx--;
  // console.log("currentIdx : " + currentIdx);
  $slideBox.css("left", -(currentIdx * slideWidth));
  checkEnd();
});

// css의 .slide-box{}에 left: 0;, top: 0; 꼭 넣어주기

function checkEnd() {
  if (currentIdx <= 0) {
    $(".prev").css("display", "none");
  } else {
    $(".prev").css("display", "block");
  }
  if (currentIdx >= slideCnt - 1) {
    $(".next").css("display", "none");
  } else {
    $(".next").css("display", "block");
  }
};


$('.lastest').on('click',function(){
      $.ajax({
         url : '/main/mainAjaxLastestOk.main',
         type : 'get',
         dataType : 'json',
         success : function(result){
            getStoreList(result);
         }
      });
});

$('.pandang-pick').on('click', function(){
   $.ajax({
      url : '/main/mainAjaxPandangOk.main',
      type : 'get',
      dataType : 'json',
      success : function(result){
        console.log('가보자고');
         getStoreList(result)
      }
   });
});

$('.following').on('click', function(){
   $.ajax({
      url : '/main/mainAjaxFollowOk.main',
      type : 'get',
      dataType : 'json',
      success : function(result){
         console.log('일단 이거라도 가져오자');
		console.log(result);
         getStoreList(result);
      }
   });
});


/*이거했음*/
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
         alert("신고가 성공적으로 접수되었습니당.");
         window.location.href = "/main.main";
      },
      error: function() {
         alert("오류가 발생했습니당. 다시 시도해주세요.");
      }
   });
   
});

/*이것도 했음*/
$('.modal-basket-btn-wrap').on('click', function(){   
   console.log($('.storeNumber').val());
   $.ajax({
      url: '/store/storeBasket.st',
      type: 'get',
      data: {storeNumber: storeNumber},
   success: function(result) {
         alert("물품을 장바구니에 추가하였습니당.");
         window.location.href = "/main.main";
      },
      error: function() {
         alert("오류가 발생했습니당. 다시 시도해주세요.");
      }
   });
});

// @@@@@@@ 모달 신고하기 버튼 누를 시 @@@@@@@@
$(".modal-report-btn").on("click", function () {
  $(".report-path").css("display", "block");

  // 재클릭시 안보이게하기
  if ($(this).data("clicked")) {
    $(".report-path").css("display", "none");
  }
});