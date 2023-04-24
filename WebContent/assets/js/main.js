/*let storePhoto = document.querySelectorAll(".store-photo-img");
let modalBox = document.querySelector(".modal-box");*/

// @@@@@모달 창 띄우기
/*for (let i = 0; i < storePhoto.length; i++) {
  storePhoto[i].addEventListener("click", function () {
   let storeNumber = $(this).data('storenumber');
   
   console.log(storeNumber);
    console.log(storePhoto);*/

/*   $.ajax({
      url : '/',
      type : 'get',
      data : {storeNumber : storeNumber},
      success : function(result){
      }   
   });
   */
   
/*   $.ajax({
      url : '/main/mainOk.re',
      type : 'get',
      data : {storeNumber : storeNumber}   ,
      dataType : 'json',
      success : function(result){
         
      }
   });*/
/*   });
}*/




/*modalBox.addEventListener("click", function (e) {
  if (e.target.tagName == "ARTICLE") {
    this.style.display = "none";
  }
});*/

/*const tabs = document.querySelectorAll("[data-tab-target]");
const tabcon = document.querySelectorAll("[data-tab-content]");

tabs.forEach((tab) => {
  tab.addEventListener("click", () => {
    const target = document.querySelector(tab.dataset.tabTarget);
    tabcon.forEach((tabc_all) => {
      tabc_all.classList.remove("active");
    });
    target.classList.add("active");
  });
});*/



function getStoreList(result){
   $(".store-wrap-sub").html('');
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
            
            console.log(img)
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
   console.log($(e.target).parent().parent().data('storenumber'));
   storeNumber = $(e.target).parent().parent().data('storenumber');
   $.ajax({
      url : '/store/storeUpdateViewCntOk.st',
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
                      name="reportTitle"
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

/*
function showReport(result){
   $(".report-list").html('');
         for(let i=0; i<result.list.length; i++){
            
            $('.report-list').append(`<div class="board-list">
                <div class="board-list-number">${result.list[i].reportNumber}</div>
                <!-- 게시물 제목 클릭하면 밑에 신고 상세내용 보이게 한다. -->
                <a href="#" class="board-list-title">${result.list[i].reportTitle}</a>
                <div class="board-list-author">${result.list[i].memberId}</div>
                <div class="board-list-date">${result.list[i].reportDate}</div>
              </div>
      
              <!-- 게시물 제목 클릭 시 신고내용이 보여진다. -->
              <div class="report-contents-wrap">
                <div class="report-content">
                  <p>
                    ${result.list[i].reportContent}
                  </p>
                </div>
                <div class="report-btn-wrap">
                  <!-- 클릭 시 해당 회원정보로 이동 -->
                  <a href="#">${result.list[i].reportedMemberId}</a>
                  <!-- 클릭 시 해당 게시물로 이동 -->
                  <button class="go-post-btn">게시물 보기</button>
                </div>
              </div>`)
            
         }
};
*/


/*$(".store-info").on("click", function () {
  $(".post-modal").css("display", "flex");
  $(".modal-background").css("display", "inline-block");
  console.log($(this).parent()).data('storeNumber');
*/   /*$.ajax({
      url : 
      
   })*/
/*});*/


// @@@@@@@ 모달 영역 밖으로 클릭하면 모달 창 없애기 @@@@@@@

$(".modal-background").on("click", function () {
  $(".post-modal").css("display", "none");

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
$(".profil-follow-btn").on("click", function () {
  if (
    $(this).children().children("span").css("color") == "rgb(124, 132, 132)"
  ) {
    $(this).children().children("span").css("color", "rgb(42, 197, 198)");
  } else {
    $(this).children().children("span").css("color", "rgb(124, 132, 132)");
  }
});


/*// @@@@@스토어의 탭 전환
const tabs = document.querySelectorAll("[data-tab-target]");
const tabcon = document.querySelectorAll("[data-tab-content]");

tabs.forEach((tab) => {
  tab.addEventListener("click", () => {
    const target = document.querySelector(tab.dataset.tabTarget);
    tabcon.forEach((tabc_all) => {
      tabc_all.classList.remove("active");
    });
    target.classList.add("active");
  });
});*/

// 처음 페이지 진입 시 '판당 pick'이 클릭되어 있게 하기.
$(document).ready(function() {
   $('.pandang-pick').click();
});

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
let slideWidth = 1320;
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
   console.log('정연재 ㅄ');
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
         getStoreList(result)
      }
   });
});

