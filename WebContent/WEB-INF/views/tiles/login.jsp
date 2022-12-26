<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>login</title>
<!--   <base href=""> -->
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
  

<!-- Login FormStart -->
  <section class="section auth-section bg-cover" style="background-image: url('')">
    <div class="container">
      <form name="form" class="auth-form light-bg" method="post" action ="login.do" style="background-image: url('')">
        <h1>Login</h1>
        <div class="form-group">
          <label>ID</label>
          <input type="text" class="form-control" placeholder="ID" name="mem_id" value="">
        </div>
        <div class="form-group">
          <label>Password</label>
          <input type="password" class="form-control" placeholder="Password" name="mem_pwd" value="">
        </div>
        <div class="auth-controls form-group">
<!--           <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="rememberMe">
            <label class="custom-control-label fw-400" for="rememberMe">Remember Me</label>
          </div> -->
<!--           <a href="info_change" class="btn-link fw-400">Forgot Password?(수정예정)</a>
        </div> -->
        <div class="form-group">
          <button type="submit" id="loginSubmit" name="loginSubmit" class="btn-custom primary btn-block">login</button>
        </div>
        <p class="form-group text-center">계정이 없으십니까? <a href="signup" class="btn-link">회원가입</a> </p>
      </form>
    </div>
  </section>
  <!-- Login Form End -->
  
 </app-root> 
 
</body>
<script>
	window.onload = function(){
		document.getElementById('loginSubmit').onclick = check;	
	}
	
	function check(){
		if(document.form.MEM_ID.value==""){
			alert("ID를 입력하세요.")
			document.form.MEM_ID.focus();
			return false;
		}
		
		if(document.form.MEM_PWD.value==""){
			alert("비밀번호를 입력하세요.")
			document.form.MEM_PWD.focus();
			return false;
		}
		document.form.submit();//전송
		
	}
</script>
</html>

