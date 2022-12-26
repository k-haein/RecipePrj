<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Class_Update</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="icon" type="image/x-icon" href="./resources/img/favicon.ico">
    

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/class_update.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/class_update_min.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/class_update_style.css" media="all" />

<link rel="stylesheet" type="text/css" href="./resources/css/plugins/magnific-popup.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/slick.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/slick-theme.css" media="all" />



 <!-- Bootstrap core CSS -->
  <link href="./resources/css/ranking.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/basic.css" rel="stylesheet">


  <!-- Bootstrap core JavaScript -->
  <script src="./resources/js/jquery.min.js"></script>
<!--   <script src="./resources/js/class_write.js"></script> -->


  
  <!--********** 【 js 링크 걸기 】********** -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="./resources/js/main.js" type="text/javascript" charset="utf-8"></script>

<script src="./resources/js/plugins/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>

<script src="./resources/js/class_update.js" type="text/javascript" charset="utf-8"></script>



<script>



/* 재료 div 부분 추가 */ 

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
		++group_idx;
	}
	
		
	
	if (is_exist_group) {
		var prev_title = $("#liMaterialGroup_"+group_idx+" [class=material_group_title_"+group_idx+"]").val();
		if ((prev_title == '' || prev_title == '재료') && title != '') {
			$("#liMaterialGroup_"+group_idx+" [class=material_group_title_"+group_idx+"]").val(title);
		}
		
	} else {
		var title_width = ($("#cok_reg_type").val() == 'edit') ? 190 : 210;
		var addbtn_style = ($("#cok_reg_type").val() == 'edit') ? 'padding:0 0 20px 240px; width:600px;' : 'padding:0 0 20px 470px; width:800px;';
		var str = '';
        str += '<li id="liMaterialGroup_'+group_idx+'">';
        str += ($("#cok_reg_type").val() == 'edit') ? '<p class="cont_tit6">' : '<p class="cont_tit6 st2 mag_r_15">';
        str += '<a href="#" class="btn-lineup"></a>';	
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
        $(".material_group_title_"+group_idx).focus();
    }

}





/* 재료 divGroup 부분 추가 */ 


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
    str += '<input type="text" name="mate_name" class="cok_material_nm_'+group_idx+'_'+step+'" id="mate_name"  style="width:'+w1+'px;">';
    str += '<input type="text" name="mate_cnt" class="cok_material_amt_'+group_idx+'_'+step+'" id="mate_cnt"  style="width:'+w2+'px;">';
    str += '<a id="btnMaterialDel_'+group_idx+'_'+step+'" href="javascript:delMaterial('+group_idx+','+step+')" class="btn-del" style="display:none"></a></li>';

    	 
    
    if (typeof prev_step == 'undefined' || prev_step === null || prev_step == 0) {
        $(str).appendTo('#divMaterialArea_'+group_idx);
        
    }
    else  {
        $(str).insertAfter("#liMaterial_"+group_idx+"_" + prev_step);
       
    }
 
   
    
    if (typeof init_json !== 'undefined' && init_json !== null && init_json['mat_nm_material']) {
        $("#divMaterialArea_"+group_idx+" [class=cok_material_nm_" + group_idx + "_" + step + "]").val(init_json['mat_nm_material']);
       
    } else {
   			
      $("#divMaterialArea_"+group_idx+" [class=cok_material_nm_" + group_idx + "_" + step + "]").attr('placeholder','예) '+_MATERIAL_SAMPLE[(step-1)%_MATERIAL_SAMPLE.length]['mat_nm_material']);
    
    
    }
     
    if (typeof init_json !== 'undefined' && init_json !== null && (init_json['mat_no_amount'] || init_json['mat_tx_amount'])) {
    	
		$("#divMaterialArea_"+group_idx+" [class=cok_material_amt_" + group_idx + "_" + step + "]").val((init_json['mat_no_amount'] ? init_json['mat_no_amount'] : '')+(init_json['mat_tx_amount'] ? init_json['mat_tx_amount'] : ''));
    } else {
        $("#divMaterialArea_"+group_idx+" [class=cok_material_amt_" + group_idx + "_" + step + "]").attr('placeholder','예) '+_MATERIAL_SAMPLE[(step-1)%_MATERIAL_SAMPLE.length]['mat_nm_amount']);
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




/* 조리 div 추가 부분 */

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
     
    
     
    var w1 = ($("#cok_reg_type").val() == 'edit') ? 180 : 850;
	var w2 = ($("#cok_reg_type").val() == 'edit') ? 180 : 150;
    var str = '';

	str += '<li id="rcMaterial_'+group_idx+'_'+step+'"><a href="#" class="btn-lineup"></a>';
    str += '<input type="textare" name="step" class="cok_material_nm_'+group_idx+'_'+step+'" id="step" style="width:'+w1+'px; height:'+w2+'px;"  placeholder="Step">';   
    str += '<a id="btnMaterialDel_'+group_idx+'_'+step+'" href="javascript:delMaterial('+group_idx+','+step+')" class="btn-del" style="display:none"></a></li>';

    if (typeof prev_step == 'undefined' || prev_step === null || prev_step == 0) {
        $(str).appendTo('#divRecipeArea_'+group_idx);
    }
    else {
        $(str).insertAfter("#rcMaterial_"+group_idx+"_" + prev_step);
    }

    if (typeof init_json !== 'undefined' && init_json !== null && init_json['mat_nm_material']) {
        $("#divRecipeArea_"+group_idx+" [class=cok_material_nm_" + group_idx + "_" + step + "]").val(init_json['mat_nm_material']);
    } else {
        $("#divRecipeArea_"+group_idx+" [class=cok_material_nm_" + group_idx + "_" + step + "]").attr('placeholder','예) '+_MATERIAL_SAMPLE[(step-1)%_MATERIAL_SAMPLE.length]['mat_nm_material']);
    }
    if (typeof init_json !== 'undefined' && init_json !== null && (init_json['mat_no_amount'] || init_json['mat_tx_amount'])) {
		$("#divRecipeArea_"+group_idx+" [class=cok_material_amt_" + group_idx + "_" + step + "]").val((init_json['mat_no_amount'] ? init_json['mat_no_amount'] : '')+(init_json['mat_tx_amount'] ? init_json['mat_tx_amount'] : ''));
    } else {
        $("#divRecipeArea_"+group_idx+" [class=cok_material_amt_" + group_idx + "_" + step + "]").attr('placeholder','예) '+_MATERIAL_SAMPLE[(step-1)%_MATERIAL_SAMPLE.length]['mat_nm_amount']);
   
	 
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









/*   파일 업로드  부분  */

 
 function fileUpload(fis) {

     var str = fis.value;

     $('#class_thumbnail').text(fis.value.substring(str.lastIndexOf("\\")+1));

     // 이미지를 변경한다.

       var reader = new FileReader();

   reader.onload = function(e){

	$('#loadImg').attr('src',e.target.result);

   }
 
reader.readAsDataURL(fis.files[0]);

}


 

/*   이미지 올리면  이미지 변하게! */

 function detailfileUpload(fis) {

     var str = fis.value;

     $('#class_info_pic').text(fis.value.substring(str.lastIndexOf("\\")+1));

     // 이미지를 변경한다.

       var reader = new FileReader();

   reader.onload = function(e){

	$('#deloadImg').attr('src',e.target.result);

   } 

reader.readAsDataURL(fis.files[0]); 

}







</script>

  
  
</head>
<body>
 
  
<app-root>
  


  
  
  <form class="writeForm" action="updateClass" method="post" enctype="multipart/form-data">
  <!-- Page Content -->
  
  <div class="container">
  
  <input type="hidden" name="mem_no" id="mem_no" value="${sessionScope.memNo}" readonly="readonly"> 

  
  <input type="hidden" name="class_no" id="class_no" value="${classUpDe.class_no}" readonly="readonly"> 

    <!-- ------------------- 클래스 등록  ---------------------  -->
    
   
	
	<div class="jumbotron my-4">
		
		
 
		<div class="show_class">
				<img src="./resources/image/class_write_img/head_icon01.png" >
				 <p3>클래스  등록</p3>
				 <hr>				
		</div>




			 <div class="cont_box pad_l_60">
			
				<div id="divMainPhotoUpload" class="cont_pic2">
					
					
				<div id="divMainPhotoBox" is_over="0">
										
					<input multiple="multiple" type="file" name="file" id="file" file_gubun="step" style="display:none;" multiple="" onchange="fileUpload(this);">	
					
						<button type="button" id="file_btn"  onclick="document.getElementById('file').click();">
							<img id="loadImg" src="${pageContext.request.contextPath}/resources/image/FoodImg/${classUpDe.class_thumbnail}" style=" cursor: pointer;">		
						</button>						
					<input type="hidden" name="class_thumbnail" id="class_thumbnail" value="${classUpDe.class_thumbnail}">			
											
				</div> 
							
				
				
				<!--    클래스 제목  -->				
				
				<div class="cont_line">
					<p class="cont_tit4">클래스 제목</p>
					<input type="text" name="class_title" class="cok_title" id="class_title"
						class="form-control" placeholder=${classUpDe.class_title} value='${classUpDe.class_title}'>
				</div>
		
				
				
				<!--    클래스 소개  -->
								
				<div class="cont_line pad_b_25">
					<p class="cont_tit4">클래스 소개</p>
					<textarea name="class_content" name="class_content" id="class_content"
						placeholder=${classUpDe.class_content}>${classUpDe.class_content}</textarea>
				</div>
				

				<!--   동영상   -->
								
				
				
				<div class="cont_line pad_b_25">
					<p class="cont_tit4" ></p>
					
						<textarea name="class_recipe_video" class="cok_video_url" name="class_recipe_video" id="class_recipe_video"  prev_url=""
						placeholder=${classUpDe.class_recipe_video} style=" resize: none;" value="">${classUpDe.class_recipe_video}</textarea>
					
				</div>
				
				
	
				<!--  정보   -->
				
				<div class="cont_line">
					<p class="cont_tit4">요리정보</p>

						<t1>시간</t1>						
						<select name="class_cooktime" id="class_cooktime" text="요리시간">						
						 <option value="5분이내"<c:if test="${class_cooktime == '5분이내'}">selected</c:if>>5분이내</option>
						 <option value="10분이내"<c:if test="${class_cooktime == '10분이내'}">selected</c:if>>10분이내</option>
						 <option value="15분이내"<c:if test="${class_cooktime == '15분이내'}">selected</c:if>>15분이내</option>
						 <option value="20분이내"<c:if test="${class_cooktime == '20분이내'}">selected</c:if>>20분이내</option>
						 <option value="30분이내"<c:if test="${class_cooktime == '30분이내'}">selected</c:if>>30분이내</option>
						 <option value="60분이내"<c:if test="${class_cooktime == '60분이내'}">selected</c:if>>60분이내</option>
						 <option value="90분이내"<c:if test="${class_cooktime == '90분이내'}">selected</c:if>>90분이내</option>
						 <option value="2시간이내"<c:if test="${class_cooktime == '2시간이내'}">selected</c:if>>2시간이내</option>
						 <option value="2시간이상"<c:if test="${class_cooktime == '2시간이상'}">selected</c:if>>2시간이상</option>							
						</select>

				




						
						<t1>수강기간</t1>						
						<select name="class_period" class="cok_day"  id="class_period" text="수강기간">		
							<option value="50"<c:if test="${class_period == 50}">selected</c:if>>50일</option>
							<option value="100"<c:if test="${class_period == 100}">selected</c:if>>100일</option>
							<option value="150"<c:if test="${class_period == 150}">selected</c:if>>150일</option>
							<option value="200"<c:if test="${class_period == 200}">selected</c:if>>200일</option>
						</select>
						
							
						<t1>가격</t1>						
						<input type="text" name="class_price" class="cok_price" id="class_price"  placeholder="${classUpDe.class_price}" value="${classUpDe.class_price}">
						<t3>원</t3>
					

					</div>
					
					
			</div>


	</div>  



</div><!--    jumbotron my-4    -->


  <!-- ------------------- 재료 등록  ---------------------  -->


<div class="jumbotron my-4">


		<div class="show_class">
				<img src="./resources/image/class_write_img/head_icon02.png" >
				 <p3>재료 등록</p3>
				 <hr>				
		</div>
		
		
				<div class="cont_box pad_l_60">
					<span class="guide mag_b_15" style="width: 100%;">재료가 남거나
						부족하지 않도록 정확한 계량정보를 적어주세요.</span>



										
			<div id="show_class_update_mate">
			<p8>재료</p8>
			
					<div class="show_upMate"> 			
						
						<c:set var="str1" value="${classUpDe.mate_name}"/>
									
											
							<c:forEach items="${fn:split(str1, ',') }" var="item">
											
								<input type="text" name="mate_name" id="mate_name" class="form-control" style="width: 330px;" value='${item}'>								
												
							</c:forEach>																		
					
					
					</div> <!-- show_freeMate  -->
										
				</div>  <!--   show_class_content_mate   -->
			
			
			
			
				<div id="show_class_update_mateCnt">
				<p8>재료수량</p8>
			
					<div class="show_upMateCnt"> 	
			
			
			
					<c:set var="str2" value="${classUpDe.mate_cnt}"/>								
									
							<c:forEach items="${fn:split(str2, ',') }" var="item">
											
								<input type="text" name="mate_cnt" id="mate_cnt" class="form-control" style="width: 280px;"  value=' ${item}'>
																	
												
							</c:forEach>
						
					
					</div> <!-- show_freeMate  -->
										
				</div>  <!--   show_class_content_mate   -->
			
			
			
				
					<div class="mag_b_25 ui-sortable" id="divMaterialGroupArea">
						
							<li id="liMaterialGroup_1">
																
								<ul id="divMaterialArea_1" class="ui-sortable">
								
									<li id="liMaterial_1_1">
									<a href="#" class="btn-lineup ui-sortable-handle" data-original-title="" title=""></a>
									
										<input type="text" name="mate_name" id="mate_name" class="form-control" style="width: 330px;" placeholder="예) 돼지고기">
										<input type="text" name="mate_cnt" id="mate_cnt" class="form-control" style="width: 280px;" placeholder="예) 300g">
										
										<a id="btnMaterialDel_1_1" href="javascript:delMaterial(1,1)" class="btn-del" style="display: none;"></a>
									</li>
									
									
								</ul>
								<div class="btn_add" style="padding: 0 0 20px 470px; width: 800px;">
									<button type="button" onclick="addMaterial(1)" class="btn btn-default">
										<span class="glyphicon glyphicon-plus-sign"></span>추가
									</button>
								</div>
								
								</li>
						</div>
	
		</div>



</div>  <!--    jumbotron my-4    -->





		
	
<!-- ------------------- 요리순서 등록  ---------------------  -->


				

	
	<div class="jumbotron my-4">
						
				
					<div class="mag_b_25 ui-sortable" id="divGroupArea">
					
					
							<li id="recipeGroup_1">
							
								<p class="recipe_tit">조리 순서</p>	
								
																
								
				
					<div id="show_class_update_step">
					
			
					<div class="show_upStep"> 	
			
				
				
						<c:set var="str3" value="${classUpDe.step}"/>								
									
							<c:forEach items="${fn:split(str3, ',') }" var="item">
															
								<input type="textare" name="step" id="step" class="form-control" style="width: 850px; height: 150px;"  value=' ${item} '>									
																
							</c:forEach>
										
						
						</div> <!-- show_freeMate  -->
											
					</div>  <!--   show_class_content_mate   -->
			
							
														
								<ul id="divRecipeArea_1" class="ui-sortable">
								
									<li id="rcMaterial_1_1">
									<a href="#" class="btn-lineup ui-sortable-handle" data-original-title="" title=""></a>
									
									
																	
										
										<a id="btnMaterialDel_1_1" href="javascript:delMaterial(1,1)" class="btn-del" style="display: none;"></a>
									</li>
									
								</ul>
								
								<div class="btn_add" style="padding: 0 0 20px 470px; width: 800px;">
									<button type="button" onclick="addRecipeMaterial(1)" class="btn btn-default">
										<span class="glyphicon glyphicon-plus-sign"></span>추가
									</button>
								</div>
								
						</div>
				
	</div>
		
		
	
<!-- ------------------- 상세 등록  ---------------------  -->
    
   
	

	
	<div class="jumbotron my-4">	
 
		<div class="show_class">
				<img src="${pageContext.request.contextPath}/resources/image/class_write_img/head_icon05.png" >
				 <p3>상세 정보 등록</p3>
				 <hr>				
		</div>
		
		

		<!--   내용 쓰기   -->
							
			<div class="defailWrap">
														
						
						<textarea name="class_detail_info" class="info_cont_area1"
						id="class_detail_info"  prev_url=""
						placeholder="${classUpDe.class_detail_info}">${classUpDe.class_detail_info}</textarea>
	
						 	
				</div>   <!--  pad_b_25  -->
	
	
	
						
</div>      <!--    jumbotron my-4    -->
		



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
						
				 <select name="kind_tag_no" id="kind_tag_no" text="${classUpDe.kind_tag_no}">
                     <option value=10<c:if test="${kind_tag_no == 10}">selected</c:if>>한식</option>
                     <option value=20<c:if test="${kind_tag_no == 20}">selected</c:if>>양식</option>
                     <option value=30<c:if test="${kind_tag_no == 30}">selected</c:if>>일식</option>
                     <option value=40<c:if test="${kind_tag_no == 40}">selected</c:if>>중식</option>
                     <option value=50<c:if test="${kind_tag_no == 50}">selected</c:if>>아시안</option>
                     <option value=60<c:if test="${kind_tag_no == 60}">selected</c:if>>Vegan</option>
                     <option value=70<c:if test="${kind_tag_no == 70}">selected</c:if>>Quick Food</option>
                     <option value=80<c:if test="${kind_tag_no == 80}">selected</c:if>>Dessert</option>
                     <option value=90<c:if test="${kind_tag_no == 90}">selected</c:if>>기타</option>
                  </select>


						<t1>메인</t1>						
						<select name="material_tag_no" id="material_tag_no" text="메인재료">
						 <option value=12<c:if test="${material_tag_no == 12}">selected</c:if>>돼지고기</option>
						 <option value=22<c:if test="${material_tag_no == 22}">selected</c:if>>소고기</option>
						 <option value=32<c:if test="${material_tag_no == 32}">selected</c:if>>닭고기</option>
						 <option value=42<c:if test="${material_tag_no == 42}">selected</c:if>>해산물</option>
						 <option value=52<c:if test="${material_tag_no == 52}">selected</c:if>>채소/과일류</option>
						 <option value=62<c:if test="${material_tag_no == 62}">selected</c:if>>기타</option>										
						</select>
						
						<t1>테마별</t1>						
						<select name="theme_tag_no" id="theme_tag_no" text="테마별">
						<option value=11<c:if test="${theme_tag_no == 11}">selected</c:if>>일상</option>
						<option value=21<c:if test="${theme_tag_no == 21}">selected</c:if>>손님접대</option>
						<option value=31<c:if test="${theme_tag_no == 31}">selected</c:if>>술안주</option>
						<option value=41<c:if test="${theme_tag_no == 41}">selected</c:if>>다이어트</option>
						<option value=51<c:if test="${theme_tag_no == 51}">selected</c:if>>간식</option>
						<option value=61<c:if test="${theme_tag_no == 61}">selected</c:if>>기타</option>									
						</select>

				
				</div>



			<div class="adminCkWrap">
				
				<label>
					<input type="checkbox" id="admin_app" name="admin_app" value="0">수정시 다시 관리자 승인을 받아야 합니다. 동의하십니까?
					</p>
				</label>
				
				<span id="admin_app_check" class="adminText"></span>
				
				</div>






	</div>  <!--   jumbotron my-4   -->





<!-- ------------------- 버튼  ---------------------  -->
    
   
	
	<div class="jumbotron my-4">

		<div class="buttonWrap">
		
			 <button type="submit" class="saveBT" >
		    	  <span class="saveBTsp"></span> 
		    	 	수정
		    </button>
		    
		     <button type="reset" class="closeBT">
		    	  <span class="closeBTsp"></span> 
		    	 	취소
		    </button>
		
		
		</div>	  <!--    buttonWrap    -->		
 
	</div>   <!--    jumbotron my-4    -->






 </div><!-- /.container -->
 
 
 
</form> 





 </app-root> 
 
</body>
</html>
