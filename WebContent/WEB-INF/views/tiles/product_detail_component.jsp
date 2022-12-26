<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Cookiteer</title>
<!--   <base href="/"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon">




<link rel="stylesheet" type="text/css"
	href="./resources/css/store_header.css" media="all" />
<link rel="stylesheet" type="text/css"
	href="./resources/css/main_shop.css" media="all" />
<link rel="stylesheet" type="text/css"
	href="./resources/css/style_shop.css" media="all" />
<link rel="stylesheet" type="text/css"
	href="./resources/css/plugins/sotre_detail_menu.css" media="all" />






<!--********** 【 js 링크 걸기 】********** -->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="./resources/js/main.js" type="text/javascript"
	charset="utf-8"></script>

<script src="./resources/js/plugins/bootstrap.min.js"
	type="text/javascript" charset="utf-8"></script>



<script src="./resources/js/plugins/isotope.pkgd.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.countdown.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.magnific-popup.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.slimScroll.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.steps.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery-3.4.1.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/popper.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/slick.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="./resources/js/plugins/waypoint.js" type="text/javascript"
	charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.js"></script>

<!--  
  -->
 <script type="text/javascript">
	
$('#checkOut').click(function(){
	location="checkOut";
});
</script>
<script>

$(document).ready(function(){
	$("#sidenav").hide();
	$('#cartBT').click(function(){
		
		$("#sidenav").toggle();		
		});
	$("#cont").hide();
	$('#searchBT').click(function(){		
		$("#cont").toggle();	
	});
	

});
	
<!--       카트 인서트         -->

	function test(){
		var strProNo = $("#cart_str_pro_no").val();
		var quantity = $("#quantity").val();
		$.ajax({
		     url: "addCart",
		     type: "POST",
		     data: {
		    	 str_pro_no : strProNo,
		    	 str_cart_cnt : quantity 
		     },
		     success: function(result) {
		    	 alert("장바구니에 담았습니다.");
		     }
		   });
	};
<!----   카트 인서트       ------>

$("#my_IMG").change(function(){
    if(this.files && this.files[0]) {
     var reader = new FileReader;
     reader.onload = function(data) {
      $(".ct-product-thumbnail a").attr("src", data.target.result).width(500);        
     }
     reader.readAsDataURL(this.files[0]);
    }
   });

</script>
<style>
a {
	text-decoration: none;
	color: gray;
}

#star_grade a.off {
	text-decoration: none;
	color: gray;
}

#star_grade a.on {
	color: red;
}

#star_result a.on {
	color: red;
}

#star_result a.off {
	color: gray;
}
</style>

</head>
<body>
	<app-header1> <app-header1> <!-- Aside (Mobile Navigation) -->
	<div class="aside-overlay aside-trigger"></div>

	<!-- Aside (Mobile Navigation) -->
	<aside class="main-aside">
		<a class="navbar-brand" routerLink="/"> <img
			src="assets/img/logo.png" alt="logo">
		</a>

		<div class="aside-scroll">
			<ul>
				<li class="menu-item menu-item-has-children"><a
					href="javascript:void(0)">Home Pages</a>
					<ul class="submenu">
						
					</ul></li>
				<li class="menu-item menu-item-has-children"><a
					href="javascript:void(0)">Blog</a>
					<ul class="submenu">
						<li class="menu-item menu-item-has-children"><a
							routerLink="/blog-grid">Blog Archive</a>
							<ul class="submenu">
								
							</ul></li>
						<li class="menu-item menu-item-has-children"><a
							routerLink="/blog-single-v1">Blog Single</a>
							</li>
					</ul></li>
				<li class="menu-item menu-item-has-children"><a
					href="javascript:void(0)">Pages</a>
					<ul class="submenu">
						
					</ul></li>
				<li class="menu-item menu-item-has-children"><a
					href="javascript:void(0)">Recipes</a>
					<ul class="submenu">
						
					</ul></li>
				<li class="menu-item"><a href="shop">Shop</a></li>
		
				</li>





			</ul>

		</div>

	</aside>
	<div class="aside-overlay aside-trigger"></div>

	<!-- Header Start --> <!-- <header class="main-header header-1 can-sticky">
		<nav class="navbar">
			<div class="container">
				Logo
				<a class="navbar-brand" routerLink="/"> <img
					src="assets/img/logo.png" alt="logo">
				</a>
				Menu
				<ul class="navbar-nav">
					<li class="menu-item menu-item-has-children"><a
						href="javascript:void(0)">Home Pages</a>
						
						</ul></li>
					<li class="menu-item menu-item-has-children"><a
						href="javascript:void(0)">Blog</a>
						<ul class="submenu">
							
							
								
						</ul></li>
					<li class="menu-item menu-item-has-children"><a
						href="javascript:void(0)">Pages</a>
						<ul class="submenu">
							<li class="menu-item"><a routerLink="/aboutus">About Us</a>
							</li>
							<li class="menu-item"><a routerLink="/login">Login</a></li>
							<li class="menu-item"><a routerLink="/signup">Sign Up</a></li>
							<li class="menu-item"><a routerLink="/checkout">Checkout</a>
							</li>
							<li class="menu-item"><a routerLink="/cart">Cart</a></li>
							<li class="menu-item"><a href="product-detail.component">Product
									Details</a></li>
						</ul></li>
					<li class="menu-item menu-item-has-children"><a
						href="javascript:void(0)">Recipes</a>
						<ul class="submenu">
							<li class="menu-item"><a routerLink="/recipe-archive">Recipe
									Archive</a></li>
							<li class="menu-item"><a routerLink="/recipe-detail">Recipe
									Details</a></li>
						</ul></li>
					<li class="menu-item"><a href="shop">Shop</a></li>
					
				</ul>

				<div class="header-controls">
					<div class="cart_bnt">
		<ul class="header-controls-inner">
        
			<i class="cart_dropdown">             
			 	<img src="resources/img/cart.png" id="cartBT">               
			</i>
			 
		<li class="search-dropdown-wrapper search-trigger" id="search_form">
              <i class="flaticon-magnifying-glass"><img src="resources/img/search1.png" id="searchBT"></i>
            </li>
		<li class="search-dropdown-wrapper search-trigger" id="search_form">
              <a href="https://tracker.delivery/#/kr.epost/1111111111111%22%20target=%22_blank">
              <img src="resources/img/car.png"></a>
            </li>
		</ul>	
		
	</div>
	


							<ul class="cart-dropdown">
								<li class="cart-item"><img src="assets/img/products/1.png"
									alt="product">
									<div class="cart-item-body">
										<a href="javascript:void(0)">Red Tea Pot With Black
											Handles</a> <span class="custom-secondary">2x 18.00$</span>
									</div></li>
								<li class="cart-item"><img src="assets/img/products/2.png"
									alt="product">
									<div class="cart-item-body">
										<a href="javascript:void(0)">Oak Wood Cutting Board</a> <span
											class="custom-secondary">1x 24.25$</span>
									</div></li>
								<li class="cart-subtotal">
									<p>
										<strong>Subtotal: </strong> 54.25$
									</p>
								</li>
								<li class="cart-buttons"><a routerLink="/checkout"
									class="btn-custom primary btn-sm shadow-none">Checkout</a> <a
									routerLink="/cart"
									class="btn-custom secondary btn-sm shadow-none">View Cart</a></li>
							</ul></li>
						<li class="search-dropdown-wrapper search-trigger">
							 
              <i class="flaticon-magnifying-glass">
              
              <img src="./resources/img/.png"> 
              
              </i>
             
						</li>
					</ul>



					Toggler
					<div class="aside-toggler aside-trigger">
						<span></span> <span></span> <span></span>
					</div>
				</div>
			</div>
		</nav>

		Search Form Start
		<div class="search-form-wrapper" id="search">
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
		Search Form End


	</header> --> <!-- Header End --> </app-header1> </app-header1>
	<!-- Subheader Start -->
	<div class="subheader bg-cover dark-overlay dark-overlay-2"
		style="background-image: url('resources/img/storeBack.jpg')">
		<div class="container">
			<div class="subheader-inner">
				<h1>Product Details</h1>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a routerLink="/product-detail">Home</a></li>
						<li class="breadcrumb-item"><a routerLink="/product-detail">Shop</a></li>
						<li class="breadcrumb-item active" aria-current="page">Product
							Details</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
	<!-- Subheader End -->
<div id="cont">
  	<form method="post" action="shop">

			<select name="searchType">
			
				<option value="2">검색</option>

			</select> <input name="searchValue" class="form-control"> <input type="submit"
				value="Search" class="btn-custom primary">

		</form>

		
	</div>	
	<section class="section product-single pb-0">
		<div class="container">
			<form method="get" action="cartInsert">
			<div class="row">
				<div class="col-lg-4 col-md-5">

					<!-- Main Thumb -->
					
					<div class="product-thumb">
						<img src="${pageContext.request.contextPath}/../recipeAdmin_00/resources/detailImage/${vo.str_pro_detail_image}" alt="product">
					</div>
					<!-- /Main Thumb -->

				</div>
				<div class="col-lg-8 col-md-7">
					<div class="product-content">

						<!-- Product Title -->

						<h2 class="title">${vo.str_pro_name}</h2>
						<input type="hidden" name="cart_str_pro_no" id="cart_str_pro_no" value="${vo.str_pro_no}"> 
						<!-- /Product Title -->

						<!-- Rating -->
						<div class="ct-rating-wrapper">
							<div class="ct-rating">
								<i class="fas fa-star active"></i> <i class="fas fa-star active"></i>
								<i class="fas fa-star active"></i> <i class="fas fa-star active"></i>
								<i class="fas fa-star"></i>
							</div>
							<span>(24 ratings)</span>
						</div>
						<!-- /Rating -->
						<!-- Price -->
						<div class="price-wrapper">
							<p class="product-price custom-secondary">${vo.str_pro_primecost}원</p>
						</div>
						<!-- /Price -->
						<!-- Product Short Description -->
						<p>${vo.str_pro_content}</p>
						
						<!-- /Variations -->

						<!-- Add To Cart Form -->
						
							<div class="form-group">
								<label>수량</label> 
								<input type="number" class="qty form-control" id="quantity" name="quantity" value="1" min="1">
									
							</div>
							<c:if test="${sessionScope.memNo != null}">
							<input type="button" class="btn-custom secondary" id="insertCart" name="insertCart" onclick="test()" value="카트에 담기">
							<!--	<a href="">  <i class="flaticon-shopping-basket"></i>
							 </button> -->
							<button type="button" name="button" class="btn-custom secondary" id="storeCart">
								<a href="storeCart"> 카트 바로가기 <i class="flaticon-shopping-basket"></i></a>
							</button>
							</c:if>

						
						<!-- /Add To Cart Form -->

						<!-- Product Meta -->
						<ul class="product-meta">
							<li><span>Categories: </span>
								<div class="product-meta-item">
									<a routerLink="/product-detail">Utensils</a>
								</div></li>
							<li><span>Tags: </span>
								<div class="product-meta-item">
									<a href="product-detail">Food</a>, <a href="product-detail">Foodie</a>,
									<a href="product-detail">Kitchen Ware</a>
								</div></li>
							<li><span>SKU: </span>
								<div class="product-meta-item">
									<span>N/A</span>
								</div></li>
						</ul>
						<!-- /Product Meta -->

					</div>
				</div>
			</div>
			</form>
			<!-- Additional Information -->
			<div class="product-additional-info">
				<ul class="nav" id="bordered-tab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="tab-product-desc-tab" data-toggle="pill"
						href="#tab-product-desc" role="tab"
						aria-controls="tab-product-desc" aria-selected="true">제품설명</a></li>
					<li class="nav-item"><a class="nav-link"
						id="tab-product-info-tab" data-toggle="pill"
						href="#tab-product-info" role="tab"
						aria-controls="tab-product-info" aria-selected="false">배송/교환/환불</a>
					</li>

					<li class="nav-item"><a class="nav-link"
						id="tab_product_reviews_tab" data-toggle="pill"
						href="#tab-product-reviews" role="tab"
						aria-controls="tab-product-reviews" aria-se$lected="false" id="review">상품후기
							(25)</a></li>

				</ul>
				<div class="tab-content" id="bordered-tabContent">
					<div class="tab-pane fade show active" id="tab-product-desc"
						role="tabpanel" aria-labelledby="tab-product-desc-tab">
						<h4>제품설명</h4>
						${vo.str_pro_content}
					</div>
					<div class="tab-pane fade" id="tab-product-info" role="tabpanel"
						aria-labelledby="tab-product-info-tab">
						<h4>배송/교환/환불</h4>

						<p>배송안내</p>
						<p>- 배송비 : 기본배송료는 3,000원 (도서,산간,오지 일부지역은 배송비가 추가될 수 있습니다)</p>
						<p>- 20,000원 이상 구매시 무료배송</p>
						- 본 상품의 평균 배송일은 1~2일 (입금 확인 후) [배송예정일은 주문시점(주문순서)에 따른 유동성이 발생하므로
						평균 배송일과는 차이가 발생할 수 있습니다.]
						<p>- 본 상품의 배송 가능일은 5일(공휴일제외)일 입니다.</p>
						배송 가능일이란 본 상품을 주문 하신 고객님들께 상품 배송이 가능한 기간을 의미합니다. (단, 연휴 및 공휴일은 기간
						계산시 제외하며 현금 주문일 경우 입금일 기준 입니다.) 환불안내
						</p>
						<p>* 교환/반품
						<p>- 식품 특성상 단순 변심,주소 오류, 연락두절로 인한 환불 및 교환은 불가하오니 주문 전 확인
							부탁드립니다.</p>
						- 교환/반품 요청기간이 지난 경우
						<p>- 구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우(단, 상품의 내용을 확인하기 위하여 포장
							등을 훼손한 경우는 제외)</p>
						- 포장을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우
						<p>- 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</p>
						- 시간의 경과에 의하여 재판매가 곤란할 정도의 상품 등의 가치가 현저히 감소한 경우
						<p>- 고객주문 확인 후 상품제작에 들어가는 주문제작상품</p>


					</div>
					<div class="tab-pane fade" id="tab-product-reviews" role="tabpanel"
						aria-labelledby="tab-product-reviews-tab">
						<h4>상품후기</h4>

						<!-- Review Form start -->
						<div id="container">
							<!-- <form method="post" action="upsave2" enctype="multipart/form-data"> -->
						<form method="post" action="comm_add">
							<table>
								<tbody>
									<tr>
										<td><input type="text" class="form-control" placeholder="Full Name" name="mem_name" id="mem_name" value="${mem_name }"></td>
									</tr>
									<tr>
										<td><input type="email" class="form-control" placeholder="Email Address" name="email" id="email" value="${email }"></td>
									</tr>
									<tr>
										<td><textarea class="form-control" placeholder="Type your comment..." name="store_review_content" id="store_review_content" rows="7" value="${store_review_content }"></textarea></td>
									</tr>
									
									
								</tbody>
								
									
										<input type="hidden" name="mem_name" id="mem_name" value="${mem_name }"> 
										<input type="hidden" name="email" id="email" value="${email}"> 
										<input type="hidden" name="store_review_content" id="store_review_content" value="${store_review_content}"> 
											<input type="hidden" name="score" id="score">
										<table>
											<tr>
												
												<td><p id="star_grade">
														<a href="#1" class="a.off">★</a> <a href="#2"
															class="a.off">★</a> <a href="#3" class="a.off">★</a> <a
															href="#4" class="a.off">★</a> <a href="#5" class="a.off">★</a>
														<span id="target">Total : </span>

													</p></td>
												<td><input type="submit" value="작성하기" id="list"></td>
											</tr>
											
											</table>
											<table>
											<thead>
											<tr>
												<td>이름</td>
												<td>내용</td>
												<td>별점</td>
											</tr>
											</thead>
                                       <tbody>
											
											<c:forEach var="list" items="${result}">
											
										<input type="hidden" name="str_pro_no" id="str_pro_no" value="${list.str_pro_no}">
												<tr>
													<td>${list.mem_name }</td>
													<td>${list.store_review_content }</td>
													<td>${list.score }</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
								
							
							</form>
							<!-- </form> -->
						</div>
					</div>
						
			<!-- Review Form End -->

						<!-- Reviews Start -->
						
						<!--
						<div class="comments-list">
						<c:forEach var="e" items="${clist}">
							<ul>
								<li class="comment-item"><img
									src="assets/img/people/people-2.jpg" alt="comment author">
									<div class="comment-body">
										<h5>${svo.mem_name}</h5>
										<div class="ct-rating">

											
										</div>
										<span>${svo.str_pro_reviewdate}</span>
										<p>${svo.str_pro_review_content}</p>
										<a href="product-detail" class="reply-link"> Reply </a>
									</div></li>
							</ul>
							
						</div>
						-->
						</c:forEach>
						</table>
						</form>
						<!-- Reviews End -->

					</div>

					<!--  문의 교환 환분 배송
        <div class="tab-pane fade show Inquiry" id="tab-product-Inquiry" role="tabpanel" aria-labelledby="tab-product-Inquiry">
            <h4>문의/교환/환불</h4>          
        </div>
           -->
				</div>
				<!-- /Additional Information -->
			</div>
	</section>


	<!-- Related Products Start -->

	<!-- Related Products End -->
	
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
	<script>
	$(function() {
		var total = 1;
		$('#star_grade a').click(function() {
			console.log($(this).attr("href"))
			console.log($(this).attr("class"))

			if ($(this).attr("href") === "#1") {
				total = 2 * 1;
			} else if ($(this).attr("href") === "#2") {
				total = 4 * 1;
			} else if ($(this).attr("href") === "#3") {
				total = 6 * 1;
			} else if ($(this).attr("href") === "#4") {
				total = 8 * 1;
			} else if ($(this).attr("href") === "#5") {
				total = 10 * 1;
			} else {

			}
			console.log("total :" + total);
			$('#target').html("Total : " + total);
			$('#score').val(total);
			$(this).parent().children("a").removeClass("on"); /* 별점의 on 클래스 전부 제거 */
			$(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
			return false;
		});

	});
</script>
</body>
</html>
