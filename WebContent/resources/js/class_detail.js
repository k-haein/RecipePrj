$(document).ready(function(){


$('.second_body').show();

$('.coment_write').hide();

$('.show_class_prop_1').hide();
 
$('.show_video').hide();

$('#show_class_content_video').hide(); 
 
$('#show_class_content_prop').hide();

$('#show_class_content_class').hide();

$('#show_class_content_mate').hide();

$('#show_class_content_step').hide();
   
$(".report-content").hide();
 
 $(".popBT").hide();
  



  $('.reportBT').hover(function(){
        $(".popBT").css('display','block');
    }, function() {
        $(".popBT").css('display','none');
    });






  $('.reportBT').hover(function(){
        $(".popBT").css('display','block');
    }, function() {
        $(".popBT").css('display','none');
    });




$('.reportXBT').click(function(){
						
					 $('.report-content').css({	
							
						'display':'none' });
						 event.preventDefault();
						
		}); 




$('.reportBT').click(function(){
						
					 $('.report-content').css({	
							
						'display':'block' });
						 event.preventDefault();
						
		}); 




$('.close').click(function(){
						
					 $('.coment_write').css({	
							
						'display':'none' });
						
		}); 




$('#comment_BT_close').click(function(){
						
					 $('.coment_write').css({	
							
						'display':'none' });
						
		}); 



 $("#show_classVideo").hide();
 
 
 

$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);



$('.close').click(function(){
						
					 $('.coment_write').css({	
							
						'display':'none' });
						
		}); 



$('#comment_BT_close').click(function(){
						
					 $('.coment_write').css({	
							
						'display':'none' });
						
		}); 


$('.starFree').click(function(){
	$("#show_class_content_video").fadeToggle(600, 'linear');
 	 event.preventDefault();
 	 

 })



$('.starClass').click(function(){
	$("#show_class_content_class").fadeToggle(600, 'linear');
 	 event.preventDefault();
 	 

 })



$('.starProp').click(function(){
	$("#show_class_content_prop").fadeToggle(600, 'linear');
 	 event.preventDefault();
 	 

 })





$('.starMate').click(function(){
	$("#show_class_content_mate").fadeToggle(600, 'linear');
 	 event.preventDefault();
 	 

 })





$('.starStep').click(function(){
	$("#show_class_content_step").fadeToggle(600, 'linear');
 	 event.preventDefault();
 	 

 })



  	
$('.start_icon').click(function(){
	$("#show_classVideo").fadeToggle(600, 'linear');
 	 event.preventDefault();
 	 

 })
   	


$('#closeProp').click(function(){
	$(".show_class_prop_1").slideToggle('slow');
 	 event.preventDefault();
 	 

 })
   	

$(".prop_icon").click(function(){
               $(".show_class_prop_1").slideToggle('slow');
 				 event.preventDefault();
            })
            

});
