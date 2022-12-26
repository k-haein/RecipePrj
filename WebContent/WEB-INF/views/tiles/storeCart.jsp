<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- saved from url=(0052)http://androthemes.com/themes/angular/cookiteer/cart -->
<!DOCTYPE html>
<html>
  <head>
  <title>Cookiteer</title>
  <!--<base href="/themes/angular/cookiteer/"> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="./resources/image/favicon.ico">
  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_header.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_main.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_style.css" media="all" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_magnific-popup.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_slick.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_slick-theme.css" media="all" />
  
 <style type="text/css">
 #search_category_text{
 	margin: 0 0 0 85%;
 }
 </style>
  
  
  
  
  
    <!--********** 【 js 링크 걸기 】********** -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js" type="text/javascript" charset="utf-8"></script>

<script src="${pageContext.request.contextPath}/resources/js/plugins/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>



<script src="${pageContext.request.contextPath}/resources/js/plugins/isotope.pkgd.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery.countdown.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery.magnific-popup.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery.slimScroll.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery.steps.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/popper.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/slick.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/waypoint.js" type="text/javascript" charset="utf-8"></script>

  
</head> 
<body>   


  <app-root>
  
<app-header2> 

<script>
$(function(){
	$(document).ready(function() {
	   //list();
	 });

	 function list() {
	   var mem_no = ${memNo};
	   $.ajax({
	     url: "storeCart",
	     type: "POST",
	     data: "mem_no="+mem_no,
	     success: function(result) {
	    	console.log(result);
	    	console.log(result[0].str_cart_no);
	    	$('#product_name').text(result[0].str_pro_name);
	    	$('#cartcnt').val(result[0].str_cart_cnt);
	    	$('#price').text(result[0].str_pro_primecost+" 원");
	    	$('#total').text(result[0].str_pro_primecost * result[0].str_cart_cnt+" 원");
	    	$('#sum').text(result[0].str_pro_primecost * result[0].str_cart_cnt+" 원");
	    	var test = result[0].str_pro_primecost + result[0].str_cart_cnt;
	    	
	    	

	    	
	     }
	   });
	 }
	 
	 

});






 


</script>

<!-- Aside (Mobile Navigation) -->
  <aside class="main-aside">
    <a class="navbar-brand" href="index"> <img src="./resources/image/main/logo.png"> </a>

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
  
  <!-- Header End -->


 
<!-- Subheader Start -->
  <div class="subheader bg-cover dark-overlay dark-overlay-2" style="background-image: url('resources/image/main/mainProduct_01.png')">
    <div class="container">
      <div class="subheader-inner">
        <h1>장바구니</h1>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index" style="text-decoration:none">Home</a></li>
            <li class="breadcrumb-item"><a href="shop" style="text-decoration:none">Shop</a></li>
            <li class="breadcrumb-item active" aria-current="page">Cart</li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
  <!-- Subheader End -->

  <!--Cart Start -->



  <section class="section">
    <div class="container">

      <!-- Cart Table Start -->


        <from id="form1" name="form1" method="post" action="">
	      <table class="ct-responsive-table">
	        <thead>
	          <tr>
	            <th class="remove-item"></th>
	            <th>상품</th>
	            <th>가격</th>
	            <th>수량</th>
	            <th>합계</th>
	          </tr>
	        </thead>
	        <tbody>	
	            <ul>
	           	  <li>	

					   <c:set var = "sum" value = "0" />
	           			<c:forEach items='${cart}' var='pro' varStatus="status">  <!-- forEach문 -->
	           			<input type="hidden" value='5'>
	           			<input type="hidden" id="hid_cart_no" name="hid_cart_no" value="${pro.str_cart_no}">
				         <tr>
				            <td class="remove" id="delete"><fa class="close-btn close-danger remove-from-cart" onclick="deleteCart(${pro.str_cart_no})"> <!-- 삭제/체크 -->
				                <span></span>
				                <span></span>
				            </td>
				            <td data-title="Product">
				              <div class="cart-product-wrapper">
				                <a href="#"><img src="${pageContext.request.contextPath}/../recipeAdmin_00/resources/image/${pro.str_pro_image}" alt="prod1" ></a> <!-- alt="img" 상품이미지 -->
				                <div class="cart-product-body">
				                  <h6> <a class="aa-cart-title" href="#"><c:out value="${pro.str_pro_name}"/></a></h6> <!-- 상품명 -->
				                </div>
				              </div>
				            </td>
				            <!--  상품 가격  -->
				            <td><c:out value="${pro.str_pro_primecost}"/></td>
				            <td class="quantity" data-title="Quantity" min="1">
				              <input type="number" id="test${pro.str_cart_no}" class="qty form-control" value="${pro.str_cart_cnt}" onclick="updateCart(${pro.str_cart_no})"/>
				              
				            </td>
				            <!--  상품 합계 가격  -->
				             <td data-title="Total"><c:out value="${pro.sum_str_pro_primecost}"/> 원</td>
				          </tr>  
				          <c:set var= "sum" value="${sum + pro.sum_str_pro_primecost}"/>
						</c:forEach>
			</ul>
       </tbody>
     </table>
   </from>
    
      <!-- Cart Table End -->

      <!-- Cart form Start -->   
      <div class="row ct-cart-form">
        <div class="offset-lg-6 col-lg-6">
          <h4>장바구니 합계</h4>
          <table>
            <tbody>
              <tr>
                <th>합계</th>
                <td><c:out value="${sum}"/> 원</td>
              </tr>
            </tbody>
          </table>
          <a href="checkOut" type="submit" style="text-decoration:none" class="btn-custom primary btn-block" >결제하기</a>
        </div>
      </div> 
      <!-- Cart form End -->

    </div>
  </section>
  <!-- Cart End -->
  
  
  
  
  <app-footer1>
  
<!--     ------------------   footer 영역    -------------------        -->

    </div>
  </section>
  
  
  </app-footer1>
<script>

function deleteCart(result){
	 var str_cart_no = result;
	   $.ajax({
	     url: "deleteCart",
	     type: "POST",
	     data: "str_cart_no="+str_cart_no,
	     success: function(result) {
	     	location.reload();  
	     }
	  });
};

function updateCart(cartNo){
 	 var str_cart_no = cartNo;
	 var str_cart_cnt = $("#test"+cartNo).val();
	   $.ajax({
		     url: "updateCart",
		     type: "POST",
		     data: {
		    	 str_cart_no : str_cart_no,
		    	 str_cart_cnt : str_cart_cnt
		     }, 
		     success: function(result) {
		     	location.reload();  
		     }
	 }); 
};

</script> 

<!-- Newsletter start -->
  
  <!-- Newsletter End -->
  

  <!-- Footer Start -->
  
  <!-- Footer End --> 
  </app-root>
</body>
</html>