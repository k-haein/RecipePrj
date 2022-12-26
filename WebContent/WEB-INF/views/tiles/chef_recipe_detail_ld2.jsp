<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Chef Recipe_detail</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="./resources/img/favicon.ico">
  
  
  
<link rel="stylesheet" type="text/css" href="./resources/css/header.css" media="all" />
<link href="./resources/css/chef_recipe_detail_ld.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./resources/css/chef_recipe_detail_min_ld.css" media="all" /> 
<link rel="stylesheet" type="text/css" href="./resources/css/chef_recipe_detail_style_ld.css" media="all" />
  
  
  

  
  <!--********** 【 js 링크 걸기 】********** -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="./resources/js/main.js" type="text/javascript" charset="utf-8"></script>

<script src="./resources/js/plugins/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>




<!-- Bootstrap core JavaScript -->
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/chef_recipe_detail.js"></script>
<script src="./resources/js/recipe_detail_bundle.js"></script>










<!--           상세 정보  접기 / 펼치기  자스.     -->







<script>

function openComment() {
	if (document.getElementById('coment_write').style.display === 'block') {
		document.getElementById('coment_write').style.display = 'none';		
		event.preventDefault ? event.preventDefault()
				: (event.returnValue = false);

	} else {
		document.getElementById('coment_write').style.display = 'block';		
		event.preventDefault ? event.preventDefault()
				: (event.returnValue = false);

	}
}

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
  
  
  <style>
#star img {
	width: 12px;
	margin: -1px 1px 0 0;
}

.order_table_box {
	
}

.order_table_box table {
	
}

.order_table_box tr {
	border-bottom: 1px solid #e2e2e2;
}

.order_table_box tr:last-child {
	border-bottom: none;
}

.order_table_box th, .order_table_box td {
	font-size: 14px;
}

.order_table_box th {
	color: #666;
	font-weight: normal;
	padding: 10px 0 10px 14px;
}

.order_table_box td {
	padding: 10px 0 10px 8px;
}

.order_table_box td:last-child {
	padding-right: 14px;
}

.order_price_total {
	font-size: 16px;
	text-align: right;
	padding: 12px 15px 20px;
	border-top: 1px solid #e2e2e2;
}

.order_price_total span {
	color: #000;
	padding-right: 10px;
	font-weight: bold;
}

.order_price_total b {
	color: #73b142;
}

.order_table_box .star_mark {
	position: relative;
}

.order_table_box .star_mark a {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 12px;
	line-height: 1.8;
	color: #555555;
	background-color: #ffffff;
	background-image: none;
	border: 1px solid #cccccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
}

.order_table_box .star_mark a span {
	float: right;
	margin: 8px 4px;
}

.order_table_box .star_mark .dropdown-menu {
	width: 100%;
	position: relative
}

.order_table_box .star_mark .dropdown-menu li {
	padding: 2px 14px;
}

.view2_review_star img {
	width: 12px;
	margin: -1px 1px 0 0;
}
</style>
  
  
  
  
</head>
<body>
 
  
<app-root>


<app-header2> 


<!-- Aside (Mobile Navigation) -->
  <aside class="main-aside">
  <!--   <a class="navbar-brand" href="index"> <img src="./resources/image/main/logo.png"> </a> -->

    <div class="aside-scroll">
      <ul>
        <li class="menu-item menu-item-has-children">
          <a href="index">Main</a>          
        </li>
        <li class="menu-item menu-item-has-children">
          <a href="recipe_list">Recipe</a>        
        </li>
        <li class="menu-item menu-item-has-children">
          <a href="chef_recipe_list">Chef Recipe</a>        
        </li>
        <li class="menu-item menu-item-has-children">
          <a href="class_main">Class</a>       
        </li>
        <li class="menu-item menu-item-has-children">
          <a href="ranking">Ranking</a>          
        </li>
        <li class="menu-item">
          <a href="shop_component">Shop</a>
        </li>
        <li class="menu-item">
          <a href="contact_us">Contact Us</a>
        </li>
        <li class="menu-item">
          <a href="login" class="loginBT"> <img src="./resources/image/main/signup_off.png"> 
          </a>
           <ul class="submenu">
                <li class="menu-item"> <a href="Mypage">My Page</a> </li>
            </ul>
        </li>
         <li class="menu-item">
          <a href="class_write" class="loginBT"> <img src="./resources/image/main/class_writeBT.png">                    
          </a>
         <ul class="submenu">
          	<li class="menu-item"> <a href="recipe_upload">Normal_Write</a> </li>
                <li class="menu-item"> <a href="chef_recipe_upload">Chef_Write</a> </li>
                <li class="menu-item"> <a href="class_write">Class_Write</a> </li>
              </ul>
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
        <a class="navbar-brand" href="index"> <img src="./resources/image/main/logo.png"> </a>
        <!-- Menu -->
        <ul class="navbar-nav">
          <li class="menu-item menu-item-has-children">
            <a href="index">Main</a>           
          </li>
          <li class="menu-item menu-item-has-children">
            <a href="recipe_list">Recipe</a>         
          </li>
          <li class="menu-item menu-item-has-children">
            <a href="chef_recipe_list">Chef Recipe</a>
            </li>
          <li class="menu-item menu-item-has-children">
            <a href="class_main">Class</a>           
          </li>
          <li class="menu-item menu-item-has-children">
            <a href="ranking">Ranking</a>       
          </li>
          <li class="menu-item">
            <a href="shop_component">Shop</a>
          </li>
          <li class="menu-item">
            <a href="contact_us">Contact Us</a>
          </li>
          
           <li class="menu-item">
          <a href="login" class="loginBT"> <img src="./resources/image/main/signup_off.png">          
          </a>
            <ul class="submenu">
                <li class="menu-item"> <a href="Mypage">My Page</a> </li>
            </ul>
         </li>
        
         <li class="menu-item">
          <a href="recipe_upload" class="loginBT"> <img src="./resources/image/main/Normal_writeBT.png">          
          </a>          
        </li>        
        
         <li class="menu-item">
          <a href="class_write" class="loginBT"> <img src="./resources/image/main/class_writeBT.png">          
          </a>
          <ul class="submenu">
                <li class="menu-item"> <a href="chef_recipe_upload">Chef_Write</a> </li>
                <li class="menu-item"> <a href="class_write">Class_Write</a> </li>
              </ul>
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
                  <a href="checkOut" class="btn-custom primary btn-sm shadow-none">Checkout</a>
                  <a href="storeCart" class="btn-custom secondary btn-sm shadow-none">View Cart</a>
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





<!--  --------------------------  클래스 디테인  메일  ---------------------------  -->




<!-- Page Content -->
	<div class="container">



		<!-- ------------------- Header content---------------------  -->
		<header class="jumbotron my-4">
				
				<p class="popBT"><img src="./resources/image/detail_img/pop.png"></p>
				
				<p class="reportBT"> 
					<a href="#"><img src="./resources/image/detail_img/report.png"></a>
				</p>				
			
			
			
	
		<!-- ------------------- 신고작성 디테일---------------------  -->
						
		<div class="report-content">
		      <div class="report-header">
		        <h4 class="report-title">Chef Recipe Title_제목</h4>
		    <button type="button" class="reportXBT" data-dismiss="modal" aria-label="Close">X</button> 
		      </div>
		      <div class="report-body">
		        <textarea id="errorCont" class="form-control" rows="3" placeholder="이런! 레시피에 문제가 있나요? 자세한 내용을 남겨주시면 신속하게 처리하겠습니다." style="height:260px;"></textarea>
		      </div>
		    <div class="report-footer">
		        <button type="button" class="reportcloseBT" data-dismiss="modal">취소</button>
		        <button type="button" class="reportsubmitBT" onclick="submitError()">전송</button>
		      </div>   
   		 </div> 
		<!-- ------------------- 신고작성 디테일---------------------  -->
						
			
			
		
			<h1 class="display-3">Chef Recipe Title_제목</h1>


			<div class="detail_img">
				<img src="./resources/image/food_Product/foodProduce_01.png" class="classProduct">		
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


			<p class="lead">레시피 설명. 레시피 설명. 레시피 가르칠 것 설명</p>

			<hr>
			<div class="detail_time">
				<div class="detail_icon_img">
					<span> <img src="./resources/image/detail_img/clock.png">
						<p1> 조리 시간 </p1> <p2> 10 </p2> <p3>분 </p3>
					</span> <span> <img src="./resources/image/detail_img/level.png">
						<p1> 난이도 </p1> <p2> Easy  </p2> 
					</span>
					<span>
						<p class="postBt"> 
							<a routerlink="/recipe-detail">스크랩</a>
						</p>
					</span>
					<span>
						<p class="postBt"> 
							<a routerlink="/recipe-detail">구독</a>
						</p>
					</span>
						
		
		</header>


		<!-- ------------------- Header content---------------------  -->


		<!--       재료 보기      -->

		<div class="jumbotron my-4">

	<!--       재료 보기  헤드      -->
			<div class="show_class">
				<img src="./resources/image/detail_img/detail_icon_02.png">
				<p3>재료 보기</p3>
				<hr>
			</div>

				

				<!--     재료 소개       -->
			
			<div class="show_class_prop_1" id="show_class_prop_1">

					<div id="c_recipe">
						<div>
							<span class="c_t1">재료</span>							
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
					</div> 
					
					
				</div>   <!--    show_class_prop    -->
			
</div>


	<!--       재료 보기      -->









		<!-- ------------------- 영상---------------------  -->


		<!--       영상 보기      -->

		<div class="jumbotron my-4">

	<!--       영상 보기  헤드      -->
			<div class="show_class">
				<img src="./resources/image/detail_img/detail_icon_03.png">
				<p3>영상 보기</p3>
				<hr>
			</div>
			
			
			<!--   ------------     section  ------------     -->
		
			
			
				<div id="show_class_content_video">
			
					<div class="show_freeVideo"> 					
					
						<span class="video_cn"> 
							<iframe width="560" height="315"
									src="https://www.youtube.com/embed/rL-Po0VnjXk" frameborder="0"
									allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
						</span>
					
					</div> <!-- show_freeVideo  -->
										
				</div>  <!--   show_class_content_video   -->
			



</div>









		<!-- ------------------- 조리순서 ---------------------  -->

		<div class="jumbotron my-4">
			<div class="second_ct">

				<!--    second hader    --> 
				<span id="toc-toggle" onclick="openCloseToc()">
					<div class="second_header">
						<img src="./resources/image/detail_img/detail_icon.png">
						<p3>조리 순서</p3>
						
						<hr>
					</div>
				</span>


				<div class="show_class_prop_1" id="show_class_prop_1">
				
						<div id="c_step">
						
							<!--     조리 순서  section  -->						
							<div class="c_s">
								감자는 얇게 채 썰어 준비한다.<br> Tip) 감자는 약 0.2mm~0.3mm 정도로 잘라요. 너무
								두꺼우면 익히는 시간도 오래걸려요.
							</div>
							
							<!--     조리 순서  section  -->	
							<div class="c_s">
								양파, 당근도 감자와 같은 크기로 채 썰어 준비한다.<br> Tip) 당근은 색감을 내기위해 사용하기도
								하니 생략해도 좋아요.
							</div>
							
							<!--     조리 순서  section  -->	
							<div class="c_s">
								감자는 찬물에 2~3번 헹궈내고 약 10분정도 담가 전분기를 제거한다.
							</div>
							
							<!--     조리 순서  section  -->	
							<div class="c_s">
								물에 담가놓은 감자는 채반을 이용해 물기를 제거한다.<br> Tip) 키친타월을 이용해 물기를 더 닦아
								주어도 좋아요.
							</div>
							
							<!--     조리 순서  section  -->	
							<div class="c_s">
								예열된 팬에 기름을 4숟가락 두르고 양파와 당근을 넣어 볶는다.<br> Tip) 센불로 약 1분간 볶아요.
							</div>
							
							<!--     조리 순서  section  -->	
							<div class="c_s">
								양파가 살짝 투명해 지면 감자를 넣어 볶는다.<br> Tip) 중불로 약 2분간 볶아요.
							</div>
							
							<!--     조리 순서  section  -->	
							<div class="c_s">
								소금, 후추로 간을 해 감자가 익을때 까지 약 2~3분간 더 볶는다.<br> Tip) 감자의 굵기에 따라
								시간을 조절해 주세요.
							</div>
							
							<!--     조리 순서  section  -->	
							<div class="c_s">
								마지막으로 깨소금을 뿌려 섞어 완성한다.
							</div>
						
													
						</div> <!--  c_step   -->
						
						
					</div> <!--  show_class_prop_1   -->
					
					
					
					
					<!--     태그        -->
						 
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
							
						 
						 
						 
						 
			</div> 	<!--    second_ct    -->

		</div> 	<!--    jumbotron my-4    -->





		<!-- -------------------   후기  ---------------------  -->

		<div class="jumbotron my-4">
			<div class="second_ct">


				<!--     second hader   -->
				<div class="second_header">
					<img src="./resources/image/detail_img/detail_icon_04.png">
					<p3>레시피 후기</p3>
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
							<a href="#">
							
							 <img
								src="./resources/image/rank_img/product07.jpg">
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
															<!-- 
															<span class="caret"></span> -->
															
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
	

  
  
  
<!-- Newsletter start  -->
  <app-footer1>
    
  																<!--    이미지 변경하고 싶으면 footBackImg_06.png <--여기를 01~06중 골라쓰세요  -->
  <section class="section light-bg bg-cover" style="background-image:url('./resources/image/main/footBackImg_05.png')">
    
    <div class="container">
      <div class="section-title-wrap section-header text-center">
        <d1 class="foot_title">Recipe Search</d1>       
      </div>

      <form class="ct-newsletter" method="post">
        <input type="email" class="form-control" placeholder="Search the recipe" value="">
        <button type="button" class="btn-custom primary" name="button"> Search <i class="far fa-paper-plane"></i> </button>
      </form>

    </div>
  </section>
  
  <!-- Footer Start -->
  <footer class="ct-footer footer-2">
  
  
   <div class="row align-items-center mt-70">
                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="./resources/image/core-img/salad.png" alt="">
                        <h3><span class="counter">1287</span></h3>
                        <h6>Recipe</h6>
                    </div>
                </div>

                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="./resources/image/core-img/hamburger.png" alt="">
                        <h3><span class="counter">25</span></h3>
                        <h6>Chef Recipe</h6>
                    </div>
                </div>

                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="./resources/image/core-img/rib.png" alt="">
                        <h3><span class="counter">471</span></h3>
                        <h6>Class</h6>
                    </div>
                </div>

                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="./resources/image/core-img/pancake.png" alt="">
                        <h3><span class="counter">326</span></h3>
                        <h6>Affiliates</h6>
                    </div>
                </div>
            </div>
      
    
  </footer>
  <!-- Footer End -->

  
  
  </app-footer1>
  
  
 </app-root> 
 
</body>
</html>
