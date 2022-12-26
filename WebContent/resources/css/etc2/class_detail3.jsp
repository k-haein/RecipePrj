<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Cookiteer</title>
<!--   <base href="/"> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="./resources/img/favicon.ico">
  
  
  
<link rel="stylesheet" type="text/css" href="./resources/css/header.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/ranking_min.css" media="all" />


<!-- Bootstrap core CSS 
<link href="./resources/css/class_detail.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./resources/css/header.css" media="all" />


<!--   
<link rel="stylesheet" type="text/css" href="./resources/css/class_detail_min.css" media="all" /> 
<link rel="stylesheet" type="text/css" href="./resources/css/class_detail_style.css" media="all" />


<link rel="stylesheet" type="text/css" href="./resources/css/plugins/magnific-popup.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/slick.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/slick-theme.css" media="all" />


-->

<!-- 
<link rel="stylesheet" type="text/css" href="./resources/css/primary-skin.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/bootstrap.min.css" media="all" /> 
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/animate.min.css" media="all" />


<link rel="stylesheet" type="text/css" href="./resources/css/plugins/magnific-popup.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/slick.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/slick-theme.css" media="all" />
<!--

-->


  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<script src="./resources/js/main.js" type="text/javascript" charset="utf-8"></script>

<script src="./resources/js/plugins/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>


<!-- 

<script src="./resources/js/plugins/isotope.pkgd.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.countdown.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.magnific-popup.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.slimScroll.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.steps.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/popper.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/slick.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/waypoint.js" type="text/javascript" charset="utf-8"></script>
  
   -->


<!--           상세 정보  접기 / 펼치기  자스.     -->

<script>

    function handlePhotoFiles(e){
    
        if (e.target.files.length == 0)
            return;
    
        // 2MB보다 크면 제한
        if (e.target.files[0].size > 10485760) {
            alert("사진은 10MB까지만 허용됩니다.");
            return false;
        }
        var il = e.target.id.replace("file_","");
        var reader = new FileReader;
        reader.onload = function(evt) {
            var img = new Image();
            img.src = reader.result;
            img.onload = function () {
                var finalFile = reader.result;
                $.ajax({
                    beforeSend: function(xhr){
                        xhr.setRequestHeader('Content-Type', 'canvas/upload');
                    },
                    type: "POST",
                    url: "/util/upload_mobile.html",
                    data: "canvasData="+finalFile,
                    dataType: "json",
                    cache: "false",
                    processData: false,
                    success: function(json) {
                        //console.log(json);
                        if(json['result'] == "SUCCESS") {
                            $("#add_imgs").hide();
                            $("#img_dd").show();
                            $("#attach_imgs").attr("src",json['url']);
                            $("#image").val(json['url']);
                        } else {
                            alert("처리에 실패하였습니다.");
                        }
                    },
                    error: function (request,status,error) {
                        //alert('오류가 발생하였습니다.');
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
                });
            }
        }
        reader.readAsDataURL(e.target.files[0]);
    }

    function deleteImg()
    {
        if (confirm('이미지를 삭제하시겠습니까?')) {
            $("#add_imgs").show();
            $("#img_dd").hide();
            $("#attach_imgs").attr("src",'about:blank');
            $("#image").val('');
            $("#old_image").val('');
        }
    }    

    $(function() {
        
        $('#file_1').on('change', handlePhotoFiles);
        
                
                
    })        
    
    function doStar(star) {
        $('#score').val(star);
        $('#star').html($('#star'+star).html())
    }
    var isSubmit = false;
    function doSubmit() {
        if (isSubmit)
        {
            alert('잠시만 기다려주세요.');
            return;
        }
        isSubmit = true;
        
        if($("#txComment").val().length < 5)
        {
            alert('내용을 5자 이상 입력해주세요.');
            isSubmit = false;
            return ;
        }
        
        $('#insFrm').submit();            
        
    }
</script>
  
  
  
  
</head>
<body>
 
  
<app-root>
  

<app-header2> 



<!-- Aside (Mobile Navigation) -->
  <aside class="main-aside">
    <a class="navbar-brand" href="#"> <img src="./resources/img/logo.png" alt="logo"> </a>

    <div class="aside-scroll">
      <ul>
        <li class="menu-item menu-item-has-children">
          <a href="javascript:void(0)">Main</a>          
        </li>
        <li class="menu-item menu-item-has-children">
          <a href="javascript:void(0)">Recipe</a>        
        </li>
        <li class="menu-item menu-item-has-children">
          <a href="javascript:void(0)">Chef Recipe</a>        
        </li>
        
        <li class="menu-item menu-item-has-children">
          <a href="javascript:void(0)">Class</a>       
        </li>
        <li class="menu-item menu-item-has-children">
          <a href="javascript:void(0)">Ranking</a>          
        </li>
        <li class="menu-item">
          <a routerLink="/shop">Shop</a>
        </li>
        <li class="menu-item">
          <a routerLink="/contactus">Contact Us</a>
        </li>
      </ul>

    </div>

  </aside>
  <div class="aside-overlay aside-trigger"></div>

  <!-- Header Start -->
  <header class="main-header header-1">
    <nav class="navbar">
      <div class="container">
        <!-- Logo -->
        <a class="navbar-brand" routerLink="/"> <img src="./resources/img/logo.png" alt="logo"> </a>
        <!-- Menu -->
        <ul class="navbar-nav">
          <li class="menu-item menu-item-has-children">
            <a href="javascript:void(0)">Main</a>           
          </li>
          <li class="menu-item menu-item-has-children">
            <a href="javascript:void(0)">Recipe</a>         
          </li>
          <li class="menu-item menu-item-has-children">
            <a href="javascript:void(0)">Chef Recipe</a>
            </li>
          <li class="menu-item menu-item-has-children">
            <a href="javascript:void(0)">Class</a>           
          </li>
          <li class="menu-item menu-item-has-children">
            <a href="javascript:void(0)">Ranking</a>       
          </li>
          <li class="menu-item">
            <a routerLink="/shop">Shop</a>
          </li>
          <li class="menu-item">
            <a routerLink="/contactus">Contact Us</a>
          </li>
        </ul>

        <div class="header-controls">
          <ul class="header-controls-inner">
            <li class="cart-dropdown-wrapper cart-trigger">
              <i class="flaticon-shopping-basket"></i>
              <ul class="cart-dropdown">
                <li class="cart-item">
                  <img src="./resources/img/products/1.png" alt="product">
                  <div class="cart-item-body">
                    <a href="javascript:void(0)">Red Tea Pot With Black Handles</a>
                    <span class="custom-secondary">2x 18.00$</span>
                  </div>
                </li>
                <li class="cart-item">
                  <img src="./resources/img/products/2.png" alt="product">
                  <div class="cart-item-body">
                    <a href="javascript:void(0)">Oak Wood Cutting Board</a>
                    <span class="custom-secondary">1x 24.25$</span>
                  </div>
                </li>
                <li class="cart-subtotal">
                  <p> <strong>Subtotal: </strong> 54.25$</p>
                </li>
                <li class="cart-buttons">
                  <a routerLink="/checkout" class="btn-custom primary btn-sm shadow-none">Checkout</a>
                  <a routerLink="/cart" class="btn-custom secondary btn-sm shadow-none">View Cart</a>
                </li>
              </ul>
            </li>
            <li class="search-dropdown-wrapper search-trigger">
              <i class="flaticon-magnifying-glass"></i>
            </li>
          </ul>
          <!-- Toggler -->
          <div class="aside-toggler aside-trigger">
            <span></span>
            <span></span>
            <span></span>
          </div>
        </div>

      </div>
    </nav>

    <!-- Search Form Start-->
    <div class="search-form-wrapper">
      <div class="search-trigger close-btn">
        <span></span>
        <span></span>
      </div>
      <form class="search-form" method="post">
        <input type="text" placeholder="Search..." value="">
        <button type="button" class="search-btn">
          <i class="flaticon-magnifying-glass"></i>
        </button>
      </form>
    </div>
    <!-- Search Form End-->


  </header>
  <!-- Header End -->

 </app-header2>








<!-- Page Content -->
	<div class="container">



		<!-- ------------------- Header content---------------------  -->
		<header class="jumbotron my-4">
			<h1 class="display-3">Class Title_제목</h1>


			<div class="detail_img">
				<img src="./resources/image/detail_img/class_detail_01.jpg">
			</div>


			<figure class="snip1425">
				<img src="./resources/image/rank_img/product07.jpg"
					alt="sq-sample19" />
				<figcaption>
					<i class="ion-podium"></i>
					<h4>이름</h4>
					<h2>Mypage</h2>
				</figcaption>
				<a href="#"></a>
			</figure>


			<p class="lead">클래스 설명. 클래스 설명. 레시피 가르칠 것 설명</p>

			<p class="class_price">
				1,100<small>원</small>
			</p>

			<hr>

			<div class="detail_time">
				<div class="detail_icon_img">
					<span> <img src="./resources/image/detail_img/clock.png">
						<p1> 강의 시간 </p1> <p2> 10 분 </p2>
					</span> <span> <img src="./resources/image/detail_img/calendar.png">
						<p1> 수강 기간 </p1> <p2> 100 일 </p2>
					</span>
				</div>

			</div>

			<ul class="pagination">
              <li class="page-item"><a class="page-link" routerLink="/recipe-archive">Class 신청</a></li>
            </ul>


		<!-- 	<a href="#" class="btn btn-primary btn-lg">Class 신청</a> -->

		</header>


		<!-- ------------------- Header content---------------------  -->


		<!--       강의 보기      -->

		<div class="jumbotron my-4">


			<!--       강의 보기  헤드      -->
			<div class="show_class">
				<img src="./resources/image/detail_img/detail_icon_02.png">
				<p3>클래스 보기</p3>
				<hr>
			</div>

			<!--   ------------     section  ------------     -->
			<div class="show_class_secction">
				<div class="show_class_content">
					<b>클래스 소개</b> <span>/ 05분이내</span>
				</div>

				<div class="show_class_content_move">
					<p4>
					<a href="#">무료 보기</a></p4>
				</div>
			</div>


			<!--   ------------     section  ------------     -->

			<div class="show_class_secction">
				<div class="show_class_content">
					<b>재료 소개</b> <span>/  05분이내</span>
				</div>

				<div class="show_class_content_move">
					<p4>
					<a href="#">무료 보기</a></p4>
				</div>
			</div>




<!--   ------------     section  ------------     -->


			<div class="show_class_secction">
				<div class="show_class_content">
					<b>푸팟퐁커리</b> <span>/ 10분이내</span>
				</div>

				<div class="show_class_content_start">
					<li><p4>
						<a href="#" class="start_icon"><img
							src="./resources/image/detail_img/detailstart_on.png"></a></p4>
					</li>
					
					
					<li class="show_video">
					<span class="videoClose"><h1>X</h1></span>
					<span class="video_cn">							
					<iframe width="700" height="450"
								src="https://www.youtube.com/embed/fXZsiXreVV4" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
					</span></li>


				</div>
				<div class="show_class_content_menu">
					<span id="show-toggle"> <p4>
						<a href="#" class="prop_icon"><img
							src="./resources/image/detail_img/detailmenu_on.png"></a></p4>
					</span>
				</div>
				
				
				
				
				

				<!--     재료 소개       -->
			
			<div class="show_class_prop_1" id="show_class_prop_1">

					<div id="c_recipe">
						<div>
							<span class="c_t1">재료</span>
							<a href="#" id="closeProp">×</a>
						</div>
						<div>
							<span class="c_st1">[필수재료]</span>
						</div>
						<div id="c_ing">
							<span class="ing_l">감자</span> <span class="ing_r">2개</span>
						</div>
						<div id="c_ing">
							<span class="ing_l">양파</span> <span class="ing_r">1/2개</span>
						</div>
						<div id="c_ing">
							<span class="ing_l">당근</span> <span class="ing_r">약간</span>
						</div>
						<div id="c_ing">
							<span class="ing_l">소금</span> <span class="ing_r">1/3숟가락</span>
						</div>
						<div id="c_ing">
							<span class="ing_l">후추</span> <span class="ing_r">약간</span>
						</div>
						<div id="c_ing">
							<span class="ing_l">깨소금</span> <span class="ing_r">1숟가락</span>
						</div>
						<div id="c_ing">
							<span class="ing_l">식용유</span> <span class="ing_r">4숟가락</span>
						</div>
						<div>
							<span class="c_t2">조리순서</span>
						</div>
						
						<div id="c_step">
							<div class="c_s">
								감자는 얇게 채 썰어 준비한다.<br> Tip) 감자는 약 0.2mm~0.3mm 정도로 잘라요. 너무
								두꺼우면 익히는 시간도 오래걸려요.
							</div>
							<div class="c_s">
								양파, 당근도 감자와 같은 크기로 채 썰어 준비한다.<br> Tip) 당근은 색감을 내기위해 사용하기도
								하니 생략해도 좋아요.
							</div>
							<div class="c_s">감자는 찬물에 2~3번 헹궈내고 약 10분정도 담가 전분기를 제거한다.</div>
							<div class="c_s">
								물에 담가놓은 감자는 채반을 이용해 물기를 제거한다.<br> Tip) 키친타월을 이용해 물기를 더 닦아
								주어도 좋아요.
							</div>
							<div class="c_s">
								예열된 팬에 기름을 4숟가락 두르고 양파와 당근을 넣어 볶는다.<br> Tip) 센불로 약 1분간 볶아요.
							</div>
							<div class="c_s">
								양파가 살짝 투명해 지면 감자를 넣어 볶는다.<br> Tip) 중불로 약 2분간 볶아요.
							</div>
							<div class="c_s">
								소금, 후추로 간을 해 감자가 익을때 까지 약 2~3분간 더 볶는다.<br> Tip) 감자의 굵기에 따라
								시간을 조절해 주세요.
							</div>
							<div class="c_s">마지막으로 깨소금을 뿌려 섞어 완성한다.</div>
						</div>
					</div>

				</div>   <!--    show_class_prop    -->

			</div>










</div>


<!--       강의 보기      -->






		<!-- ------------------- 상세 정보 부분 ---------------------  -->

		<div class="jumbotron my-4">
			<div class="second_ct">


				<!--     second hader   -->
				<span id="toc-toggle" onclick="openCloseToc()">
					<div class="second_header">
						<img src="./resources/image/detail_img/detail_icon.png">
						<p3>클래스 상세 정보</p3>
						<p4>
						<img src="./resources/image/detail_img/detail_on.png"
							id="detail_more_IMG"></p4>
						<hr>
					</div>
				</span>



				<ol id="toc-content">

					<div class="second_body">
						<div class="sc_body_title">
							<p5>현지의 맛과 향이 느껴지는 </br>
							</p5>
							<p5>태국 요리 6가지를 배울 수 있어요.</p5>
						</div>




						<!--     second boby  secciton    -->
						<div class="body_ct">
							<div class="body_ct_img">
								<span> <img
									src="./resources/image/detail_img/detail_img_01.jpg">
								</span>
							</div>

							<div class="body_ct_title">
								<span> <p6>태국 대표 볶음 요리 <팟타이></p6>
								</span>
							</div>
							<div class="body_ct_content">
								<span> <p7>달걀, 새우와 숙주, 쌀국수를 볶은 태국 태표 요리인 팟타이 <팟타이></p7>
								</span>
							</div>
						</div>



						<!--     second boby  secciton   -->
						<div class="body_ct">
							<div class="body_ct_img">
								<span> <img
									src="./resources/image/detail_img/detail_img_02.jpg">
								</span>
							</div>

							<div class="body_ct_title">
								<span> <p6>태국 전통 스프 <똠얌꿍></p6>
								</span>
							</div>
							<div class="body_ct_content">
								<span> <p7>새우 육수와 똠양 페이스트로 만들어 새콤한 맛의 똠얌꿍<팟타이></p7>
								</span>
							</div>
						</div>



						<!--     second boby  secciton   -->
						<div class="body_ct">
							<div class="body_ct_img">
								<span> <img src="./resources/image/detail_img/detail_img_03.jpg">
								</span>
							</div>

							<div class="body_ct_title">
								<span> <p6>태국가면 꼭 먹어야 할 요리 <푸팟퐁커리></p6>
								</span>
							</div>
							<div class="body_ct_content">
								<span> <p7>튀긴 게와 옐로우커리의 만남! 무조건 먹는 태국 여행 1순위 메뉴
									푸팟퐁커리 <팟타이></p7>
								</span>
							</div>
							
							<hr>
							
							
						<!--  태그  -->	
							<div class="body_tag">
							<img src="./resources/image/detail_img/tag.png">
								<li class="tag_text">
									<a href="#" >
									<h7>#아시아</h7>									
									</a>								
								</li>
								<li class="tag_text">
									<a href="#" >
									<h7>#해산물</h7>									
									</a>								
								</li>
							</div>
							
														
							
						</div>









					</div>
					<!--   second_body   -->

				</ol>
				<!--    toc-content    -->

			</div>
			<!--    second_ct    -->

		</div>
		<!--    jumbotron my-4    -->








		<!-- ------------------- 취소 환불 부분   ---------------------  -->

		<div class="jumbotron my-4">
			<div class="second_ct">


				<!--     second hader   -->
				<div class="second_header">
					<img src="./resources/image/detail_img/detail_icon_03.png">
					<p3>취소 / 환불 안내</p3>
					<hr>
				</div>
				<p10>온라인 클래스</p10>
				<table class="thired_table" width="100%" cellspacing="0"
					cellpadding="0" radius="10">
					<colgroup>
						<col width="">
						<col width="">
						<col width="">
					</colgroup>
					<tbody>
						<tr class="table_line1">
							<th></th>
							<th>클래스 이용 전</th>
							<th>클래스 이용 후</th>
						</tr>
						<tr class="table_line2">
							<td>클래스 신청 후,7일 이내</td>
							<td>전액 환불</td>
							<td>기이용분 차감 후, 환불 진행</td>
						</tr>
						<tr class="table_line2">
							<td>클래스 신청 후,7일 초과</td>
							<td>판매금액의 10% 수수료 차감 후 환불<br>(수강기간 종료 시, 환불 불가)
							</td>
							<td>환불 불가</td>
						</tr>
					</tbody>
				</table>


				<div class="info_policy_cont_i">
					※ 기이용분 = 정상가 × (이용 유료 강의 수 / 전체 유료 강의 수) <br> ※ 유료 강의에 포함된
					레시피를 보시는 경우, 해당 강의를 이용한 것으로 간주하여 기이용분에 포함됩니다.
				</div>


			</div>
			<!--   second_ct   -->

		</div>
		<!--    jumbotron my-4   -->








		<!-- -------------------  수강 후기  ---------------------  -->

		<div class="jumbotron my-4">
			<div class="second_ct">


				<!--     second hader   -->
				<div class="second_header">
					<img src="./resources/image/detail_img/detail_icon_04.png">
					<p3>클래스 후기</p3>
					<hr>
				</div>



				<!--     후기  Section         -->
				<section>
					<div class="afterWord_Wrap">

						<div class="media-left">
							<a href="#"> <img
								src="./resources/image/detail_img/profile.png">
							</a> <b class="info_name_f"> 아이디 </b>

							<c class="info_date">2020-11-25 23:56:08 </c>


							<span class="info_star"> <img
								src="./resources/image/detail_img/star.png"
								class="afterWord_star"> <img
								src="./resources/image/detail_img/star.png"
								class="afterWord_star"> <img
								src="./resources/image/detail_img/star.png"
								class="afterWord_star">
							</span>

							<d class="info_delete">
							<a href="#">삭제</a></d>
						</div>

						<div class="info_content">후기후기 내용내용 후기후기 내용내용 후기후기 내용내용</div>

						<hr class="info_line">


					</div>
					<!--    afterWord_Wrap    -->

				</section>






				<!--     후기  Section         -->
				<section>
					<div class="afterWord_Wrap">

						<div class="media-left">
							<a href="#"> <img
								src="./resources/image/detail_img/profile.png">
							</a> <b class="info_name_f"> 아이디 </b>

							<c class="info_date">2020-11-25 23:56:08 </c>


							<span class="info_star"> <img
								src="./resources/image/detail_img/star.png"
								class="afterWord_star"> <img
								src="./resources/image/detail_img/star.png"
								class="afterWord_star"> <img
								src="./resources/image/detail_img/star.png"
								class="afterWord_star">
							</span>

							<d class="info_delete">
							<a href="#">삭제</a></d>
						</div>

						<div class="info_content">후기후기 내용내용 후기후기 내용내용 후기후기 내용내용</div>

						<hr class="info_line">


					</div>
					<!--    afterWord_Wrap    -->

				</section>


				<span id="com-toggle" onclick="openComment()">
				
				<ul class="pagination">
              <li class="page-item"><a class="page-link" routerLink="/recipe-archive">후기작성</a></li>
            </ul>
            </span>







				<!-- -    -----------------     후기작성  디테일  -------------------------       -->



				<div class="coment_write" id="coment_write">

					<div class="comentForm_head">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h5 class="modal-title">
							<span class="glyphicon glyphicon-circle-arrow-right"></span> <strong>후기작성</strong>
						</h5>
					</div>
					<!--   comentForm_head     -->


					<div class="modal-body" style="max-height: 852px; height: 852px;">


						<form name="commentFrom" id="commentFrom" method="" action="">

							<!-- 	<input type="hidden" name="q_mode" value="insert">  -->

							<div class="container">
								<div class="D_goods_box">


									<div class="order_table_box">
										<table width="100%" cellspacing="0" cellpadding="0">
											<colgroup>
												<col width="60px">
												<col>
												<col>
											</colgroup>
											<tbody>
												<tr>

													<th class="thclass">평가</th>
													<td class="star_mark">
													<a id="" href="#" class="dropdown-toggle" data-toggle="dropdown"
														aria-haspopup="true" role="button" aria-expanded="true">
															<div id="star" style="display: inline;">
																<img src="./resources/image/detail_img/star.png">
																<img src="./resources/image/detail_img/star.png">
																<img src="./resources/image/detail_img/star.png">
																<img src="./resources/image/detail_img/star.png">
																<img src="./resources/image/detail_img/star.png">
															</div>
															
															<span class="caret"></span>
															
													</a>
														<ul id="menu3" class="dropdown-menu" role="menu"
															aria-labelledby="">
															<li role="presentation" onclick="doStar(5)"><span
																class="view2_review_star" id="star5"> <img
																	src="./resources/image/detail_img/star.png"> <img
																	src="./resources/image/detail_img/star.png"> <img
																	src="./resources/image/detail_img/star.png"> <img
																	src="./resources/image/detail_img/star.png"> <img
																	src="./resources/image/detail_img/star.png">
															</span></li>
															<li role="presentation" onclick="doStar(4)"><span
																class="view2_review_star" id="star4"> <img
																	src="./resources/image/detail_img/star.png"> <img
																	src="./resources/image/detail_img/star.png"> <img
																	src="./resources/image/detail_img/star.png"> <img
																	src="./resources/image/detail_img/star.png"> <img
																	src="./resources/image/detail_img/star_off.png">
															</span></li>
															<li role="presentation" onclick="doStar(3)"><span
																class="view2_review_star" id="star3"> <img
																	src="./resources/image/detail_img/star.png"> <img
																	src="./resources/image/detail_img/star.png"> <img
																	src="./resources/image/detail_img/star.png"> <img
																	src="./resources/image/detail_img/star_off.png">
																	<img src="./resources/image/detail_img/star_off.png">

															</span></li>
															<li role="presentation" onclick="doStar(2)"><span
																class="view2_review_star" id="star2"> <img
																	src="./resources/image/detail_img/star.png"> <img
																	src="./resources/image/detail_img/star.png"> <img
																	src="./resources/image/detail_img/star_off.png">
																	<img src="./resources/image/detail_img/star_off.png">
																	<img src="./resources/image/detail_img/star_off.png">
															</span></li>
															<li role="presentation" onclick="doStar(1)"><span
																class="view2_review_star" id="star1"> <img
																	src="./resources/image/detail_img/star.png"> <img
																	src="./resources/image/detail_img/star_off.png">
																	<img src="./resources/image/detail_img/star_off.png">
																	<img src="./resources/image/detail_img/star_off.png">
																	<img src="./resources/image/detail_img/star_off.png">
															</span></li>
														</ul></td>
												</tr>
												<tr>
													<td colspan="2" style="padding-left: 14px;">
														<hr> <textarea id="txComment" class="form-control"
															placeholder="내용을 입력하세요."
															style="height: 300px; resize: none; text-align: left;">
													</textarea>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!--    order_table_box     -->


									<hr>



									<div class="story_write_pic" style="padding: 0px 0px 0px;">

										<div id="add_imgs" class="complete_pic">
											<img src="https://recipe1.ezmember.co.kr/img/pic_none3.gif"
												alt="파일첨부" width="150" height="150"
												onclick="document.getElementById('file_1').click();"
												style="cursor: pointer;">
										</div>


										<div id="img_dd" class="complete_pic" style="display: none;">
											<img id="attach_imgs"
												src="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7"
												width="150" height="150">
										</div>
									</div>
									<!--    story_write_pic    -->


									<p style="text-align: center; border-top: 1px solid #e2e2e2">
										<button type="button" class="cmbt cmbt-primary"
											style="width: 15%;" id="comment_BT_close">취소</button>
										<button type="button" onclick="doSubmit()"
											class="cmbt cmbt-primary" style="width: 15%;" id="comment_BT">저장</button>
									</p>


								</div>
								<!--    D_goods_box    -->

							</div>
							<!--  container   -->

							<iframe class="comment_de" name="comment_de" frameborder=0
								framespacing=0 marginheight=0 marginwidth=0 scrolling=yes
								vspace=0></iframe>

							<!-- 	<iframe src="#" name="epBootstrapIframe_i0kjn" style="" width="100%"
				height="100%" frameborder="0" scrolling="auto"></iframe> -->



						</form>
						<!--   commentFrom     -->

					</div>
					<!--    modal-body    -->

				</div>
				<!--  coment_write   -->





















			</div>
			<!--   second_ct   -->

		</div>
		<!--    jumbotron my-4   -->






	</div>
	<!-- /.row -->

	</div>
	<!-- /.container -->
	







  
  
  
  <app-footer1>
  
  
<!-- Newsletter start -->
  <section class="section light-bg bg-cover" style="background-image:url('./resources/img/bg/1.jpg')">
    <div class="container">
      <div class="section-title-wrap section-header text-center">
        <h2 class="title">Subscribe to My Newsletter</h2>
        <p class="subtitle">
          Get access to my latest recipes by joining the weekly newsletter
        </p>
      </div>

      <form class="ct-newsletter" method="post">
        <input type="email" class="form-control" placeholder="Enter your email address" value="">
        <button type="button" class="btn-custom primary" name="button"> Submit <i class="far fa-paper-plane"></i> </button>
      </form>

    </div>
  </section>
  <!-- Newsletter End -->

  <!-- Instagram Start -->
  <div class="row no-gutters">
    <div class="col-lg-2 col-md-4 col-sm-4 col-6 p-0">
      <a href="javascript:void(0)" class="ct-ig-item">
        <img src="./resources/img/ig/1.jpg" alt="ig">
      </a>
    </div>
    <div class="col-lg-2 col-md-4 col-sm-4 col-6 p-0">
      <a href="javascript:void(0)" class="ct-ig-item">
        <img src="./resources/img/ig/2.jpg" alt="ig">
      </a>
    </div>
    <div class="col-lg-2 col-md-4 col-sm-4 col-6 p-0">
      <a href="javascript:void(0)" class="ct-ig-item">
        <img src="./resources/img/ig/3.jpg" alt="ig">
      </a>
    </div>
    <div class="col-lg-2 col-md-4 col-sm-4 col-6 p-0">
      <a href="javascript:void(0)" class="ct-ig-item">
        <img src="./resources/img/ig/4.jpg" alt="ig">
      </a>
    </div>
    <div class="col-lg-2 col-md-4 col-sm-4 col-6 p-0">
      <a href="javascript:void(0)" class="ct-ig-item">
        <img src="./resources/img/ig/5.jpg" alt="ig">
      </a>
    </div>
    <div class="col-lg-2 col-md-4 col-sm-4 col-6 p-0">
      <a href="javascript:void(0)" class="ct-ig-item">
        <img src="./resources/img/ig/6.jpg" alt="ig">
      </a>
    </div>
  </div>
  <!-- Instagram End -->

  <!-- Footer Start -->
  <footer class="ct-footer footer-2">
    <div class="container">
      <div class="footer-widget">
        <ul class="social-media">
          <li> <a href="javascript:void(0)"> <i class="fab fa-facebook-f"></i> </a> </li>
          <li> <a href="javascript:void(0)"> <i class="fab fa-twitter"></i> </a> </li>
          <li> <a href="javascript:void(0)"> <i class="fab fa-pinterest-p"></i> </a> </li>
          <li> <a href="javascript:void(0)"> <i class="fab fa-linkedin-in"></i> </a> </li>
        </ul>
      </div>
      <div class="footer-widget">
        <ul>
          <li> <a href="javascript:void(0)">Breakfast</a> </li>
          <li> <a href="javascript:void(0)">Desserts</a> </li>
          <li> <a href="javascript:void(0)">Dinner</a> </li>
          <li> <a href="javascript:void(0)">Dairy</a> </li>
        </ul>
      </div>
      <div class="footer-bottom">
        <div class="container">
          <p class="m-0">&copy; Copyright 2020 - <a href="javascript:void(0)">AndroThemes</a> All Rights Reserved.</p>
        </div>
      </div>
    </div>
  </footer>
  <!-- Footer End -->

  
  
  </app-footer1>
  
  
 </app-root> 
 
</body>
</html>
