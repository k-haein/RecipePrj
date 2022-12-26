<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>회원정보수정</title>
<!--   <base href=""> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="./resources/img/favicon.ico">
  
<!-- 인포 추가 -->  
 <link href="/maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="./resources/css/info_change.css" media="all" />
<script src="./resources/js/info_change.js" type="text/javascript" charset="utf-8"></script>

<!-- 인포 추가끝 -->

<link rel="stylesheet" type="text/css" href="./resources/css/header.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/main.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/style.css" media="all" />


 

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
  

<!-- info_change Start -->

<div class="container" style="margin-top: 1em;">
    <!-- Sign up form -->
	 <form name="form" method="post" action ="memberupdate"  enctype="multipart/form-data">
        <!-- Sign up card -->
        <div class="card person-card">
            <div class="card-body">
                <!-- Sex image -->
                <img id="img_sex" class="person-img"
                    src="https://visualpharm.com/assets/217/Life%20Cycle-595b40b75ba036ed117d9ef0.svg">
                <h2 id="who_message" class="card-title">회원정보수정</h2>
                <!-- First row (on medium screen) -->
               <div class="row">
                     <div class="form-group col-md-2">
						<input id="mem_id" name="mem_id" value="${sessionScope.memId}" type="text" class="form-control" readonly="readonly" >
                    </div>

                    <div class="form-group col-md-5">
                        <input id="mem_name"  name="mem_name" value="${sessionScope.memName}" type="text" class="form-control" placeholder="Name" required>
                        <div id="first_name_feedback" class="invalid-feedback">
                            
                        </div>
                    </div>
                    <div class="form-group col-md-5">
                        <input id="mem_nickname"  name="mem_nickname" value="${sessionScope.memNickname}" type="text" class="form-control" placeholder="Nickname" reqired>
                        <div id="last_name_feedback" class="invalid-feedback">
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-6" style="padding=0.5em;">
                <div class="card">
                    <div class="card-body">
                        <h2 class="card-title">연락처수정</h2>
                        <div class="form-group">
                            <label for="email" class="col-form-label">Email</label>
                            <input type="email" class="form-control" id="mem_email" name="mem_email"  value="${sessionScope.memEmail}" placeholder="example@gmail.com" required>
                            <div class="email-feedback">
                            
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tel" class="col-form-label">Phone number</label>
                            <input type="text" class="form-control" id="mem_phone" name="mem_phone"  value="${sessionScope.memPhone}" placeholder="01000000000" required>
                            <div class="phone-feedback">
                            
                            </div>
                        </div>
<!--                         <div class="form-group">
                            <label for="tel" class="col-form-label">Address</label>
                            <input type="text" class="form-control" id="addr" placeholder="서울특별시 구로구..." required>
                        </div> -->
                    </div>
                </div>
            </div>
                
            <div class="col-md-6">
                <div class="card"> 
                    <div class="card-body">
                        <h2 class="card-title">비밀번호수정</h2>
                        <div class="form-group">
                            <label for="password" class="col-form-label">비밀번호</label>
                            <input type="password" class="form-control" id="mem_pwd" name="mem_pwd"  placeholder="Type your password" required="">
                            <div class="password-feedback">
                            
                            </div>
                        </div>
<!--                         <div class="form-group"> -->
<!--                             <label for="password_conf" class="col-form-label">주민번호</label> -->
<%--                             <input type="text" class="form-control" id="mem_juminnum" name="mem_juminnum"  value="${sessionScope.memJuminnum}" placeholder="Type your personal num" required> --%>
<!--                             <div class="password_conf-feedback"> -->
                            
<!--                             </div> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>   
 			<div class="col-md-12">
          <div class="card">
               <div class="row">
                    <div class="form-group col-md-8">
                    <label for="tel" class="col-form-label">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;Profile Picture</label>
                        
                        <!-- 사진업로드 -->
                        <input id="mem_pic" name="file"  type="file" class="form-control">                            
                        </div>     

              
                    </div>
                </div>
            </div>
        </div>
         
        <br>
        <div style="margin-top: 1em;">
            <button type="submit" class="btn-custom primary btn-block">회원정보수정</button>
        </div>
        <br>
        </form>
</div>

 </app-root> 
 
</body>
</html>
