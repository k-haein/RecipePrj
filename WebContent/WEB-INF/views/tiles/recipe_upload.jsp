<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Recipe_upload</title>
<!--   <base href="/"> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="./resources/img/favicon.ico">


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_upload_header.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_write.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/class_write_min.css" media="all" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_main.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_style.css" media="all" />

<link rel="stylesheet" type="text/css" href="./resources/css/plugins/magnific-popup.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/slick.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/slick-theme.css" media="all" />



 <!-- Bootstrap core CSS -->
  <link href="./resources/css/ranking.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/basic.css" rel="stylesheet">


  <!-- Bootstrap core JavaScript -->
  <script src="./resources/js/jquery.min.js"></script>
  <!-- <script src="./resources/js/class_write.js"></script>  -->


  
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
		/*str += '<input type="text" name="material_group_title_'+group_idx+'" id="material_group_title_'+group_idx+'" value="예>양념" class="form-control" style="font-weight:bold;font-size:18px;width:'+title_width+'px;">';
    	*/
		/*  
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
    str += '<input type="text" name="mate_name" class="step'+group_idx+'_'+step+'" id="mate_name"  style="width:'+w1+'px; margin-right:10px;">';
    str += '<input type="text" name="mate_cnt" class="cok_material_amt_'+group_idx+'_'+step+'" id="mate_cnt"  style="width:'+w2+'px;">';
    str += '<a id="btnMaterialDel_'+group_idx+'_'+step+'" href="javascript:delMaterial('+group_idx+','+step+')" class="btn-del" style="display:none"></a></li>';

    	 
    
    if (typeof prev_step == 'undefined' || prev_step === null || prev_step == 0) {
        $(str).appendTo('#divMaterialArea_'+group_idx);
        
    }
    else  {
        $(str).insertAfter("#liMaterial_"+group_idx+"_" + prev_step);
       
    }
 
   
    
    if (typeof init_json !== 'undefined' && init_json !== null && init_json['mat_nm_material']) {
        $("#divMaterialArea_"+group_idx+" class=step" + group_idx + "_" + step ).val(init_json['mat_nm_material']);
       
    } else {
   			
      $("#divMaterialArea_"+group_idx+" class=step" + group_idx + "_" + step ).attr('placeholder','예) '+_MATERIAL_SAMPLE[(step-1)%_MATERIAL_SAMPLE.length]['mat_nm_material']);
    
    
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
  
    var w1 = ($("#cok_reg_type").val() == 'edit') ? 180 : 610;
	var w2 = ($("#cok_reg_type").val() == 'edit') ? 180 : 150;
    var str = '';

	str += '<li id="rcMaterial_'+group_idx+'_'+step+'"><a href="#" class="btn-lineup"></a>';
    str += '<input type="text" name="step" id="step'+group_idx+'_'+step+'" class="form-control" style="width:'+w1+'px; height:'+w2+'px;"  placeholder="Step'+stepR+'">';   

    str += '<a id="btnMaterialDel_'+group_idx+'_'+step+'" href="javascript:delMaterial('+group_idx+','+step+')" class="btn-del" style="display:none"></a></li>';

    if (typeof prev_step == 'undefined' || prev_step === null || prev_step == 0) {
        $(str).appendTo('#divRecipeArea_'+group_idx);
    }
    else {
        $(str).insertAfter("#rcMaterial_"+group_idx+"_" + prev_step);
    }

    if (typeof init_json !== 'undefined' && init_json !== null && init_json['mat_nm_material']) {
        $("#divRecipeArea_"+group_idx+" [id=step" + group_idx + "_" + step + "]").val(init_json['mat_nm_material']);
    } else {
        $("#divRecipeArea_"+group_idx+" [id=step" + group_idx + "_" + step + "]").attr('placeholder','예) '+_MATERIAL_SAMPLE[(step-1)%_MATERIAL_SAMPLE.length]['mat_nm_material']);
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





function fileUpload(fis) {

    var str = fis.value;

    $('#recipe_thumbnail').text(fis.value.substring(str.lastIndexOf("\\")+1));

    // 이미지를 변경한다.

      var reader = new FileReader();

  reader.onload = function(e){

	$('#write_photo').attr('src',e.target.result);

  }

reader.readAsDataURL(fis.files[0]);

}
















</script>

  
  
</head>
<body>
 
  
<app-root>
  

  
  <form class="writeForm" action="insert_recipe" method="post" enctype="multipart/form-data">
  <!-- Page Content -->
  <div class="container">
  <input type="hidden" name="mem_no" id="mem_no" value="${sessionScope.memNo}" readonly="readonly"> 


    <!-- ------------------- 클래스 등록  ---------------------  -->
    
   
	
	<div class="jumbotron my-4">
		
		
 
		<div class="show_class">
				<img src="./resources/image/class_write_img/head_icon01.png" >
				 <p3>레시피 등록</p3>
				 <hr>				
		</div>


			<div class="cont_box pad_l_60">
			
				<div id="divMainPhotoUpload" class="cont_pic2">
					
					<div id="divMainPhotoBox" is_over="0">
						<input type="file" name="file" id="file"
							file_gubun="step" 
							style="display:none;" multiple="" onchange="fileUpload(this);">
						<img id="write_photo" onclick="document.getElementById('file').click();" src="${pageContext.request.contextPath}/resources/image/class_write_img/photo_icon.png" style=" cursor: pointer;">
						<input type="hidden" name="recipe_thumbnail" id="recipe_thumbnail" value="">
					</div>  
										
					
				</div>
							
				
				
				<!--    클래스 제목  -->				
				
				<div class="cont_line">
					<p class="cont_tit4">레시피 제목</p>
					<input type="text" name="recipe_title" class="cok_title" id="recipe_title"
						class="form-control" placeholder="예) 뽀모도로 파스타 만들기">
				</div>
		
				
				<!--    클래스 소개  -->
								
				<div class="cont_line pad_b_25">
					<p class="cont_tit4">레시피 내용</p>
					<textarea name="recipe_content" id="recipe_content"
						class="form-control step_cont"
						placeholder="예) 집에서 쉽게 만드는 뽀모도로 파스타 레시피 입니다" 
						style=" resize: none; margin-left: 90px;"></textarea>
				</div>
				

				<!--   동영상   -->
				
				<div class="cont_line pad_b_25">
					<p class="cont_tit4" >레시피 동영상</p>
					<input type="hidden" name="video_photo" id="video_photo" value="">
					<input type="hidden" name="new_video_photo" id="new_video_photo" value=""> 
					<input type="hidden" name="del_video_photo" id="del_video_photo" value="1"> <input type="hidden"
						name="cok_video_src" id="cok_video_src" value="">
						
						
						<textarea name="recipe_video" class="recipe_video" id="recipe_video"  prev_url=""
						placeholder="조리법 영상 주소를 입력하세요.(Youtube,네이버tvcast,다음tvpot 만 가능) 예)http://youtu.be/lA0Bxo3IZmM"
						style=" resize: none;"></textarea>

					
				</div>
				
				
	
				<!--  정보   -->
				
				<div class="cont_line">
					<p class="cont_tit4">요리정보</p>

						<t1>시간</t1>						
						<select name="recipe_time" id="recipe_time" text="요리시간">
							<option value="">시간</option>
							<option value="5분이내">5분이내</option>
							<option value="10분이내">10분이내</option>
							<option value="15분이내">15분이내</option>
							<option value="20분이내">20분이내</option>
							<option value="30분이내">30분이내</option>
							<option value="60분이내">60분이내</option>
							<option value="90분이내">90분이내</option>
							<option value="2시간이내">2시간이내</option>
							<option value="2시간이상">2시간이상</option>
						</select>


						<t1>난이도</t1>						
						<select name="recipe_level" id="recipe_level" text="난이도">
							<option value="난이도">난이도</option>
							<option value="Easy">Easy</option>
							<option value="Normal">Normal</option>
							<option value="Hard">Hard</option>						
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
																
								<ul id="divMaterialArea_1" class="ui-sortable">
								
									<li id="liMaterial_1_1">
									<a href="#" class="btn-lineup ui-sortable-handle" data-original-title="" title=""></a>
										<input type="text" name="mate_name" id="mate_name" class="form-control" style="width: 330px;" placeholder="예) 돼지고기">
										<input type="text" name="mate_cnt" id="mate_cnt" class="form-control" style="width: 280px;" placeholder="예) 300g">
										<a id="btnMaterialDel_1_1" href="javascript:delMaterial(1,1)" class="btn-del" style="display: none;"></a>
									</li>
									
									<li id="liMaterial_1_2">
										<a href="#" class="btn-lineup ui-sortable-handle" data-original-title="" title=""></a>
										<input type="text" name="mate_name" id="mate_name" class="form-control" style="width: 330px;" placeholder="예) 양배추">
										<input type="text" name="mate_cnt" id="mate_cnt" class="form-control" style="width: 280px;" placeholder="예) 1/2개">
										<a id="btnMaterialDel_1_2" href="javascript:delMaterial(1,2)" class="btn-del" style="display: none;"></a>
									</li>
									
									<li id="liMaterial_1_3">
										<a href="#" class="btn-lineup ui-sortable-handle" data-original-title="" title=""></a>
										<input type="text" name="mate_name" id="mate_name" class="form-control" style="width: 330px;" placeholder="예) 참기름">
										<input type="text" name="mate_cnt" id="mate_cnt" class="form-control" style="width: 280px;" placeholder="예) 1T">
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


						  <!--  noti    -->
						
				
				
				
				
					<div class="mag_b_25 ui-sortable" id="divGroupArea">
					
						<hr>	
					
					
							<li id="recipeGroup_1">
							
								<p class="recipe_tit">조리 순서</p>	
								
														
								<ul id="divRecipeArea_1" class="ui-sortable">
								
									<li id="rcMaterial_1_1">
									<a href="#" class="btn-lineup ui-sortable-handle" data-original-title="" title=""></a>
										<input type="text" name="step" id="step" class="form-control" style="width: 610px; height: 150px;" placeholder="step1 &nbsp; &nbsp; 예) 베이컨을 얇게 썰어주세요">										
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

<!-- ------------------- 요리순서 등록  ---------------------  -->
    
	      <!--    jumbotron my-4    -->
		
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
						<select name="kind_tag_no" id="kind_tag_no" text="종류">
							<option value="10">한식</option>
							<option value="20">양식</option>
							<option value="30">일식</option>
							<option value="40">중식</option>
							<option value="50">아시안</option>
							<option value="60">Vegan</option>
							<option value="70">Quick Food</option>
							<option value="80">Dessert</option>
							<option value="90">기타</option>
						</select>


						<t1>메인</t1>						
						<select name="material_tag_no" id="material_tag_no" text="메인재료">
							<option value="12">돼지고기</option>
							<option value="22">소고기</option>
							<option value="32">닭고기</option>
							<option value="42">해산물</option>					
							<option value="52">채소/과일류</option>					
							<option value="62">기타</option>					
						</select>
						
						<t1>테마별</t1>						
						<select name="theme_tag_no" id="theme_tag_no" text="테마별">
							<option value="11">일상</option>
							<option value="21">손님접대</option>
							<option value="31">술안주</option>					
							<option value="41">다이어트</option>					
							<option value="51">간식</option>					
							<option value="61">기타</option>					
						</select>

					</div>
	
	</div>  <!--   jumbotron my-4   -->

<!-- ------------------- 버튼  ---------------------  -->
    
	<div class="jumbotron my-4">

		<div class="buttonWrap">
		
			 <button type="submit" class="saveBT" >
		    	  <span class="saveBTsp"></span> 
		    	 	저장
		    </button>
		     <button type="reset" class="closeBT">
		    	  <span class="closeBTsp"></span> 
		    	 	취소
		    </button>
		
		
		</div>	  <!--    buttonWrap    -->		
 
	</div>   <!--    jumbotron my-4    -->


 </div><!-- /.container -->
 
 
</form> 

<!--     ------------------   footer 영역    -------------------        -->

  
 </app-root> 
 
</body>
</html>
