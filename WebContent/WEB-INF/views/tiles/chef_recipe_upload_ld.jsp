<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Chef Recipe Write</title>
<!--   <base href="/"> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="./resources/img/favicon.ico">
  
  


<link rel="stylesheet" type="text/css" href="./resources/css/header.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/chef_recipe_upload_ld.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/chef_recipe_upload_min_ld.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/chef_recipe_upload_style_ld.css" media="all" />



  <!-- Bootstrap core JavaScript -->
  <script src="./resources/js/jquery.min.js"></script>
  <script src="./resources/js/chef_recipe_upload_write_ld.js"></script>


  
  <!--********** 【 js 링크 걸기 】********** -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="./resources/js/main.js" type="text/javascript" charset="utf-8"></script>

<script src="./resources/js/plugins/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

<script src="./resources/js/class_wirte_video.js" type="text/javascript" charset="utf-8"></script>



<script>



function addMaterialGroup(title,json,group_idx,isManualAdd) {
	var is_exist_group = false;
	if (group_idx && $("#divMaterialArea_"+group_idx).length) {
		//존재함
		is_exist_group = true;
	} else {
		if (!group_idx) group_idx = 0;
		$("[id^=divMaterialArea_]").each(function() {
            var idx = parseInt($(this).prop('id').replace('divMaterialArea_',''),10);
            group_idx = Math.max(group_idx,idx);
        });
        group_idx++;
	}
	if (is_exist_group) {
		var prev_title = $("#liMaterialGroup_"+group_idx+" [id=material_group_title_"+group_idx+"]").val();
		if ((prev_title == '' || prev_title == '재료') && title != '') {
			$("#liMaterialGroup_"+group_idx+" [id=material_group_title_"+group_idx+"]").val(title);
		}
	} else {
		var title_width = ($("#cok_reg_type").val() == 'edit') ? 190 : 210;
		var addbtn_style = ($("#cok_reg_type").val() == 'edit') ? 'padding:0 0 20px 240px; width:600px;' : 'padding:0 0 20px 470px; width:800px;';
		var str = '';
        str += '<li id="liMaterialGroup_'+group_idx+'">';
        str += ($("#cok_reg_type").val() == 'edit') ? '<p class="cont_tit6">' : '<p class="cont_tit6 st2 mag_r_15">';
        str += '<a href="#" class="btn-lineup"></a>';
		str += '<input type="text" name="material_group_title_'+group_idx+'" id="material_group_title_'+group_idx+'" value="예>양념" class="form-control" style="font-weight:bold;font-size:18px;width:'+title_width+'px;">';
    
		/*  
		str += '<input type="text" name="material_group_title_'+group_idx+'" id="material_group_title_'+group_idx+'" value="'+title+'" class="form-control" style="font-weight:bold;font-size:18px;width:'+title_width+'px;">';
    
		str += '<span class="cont_tit_btn">';
		str += '<button id="btnAutoMaterialModal" data-toggle="modal" data-target="#divAutoMaterialModal" type="button" data-group_idx="'+group_idx+'" class="btn-sm btn-default"><span class="glyphicon glyphicon-import"></span> 한번에 넣기</button>';
		str += '<button type="button" onclick="delMaterialGroup('+group_idx+')" class="btn-sm btn-default"><span class="glyphicon glyphicon-remove"></span> 묶음삭제</button>';
        str += '</span>';
	 */	
	 
	 	str += '</p>';
        str += '<ul id="divMaterialArea_'+group_idx+'"></ul>';
        str += '<div class="btn_add" style="'+addbtn_style+'"><button type="button" onclick="addMaterial('+group_idx+')" class="btn btn-default"><span class="glyphicon glyphicon-plus-sign"></span>추가</button></div>';
        str += '</li>';

        $(str).appendTo("#divMaterialGroupArea");
	}

    for (var i=0; i<json.length; i++) {
		addMaterial(group_idx,json[i],'');
	}
	if (group_idx == 1) {
		if ($("#divMaterialArea_" + group_idx + " [id^=liMaterial_" + group_idx + "_]").length < 3) {
			for (var j = i; j < 3; j++) {
				addMaterial(group_idx, [], '');
			}
		}
	} else {
		if ($("#divMaterialArea_" + group_idx + " [id^=liMaterial_" + group_idx + "_]").length < 3) {
			for (var j = i; j < 2; j++) {
				addMaterial(group_idx, [], '');
			}
		}
	}
	$("#divMaterialGroupArea").sortable({
        handle: $('.btn-lineup')
    });
	if (isManualAdd && isManualAdd == '1') {
        $("#material_group_title_"+group_idx).focus();
    }

}
function delMaterialGroup(group_idx) {
	var cnt = 0;
	$("#divMaterialArea_"+group_idx+" [id^=cok_material_nm_"+group_idx+"_]").each(function() {
		if ($.trim($(this).val()) != '') {
			cnt++;
		}
	});
	var isOK = true;
	if (cnt > 0) {
		if(!confirm('['+$("#material_group_title_"+group_idx).val()+']을 삭제하시겠습니까?')) {
			isOK = false;
		}
	}
	if (isOK) {
		if ($("#divMaterialGroupArea [id^=liMaterialGroup_]").length == 1) {
            $("#liMaterialGroup_"+group_idx+" [id=material_group_title_"+group_idx+"]").val('');
            $("#divMaterialArea_"+group_idx+" [id^=liMaterial_"+group_idx+"_]").each(function(idx,obj) {
                var step = $(this).prop('id').replace('liMaterial_'+group_idx+'_','');
                if (idx < 3) {
                    $("#liMaterial_"+group_idx+"_"+step+" [id=cok_material_nm_"+group_idx+"_"+step).val('');
                    $("#liMaterial_"+group_idx+"_"+step+" [id=cok_material_amt_"+group_idx+"_"+step).val('');
                } else {
                    $("#liMaterial_"+group_idx+"_"+step).remove();
                }
            });
        } else {
            $("#divMaterialGroupArea [id=liMaterialGroup_"+group_idx+"]").fadeOut(200,function() {
                $(this).remove();
            });
        }
	}
}
function addMaterial(group_idx, init_json, prev_step){
    var step = 0;
    $("#divMaterialArea_"+group_idx+" [id^=liMaterial_"+group_idx+"_]").each(function(){
        var tmp = $(this).prop('id').replace('liMaterial_'+group_idx+'_', '');
        var tmp_step = parseInt(tmp, 10);
        step = Math.max(step, tmp_step);
    });
    step++;
    //alert(step);
    var w1 = ($("#cok_reg_type").val() == 'edit') ? 180 : 330;
	var w2 = ($("#cok_reg_type").val() == 'edit') ? 140 : 280;
    var str = '';
	str += '<li id="liMaterial_'+group_idx+'_'+step+'"><a href="#" class="btn-lineup"></a>';
    str += '<input type="text" name="cok_material_nm_'+group_idx+'[]" id="cok_material_nm_'+group_idx+'_'+step+'" class="form-control" style="width:'+w1+'px;">';
    str += '<input type="text" name="cok_material_amt_'+group_idx+'[]" id="cok_material_amt_'+group_idx+'_'+step+'" class="form-control" style="width:'+w2+'px;">';
    str += '<a id="btnMaterialDel_'+group_idx+'_'+step+'" href="javascript:delMaterial('+group_idx+','+step+')" class="btn-del" style="display:none"></a></li>';

    if (typeof prev_step == 'undefined' || prev_step === null || prev_step == 0) {
        $(str).appendTo('#divMaterialArea_'+group_idx);
    }
    else {
        $(str).insertAfter("#liMaterial_"+group_idx+"_" + prev_step);
    }

    if (typeof init_json !== 'undefined' && init_json !== null && init_json['mat_nm_material']) {
        $("#divMaterialArea_"+group_idx+" [id=cok_material_nm_" + group_idx + "_" + step + "]").val(init_json['mat_nm_material']);
    } else {
        $("#divMaterialArea_"+group_idx+" [id=cok_material_nm_" + group_idx + "_" + step + "]").attr('placeholder','예) '+_MATERIAL_SAMPLE[(step-1)%_MATERIAL_SAMPLE.length]['mat_nm_material']);
    }
    if (typeof init_json !== 'undefined' && init_json !== null && (init_json['mat_no_amount'] || init_json['mat_tx_amount'])) {
		$("#divMaterialArea_"+group_idx+" [id=cok_material_amt_" + group_idx + "_" + step + "]").val((init_json['mat_no_amount'] ? init_json['mat_no_amount'] : '')+(init_json['mat_tx_amount'] ? init_json['mat_tx_amount'] : ''));
    } else {
        $("#divMaterialArea_"+group_idx+" [id=cok_material_amt_" + group_idx + "_" + step + "]").attr('placeholder','예) '+_MATERIAL_SAMPLE[(step-1)%_MATERIAL_SAMPLE.length]['mat_nm_amount']);
    }

    $("#divMaterialArea_"+group_idx+" [id=liMaterial_" + group_idx + "_" + step + "]").mouseover(function(){
        $(this).find('.btn-del').show();
    }).mouseout(function(){
        $(this).find('.btn-del').hide();
    });

    $("#divMaterialArea_"+group_idx).sortable({
        handle: $('.btn-lineup')
    });
    //$( "ul, li" ).disableSelection();
}








function addRecipeMaterial(group_idx, init_json, prev_step){
    var step = 0;
    var stepR = 2;
    $("#divRecipeArea_"+group_idx+" [id^=rcMaterial_"+group_idx+"_]").each(function(){
        var tmp = $(this).prop('id').replace('rcMaterial_'+group_idx+'_', '');
        var tmp_step = parseInt(tmp, 10);
        var tmp_stepR = parseInt(tmp, 10);
        step = Math.max(step, tmp_step);
        stepR = Math.max(stepR+1, tmp_stepR);
    });
    step++;
    stepR--;
  
    var w1 = ($("#cok_reg_type").val() == 'edit') ? 180 : 650;
	var w2 = ($("#cok_reg_type").val() == 'edit') ? 180 : 150;
    var str = '';
/* 	str += '<p class="recipe_step'+'_'+stepR+'">Step'+stepR+'</p>'; */
	str += '<li id="rcMaterial_'+group_idx+'_'+step+'"><a href="#" class="btn-lineup"></a>';
    str += '<input type="text" name="cok_material_nm_'+group_idx+'[]" id="cok_material_nm_'+group_idx+'_'+step+'" class="form-control" style="width:'+w1+'px; height:'+w2+'px;"  placeholder="Step'+stepR+'">';   
/*     str += '<input type="text" name="cok_material_nm_'+group_idx+'[]" id="cok_material_nm_'+group_idx+'_'+step+'" class="form-control" style="width:'+w1+'px; height:'+w2+'px;">';   */ 
    str += '<a id="btnMaterialDel_'+group_idx+'_'+step+'" href="javascript:delMaterial('+group_idx+','+step+')" class="btn-del" style="display:none"></a></li>';

    if (typeof prev_step == 'undefined' || prev_step === null || prev_step == 0) {
        $(str).appendTo('#divRecipeArea_'+group_idx);
    }
    else {
        $(str).insertAfter("#rcMaterial_"+group_idx+"_" + prev_step);
    }

    if (typeof init_json !== 'undefined' && init_json !== null && init_json['mat_nm_material']) {
        $("#divRecipeArea_"+group_idx+" [id=cok_material_nm_" + group_idx + "_" + step + "]").val(init_json['mat_nm_material']);
    } else {
        $("#divRecipeArea_"+group_idx+" [id=cok_material_nm_" + group_idx + "_" + step + "]").attr('placeholder','예) '+_MATERIAL_SAMPLE[(step-1)%_MATERIAL_SAMPLE.length]['mat_nm_material']);
    }
    if (typeof init_json !== 'undefined' && init_json !== null && (init_json['mat_no_amount'] || init_json['mat_tx_amount'])) {
		$("#divRecipeArea_"+group_idx+" [id=cok_material_amt_" + group_idx + "_" + step + "]").val((init_json['mat_no_amount'] ? init_json['mat_no_amount'] : '')+(init_json['mat_tx_amount'] ? init_json['mat_tx_amount'] : ''));
    } else {
        $("#divRecipeArea_"+group_idx+" [id=cok_material_amt_" + group_idx + "_" + step + "]").attr('placeholder','예) '+_MATERIAL_SAMPLE[(step-1)%_MATERIAL_SAMPLE.length]['mat_nm_amount']);
    }

    $("#divRecipeArea_"+group_idx+" [id=rcMaterial_" + group_idx + "_" + step + "]").mouseover(function(){
        $(this).find('.btn-del').show();
    }).mouseout(function(){
        $(this).find('.btn-del').hide();
    });

    $("#divRecipeArea_"+group_idx).sortable({
        handle: $('.btn-lineup')
    });
    //$( "ul, li" ).disableSelection();
}





</script>

  
  
</head>
<body>
 
  
<app-root>
  

<app-header2> 



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
  <header class="main-header header-1">
    <nav class="navbar">
      <div class="container">
        <!-- Logo -->
        <a class="navbar-brand" href="index"> <img src="./resources/image/main/logo.png"> </a>
        <!-- Menu -->
        <ul class="navbar-nav">
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
          <a href="recipe_upload" class="loginBT"> <img src="./resources/image/main/Normal_writeBT.png">          
          </a>          
        </li>        
        
         <li class="menu-item">
          <a href="class_write" class="loginBT"> <img src="./resources/image/main/class_writeBT.png">          
          </a>
          <ul class="submenu">
                <li class="menu-item"> <a href="chef_recipe_upload">Chef_Write</a> </li>
                <li class="menu-item"> <a href="class_write">Class_Write</a> </li>
              </ul>
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
                  <a href="checkOut" class="btn-custom primary btn-sm shadow-none">Checkout</a>
                  <a href="storeCart" class="btn-custom secondary btn-sm shadow-none">View Cart</a>
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


  
  
  <form class="writeForm" action="class_main">
  <!-- Page Content -->
  <div class="container">
  



    <!-- ------------------- 쉐프 레시피 등록  ---------------------  -->
    
   
	
	<div class="jumbotron my-4">
		
		
 
		<div class="show_class">
				<img src="./resources/image/class_write_img/head_icon01.png" >
				 <p3>쉐프 레시피 등록</p3>
				 <hr>				
		</div>


			<div class="cont_box pad_l_60">
			
				<div id="divMainPhotoUpload" class="cont_pic2">
					<input type="hidden" name="main_photo" id="main_photo" value="">
					<input type="hidden" name="new_main_photo" id="new_main_photo"
						value=""> <input type="hidden" name="del_main_photo"
						id="del_main_photo" value="">
					<div style="position: absolute; left: -3000px">
						<input type="file" name="q_main_file" id="q_main_file"
							file_gubun="main" accept="jpeg,png,gif"
							style="display:; width: 0px; height: 0px; font-size: 0px;"
							text="">
					</div>
					
						
			
					<div id="divMainPhotoBox" is_over="0">
					  <input type="file" name="file" id="multifile_1" file_gubun="step" style="display:none;" multiple="">
						<img id="write_photo" onclick="document.getElementById('multifile_1').click();" src="./resources/image/class_write_img/photo_icon.png"
							style=" cursor: pointer">
					</div> 
										
					
				</div>
							
				
				
				<!--    레시피 제목  -->				
				
				<div class="cont_line">
					<p class="cont_tit4">레시피 제목</p>
					<input type="text" name="cok_title" class="cok_title" id="cok_title" value=""
						class="form-control" placeholder="예) 뽀모도로 파스타 만들기">
				</div>
		
				
				<!--    레시피 소개  -->
								
				<div class="cont_line pad_b_25">
					<p class="cont_tit4">클래스 소개</p>
					<textarea name="cok_intro" id="cok_intro"
						class="form-control step_cont"
						placeholder="예) 집에서 쉽게 만드는 뽀모도로 파스타 입니다~"></textarea>
				</div>
				

				<!--   동영상   -->
				
				<div class="cont_line pad_b_25">
					<p class="cont_tit4" >조리 영상</p>
					<!-- <input type="hidden" name="video_photo" class="intro_video"id="video_photo" value="">
					<input type="hidden" name="new_video_photo" id="new_video_photo" value=""> 
					<input type="hidden" name="del_video_photo" id="del_video_photo" value="1"> <input type="hidden"
						name="cok_video_src" id="cok_video_src" value=""> -->
						
						
						<textarea name="cok_video_url" class="cok_video_url" 
						placeholder="조리 영상이 있으면 주소를 입력하세요.(Youtube,네이버tvcast,다음tvpot 만 가능) 예)http://youtu.be/lA0Bxo3IZmM"
						style=" resize: none;"></textarea>

					
				</div>
				
				
				
	
				<!--  정보   -->
				
				<div class="cont_line">
					<p class="cont_tit4">요리정보</p>

						<t1>시간</t1>						
						<select name="cok_time" id="cok_time" text="요리시간">
							<option value="">시간</option>
							<option value="5">5분이내</option>
							<option value="10">10분이내</option>
							<option value="15">15분이내</option>
							<option value="20">20분이내</option>
							<option value="30">30분이내</option>
							<option value="60">60분이내</option>
							<option value="90">90분이내</option>
							<option value="120">2시간이내</option>
							<option value="999">2시간이상</option>
						</select>


						<t1>난이도</t1>						
						<select name="cok_level" text="난이도">
							<option value="">난이도</option>
							<option value="5">Easy</option>
							<option value="10">Normal</option>
							<option value="15">Hard</option>							
						</select>
						

					</div>
					
					
			</div>


</div>  <!--    jumbotron my-4    -->






  <!-- ------------------- 재료 등록  ---------------------  -->


<div class="jumbotron my-4">


		<div class="show_class">
				<img src="./resources/image/class_write_img/head_icon02.png" >
				 <p3>재료 등록</p3>
				 <hr>				
		</div>
		
		
		<form class="propFrom">
		

				<div class="cont_box pad_l_60">
					<span class="guide mag_b_15" style="width: 100%;">재료가 남거나
						부족하지 않도록 정확한 계량정보를 적어주세요.</span>





						<div class="mag_b_25 ui-sortable" id="divMaterialGroupArea">
						
							<li id="liMaterialGroup_1">
								<p class="cont_tit6 st2 mag_r_15">
								
										<a href="#" class="btn-lineup ui-sortable-handle" data-original-title="" title=""></a>
										<input type="text" name="material_group_title_1" id="material_group_title_1"
											value="재료" class="form-control"
											style="font-weight: bold; font-size: 18px; width: 210px;">
								</p>								
								<ul id="divMaterialArea_1" class="ui-sortable">
								
									<li id="liMaterial_1_1">
									<a href="#" class="btn-lineup ui-sortable-handle" data-original-title="" title=""></a>
										<input type="text" name="cok_material_nm_1[]" id="cok_material_nm_1_1" class="form-control" style="width: 330px;" placeholder="예) 돼지고기">
										<input type="text" name="cok_material_amt_1[]" id="cok_material_amt_1_1" class="form-control" style="width: 280px;" placeholder="예) 300g">
										<a id="btnMaterialDel_1_1" href="javascript:delMaterial(1,1)" class="btn-del" style="display: none;"></a>
									</li>
									
									<li id="liMaterial_1_2">
										<a href="#" class="btn-lineup ui-sortable-handle" data-original-title="" title=""></a>
										<input type="text" name="cok_material_nm_1[]" id="cok_material_nm_1_2" class="form-control" style="width: 330px;" placeholder="예) 양배추">
										<input type="text" name="cok_material_amt_1[]" id="cok_material_amt_1_2" class="form-control" style="width: 280px;" placeholder="예) 1/2개">
										<a id="btnMaterialDel_1_2" href="javascript:delMaterial(1,2)" class="btn-del" style="display: none;"></a>
									</li>
									
									<li id="liMaterial_1_3">
										<a href="#" class="btn-lineup ui-sortable-handle" data-original-title="" title=""></a>
										<input type="text" name="cok_material_nm_1[]" id="cok_material_nm_1_3" class="form-control" style="width: 330px;" placeholder="예) 참기름">
										<input type="text" name="cok_material_amt_1[]" id="cok_material_amt_1_3" class="form-control" style="width: 280px;" placeholder="예) 1T">
										<a id="btnMaterialDel_1_3" href="javascript:delMaterial(1,3)" class="btn-del" style="display: none;"></a>
									</li>
								</ul>
								<div class="btn_add" style="padding: 0 0 20px 470px; width: 800px;">
									<button type="button" onclick="addMaterial(1)" class="btn btn-default">
										<span class="glyphicon glyphicon-plus-sign"></span>추가
									</button>
								</div>
								
								</li>
						</div>


						<div class="noti">
						
							<t2> ※ 양념, 양념장, 소스, 드레싱, 토핑, 시럽, 육수 밑간 등으로 구분해서 작성해주세요. </t2>
							<div class="noti_btn">
								<button type="button" onclick="addMaterialGroup('',[],null,'1')" class="btn-lg btn-default">				
								<img src="./resources/image/class_write_img/head_icon04.png" >
									<span class="glyphicon glyphicon-plus"></span> 재료/양념 묶음 추가
								</button>
							</div>
						</div>  <!--  noti    -->
						
				
				
				
				
					<div class="mag_b_25 ui-sortable" id="divGroupArea">
					
						<hr>	
					
					
							<li id="recipeGroup_1">
							
								<p class="recipe_tit">조리 순서</p>	
								
														
								<ul id="divRecipeArea_1" class="ui-sortable">
								
									<li id="rcMaterial_1_1">
									<a href="#" class="btn-lineup ui-sortable-handle" data-original-title="" title=""></a>
										<input type="text" name="cok_material_nm_1[]" id="cok_material_nm_1_1" class="form-control" style="width: 650px; height: 150px;" placeholder="step1 &nbsp; &nbsp; 예) 감자를 얇게 썰어주세요">										
										<a id="btnMaterialDel_1_1" href="javascript:delMaterial(1,1)" class="btn-del" style="display: none;"></a>
									</li>
									
								</ul>
								
								<div class="btn_add" style="padding: 0 0 20px 470px; width: 800px;">
									<button type="button" onclick="addRecipeMaterial(1)" class="btn btn-default">
										<span class="glyphicon glyphicon-plus-sign"></span>추가
									</button>
								</div></li>
						</div>
				
				
				
				</div>	

	</form>  <!--    propFrom   -->
	
</div> <!--  jumbotron my-4    -->

	
		



<!-- ------------------- 태그  등록  ---------------------  -->
    
   
	
	<div class="jumbotron my-4">
		
		
 
		<div class="show_class">
				<img src="./resources/image/class_write_img/head_icon05.png" >
				 <p3>태그 등록</p3>
				 <hr>				
		</div>

			
				<div class="cont_line_info">
					<p class="cont_tit4_info">요리정보</p>

						<t1>종류</t1>						
						<select name="tag_info_1"  text="종류">
							<option value="info1">한식</option>
							<option value="info2">양식</option>
							<option value="info3">일식</option>
							<option value="info4">중식</option>
							<option value="info5">아시안</option>
<<<<<<< HEAD
							<option value="info6">Vegan</option>
							<option value="info7">Quick Food</option>
							<option value="info8">Dessert</option>
							<option value="info9">기타</option>
						</select>


						<t1>메인</t1>						
						<select name="tag_info_2"  text="메인재료">
							<option value="main_info1">돼지고기</option>
							<option value="main_info2">소고기</option>
							<option value="main_info3">닭고기</option>
							<option value="main_info4">해산물</option>					
							<option value="main_info5">채소/과일류</option>					
							<option value="main_info6">기타</option>					
						</select>
						
						<t1>테마별</t1>						
						<select name="tag_info_3"  text="테마별">
							<option value="second_info1">일상</option>
							<option value="second_info2">손님접대</option>
							<option value="second_info3">술안주</option>					
							<option value="second_info4">다이어트</option>					
							<option value="second_info5">간식</option>					
							<option value="second_info6">기타</option>					
=======
							<option value="info5">Vegan</option>
							<option value="info5">Quick Food</option>
							<option value="info5">Dessert</option>
							<option value="info5">기타</option>
						</select>


						<t1>메인</t1>						
						<select name="tag_info_2"  text="메인재료">
							<option value="main_info1">돼지고기</option>
							<option value="main_info2">소고기</option>
							<option value="main_info2">닭고기</option>
							<option value="main_info3">해산물</option>					
							<option value="main_info3">채소/과일류</option>					
							<option value="main_info3">기타</option>					
						</select>
						
						<t1>테마별</t1>						
						<select name="tag_info_2"  text="테마별">
							<option value="second_info1">일상</option>
							<option value="second_info2">손님접대</option>
							<option value="second_info3">술안주</option>					
							<option value="second_info3">다이어트</option>					
							<option value="second_info3">간식</option>					
							<option value="second_info3">기타</option>					
>>>>>>> refs/remotes/origin/main
						</select>

					</div>
	



	</div>  <!--   jumbotron my-4   -->






<!-- ------------------- 버튼  ---------------------  -->
    
   
	
	<div class="jumbotron my-4">

		<div class="buttonWrap">
		
			 <button type="button" class="saveBT" onClick="location.href='class_main'">
		    	  <span class="saveBTsp"></span> 
		    	 	저장
		    </button>
		    
		     <button type="button" class="writeBT" onClick="location.href='class_main'">
		    	  <span class="saveBTsp"></span> 
		    	 	저장 후 등록
		    </button>
		    
		     <button type="button" class="closeBT">
		    	  <span class="saveBTsp"></span> 
		    	 	취소
		    </button>
		
		
		</div>	  <!--    buttonWrap    -->		
 
	</div>   <!--    jumbotron my-4    -->





 </div><!-- /.container -->
 
 
</form> 




  
<!-- Newsletter start  -->
  <app-footer1>
  
  
  																<!--    이미지 변경하고 싶으면 footBackImg_06.png <--여기를 01~06중 골라쓰세요  -->
  <section class="section light-bg bg-cover" style="background-image:url('./resources/image/main/footBackImg_05.png')">
  
  
    <div class="container">
      <div class="section-title-wrap section-header text-center">
        <d1 class="foot_title">Recipe Search</d1>       
      </div>

      <form class="ct-newsletter" method="post">
        <input type="email" class="form-control" placeholder="Search the recipe" value="">
        <button type="button" class="btn-custom primary" name="button"> Search <i class="far fa-paper-plane"></i> </button>
      </form>

    </div>
  </section>
 
 
  <!-- Footer Start -->
  <footer class="ct-footer footer-2">
  
  
   <div class="row align-items-center mt-70">
                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="./resources/image/core-img/salad.png" alt="">
                        <h3><span class="counter">1287</span></h3>
                        <h6>Recipe</h6>
                    </div>
                </div>

                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="./resources/image/core-img/hamburger.png" alt="">
                        <h3><span class="counter">25</span></h3>
                        <h6>Chef Recipe</h6>
                    </div>
                </div>

                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="./resources/image/core-img/rib.png" alt="">
                        <h3><span class="counter">471</span></h3>
                        <h6>Class</h6>
                    </div>
                </div>

                <!-- Single Cool Fact -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-cool-fact">
                        <img src="./resources/image/core-img/pancake.png" alt="">
                        <h3><span class="counter">326</span></h3>
                        <h6>Affiliates</h6>
                    </div>
                </div>
            </div>
  
    
    
  </footer>
  <!-- Footer End -->

  
  
  </app-footer1>
  






  
 </app-root> 
 
</body>
</html>
