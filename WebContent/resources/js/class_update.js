

 $(document).ready(function(){

	  $('#kind_tag_no option').each(function(){

	    if($(this).val()=="${classUpDe.kind_tag_no}"){

	      $(this).attr("selected","selected"); 

	    }

	  });
	  
	  
	  	  
	  $('#material_tag_no option').each(function(){

		    if($(this).val()=="${classUpDe.material_tag_no}"){

		      $(this).attr("selected","selected"); 

		    }

		  });
	  
	  
	  
	  $('#theme_tag_no option').each(function(){

		    if($(this).val()=="${classUpDe.theme_tag_no}"){

		      $(this).attr("selected","selected"); 

		    }

		  });
	  
	  

	  $('#class_cooktime option').each(function(){

		    if($(this).val()=="${classUpDe.class_cooktime}"){

		      $(this).attr("selected","selected"); 

		    }

		  });
	  

	  $('#class_period option').each(function(){

		    if($(this).val()=="${classUpDe.class_period}"){

		      $(this).attr("selected","selected"); 

		    }

		  });
	  
	  
	  
	  

	});









