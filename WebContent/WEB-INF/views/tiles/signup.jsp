<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>signup</title>
<!--   <base href=""> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="./resources/img/favicon.ico">

<script type="text/javascript" src="./resources/js/jquery-1.7.1.js"></script>
<script  src="./resources/js/Membership.js"></script>


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
  
<!-- Login FormStart -->
  <section class="section auth-section bg-cover" style="background-image: url('assets/img/bg/3.jpg')">
    <div class="container">
      <form name = "userinput" id="userinput" class="auth-form light-bg" action = "register" method="post" style="background-image: url('assets/img/bg/5.jpg')">
        <h1>Sign Up</h1>
        <div class="form-group">
          <label>이름</label>
          <input type="text" class="form-control" placeholder="이름" name="mem_name" value="">
        </div>
        <div class="form-group">
          <label>별명</label>
          <input type="text" class="form-control" placeholder="별명" name="mem_nickname" value="">
        </div>
        <div class="form-group">
          <label>ID</label>
          <input type="text" class="form-control" placeholder="ID" name="mem_id" id="mem_id" value="">
        </div>
         <td>    	
		<input type="button" value="중복확인" id="idChkBtn" style="width: 150px; font-size: 10px; height: 30px;">		
		<span class="box" id="target"></span>
		<td>		       
        <div class="form-group">
          <label>Password</label>
          <input type="password" class="form-control" placeholder="Password" name="mem_pwd" value="">
        </div>
        <div class="form-group">
          <label>주민번호</label>
          <input type="text" class="form-control" placeholder="주민번호" name="mem_juminnum" value="">
        </div>        
        <div class="form-group">
          <label>Email</label>
          <input type="email" class="form-control" placeholder="Email Address" name="mem_email" value="">
        </div>
        <div class="form-group">
          <label>핸드폰번호</label>
          <input type="text" class="form-control" placeholder="핸드폰번호" name="mem_phone" value="">
        </div>


        <div class="auth-controls form-group">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="rememberMe">
            <label class="custom-control-label fw-400" for="rememberMe">회원가입 규정에 <a href="https://kto.visitkorea.or.kr/kor/helpDesk/policy/memberPolicy.kto" onclick="window.open(this.href,'_blank','toolbar=no,scrollbars=yes'); return false;" class="btn-link">동의합니다.</a> </label>
          </div>
        </div>
        <div class="form-group">
          <button type="submit" class="btn-custom primary btn-block">sign up</button>
        </div>
        <p class="form-group text-center">계정이 있으십니까? <a href="login" class="btn-link">로그인</a> </p>
      </form>
    </div>
  </section>
  <!-- Login Form End -->

  
 </app-root> 
 
 <!-- 제이쿼리를 가져오자. -->
   <!-- // jQury에서 id => #, class => . Element => E-->
   <script src = "http://code.jquery.com/jquery-3.5.1.min.js"></script>
   <!-- 콘솔창에 띄워보자. 크롬 F12 누르기 -->
   <script>
   
	    $(function(){
		//확인 다 했으니 버튼에 기능을 입혀보자.
		      //jQury에서 id => #, class => . Element => E
		      $('#idChkBtn').click(function(){
		    	 
		         // 아이디 값이 있는 지 없는지 if문 확인 return
		      $.ajax({
		    	  url:'idChk?mem_id=' + $('#mem_id').val(),
		        success: function(data){
		            //console.log(data);
		            
		            //$.trim : 공백제거 함수
				   //== 안씀. === 쓴다.
		            var msg = '';
		            if($.trim(data)==='1'){
		               msg = "<span style='color:red'>중복된 아이디입니다.</span>";
		            }
		            else{
		               msg = "<span style='color:blue'>사용가능한 아이디입니다.</span>";
		               }
		               //console.log(msg)
		               $('#target').html(msg);
		            
		            }
		        });
		      });
		    
	});
   
   </script>
 
</body>
</html>

