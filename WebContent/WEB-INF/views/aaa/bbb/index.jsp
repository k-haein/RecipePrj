<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>      
    
    
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Recipe Site</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css" media="all" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style_main.css" media="all" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index_main.css" media="all" /> 

<link rel="author" href="https://plus.google.com/113101541449927918834"/>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600' rel='stylesheet' type='text/css'>

 
  
  <!--********** 【 js 링크 걸기 】********** -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<!-- <script src="./resources/js/main.js" type="text/javascript" charset="utf-8"></script>
 -->
<script src="${pageContext.request.contextPath}/resources/js/plugins/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script src="jquery.counterup.min.js"></script>
  
  
  
</head>

<body>
   
<app-root>
  

<app-header2> 


<header _ngcontent-efm-c6="" class="main-header header-2 header-absolute">
		<nav _ngcontent-efm-c6="" class="navbar">
			<div _ngcontent-efm-c6="" class="container">
				<a _ngcontent-efm-c6="" routerlink="#" class="navbar-brand"
					href="#"> 
					<img _ngcontent-efm-c6="" src="${pageContext.request.contextPath}/resources/image/main/logo_main.png"></a>
				<ul _ngcontent-efm-c6="" class="navbar-nav">
					<li _ngcontent-efm-c6="" class="menu-item menu-item-has-children">
						<a _ngcontent-efm-c6="" href="index" class="headText">Main</a>					
					</li>
					
					<li _ngcontent-efm-c6="" class="menu-item menu-item-has-children">
					<a ngcontent-efm-c6="" href="recipe_list" class="headText">Recipe</a>
					</li>
						
						
					<li _ngcontent-efm-c6="" class="menu-item menu-item-has-children">
						<a _ngcontent-efm-c6="" href="chef_recipe_list" class="headText">Chef Recipe</a>
					</li>
					<li _ngcontent-efm-c6="" class="menu-item menu-item-has-children"><a
						_ngcontent-efm-c6="" href="ranking" class="headText">Ranking</a>
						</li>
						
						<li _ngcontent-efm-c6="" class="menu-item menu-item-has-children">
						<a ngcontent-efm-c6="" href="class_main" class="headText">Class</a>
						</li>												
					<li _ngcontent-efm-c6="" class="menu-item"><a
						_ngcontent-efm-c6="" routerlink="/shop"
						href="shop" class="headText">Shop</a></li>
					<li _ngcontent-efm-c6="" class="menu-item"><a
						_ngcontent-efm-c6="" routerlink="/contactus"
						href="contact_us" class="headText">Contact Us</a></li>
					<li _ngcontent-efm-c6="" class="menu-item">
					<a ngcontent-efm-c6="" href="login" class="loginBT"> <img src="${pageContext.request.contextPath}/resources/image/main/signup_off_white.png"></a>
						
                   
                  <c:if test="${sessionScope.memNo != null}">
                   <ul _ngcontent-efm-c6="" class="submenu">
                          
                     <li _ngcontent-efm-c6="" class="menu-item">
                     <c:choose>
                     <c:when test="${sessionScope.memGrade_no == '일반인'}"><a ngcontent-efm-c6="" href="Mypage">MyPage</a></c:when>
                     <c:when test="${sessionScope.memGrade_no == '쉐프'}"><a ngcontent-efm-c6="" href="Mypage_chef">Mypage_chef</a></c:when>
                     </c:choose>
                     </li> 
                         
                  	</c:if>
                             
                  </ul>
					</li>	
					<c:if test="${sessionScope.memNo != null}">			
					<li _ngcontent-efm-c6="" class="menu-item menu-item-has-children"><a
						_ngcontent-efm-c6="" href="recipe_upload"><img src="${pageContext.request.contextPath}/resources/image/main/Normal_writeBT_white.png"></a>
					</li>
					<c:if test="${sessionScope.memGrade_no == '쉐프'}">
					<li _ngcontent-efm-c6="" class="menu-item">
					<a ngcontent-efm-c6="" href="signup" class="loginBT"> <img src="${pageContext.request.contextPath}/resources/image/main/class_writeBT_white.png"></a>
						<ul _ngcontent-efm-c6="" class="submenu">
							<li _ngcontent-efm-c6="" class="menu-item"><a
								_ngcontent-efm-c6="" href="chef_recipe_upload">Chef_Write</a></li>
							<li _ngcontent-efm-c6="" class="menu-item"><a
								_ngcontent-efm-c6="" href="class_write">Class_Write</a></li>
								
						</ul>
					</li>
					</c:if>	
					</c:if>
				</ul>
		
			</div>
		</nav>
		
		 
    <div class="container">
   

      <form class="ct-newsletter" method="post">
        <input type="email" class="form-control" placeholder="Enter Recipe Name" value="">
        <button type="button" class="btn-custom primary" name="button"> Search <i class="far fa-paper-plane"></i> </button>
      </form>

    </div>
  
		
	</header> 
	
	</app-header2>
  
<!-- Banner Start -->
  <div class="banner banner-video dark-overlay">
    <video autoplay muted loop id="myVideo">
      <source src="${pageContext.request.contextPath}/resources//vids/video04.mp4" type="video/mp4">
    </video>
    <div class="container">

      <div class="banner-item">
        <div class="banner-inner text-center">
        
        
       	  
          <h1 class="title text-white"> popular&nbsp;<span class="custom-primary">&nbsp; Recipe </span>  
           <p class="subtitle text-white">${recipeList.recipe_title}</p>
         <a href="recipe_detail?recipe_no=${recipeList.recipe_no}" class="btn-custom primary shadow-none">Move <i class="fas fa-arrow-right"></i> </a>
       
        </h1>
    
        
          <span>&nbsp;</span>
        </div>
      </div>

    </div>
  </div>
  <!-- Banner End -->





<!--      첫번째   섹션       -->

  <!-- Categories Section Start -->
  <div class="section section-padding ct-categories ct-categories-3">
    <div class="container">      
      <div class="row">
      
      
		<!--     section    -->
        <div class="col-lg-3 col-md-4 col-sm-6">
          <a href="getFood?kind_tag_no=10" class="ct-category">
            <div class="ct-category-img">
              <img src="${pageContext.request.contextPath}/resources/image/main/mainProduct_01.png" alt="category">
              <span>Korean food</span>  
            </div>
            <div class="ct-category-info">
              <h5>한식</h5>
              <p>Who said korean food can't be delicious</p>
            </div>
          </a>
        </div>
        
        
        
	<!--     section    -->
        <div class="col-lg-3 col-md-4 col-sm-6">
          <a href="getFood?kind_tag_no=20" class="ct-category">
            <div class="ct-category-img">
              <img src="${pageContext.request.contextPath}/resources/image/main/mainProduct_02.png" alt="category">
              <span>Western food</span>  
            </div>
            <div class="ct-category-info">
              <h5>양식</h5>
              <p>Who said Western food can't be delicious</p>
            </div>
          </a>
        </div>
        
        
        
	<!--     section    -->
        <div class="col-lg-3 col-md-4 col-sm-6">
            <a href="getFood?kind_tag_no=30" class="ct-category">
            <div class="ct-category-img">
              <img src="${pageContext.request.contextPath}/resources/image/main/mainProduct_03.png" alt="category">
              <span>Japanese food</span>
            </div>
            <div class="ct-category-info">
              <h5>일식</h5>
              <p>Who said Japanese food can't be delicious</p>
            </div>
          </a>
        </div>
        
        
	<!--     section    -->
        <div class="col-lg-3 col-md-4 col-sm-6">
           <a href="getFood?kind_tag_no=40" class="ct-category">
            <div class="ct-category-img">
              <img src="${pageContext.request.contextPath}/resources/image/main/mainProduct_04.png" alt="category">
              <span>Chinese food</span>
            </div>
            <div class="ct-category-info">
              <h5>중식</h5>
              <p>Did someone say Chinese food? We got it here</p>
            </div>
          </a>
        </div>
        
        
	<!--     section    -->        
        <div class="col-lg-3 col-md-4 col-sm-6">
           <a href="getFood?kind_tag_no=50" class="ct-category">
            <div class="ct-category-img">
              <img src="${pageContext.request.contextPath}/resources/image/main/mainProduct_05.png" alt="category">
              <span>Asian food</span>
            </div>
            <div class="ct-category-info">
              <h5>아시안</h5>
              <p>Did someone say Asian food? We got it here</p>
            </div>
          </a>
        </div>
        
        
	<!--     section    -->        
        <div class="col-lg-3 col-md-4 col-sm-6">
           <a href="getFood?kind_tag_no=60" class="ct-category">
            <div class="ct-category-img">
              <img src="${pageContext.request.contextPath}/resources/image/main/mainProduct_06.png" alt="category">
              <span>Vegetarian</span>
            </div>
            <div class="ct-category-info">
              <h5>Vegan</h5>
              <p>Did someone say vegan burgers? We got it here</p>
            </div>
          </a>
        </div>
        
        
	<!--     section    -->        
        <div class="col-lg-3 col-md-4 col-sm-6">
           <a href="getFood?kind_tag_no=70" class="ct-category">
            <div class="ct-category-img">
              <img src="${pageContext.request.contextPath}/resources/image/main/mainProduct_07.png" alt="category">
              <span>Fast food</span>
            </div>
            <div class="ct-category-info">
              <h5>Quick food</h5>
              <p>Who said Quick food can't be delicious</p>
            </div>
          </a>
        </div>
        
        
	<!--     section    -->        
        <div class="col-lg-3 col-md-4 col-sm-6">
           <a href="getFood?kind_tag_no=80" class="ct-category">
            <div class="ct-category-img">
              <img src="${pageContext.request.contextPath}/resources/image/main/mainProduct_08.png" alt="category">
              <span>Sweet</span>
            </div>
            <div class="ct-category-info">
              <h5>Dessert</h5>
              <p>Who said Dessert can't be delicious</p>
            </div>
          </a>
        </div>
      </div>
    </div>
  </div>
  <!-- Categories Section End -->



<!--      두번째   섹션       -->



  <!-- Blog Posts Start -->
  <section class="section pt-0 section-padding posts">
    <div class="container">
      <div class="section-title-wrap section-header">
       <h2 > Best<span class="custom-primary">&nbsp; Class </span>
<!--         <h2 class="title_1"> Best</h2> <h3 class="title_2"> Class </h3>
 -->   
      </div>
      <div class="row masonry">



	<!--    section    -->
<c:choose> 

		<c:when test="${!empty mainList}">
		
			<c:forEach var="list" items="${mainList}" begin="0" end="3">     



        <!-- Post Start -->
        <div class="col-lg-6 col-md-6 masonry-item">
         <c:if test="${sessionScope.memNo == null}">
              클래스는 로그인 후 이용 가능하십니다.
              </c:if>
          <article class="post">
            <div class="post-thumbnail">
             
            
            <c:if test="${sessionScope.memNo != null}">
              <a href="class_detail?class_no=${list.class_no}"><img src="${pageContext.request.contextPath}/resources/images/FoodImg/${list.class_thumbnail}" alt="blog post"></a>
            </c:if>
            <c:if test="${sessionScope.memNo == null}">
               <a href="#">
               <img src="${pageContext.request.contextPath}/resources/image/FoodImg/${list.class_thumbnail}" alt="blog post">
               </a>
            </c:if>  
              <div class="post-meta">
                <span>${list.class_uploadtime}</span>
                <span>${list.member.mem_nickname}</span>
                <span>view : ${list.view_cnt}</span>                
              </div>
              
            </div>
            
            <div class="post-categories">
              <dd1> ${list.kindtag.kind_tag_name}</dd1>
              <dd1> ${list.material.material_tag_name}</dd1>
              <dd1>  ${list.themetag.theme_tag_name}</dd1>           
            </div>
                        
 
            <div class="post-body">
            
              <h5 class="post-title"> <a routerLink="/blog-single-v1">${list.class_title}</a> </h5>
                                          
            </div>
          </article>
        </div>
        <!-- Post End -->


		</c:forEach>
		
	</c:when>
	
</c:choose>

    

      </div>
    </div>
  </section>
  <!-- Blog Posts End -->
 
  
  
<!--     ------------------   footer 영역    -------------------        -->
 <app-footer1>


<!-- Newsletter start -->
  <section class="section light-bg bg-cover" style=" background-image:url('${pageContext.request.contextPath}/resources/image/main/footBackImg_03.png')">


  </section>
  <!-- Newsletter End -->
  

  <!-- Footer Start -->
  <footer class="ct-footer footer-2">
  
      
                      
                      
  	<div class="raw align-items-center mt-70">
  	
  	
                <!-- Single Cool Fact -->
                 <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="${pageContext.request.contextPath}/resources/image/core-img/salad.png" alt="">
                        <h3><span class="counter">${count}</span></h3>
                        <h6>Recipe</h6>
                    </div>
                </div>

                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="${pageContext.request.contextPath}/resources/image/core-img/hamburger.png" alt="">
                        <h3><span class="counter">${chefcount}</span></h3>
                        <h6>Chef Recipe</h6>
                    </div>
                </div>

                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="${pageContext.request.contextPath}/resources/image/core-img/rib.png" alt="">
                        <h3><span class="counter">${classcount}</span></h3>
                        <h6>Class</h6>
                    </div>
                </div>


                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="${pageContext.request.contextPath}/resources/image/core-img/pancake.png" alt="">
                        <h3><span class="counter">${memcount}</span></h3>
                        <h6>Member</h6>
                    </div>
                </div>
                
                                
                
                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                
              
                    <div class="single-cool-fact">                  
                  	
                    <a href="mailto:abc@naver.com" class="mailGoBT">
           				 <img src="${pageContext.request.contextPath}/resources/image/core-img/mail.png" alt="">
                    </a>                    
                        <h6>쉐프등업</h6>                        
                    </div>
                </div>
                
                 <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                              
                    <div class="single-cool-fact">    
                                  
                     <span class="warringPop">
           			  <img src="${pageContext.request.contextPath}/resources/image/main/popChef.png" alt=""> 
                     </span>              
                                 
                    </div>
                </div>
                
            </div>
  				
  				
  				<script type="text/javascript">
  				
  				$(document).ready(function(){

  					$(".warringPop").hide();
  				
  				
		  			  $('.mailGoBT').hover(function(){
		  				  
		  			        $(".warringPop").css('display','block');
		  			        
		  			    }, function() {
		  			    	
		  			        $(".warringPop").css('display','none');
		  			        
		  			    });

  				});

  				
  				</script>
  
  </footer>
  
 </app-footer1> 
 
 
  
 </app-root> 
 
</body>
</html>
