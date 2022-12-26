<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>나의 레시피</title>
<!--   <base href=""> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="./resources/img/favicon.ico">
  


<link rel="stylesheet" type="text/css" href="./resources/css/header.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/main.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/style.css" media="all" />



<!-- 따로 추가 -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.3.1/css/all.min.css" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->

<!-- 
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/bootstrap.min.css" media="all" /> 

 
<link rel="stylesheet" type="text/css" href="./resources/css/primary-skin.css" media="all" />

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
  
  
<!--  
  -->
  
  
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
                
			   <!-- Blog Posts Start -->
			  <div class="section section-padding posts">
			    <div class="container">
				<h4>내 레시피 목록</h4>
			      <div class="row">
			        <div class="col-lg-10">
			
			          <div class="row masonry">
			
			            <!-- Post Start -->
			            <c:forEach var="listr" items="${listr}">
			            <div class="col-lg-6 col-md-6 masonry-item">
			              <article class="post">
			                <div class="post-thumbnail">
			                  <a href="recipe_detail?recipe_no=${listr.recipe_no}"><img src="${pageContext.request.contextPath}/resources/image/recipe_upload/${listr.recipe_thumbnail}"  
									style="height: 200px; width: 300px;"/></a>			                  
			                  <div class="post-meta">
			                    <span>${listr.recipe_uploadtime}</span>
			                    <span>조회 ${listr.visit_cnt}회</span>
			                  </div>
			                </div>
			                <div class="post-categories">
			                  <a href="recipe_list">
			                  <c:set var="kind_tag_no" value="${listr.kind_tag_no}" />
		
								<c:if test="${kind_tag_no eq 10}">
									한식
								</c:if>
								<c:if test="${kind_tag_no eq 20}">
									양식
								</c:if>	
								<c:if test="${kind_tag_no eq 30}">
									일식
								</c:if>	
								<c:if test="${kind_tag_no eq 40}">
									중식
								</c:if>	
								<c:if test="${kind_tag_no eq 50}">
									아시안
								</c:if>	
								<c:if test="${kind_tag_no eq 60}">
									Vegan
								</c:if>	
								<c:if test="${kind_tag_no eq 70}">
									Quick Food
								</c:if>	
								<c:if test="${kind_tag_no eq 80}">
									Dessert
								</c:if>	
								<c:if test="${kind_tag_no eq 90}">
									기타
								</c:if>
							</a>
			                </div>
			                <div class="post-body">
			                  <h5 class="post-title"> <a href="recipe_detail?recipe_no={listc.recipe_no}">${listr.recipe_title}</a> </h5>
			                   <p class="post-text">${listr.recipe_content}</p>
			                </div>
			                
			              </article>
			            </div>
			            </c:forEach>
			            
			            
			            <!-- Post End -->
			            
			
			
			          </div>
			
			        </div>
			      </div>
						    <!-- Pagination Start -->
            
				            <ul class="pagination" id="pageTd">				            
							<%-- page 처리  --%>
							<%@include file="pageProcess_myRecipe.jsp" %>
				            </ul>
				                        
				          <!-- Pagination End -->
			    </div>

			  </div>
			  <!-- Blog Posts End -->
                
                
                <!--Content  End-->
                </div>
            </div>
           
           			             
           
           
           
         </div>
            </div>			
</section>
  <!--마이페이지 End -->

  
 </app-root> 
 
</body>
</html>
