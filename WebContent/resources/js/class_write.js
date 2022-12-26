$(document).ready(function(){


$('.close_liMaterial').hide();


		$('.close').click(function(){
								
			 $('.coment_write').css({ 'display':'none' });
								
		}); 
			
		

    $('.sectionAdd').mouseover(function () {  
    
    	 $(".close_liMaterial").css({'display':'inline-block' });   

    });
    
    
    $(".sectionAdd").mouseout(function () {
    
         $(".close_liMaterial").css({'visibility':'hidden' });
    });
    
    
    
    
function checkForm(){

					
				 if($("#file").val() == ""){
					 				 
						 $(".filechekText").html('썸네일 사진을 등록하세요');
					   
	     			   
	     			   return false;
	     			   
	     			 }	else{	

						 $(".filechekText").html('사진이 등록되었습니다');
						 $(".filechekText").attr("style", 'color:blue');
										
						}
	
			
			
				
					 if($("#class_title").val() == ""){
					 				 
						 $(".chekText").html('클래스 제목을 적어주세요');
					        			 
	     			   $("#class_title").focus();
	     			   
	     			   return false;
	     			   
	     			 }	else{	

						 $(".chekText").html('클래스 이름 확인');
						 $(".chekText").attr("style", 'color:blue');
										
						}
	
     			      			 
					
					 if($("#class_cooktime").val() == ""){
				 
	       			 alert("시간을 선택해주세요!");
	       			 
	     			   return false;
	     			   
	     			 }
	     			 
     			 
	     			  if($("#class_period").val() == ""){
				 
	       			 alert("수강기간을 선택해주세요!");
	       			 
	     			   
	     			   return false;
	     			   
	     			 }
	      
				 
				   if($("#class_price").val() == ""){
				   
				     $(".priceText").html('가격을 입력해주세요.');
				        			 
	     			   
	     			   return false;
	     			   
	     			 }else{	

						 $(".priceText").html('가격 확인');
						 $(".priceText").attr("style", 'color:blue');
										
						}
	


				


//-- **************** 【 	재료, 재료등록 부분 	】 *****************************
	

			
					 if($("#mate_name").val() == ""){
					 
					   $(".mateText").html('재료와 재료 수량을 입력해주세요');
				  
				
						 $("#mate_name").focus();
					  return false;
					 
					 }else{	

						 $(".mateText").html('입력 확인');
						 $(".mateText").attr("style", 'color:blue');
										
						}
						
				 
				  if($("#mate_cnt").val() == ""){
					 
					   $(".mateText").html('재료와 재료 수량을 입력해주세요');
				  
					 	 return false;				 
					 }else{	

						 $(".mateText").html('입력 확인');
						 $(".mateText").attr("style", 'color:blue');
										
						}
				  
				  



//-- **************** 【 	조리법 부분 	】 *****************************

								
					 if($("#step").val() == ""){
					 
					   $(".stepText").html('조리법을 입력해주세요');
				  
				
						 $("#step").focus();
					 
					  return false;
					 }else{	

						 $(".stepText").html('입력 확인');
						 $(".stepText").attr("style", 'color:blue');
										
						}
				  




//-- **************** 【 	태그 등록 부분 	】 *****************************



							if($("#kind_tag").val() == ""){
							 
				       			 alert("태그 종류를 선택해주세요!");
				       			 
				     			   $("#kind_tag").focus();
				     			   
				     			   return false;
				     			   
				     			 }
				     			 
				     			 
				     			 
				     			 if($("#material_tag").val() == ""){
							 
				       			 alert("메인 태그를 선택해주세요!");
				       			 
				     			   $("#material_tag").focus();
				     			   
				     			   return false;
				     			   
				     			 }
				     			 
				     			 
				     			 
				     			 if($("#theme_tag").val() == ""){
							 
				       			 alert("태그 종류를 선택해주세요!");
				       			 
				     			   $("#theme_tag").focus();
				     			   
				     			   return false;
				     			   
				     			 }     			 				  
				  
				  
//-- **************** 【 	체크 부분 	】 *****************************


				     			
				 				
				     	if( $("#admin_app").is(":checked") == false){
				     			 	
									 
						 $(".adminText").html('동의사항에 체크 해주세요!');
						 
						 return false;
									 
										
						}
	 
	 
	 
	 }
	 
	 
    
 $('.saveBT').click(function(){
 
               if(checkForm()==0){
					
					alert('입력양식을 다시 확인하세요');
					
					
					return false;
					
                   
               }else{
               
                   return true;
                   
               }
               
	 })       
	 

		$( ".closeBT").click(function () {
				
				$( ".writeForm" ).each( function () { 
				
				  this.reset();
				  
				 });
				
			})	
		
		
    
});
