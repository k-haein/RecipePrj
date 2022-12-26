<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="header1" class="hd">
	<!--     ------------------   footer 영역    -------------------        -->

<!-- Newsletter start -->
  <section class="section light-bg bg-cover" style=" background-image:url('${pageContext.request.contextPath}/resources/image/main/footBackImg_03.jpg')">


  </section>
  <!-- Newsletter End -->
  

  <!-- Footer Start -->
  <footer class="ct-footer footer-2">
  
      
                      
                      
  	<div class="raw align-items-center mt-70">
  	
  	
                <!-- Single Cool Fact -->
                 <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="${pageContext.request.contextPath}/resources/image/core-img/salad.png" alt="">
                        <h3><span class="counter" id='recipecnt'></span></h3>
                        <h6>Recipe</h6>
                    </div>
                </div>

                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="${pageContext.request.contextPath}/resources/image/core-img/hamburger.png" alt="">
                        <h3><span class="counter" id='chefrecipecnt'></span></h3>
                        <h6>Chef Recipe</h6>
                    </div>
                </div>

                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="${pageContext.request.contextPath}/resources/image/core-img/rib.png" alt="">
                        <h3><span class="counter" id='classcnt'></span></h3>
                        <h6>Class</h6>
                    </div>
                </div>


                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="${pageContext.request.contextPath}/resources/image/core-img/pancake.png" alt="">
                        <h3><span class="counter" id='membercnt'></span></h3>
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
  <!-- Footer End -->
  

</div>