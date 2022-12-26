$(document).ready(function(){


$('.close_liMaterial').hide();


$('.close').click(function(){
						
					 $('.coment_write').css({	
							
						'display':'none' });
						
		}); 
		
		

    $('.sectionAdd').mouseover(function () {  
    
     $(".close_liMaterial").css({'display':'inline-block' });   

    });
    
    $(".sectionAdd").mouseout(function () {
         $(".close_liMaterial").css({'visibility':'hidden' });
    });
    
    
});
