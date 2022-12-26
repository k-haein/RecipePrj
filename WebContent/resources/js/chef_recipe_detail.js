$(document).ready(function(){


$('.second_body').show();

$('.coment_write').hide();
 

 
 $(".popBT").hide();
  
 
 $(".report-content").hide();
 
 
 
 

$(".hover").mouseleave(
  function () {
    $(this).removeClass("hover");
  }
);






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


            
            

});
