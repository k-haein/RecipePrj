<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- saved from url=(0052)http://androthemes.com/themes/angular/cookiteer/cart -->
<!DOCTYPE html>
<html>
  <head>
  <title>Cookiteer</title>
  <!--<base href="/themes/angular/cookiteer/"> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_header.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_main.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_style.css" media="all" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_magnific-popup.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_slick.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_slick-theme.css" media="all" />
  
 <style type="text/css">
 #search_category_text{
 	margin: 0 0 0 85%;
 }
 </style>
  
  
  
  
  
    <!--********** 【 js 링크 걸기 】********** -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js" type="text/javascript" charset="utf-8"></script>

<script src="${pageContext.request.contextPath}/resources/js/plugins/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>



<script src="${pageContext.request.contextPath}/resources/js/plugins/isotope.pkgd.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery.countdown.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery.magnific-popup.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery.slimScroll.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery.steps.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/popper.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/slick.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/waypoint.js" type="text/javascript" charset="utf-8"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


 
 
 
<script>

	$(document).ready(function() {
	   userlist();
	 });

    function userlist() {
    	var mem_no = ${memNo};
    	$.ajax({
 	     url: "checkOut_User",
 	     type: "POST",
 	     data: "mem_no="+mem_no,
 	     success: function(result) {
 	    	console.log(result);
 	    	$('#fname').val(result[0].mem_name);
 	    	$('#phone').val(result[0].mem_phone);
 	    	$('#email').val(result[0].mem_email);
 	     
 	     }
 	   });
 	 }
	
var payMethod = 'card';

function doPayMethod(method)
{
    $("[id^='pm_img_']").each(function(_,item){
        if( item.src.indexOf('_on.png') )
            item.src = item.src.replace('_on.png', '_off.png')
    });        
    $('#pm_img_'+method).attr('src', $('#pm_img_'+method).attr('src').replace('_off.png', '_on.png'));
    payMethod = method;
    $("#hid_pay_select").val(method);
}     



<!--      우편번호 검색        -->
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=addr1]").val(data.zonecode);
           $("[name=addr2]").val(fullRoadAddr);
           
           /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
           document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open();
    
		<!--      우편번호 검색        -->
    
    $("#order").on('click', function(){
    	var memNo = ${memNo};
    	//var name = $("#fname").val();
    	var zipCode = $("#addr1").val();
    	var addr = $("#addr2").val();
    	var phone = $("#phone").val();
    	var email = $("#email").val();
    	//var comment = $("#comment").val();
    	var payInfoType = $("#hid_pay_select").val();
    	if(payInfoType == "trans"){
	    	payInfoType = "계좌이체";     		
    	}else{
    		payInfoType = "카드결제"; 
    	}
    	

    	 $.ajax({
		     url: "chkOut_insert",
		     type: "POST",
		     data: {
		    	 //orderer_name : name,
		    	 mem_no : memNo,
		    	 post_num : zipCode,
		    	 place_addr : addr,
		    	 place_telnum : phone,
		    	 //price_email : email,
		    	 //order_comment : comment,
		    	 pay_info_type : payInfoType
		    	 
		     }, 
		     success: function(result) {
		    	 alert("구매완료");
		    	 location.href="shop";

		     }
	 	});
    	
    });
    

}




</script>
</head>
<body>
<!-- Aside (Mobile Navigation) -->
  <aside class="main-aside">
    <a class="navbar-brand" href="index"> <img src="./resources/image/main/logo.png"> </a>

    <div class="aside-scroll">
      <ul>
        <li class="menu-item menu-item-has-children">
          <a href="index">Main</a>          
        </li>
        <li class="menu-item menu-item-has-children">
          <a href="recipe_list">Recipe</a>        
        </li>
        <li class="menu-item menu-item-has-children">
          <a href="chef_recipe_list">Chef Recipe</a>        
        </li>
        <li class="menu-item menu-item-has-children">
          <a href="class_main">Class</a>       
        </li>
        <li class="menu-item menu-item-has-children">
          <a href="ranking">Ranking</a>          
        </li>
        <li class="menu-item">
          <a href="shop_component">Shop</a>
        </li>
        <li class="menu-item">
          <a href="contact_us">Contact Us</a>
        </li>
        <li class="menu-item">
          <a href="login" class="loginBT"> <img src="./resources/image/main/signup_off.png"> 
          </a>
           <ul class="submenu">
                <li class="menu-item"> <a href="Mypage">My Page</a> </li>
            </ul>
        </li>
         <li class="menu-item">
          <a href="class_write" class="loginBT"> <img src="./resources/image/main/class_writeBT.png">                    
          </a>
         <ul class="submenu">
          	<li class="menu-item"> <a href="recipe_upload">Normal_Write</a> </li>
                <li class="menu-item"> <a href="chef_recipe_upload">Chef_Write</a> </li>
                <li class="menu-item"> <a href="class_write">Class_Write</a> </li>
              </ul>
        </li>
        
      </ul>

    </div>

  </aside>
  <div class="aside-overlay aside-trigger"></div>

  <!-- Header Start -->
  <!-- Header End -->
 
<!-- Subheader Start -->
  <div class="subheader bg-cover dark-overlay dark-overlay-2" style="background-image: url('resources/image/main/mainProduct_01.png')">
    <div class="container">
      <div class="subheader-inner">
        <h1>결제</h1>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="index" style="text-decoration:none">Home</a></li>
            <li class="breadcrumb-item"><a href="shop_component" style="text-decoration:none">Shop</a></li>
            <li class="breadcrumb-item active" aria-current="page" >Checkout</li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
  <!-- Subheader End -->

  <!-- Checkout Start -->
  <section class="section">
    <div class="container">
	
      <form method="post">
      <intut type="hidden" id="hid_pay_select" name="hid_pay_select" val="">
        <div class="row">
          <div class="col-xl-6">
            <!-- Buyer Info -->
            <h4>구매자 정보</h4>
            <div class="row">
              <div class="form-group col-xl-12">
                <label>이름 <span class="text-danger">*</span></label>
                <input type="text" name="fname" id="fname" class="form-control" value="" required="">
              </div>      
              <div class="form-group col-xl-12">
                <label>우편번호 <span class="text-danger">*</label>
                	<input type="text" name="addr1" id="addr1" class="form-control" readonly="readonly"><br>
                		<button type="button" class="btn-custom primary btn-block" onclick="execPostCode();"> 우편번호 검색 </button>
              </div>
              <div class="form-group col-xl-12">
                <label>주소 <span class="text-danger">*</span></label>
                <input type="text" id="addr2" name="addr2" class="form-control" value="" required=""/>
              </div>
              <div class="form-group col-xl-12">
                <label>전화번호 <span class="text-danger">*</span></label>
                <input type="text" name="phone" id="phone" class="form-control" value="" required="">
              </div>
<!--               <div class="form-group col-xl-6">
                <label>E-mail 주소 <span class="text-danger">*</span></label>
                <input type="email" name="email" id="email" class="form-control" value="" required="">
              </div> -->
              <!-- <div class="form-group col-xl-12 mb-0">
                <label>배송요청사항 </label>
                <textarea name="comment" id="comment" rows="3" class="form-control"></textarea>
              </div> -->
            </div>
			
            <!-- /Buyer Info -->

          </div>
          <div class="col-xl-6 checkout-billing">
            <!-- Billing Details -->
            <h4>청구 세부 정보</h4>
            <table class="ct-responsive-table">
              <thead>
                <tr>
                  <th>상품</th>
                  <th>수량</th>
                  <th>합계</th>
                </tr>
              </thead>
             <c:forEach items="${orderInfo}" var="pay" varStatus="status">
              <tbody>
                <tr>
                  <td data-title="Product">
                    <div class="cart-product-wrapper">
                      <img src="${pageContext.request.contextPath}/../recipeAdmin_00/resources/image/${pay.str_pro_image}" alt="prod1">
                      <div class="cart-product-body">
                        <h6> <a routerLink="/checkout"><c:out value="${pay.str_pro_name}" /></a> </h6>
                        <p><c:out value="${pay.str_pro_name}" /></p>
                      </div>
                    </div>
                  </td>
                  <td data-title="Quantity">x <c:out value="${pay.str_cart_cnt}" /></td>
                  <td data-title="Total"><c:out value="${pay.sum_str_pro_primecost}"/> 원</td>
                </tr>
              </tbody>
             </c:forEach>
            </table>

            <div class="class_pay_method" style="text-align: center">
                    <a href="javascript:doPayMethod('card')">
                    <img id="pm_img_card" class="creditBT" src="./resources/image/chackout/credit_off.png" alt="신용카드" val="1">
                    </a>
                                                         
                    <a href="javascript:doPayMethod('trans')">
                    <img id="pm_img_trans" class="cashBT" src="./resources/image/chackout/cashbook_off.png" alt="계좌이체" val="2">
                    </a>
            </div>

            <p class="small">귀하의 개인 데이터는 귀하의 주문을 처리하고, 본 웹 사이트 전체에서 귀하의 경험을 지원하며, 당사의 개인 정보 보호 정책에 설명된 다른 목적으로 사용될 것이다.</p>
            <input type="button" id="order" name="order" class="btn-custom primary btn-block" style="text-decoration:none" value="결제"/>

            <!-- /Billing Details -->

          </div>
        </div>
      </form>

    </div>
  </section>
  <!-- Checkout End -->

  <app-footer1>
  
<!--     ------------------   footer 영역    -------------------        -->
<!-- Newsletter start -->
  
  <!-- Newsletter End -->
  

  <!-- Footer Start -->
  
  <!-- Footer End -->


  
  
  </app-footer1>
 
  </app-root>
</body>
</html>