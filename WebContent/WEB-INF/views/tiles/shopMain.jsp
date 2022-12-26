<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Cookiteer</title>
<!--   <base href="/"> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" >
  

<link rel="stylesheet" type="text/css" href="./resources/css/store_header.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/store_styles.c63_shop.css" media="all" />
<!-- <link rel="stylesheet" type="text/css" href="./resources/css/shop_Inquiry.css" media="all" /> -->
<link rel="stylesheet" type="text/css" href="./resources/css/sotre_menu.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/tabStyles.css" media="all"/>



  
  <!--********** 【 js 링크 걸기 】********** -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<!-- 
<script src="./resources/js/main.js" type="text/javascript" charset="utf-8"></script>
 -->

<script src="./resources/js/plugins/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/isotope.pkgd.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.countdown.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.magnific-popup.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.slimScroll.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.steps.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/popper.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/slick.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/waypoint.js" type="text/javascript" charset="utf-8"></script> 
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript" src="./resources/js/scripts.js"></script>





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


</script>



</head>

<body>


		
<!-- Subheader Start -->
  <div class="subheader bg-cover dark-overlay dark-overlay-2" style="background-image: url('${pageContext.request.contextPath}/resources/img/storeBack.jpg')" id="shop_img">
  <!-- <div class="d7">
			<form>
			  <input type="text" placeholder="검색어 입력">	
			  <button type="submit"><img src="resources/img/search1.png" ></button>  
			</form>			
		</div> -->
		
    <div class="container">
      <div class="subheader-inner">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <!-- <li class="breadcrumb-item"><a routerLink="/shop">Home</a></li> -->
            
			            <form method="post" action="shop">
			
<!-- 						<select name="searchType" style="height: 50px; padding: 8px 15px; border-radius: 8px; border: 1px solid #efefef; width: 40%;  -->
<!-- 	      											color: #6e6e6e; border-color: #e5e1dc;background-color: #fff; letter-spacing: 0.1px; font-size: 15px;"> -->
<!-- 							<option value="2">검색</option> -->
<!-- 						</select>  -->
						<li><input name="searchValue" class="form-control" placeholder="식자재를 검색해 주세요"> &emsp;
						<input type="submit" value="Search" class="btn-custom primary"></li>
			
						</form>
						
            <!-- <li class="breadcrumb-item active" aria-current="page">Shop</li> -->
          </ol>
        </nav>
      </div>
    </div>
    
  </div>
  
  <!-- Subheader End -->
  
  	
<div id="cont">
  	<form method="post" action="shop">

<!-- 			<select name="searchType" > -->
<!-- 				<option value="2">검색</option> -->
<!-- 			</select>  -->
			<input name="searchValue" class="form-control" placeholder="식자재를 검색해 주세요"> 
			<input type="submit" value="Search" class="btn-custom primary">

		</form>

		
	</div>	
	<ul class="sidenav" id="sidenav">
	<c:forEach var="listv" items="${list}">
				
                <li class="cart-item" id="cart-item">
                  <img src="resources/img/products/cup.jpg" alt="product">
                  <div class="cart-item-body" id="cart-item-body">
                    <a href="javascript:void(0)">${listv.str_pro_name}</a>
                    <span class="custom-secondary">${listv.str_pro_primecost}원</span>
                  </div>                  
                </li>
                </c:forEach>
                
                <li class="cart-buttons">
                  <a href="checkOut" class="btn-custom primary btn-sm shadow-none">Checkout</a>
                  <a href="storeCart" class="btn-custom secondary btn-sm shadow-none">View Cart</a>
                </li>                      
		</ul>
		
  <section class="section section-padding posts">
  <!--  
  <div class="tabSet" id="search_category">
  
		<div id="material">
              <a href="storeCategory?shop_category_no=10">고기류</a>
              <a href="storeCategory?shop_category_no=20">수산물</a>
              <a href="storeCategory?shop_category_no=30">과일류</a>
              <a href="storeCategory?shop_category_no=40">채소류</a>
     
              </div>
	
</div>
-->
    <div class="container">
		
      <div class="row">

        <div class="col-lg-12">

         <!-- Toggle & Filter Start -->
				
				
				<!-- Toggle & Filter End -->
          <form class="storeForm" action="product_detail" method="get">
			
		
          <div class="row">
          <c:forEach var="list" items="${list}">
            <!-- Product Start -->
            <div class="col-md-4">
              <div class="ct-product">
              
                <div class="ct-product-thumbnail">
                  <a href="product_detail"><img src="${pageContext.request.contextPath}/../recipeAdmin_00/resources/image/${list.str_pro_image}" alt="product"></a>
                  <div class="ct-product-controls">
                  	<!-- <input type = "submit" value="Buy Now" class="btn-custom secondary"><i class="fas fa-arrow-right"></i></input>-->
                  	<a href="product_detail?str_pro_no=${list.str_pro_no}" class="btn-custom secondary">Buy Now <i class="fas fa-arrow-right"></i> </a>                  
                  </div>
                </div>              
                <div class="ct-product-body">              
                  <h5 class="product-title"> <a href="product_detail?str_pro_no=${list.str_pro_no}">${list.str_pro_name}</a> </h5>
                  
                  <p class="product-price custom-secondary">${list.str_pro_primecost}원</p>
                  <p class="product-text">${list.str_pro_content}</p>
                </div>
                
              </div>
              
            </div>
            </c:forEach>
               
             </div>
          
         
          </form>
          
           <!-- /panels -->
		
          <!-- Pagination Start -->
            
          <!-- Pagination End -->
        

        <!-- Sidebar Start -->
        
        <!-- Sidebar End -->

      </div>
		<!-- /tabset -->
	</div>

	</div>

    
    <ul class="pagination">
		<tfoot class="page-link">
				<tr >
					<td colspan="4" id="pageTd" class="page-item">
						<%-- page 처리  --%>
						<%@include file="pageProcess.jsp" %>
					</td>
				</tr>
		</tfoot>
	</ul>
  </section>
  
   <!-- Newsletter start  -->
  <app-footer1>
 
  <!--     ------------------   footer 영역    -------------------        -->

<!-- Newsletter start -->
 
  <!-- Newsletter End -->

  <!-- Footer Start -->
  
  <!-- Footer End -->
  

  
  
  </app-footer1>
   </body>
</html>