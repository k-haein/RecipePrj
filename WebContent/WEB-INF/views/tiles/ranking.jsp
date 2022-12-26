<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>      
    
    
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Cookiteer</title>
<!--   <base href="/"> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
  
  


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ranking_min.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/ranking_style.css" media="all" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/magnific-popup.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/slick.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/slick-theme.css" media="all" />


  <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400" rel="stylesheet">


 <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/css/ranking.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/basic.css" rel="stylesheet">


  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/ranking_main.js"></script>


  
  <!--********** 【 js 링크 걸기 】********** -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js" type="text/javascript" charset="utf-8"></script>

<script src="${pageContext.request.contextPath}/resources/js/plugins/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>


  
  
</head>
<body>
 
  
<app-root>
 
   
  
   <!--  ---------------------------------- Content --------------------------------  -->
   
 <form class="Recipe_Rank_Form">
  <div class="container">
  
        <li class="tabMenu1"><a href="#" class="tabMN1">Recipe</a></li>
	 <li class="tabMenu2"><a href="#" class="tabMN2">Class</a></li>
	<li class="tabMenu3"><a href="#" class="tabMN3">Member</a></li>

    <div class="tab_line"></div>
		
		
        
    
<!--    --------------------------- 레시피   랭킹 --------------------------------     -->    

 <div class="row">
    
    
		 <!-- Pagination Start -->
            <ul class="pagination"> </ul>
          <!-- Pagination End -->
            
   	    
			    <!--  -------  레시피  섹션 --------    -->
			    
			    <c:choose> 
					<c:when test="${!empty rkRecipeList}">
						<c:forEach var="list" items="${rkRecipeList}" varStatus="status" begin="0" end="12">    
			    
							    
							    <div class="ranking_form">
							    
							    <p class="ranking_num"><b><c:out value="${list.rank}" /></b></p>
								   
								    <figure class="snip1477">
								    
								    	<span>
								    	조회수: ${list.visit_cnt}회
								    	</span>					    
								    		<!--  취합	시 사진 경로 변경    -->
								    	<img src="${pageContext.request.contextPath}/resources/image/recipe_upload/${list.recipe_thumbnail}" alt="sample38" />
								    	 <div class="title">	 					    	 
									    	  <div>
										    	<h2>${list.recipe_title}</h2><h4>${list.member.mem_nickname}</h4>
									    	   </div>
								    	    </div>
								    	    
								       <figcaption>
								       		<p>${list.recipe_content}</p>
								  	  </figcaption>
								  	 
								   	<a class="ranking_move" href="recipe_detail?recipe_no=${list.recipe_no}"></a>	
								   		   	   	
								</div>      <!--  ranking_form   -->
									    
			    
						</c:forEach>
					</c:when>
				</c:choose>


	</div>
   

  <hr>
  
  
  </div> <!-- container -->

</form> 
    
    
<!--    --------------------------- 레시피   랭킹 --------------------------------     -->    

    
    
    
    
    
<!--    --------------------------- 클래스   랭킹 --------------------------------     -->    
  <form class="Chef_Rank_Form">
  <div class="container">
  
         <li class="tabMenu1"><a href="#" class="tabMN1">Recipe</a></li>
	 <li class="tabMenu2"><a href="#" class="tabMN2">Class</a></li>
	<li class="tabMenu3"><a href="#" class="tabMN3">Member</a></li>

    <div class="tab_line"></div>
		
	<div class="reviewTitle">User Review</div>
	
	
	<div class="slide">
			<ul>				           
			   <li>
			  
		<!--    리뷰 목록 보여주기      -->      
		      	<table class="review_table" width="100%" cellspacing="0"
					cellpadding="0" radius="10">
				<tbody>		
					
				 <c:choose> 
					<c:when test="${!empty rkReviewList}">
						<c:forEach var="rvlist" items="${rkReviewList}" varStatus="status" >     
									
						<tr class="rvtable_line1">
							<td>
								<p4><img src="${pageContext.request.contextPath}/resources/image/member_upload/${rvlist.member.mem_pic}" />		</p4>										
								
							</td>
							
							
							<td> 							
								<p1> ${rvlist.member.mem_nickname} </p1></br>
								 <p2> ${rvlist.review.review_date} </p2>							
							</td>						
							
							
							<td>
								<p3>
									<img src="${pageContext.request.contextPath}/resources/image/FoodImg/${rvlist.class_thumbnail}"  alt="sample38" />
								</p3>
							</td>
							
							<td>
							 <c:if test="${sessionScope.memNo != null}">
								<a href="class_detail?class_no=${rvlist.class_no}">
							</c:if>
							
							 <c:if test="${sessionScope.memNo == null}">
								
							</c:if>
							
								<p1>${rvlist.class_title} </p1></br>
								</a> 							
								 <p2>${rvlist.review.review_content} </p2>							
							</td>	
							<td>
								<img src="${pageContext.request.contextPath}/resources/image/detail_img/star_${rvlist.review.star_rate}.png" alt="sample38" 
								style="width: 100px;"/> 
							</td>						   
						
							</tr>
					    </c:forEach>
						
					</c:when>
				</c:choose>  
	
		     	</tbody>
		     	</table>
		     
		     
	 			</li>		      
		    </ul>
		  </div>  
     
     
     <hr>





 <div class="row">
 
    
    <!--  -------  섹션 --------    -->
    
<div class="reviewTitle">Rate Ranking : 가장 리뷰 점수가 좋은 클래스!</div>
  

 
			<table class="thired_table" width="100%" cellspacing="0"
					cellpadding="0" radius="10">
					<colgroup>
						<col width="">
						<col width="">
						<col width="">
					</colgroup>
					<tbody>						
			 
				  <c:choose> 
						<c:when test="${!empty rkChefList}">
							<c:forEach var="chlist" items="${rkChefList}" varStatus="status" begin="0" end="4">    							
						
						<tr class="table_line1">
							<td>
								<c>
									<c:out value="${chlist.rank}"/>
								</c>
									<p5>									
										
											<img src="${pageContext.request.contextPath}/resources/image/member_upload/${chlist.member.mem_pic}" />									
										
									 </p5>
							</td>
							
							
							<td>
							 	<p1>  ${chlist.member.mem_nickname} </p1></br>
								 <p2> ${chlist.member.mem_email} </p2>
							</td>						
							
							
							<td>
								<p3>
									<img src="${pageContext.request.contextPath}/resources/image/FoodImg/${chlist.class_thumbnail}"  alt="sample38" />
								</p3>
							</td>
							
							<td>
							 <c:if test="${sessionScope.memNo != null}">
							
								<a href="class_detail?class_no=${chlist.class_no}">
																
								<p1>${chlist.class_title}</p1></br>
								</a> 	
								
							</c:if>
							
							 <c:if test="${sessionScope.memNo == null}">
														
																
								<p1>${chlist.class_title}</p1></br>
								</a> 	
								
							</c:if>
							
														
								 <p2>${chlist.class_cooktime}</p2>							
							</td>	
							<td>
								<img src="${pageContext.request.contextPath}/resources/image/detail_img/star_${chlist.review.star_rate}.png" alt="sample38" 
								style="width: 140px;"/> 
							</td>						   
										
				      
							</c:forEach>
							
						</c:when>
					</c:choose>
						
						
						
						</tr>
										
					</tbody>
				</table>
		
	<hr>  
	
        
 <div class="reviewTitle">Pay Ranking! 가장 많이 팔린 클래스!</div>
  
  

			<table class="pay_table" width="100%" cellspacing="0"
					cellpadding="0" radius="10">
					<colgroup>
						<col width="">
						<col width="">
						<col width="">
					</colgroup>
					<tbody>						
			 
				  <c:choose> 
						<c:when test="${!empty payList}">
							<c:forEach var="pylist" items="${payList}" varStatus="status" begin="0" end="4">    							
						
						<tr class="table_line2">
							<td>
							<c>
									<c:out value="${pylist.rank}"/>
								</c>
									<p5>		
										
										
											<img src="${pageContext.request.contextPath}/resources/image/member_upload/${pylist.member.mem_pic}" />									
										
									 </p5>
							</td>
							
							
							<td>
							 	<p1>  ${pylist.member.mem_nickname} </p1></br>
								 <p2> ${pylist.class_uploadtime} </p2>
							</td>						
							
							
							<td>
								<p3>
									<img src="${pageContext.request.contextPath}/resources/image/FoodImg/${pylist.class_thumbnail}"  alt="sample38" />
								</p3>
							</td>
							
							<td>
							 <c:if test="${sessionScope.memNo != null}">
							
								<a href="class_detail?class_no=${pylist.class_no}">
																
								<p1>${pylist.class_title}</p1></br>
								</a> 	
								
							</c:if>
							
							 <c:if test="${sessionScope.memNo == null}">
														
																
								<p1>${pylist.class_title}</p1></br>
								</a> 	
								
							</c:if>
							
														
								 <p2>${pylist.class_cooktime}</p2>							
							</td>	
							<td> 
									 
								  <p2>구매자 : </p2>
								  
								  <p6> ${pylist.payinfo.ct}</p6>
								  
								  <p2> 명</p2>	 
						 
								
							</td>						   
										
				      
							</c:forEach>
							
						</c:when>
					</c:choose>
								
						
						</tr>
										
					</tbody>
				</table>
		        
        
        
         
         
   </div>     <!--    row     --> 
   
  <hr>
  
  </div> <!-- container -->

</form>    
    
    
    
<!--    ---------------------------클래스  랭킹 --------------------------------     -->    
  
  
<!--    --------------------------- 맴버   랭킹 --------------------------------    -->
  
  
<form class="worldCup_Rank_Form">


 <script>
 
 $(".hover").mouseleave(
		  function () {
		    $(this).removeClass("hover");
		  }
		);
 
 
 </script>
 
 

  <div class="container">
  
        <li class="tabMenu1"><a href="#" class="tabMN1">Recipe</a></li>
	 <li class="tabMenu2"><a href="#" class="tabMN2">Class</a></li>
	<li class="tabMenu3"><a href="#" class="tabMN3">Member</a></li>
  <div class="titleWrap">
	
        	<span class="chefRkTitle1">Recipe King</span> 
        	<span class="chefRkTitle2">Class King</span>
        	<span class="chefRkTitle3">Pay King</span> 
 	</div>
 	
	<div class="subWrap" >	       	
 
        	<span class="chefRksub1">레시피를 제일 많이 올린 회원!</span>
        	<span class="chefRksub2">클래스를 제일 많이 올린 회원!</span>
        	<span class="chefRksub3">결제를 제일 많이 한 회원!</span>
 
 	</div>
 	
 	
 <!--    section  -->
<div class="parent">
    
  <div class="first">
        	
        
		 <c:choose> 
				<c:when test="${!empty chRecipeList}">
					<c:forEach var="chRelist" items="${chRecipeList}" varStatus="status" begin="0" end="4">    		
		   	        	
		        	<ul>        	
		        		<li>
		        		<n4><c:out value="${chRelist.rank}"/></n4>
		        		</li>        	
				  		<li>		  		
				  		<figure class="snip1368">
							  <h3>${chRelist.mem_nickname}</h3>
							  <img src="${pageContext.request.contextPath}/resources/image/member_upload/${chRelist.mem_pic}" alt="sample30" />
							  <figcaption>
							    <div class="icons"><a href="#"><i class="ion-social-reddit-outline"></i></a>
							      <a href="#"> <i class="ion-social-twitter-outline"></i></a>
							      <a href="#"> <i class="ion-social-vimeo-outline"></i></a>
							    </div>
							  </figcaption>
							</figure>
						</figure>
				  		</li>		  		
				  				  		
				  		<li>
				  			<n2>
						  	 총 레시피 갯수:
				  			</n2>
				  			
				  			<n1>		  			
						  	 	${chRelist.ct} 개		  			
				  			</n1>
				  		</li>
				  		
			  		</ul>	
			  			  		
				<hr>
			  	  
			    </c:forEach>
		    </c:when>
		 </c:choose>   
		 
 
	</div>
	  	
	  	
	  	
	  	
	  	
   <!--    section  -->      
     
 <div class="second">
        
      	
        
 <c:choose> 
		<c:when test="${!empty chClassList}">
			<c:forEach var="chClasslist" items="${chClassList}" varStatus="status" begin="0" end="4">    		
   	        	
        	<ul>        	
        		<li>
        		<n4><c:out value="${chClasslist.rank}"/></n4>
        		</li>        	
		  		<li>		  		
		  		<figure class="snip1368">
					  <h3>${chClasslist.member.mem_nickname}</h3>
					  <img src="${pageContext.request.contextPath}/resources/image/member_upload/${chClasslist.member.mem_pic}" alt="sample30" />
					  <figcaption>
					    <div class="icons"><a href="#"><i class="ion-social-reddit-outline"></i></a>
					      <a href="#"> <i class="ion-social-twitter-outline"></i></a>
					      <a href="#"> <i class="ion-social-vimeo-outline"></i></a>
					    </div>
					  </figcaption>
					</figure>
				</figure>
		  		</li>		  		
		  				  		
		  		<li>
		  			<n2>
				  	 총 클래스 갯수:
		  			</n2>
		  			
		  			<n1>		  			
				  	 	${chClasslist.cot} 개		  			
		  			</n1>
		  		</li>
		  		
	  		</ul>	
	  			  		
		<hr>
	  	  
	    </c:forEach>
    </c:when>
 </c:choose>   
</div>
        
        
        
        
        
        
<div class="third">
        	
                
 <c:choose> 
		<c:when test="${!empty chPayList}">
			<c:forEach var="chPylist" items="${chPayList}" varStatus="status" begin="0" end="4">    		
   	        	
        	<ul>        	
        		<li>
        		<n4><c:out value="${chPylist.rank}"/></n4>
        		</li>        	
		  		<li>		  		
		  		<figure class="snip1368">
					  <h3>${chPylist.mem_nickname}</h3>
					  <img src="${pageContext.request.contextPath}/resources/image/member_upload/${chPylist.mem_pic}" alt="sample30" />
					  <figcaption>
					    <div class="icons"><a href="#"><i class="ion-social-reddit-outline"></i></a>
					      <a href="#"> <i class="ion-social-twitter-outline"></i></a>
					      <a href="#"> <i class="ion-social-vimeo-outline"></i></a>
					    </div>
					  </figcaption>
					</figure>
				</figure>
		  		</li>		  		
		  				  		
		  		<li>
		  			<n2>
				  	 구매 클래스 갯수:
		  			</n2>
		  			
		  			<n1>		  			
				  	 	${chPylist.ct} 개		  			
		  			</n1>
		  		</li>
		  		
	  		</ul>	
	  			  		
		<hr>
	  	  
	    </c:forEach>
    </c:when>
 </c:choose>   
 
</div>
       
  	
  	
  	
  	
</div>
 
</div> 	  	
 
 </form>
  <!-- container -->

   

  
<!-- Newsletter start  -->

  
 </app-root> 
 
</body>
</html>
