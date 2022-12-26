<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Class_Payment</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/img/favicon.ico">
  
  

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/class_payment.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/class_payment_min.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/class_payment_style.css" media="all" />




  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/class_payment.js"></script>


  
  <!--********** 【 js 링크 걸기 】********** -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js" type="text/javascript" charset="utf-8"></script>

<script src="${pageContext.request.contextPath}/resources/js/plugins/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

    
  
</head>
<body>
 
  
<app-root>
  

  
    <!-- ------------------- 클래스 결제  ---------------------  -->
  
  
  
  <form class="writeForm" action="index">
  <!-- Page Content -->
  <div class="container">
  
   
	

	
	<div class="jumbotron my-4">
		
						
		
			<div class="payOkWrap">
					<img src="${pageContext.request.contextPath}/resources/image/class_payment/pay_ok.png" class="okImg">
					
					<h1> 클래스 등록이 완료되었습니다. </h1>
					
			</div>
						
		
		
		<hr class="line1">
				
				<div class="btn_pay_wrap"> 
	               <button type="submit">확인</button>
	            
	            </div>


			</div> <!--   jumbotron my-4  -->


	 </div><!-- /.container -->
 
 
</form> 
 
 
  
  
 </app-root> 
 
 
</body>
</html>
