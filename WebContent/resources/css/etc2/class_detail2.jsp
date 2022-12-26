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
<link rel="stylesheet" type="text/css" href="./resources/css/main.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/style.css" media="all" />

<link rel="stylesheet" type="text/css" href="./resources/css/plugins/magnific-popup.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/slick.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/slick-theme.css" media="all" />

<!-- 
<link rel="stylesheet" type="text/css" href="./resources/css/primary-skin.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/bootstrap.min.css" media="all" /> 
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/animate.min.css" media="all" />


<link rel="stylesheet" type="text/css" href="./resources/css/plugins/magnific-popup.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/slick.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/slick-theme.css" media="all" />
<!--

-->


  
  <!--********** 【 js 링크 걸기 】********** -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="./resources/js/main.js" type="text/javascript" charset="utf-8"></script>

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
  
  
<!--  
  -->
  
  
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




<!-- Subheader Start -->
  <div class="subheader bg-cover dark-overlay dark-overlay-2" style="background-image: url('./resources/img/subheader.jpg')">
    <div class="container">
      <div class="subheader-inner">
        <h1>Recipe Details</h1>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a routerLink="/recipe-detail">Home</a></li>
            <li class="breadcrumb-item"><a routerLink="/recipe-detail">Recipes</a></li>
            <li class="breadcrumb-item active" aria-current="page">Recipe Details</li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
  <!-- Subheader End -->

  <!-- Recipe Start -->
  <div class="section section-padding single-post-1">
    <div class="container">

      <div class="row">
        <div class="col-lg-8">

          <!-- Content Start -->
          <article class="post-single">
            <div class="post-thumbnail">
              <img src="./resources/img/blog/1.jpg" alt="post">
              <div class="video-player-trigger">
                <a href="https://www.youtube.com/watch?v=TKnufs85hXk" class="popup-youtube">
                  <i class="fas fa-play"></i>
                  <div class="video-player-icons">
                    <i class="flaticon-pot"></i>
                    <i class="flaticon-taco"></i>
                    <i class="flaticon-bread"></i>
                    <i class="flaticon-chef"></i>
                    <i class="flaticon-diet"></i>
                  </div>
                </a>
              </div>
            </div>
            <div class="post-categories">
              <a routerLink="/recipe-detail">Breakfast</a>
            </div>
            <h2 class="title">Puffy Pancakes Glazed With Caramel Topped With Fruits</h2>
            <div class="post-meta">
              <span><i class="fas fa-concierge-bell"></i> 13 Steps</span>
              <span> <i class="far fa-user"></i> Posted by Fredrick Flow</span>
              <div class="recipe-duration">
                  <span><i class="fas fa-stopwatch"></i> 50 mins</span>
                </div>
            </div>
            <div class="post-content">
              <div class="recipe-ingredients">
                <h4>Ingredients</h4>
                <ul class="ct-list">
                  <li>2 cups flour (125 g)</li>
                  <li>¼ cup sugar (50 g), or sweetener of choice</li>
                  <li>4 teaspoons baking powder</li>
                  <li>¼ teaspoon baking soda</li>
                  <li>½ teaspoon salt</li>
                  <li>1 ½ cups milk (355 mL), plus more if needed</li>
                  <li>¼ cup butter (57 g), melted</li>
                  <li>2 teaspoons vanilla</li>
                  <li>1 egg</li>
                  <li>1 cup pumpkin puree (225 g)</li>
                </ul>
              </div>
              <div class="recipe-instructions">
                <h4>Instructions</h4>
                <ul>
                  <li>
                    <h5>Step 1</h5>
                    <p>
                      Combine together the flour, sugar (or sweetener), baking powder, baking soda, and salt in a large-sized bowl.
                    </p>
                  </li>
                  <li>
                    <h5>Step 2</h5>
                    <p>
                      Make a well in the centre and whisk in the milk, slightly cooled melted butter, vanilla and egg. Whisk in the pumpkin puree until smooth.
                    </p>
                  </li>
                  <li>
                    <h5>Step 3</h5>
                    <p>
                      Heat a nonstick pan or griddle over low-medium heat and wipe over with a little butter to lightly grease pan.
                    </p>
                  </li>
                  <li>
                    <h5>Step 4</h5>
                    <p>
                      Pour 1⁄4 cup of batter onto the pan and spread out gently into a round shape with the back of your ladle or measuring cup. When the underside is golden and bubbles begin to
                      appear on the surface, flip with a spatula and cook until golden. Repeat with remaining batter.
                    </p>
                  </li>
                  <li>
                    <h5>Step 5</h5>
                    <p>
                      Serve with your choice of topping.
                    </p>
                  </li>
                </ul>
              </div>

            </div>
          </article>
          <!-- Content End -->

          <!-- Related Products Start -->
          <div class="similar-recipes related">
            <h4>Similar Recipes</h4>
            <div class="row">
              <div class="col-lg-6 col-md-6">
                <div class="recipe">
                  <div class="recipe-thumbnail">
                    <a routerLink="/recipe-detail">
                      <img src="./resources/img/blog/8.jpg" alt="blog post">
                    </a>
                  </div>
                  <div class="recipe-body">
                    <h5 class="recipe-title"> <a routerLink="/recipe-detail">Oat Pancakes With Strawberries and Blueberries </a> </h5>
                    <p class="recipe-text">Some quick example text to build on the card title and make up the bulk of the card's content...</p>
                    <div class="recipe-meta">
                      <div class="recipe-difficulty">
                        <div class="recipe-difficulty-inner">
                          <span class="active"></span>
                          <span class="active"></span>
                          <span></span>
                        </div>
                        <span>Home Cook</span>
                      </div>
                      <div class="recipe-steps">
                        <span><i class="fas fa-concierge-bell"></i> 24 Steps</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-6 col-md-6">
                <div class="recipe">
                  <div class="recipe-thumbnail">
                    <a routerLink="/recipe-detail">
                      <img src="./resources/img/blog/7.jpg" alt="blog post">
                    </a>
                  </div>
                  <div class="recipe-body">
                    <h5 class="recipe-title"> <a routerLink="/recipe-detail">Sugary Pancake with Raspberries, Mint and Cream</a> </h5>
                    <p class="recipe-text">Some quick example text to build on the card title and make up the bulk of the card's content...</p>
                    <div class="recipe-meta">
                      <div class="recipe-difficulty">
                        <div class="recipe-difficulty-inner">
                          <span class="active"></span>
                          <span class="active"></span>
                          <span class="active"></span>
                        </div>
                        <span>Expert Chef</span>
                      </div>
                      <div class="recipe-steps">
                        <span><i class="fas fa-concierge-bell"></i> 47 Steps</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Related Products End -->

          <!-- Comments Start -->
          <div class="comments-list">
            <h4>2 Comments</h4>
            <ul>
              <li class="comment-item">
                <img src="./resources/img/people/people-1.jpg" alt="comment author">
                <div class="comment-body">
                  <h5>John Doe</h5>
                  <span>Posted on: January 13 2020</span>
                  <p>Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition.</p>
                  <a routerLink="/recipe-detail" class="reply-link"> Reply </a>
                </div>
              </li>
              <li class="comment-item">
                <img src="./resources/img/people/people-2.jpg" alt="comment author">
                <div class="comment-body">
                  <h5>John Doe</h5>
                  <span>Posted on: January 13 2020</span>
                  <p>Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches</p>
                  <a routerLink="/recipe-detail" class="reply-link"> Reply </a>
                </div>
              </li>
            </ul>
          </div>
          <div class="comment-form">
            <h4>Leave a Reply</h4>
            <form method="post">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" class="form-control" placeholder="Full Name" name="fname" value="">
                </div>
                <div class="col-md-6 form-group">
                  <input type="email" class="form-control" placeholder="Email Address" name="email" value="">
                </div>
                <div class="col-md-12 form-group">
                  <textarea class="form-control" placeholder="Type your comment..." name="comment" rows="7"></textarea>
                </div>
              </div>

              <button type="button" class="btn-custom primary" name="button">Post comment</button>
            </form>
          </div>
          <!-- Comments End -->

        </div>
        <div class="col-lg-4">
          <div class="sidebar">

            <div class="sidebar-widget">
              <h5>Featured Recipes</h5>

              <div class="recipe featured-recipe">
                <div class="recipe-thumbnail">
                  <a routerLink="/recipe-detail">
                    <img src="./resources/img/blog/7.jpg" alt="blog post">
                  </a>
                </div>
                <div class="recipe-body">
                  <h6 class="recipe-title"> <a routerLink="/recipe-detail">Sugary Pancakes Dressed With Cream and Raspberries</a> </h6>
                  <div class="recipe-meta">
                    <div class="recipe-difficulty">
                      <div class="recipe-difficulty-inner">
                        <span class="active"></span>
                        <span class="active"></span>
                        <span></span>
                      </div>
                      <span>Home Cook</span>
                    </div>
                    <div class="recipe-steps">
                      <span><i class="fas fa-concierge-bell"></i> 24 Steps</span>
                    </div>
                  </div>
                </div>
              </div>

              <div class="recipe featured-recipe">
                <div class="recipe-thumbnail">
                  <a routerLink="/recipe-detail">
                    <img src="./resources/img/blog/11.jpg" alt="blog post">
                  </a>
                </div>
                <div class="recipe-body">
                  <h6 class="recipe-title"> <a routerLink="/recipe-detail">Fig and Raspberry Cake With Sugar Filling and Coating</a> </h6>
                  <div class="recipe-meta">
                    <div class="recipe-difficulty">
                      <div class="recipe-difficulty-inner">
                        <span class="active"></span>
                        <span></span>
                        <span></span>
                      </div>
                      <span>Amateur</span>
                    </div>
                    <div class="recipe-steps">
                      <span><i class="fas fa-concierge-bell"></i> 13 Steps</span>
                    </div>
                  </div>
                </div>
              </div>

            </div>

          </div>
        </div>
      </div>

    </div>
  </div>
  <!-- Recipe End -->

  
  
  
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
