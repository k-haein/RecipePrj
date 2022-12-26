<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>고객센터 Q&A</title>
<!--   <base href=""> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="./resources/img/favicon.ico">
  


<link rel="stylesheet" type="text/css" href="./resources/css/header.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/main.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/style.css" media="all" />



<!-- 따로 추가 -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.3.1/css/all.min.css" rel="stylesheet">

<!------ Include the above in your HEAD tag ---------->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/a91a27e46f.js" crossorigin="anonymous"></script>
<!------ Include the above in your HEAD tag ---------->


  
  <!--********** 【 js 링크 걸기 】********** -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="./resources/js/main.js" type="text/javascript" charset="utf-8"></script>

<script src="./resources/js/plugins/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

<style>
.card-header .title {
    font-size: 17px;
    color: #000;
}
.card-header .accicon {
  float: right;
  font-size: 20px;  
  width: 1.2em;
}
.card-header{
  cursor: pointer;
  border-bottom: none;
}
.card{
  border: 1px solid #ddd;
}
.card-body{
  border-top: 1px solid #ddd;
}
.card-header:not(.collapsed) .rotate-icon {
  transform: rotate(180deg);
}
</style>

  
</head>
<body>
 
  
  <app-root>
 

<!-- 마이페이지 Start -->
<section id="about-us" class="py-5">
    <div class="container">
        <div class="row">
        
        
             <!--left sidebar-->
            <div class="col-md-3 pr-md-4">
                <div class="sidebar-left">
                    <!--sidebar menu-->
                    <ul class="list-unstyled sidebar-menu pl-md-2 pr-md-0">
                        <li>
                            <a class="sidebar-item active d-flex justify-content-between align-items-center" href="Myrecipe_list">
                                내가 쓴 레시피 보기
                                <span class="fas fa-copy"></span>
                            </a>
                        </li>
                           
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center"  href="review">
                                나에게 달린 코멘트
                                <span class="side-notif" title="1 new comment"></span>
                                <span class="fas fa-comment"></span>
                            </a>
                        </li>                  
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center"  href="Myscrap">
                                레시피 스크랩
                                <span class="fas fa-bookmark"></span>
                            </a>
                        </li>                         
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center"  href="MySubscribe">
                                팔로잉 리스트
                                <span class="fas fa-user-friends"></span>
                            </a>
                        </li>                           
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center"  href="MySubscriber">
                                팔로워 리스트
                                <span class="fas fa-user-tag"></span>
                            </a>
                        </li>                       
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center"  href="storeCart">
                                장바구니
                                <span class="fas fa-cart-arrow-down"></span>
                            </a>
                        </li>
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center"  href="MyServiceCenter">
                                고객센터  
                                <span class="side-notif" title="1 new messages"></span>
                                <span class="fas fa-headset"></span>
                            </a>
                        </li>
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center"  href="info_change">
                                회원정보수정
                                <span class="fas fa-user-cog"></span>
                            </a>
                        </li> 
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center" href="logout">
                                로그아웃
                                <span class="fas fa-sign-out-alt"></span>
                            </a>
                        </li>
                          <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center" href="memberDelete">
                                회원탈퇴
                                <span class="fas fa-user-slash"></span>
                            </a>
                        </li>        
                    </ul>
                </div>
            </div>
            
            
           
                
            <div class="col-md-9">
                <div class="dashboard-area">
                <!--Content-->
                
            <!-- Posts Start -->

<div class="container">


    <center>
        <h2>자주 물어보는 질문</h2>
    </center>
    
     <div class="row">
     <div class="col-12">
        <ul class="nav nav-pills mb-5" id="pills-tab" role="tablist">
           <li class="nav-item">
              <a class="nav-link active show" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">회원정보</a>
            </li>
           <li class="nav-item">
               <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">레시피/클래스</a>
           </li> 
                                           
            <li class="nav-item">
               <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">결제</a>
            </li>
             <li class="nav-item">
             <a class="nav-link" id="pills-class-tab" data-toggle="pill" href="#pills-class" role="tab" aria-controls="pills-class" aria-selected="false">교환/반품</a>
           </li>

           </ul>
       <div class="tab-content" id="pills-tabContent">
       
    <!-- 탭1 -->   
       
            <div class="tab-pane fade active show" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
             
<!-- ------ 내용 ------ -->

      
    <div class="accordion" id="accordionExample">
            <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false">     
                <span class="title">#1. 회원가입은 어떻게 하나요? </span>
            </div>
            <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
               만개의레시피는 이메일로 회원가입을 할 수 있습니다.
               <br>
               오른쪽 상단 [사람모양 아이콘]을 통해 가입이 가능합니다.
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false">     
                <span class="title">#2. 로그인은 어떻게 하나요? </span>
            </div>
            <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
                    상단의 사람모양 아이콘을 클릭해 가입하신 아이디와 비밀번호를 입력해주세요.
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false">     
                <span class="title">#3. 회원정보를 수정하고 싶어요.</span>
            </div>
            <div id="collapseThree" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
                   로그인 후 마이페이지에 입장해주세요. 메뉴의 회원정보수정을 눌러 회원정보를 수정해주세요. 
                   </div>
            </div>
        </div>        
        <div class="card">
            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false">     
                <span class="title">#4. 프로필 사진을 변경하고 싶어요</span>
            </div>
            <div id="collapseFour" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
               프로필 사진을 다른 사진으로 변경하고 싶으시면,
               <br>
               로그인 후 우측 상단 [사람모양 아이콘->MyPage]에서 프로필 사진을 클릭하여 변경하실 수 있습니다.
                   </div>
            </div>
        </div>        
        <div class="card">
            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false">     
                <span class="title">#5. 비밀번호를 변경하고 싶어요</span>
            </div>
            <div id="collapseFive" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
               사용중인 비밀번호를 변경하고 싶으시면,<br>

               로그인 후 우측 상단 [사람모양 아이콘>MyPage->회원정보수정]페이지에서 변경하실 수 있습니다.
                   </div>
            </div>
        </div>
                <div class="card">
            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false">
                <span class="title">#6. 이메일 주소를 변경하고 싶어요. </span>
            </div>
            <div id="collapseSix" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
                   회원가입 시 입력한 이메일 주소를 변경하고 싶으신가요?<br>
               만개의레시피에 로그인하신 후 우측 상단 사람 모양 아이콘클릭>회원정보수정을 클릭하시면 이메일 주소를 변경하실 수 있습니다.
    </div>
            </div>
        </div>
        
        <div class="card">
            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="false">
                <span class="title">#7. 회원탈퇴 방법을 알려주세요.</span>
            </div>
            <div id="collapseSeven" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
                   사용중인 만개의레시피 아이디는 회원탈퇴 후 재사용 및 복구가 불가합니다.<br>
               탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택해 주세요. <br>
               오른쪽 상단 [사람모양 아이콘->MyPage]으로 들어갑니다.<br>
               1. 왼쪽 메뉴 중 [탈퇴하기]를 클릭해주세요.<br>
               2. 유의사항을 읽고, 비밀번호를한번 더 정확하게 입력해주세요.<br>
               3. [확인]을 누르면 탈퇴가완료됩니다.<br>
               - 공공적 성격의커뮤니티 게시물은 탈퇴 후에도 삭제되지 않으므로 반드시 직접 삭제하신 후 탈퇴해 주시기 바랍니다.
 </div>
            </div>
        </div>        
        <div class="card">
            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseEight" aria-expanded="false">
                <span class="title">#8. 나의 활동내역을 확인하고 싶어요.</span>
            </div>
            <div id="collapseEight" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
                   내가 활동한 내용들을 한꺼번에 확인하고 싶으신가요?<br>
               상단의 [사람모양 아이콘->MyPage]를 클릭하시면 확인하실 수 있습니다.
    </div>
            </div>
        </div>


    </div>

</div>

  <!-- 탭2 -->   
       
            <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
<!-- ------ 내용 ------ -->

      
    <div class="accordion" id="accordionExample">
        <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false">     
                <span class="title">#1. 쉐프 레시피는 무엇인가요?</span>
            </div>
            <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
                    
                 쉐프는 Necipe에 보다 전문적인 레시피를 제공해주시는 분들을 말합니다.<br>
            쉐프들의 전문 레시피 포스팅을 구독 또는 스크랩을 통해 마이페이지에서 다시한번 확인이 가능합니다.
            
            </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false">     
                <span class="title">#2. 레시피를 등록하고 싶어요. </span>
            </div>
            <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
                    레시피 등록방법이 궁금하신가요?
               <br>
               만개의레시피 메인 오른쪽 상단의 글쓰기 책모양 아이콘>직접 등록하기를 클릭하여 레시피를 작성하실 수 있습니다.
               
               <br>
               편집페이지 오른쪽 상단에서  버튼을 클릭하여 자세한 등록방법을 확인하세요.
            </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseTree" aria-expanded="false">
                <span class="title">#3. 레시피를 스크랩하고 싶어요.</span>
            </div>
            <div id="collapseTree" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
                    레시피 상세보기의 하트 표시를 클릭해주시면 마이페이지의 스크랩 부분에서 모아보기가 가능합니다.
                     </div>
            </div>
        </div>        
        <div class="card">
            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false">
                <span class="title">#4. 내 레시피에 달린 댓글을 확인하고 싶어요.</span>
            </div>
            <div id="collapseFour" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
                    마이페이지 [나에게 달린 코멘트] 부분에서 리뷰 확인이 가능합니다.
                     </div>
            </div>
        </div>
  <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false">     
                <span class="title">#5. 쉐프란 무엇인가요? 쉐프 신청하는 방법을 알려주세요. </span>
            </div>
            <div id="collapseFive" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
                    
                 쉐프는 Necipe에 보다 전문적인 레시피를 제공해주시는 분들을 말합니다.<br>
            Necipe에 오시면 여러분도 쉐프가 될 수 있습니다.<br>
            쉐프는 유료 클래스 운영이 가능하며 관리자 승인 후 업로드 가능합니다.<br>
            쉐프 등업은 제일 하단 쉐프등업을 통해 신청이 가능합니다. 
            
            </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false">     
                <span class="title">#6. 클래스를 수강하고 싶어요.</span>
            </div>
            <div id="collapseSix" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
               클래스 상세보기 페이지에서 클래스 수강이 가능합니다.<br> 결제 후 쉐프의 전문 레시피를 영상으로 확인해보세요!     
          </div>
            </div>
        </div>
    </div>

</div>
 <!-- 탭3 -->   
       
            <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
<!-- ------ 내용 ------ -->

    <div class="accordion" id="accordionExample">
        <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false">     
                <span class="title">#1. 상품주문은 어떻게 하나요?  </span>
            </div>
            <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
                    
         구매를 원하시는 상품을 장바구니에 담으신 후, [결제] 버튼을 누르시면 됩니다.
          </div>
            </div>
        </div><div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false">     
                <span class="title">#2. 해외배송은 안되나요?  </span>
            </div>
            <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
                    (마켓이름)의 대부분의 제품은 냉동, 냉장식품이기 때문에 제품의 신선도 및 통관상의 이유로 해외배송이 어렵습니다.
                  <br>
               이점 양해바랍니다.
 </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false">     
                <span class="title">#3. 제주도 배송스케쥴은 어떻게 되나요?  </span>
            </div>
            <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
                    제주 배송은 보통 출고일 기준으로 3일 소요 됩니다. (예시: 월요일 출고 → 수요일 도착) 
               <br>
               안전 상의 이유로 월요일/화요일/수요일/목요일에만 출고하고 있으며,
               <br>
               기후 및 선박 스케줄에 따라 위 일정은 변경 될 수 있습니다.   
 </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false">     
                <span class="title">#4. 배송지를 변경하고 싶어요.  </span>
            </div>
            <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
                    일단 입금이 확인이 되면 주문 마감시간에 맞춰 데이터가 넘어가기 때문에
               <br>
               변경/취소가 어려우나 물류센터와 확인하여 가능한 주문에 한하여 변경/취소를 도와드리고 있습니다.
               <br>
               100% 모두 가능하지 않을수 있으니 주문 즉시 고객센터(xxxx-xxxx)로 연락주시면 빠른 처리 도와드리겠습니다.

 </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false">     
                <span class="title">#5. 냉동식품인데 냉장보관 해도 되나요?  </span>
            </div>
            <div id="collapseFive" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
                    안 됩니다! 바로 조리하기위해 해동을 요하는 제품이 아니라면 꼭! '냉동보관' 해주세요~
<br>
            장기간 냉장보관 하거나, 해동 된 제품을 재냉동하는것은 제품의 쉽게 변질될 우려가 많으니 안전 유의하여 이용해주세요!

 </div>
            </div>
        </div>

    </div>

</div>

 <!-- 탭4 -->   
       
            <div class="tab-pane fade" id="pills-class" role="tabpanel" aria-labelledby="pills-class-tab"> 
<!-- ------ 내용 ------ -->

    <div class="accordion" id="accordionExample">
        <div class="card">
            <div class="card-header" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false">     
                <span class="title">#1. 교환 또는 반품신청 시에 사진을 첨부해야 하나요?  </span>
            </div>
            <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                <div class="card-body">
                    상품의 하자 등의 사유로 교환 또는 반품을 신청하시는 경우, 1:1 문의 또는 카카오톡 문의에 해당 사항을 확인할 수 있는 사진 첨부를 부탁드립니다.
               <br>
               구매하신 상품의 문제 상황을 확인할 수 있는 당시의 상세한 사진일 수록, 보다 신속하고 정확한 안내를 받으실수 있습니다.
               <br>
               고객님의 소중한 말씀과 사진은 해당 담당부서로 공유되며, 이를 바탕으로 더 나은 품질의 상품으로 제공드리도록 하겠습니다.
 </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false">     
                <span class="title">#2. 상품을 반품했는데 아직 카드취소가 되지 않았어요. 어떻게 된 건가요?</span>
            </div>
            <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
                   카드환불의 경우 카드사 사정에 따라 환불 접수일로 부터 영업일 기준 3~7일 정도 소요될 수 있습니다.
               <br>
               (취소완료시 카드사에서 안내드리는 SMS는 고객님의 수신 설정여부에 따라 미수신 될 수 있습니다)
               <br>
               자세한 사항은 카드사에 문의 부탁드리며, 7일 이후에도 환불이 되지 않은 경우 1:1문의로 문의 부탁드립니다.
   </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false">
                <span class="title">#3. 교환/반품 기준이 어떻게 되나요?</span>
            </div>
            <div id="collapseThree" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
                    [상품에 문제가 있는 경우]
               <br>
               1. 신선식품: 상품을 받은 날로부터 2일이내에 사진과 함께 1:1 문의 또는 카카오톡 문의로 접수해주세요.
               <br>
               2. 그외의 상품: 상품을 받은 날로부터 3개월 이내, 또는 문제가 있다는 사실을 알았거나 알 수 있었던 날로부터 30일 이내에, 사진과 함께 1:1 문의 또는 카카오톡 문의로 접수해주세요.
               
               <br><br>
               
               [단순변심 / 주문 오류의 경우]
               <br>
               1. 신선식품: 재판매가 불가한 상품의 특성상 단순변심, 주문 실수, 개인 기호에 따른 교환 및 반품은 어렵습니다.
               <br>
               2. 그외의 상품: 상품을 받은 날로부터 7일이내에 교환 또는 환불 신청할 수 있습니다.
               <br><br>
               
               (참고)
               단순변심인 경우 배송비는 고객님 부담 6000원이 부담됩니다.
               <br>
               상품에 문제가 있는 것이 확인될 경우 배송비는 (마켓이름)에서 부담합니다.   </div>
            </div>
        </div>        
        <div class="card">
            <div class="card-header collapsed" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false">
                <span class="title">#4. 교환시 별도 배송비가 부과되나요?</span>
            </div>
            <div id="collapseFour" class="collapse" data-parent="#accordionExample">
                <div class="card-body">
                    가공식품 및 일부 비식품류에 한해서만 반품이 가능합니다.
               <br><br>
               
               단순변심에 의한 교환/반품 시 배송비 6,000원 (주문 건 배송비를 낸 경우 3,000원)을 고객님께서 부담하셔야합니다.
               <br>
               1. 상품에 이상이 없거나 상품의 특성적인 부분인 경우
               <br>
               2. 단순 변심에 의해 교환 및 반품하는 경우
               <br>
               3. 옵션 및 상품을 잘못 선택하여 잘못 주문했을 경우
               <br><br>
               
               판매자 과실 등 상품에 문제로 인해 교환시 배송비를 판매자가 부담합니다.
               <br>
               1. 수령한 상품이 불량인 경우
               <br>
               2. 수령한 상품이 파손된 경우
               <br>
               3. 상품이 상품상세정보와 다른 경우
               <br>
               4. 주문한 상품과 다른 상품이 배송된 경우 등 
               </div>
            </div>
        </div>
      
    </div>

</div>


    </div><!-- pills-tabContent -->
</div>


        </div><!-- Tab End 3개 -->

    </div>
</div>
           <!-- Posts End -->
                
                
                <!--Content  End-->
                </div>
            </div>
           
                                 
           
           
           
         </div>
   
</section>
  <!--마이페이지 End -->

  
 </app-root> 
 
</body>
</html>