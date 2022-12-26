<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> Necipe</title>
<link rel="stylesheet" type="text/css" href="resources/css/basic.css" />
<link rel="stylesheet" href="resources/css/style.css" type="text/css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
   <div id="wrap">
      <tiles:insertAttribute name="header"/>
         <tiles:insertAttribute name="body"/>
      <tiles:insertAttribute name="footer"/>
   </div>
   <div id='aaaa'></div>
</body>
<script>
   $(document).ready(function(){
       $.ajax({
    	   url:"classCounter"
    		,success:function(cnt){
    			$('#membercnt').text(cnt.membercnt);
    			$('#recipecnt').text(cnt.recipecnt);
                $('#chefrecipecnt').text(cnt.chefrecipecnt);
                $('#classcnt').text(cnt.classcnt);
    		}
       		,error:function(err){
       			alert(err)
       		}
                 
       })
   })
   
</script>
</html>







