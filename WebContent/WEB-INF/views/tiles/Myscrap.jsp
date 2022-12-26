<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>스크랩</title>
<!--   <base href=""> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="./resources/img/favicon.ico">
  


<link rel="stylesheet" type="text/css" href="./resources/css/header.css" media="all" /><!-- 글씨가 작아지네..?
<link rel="stylesheet" type="text/css" href="./resources/css/main.css" media="all" /> 
<link rel="stylesheet" type="text/css" href="./resources/css/style.css" media="all" />-->

 
<!------ Include the above in your HEAD tag ---------->
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="./resources/css/Myscrap.css" media="all" />
<!------ Include the above in your HEAD tag ---------->
 

<!-- 
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/bootstrap.min.css" media="all" /> 

 
<link rel="stylesheet" type="text/css" href="./resources/css/primary-skin.css" media="all" />

<link rel="stylesheet" type="text/css" href="./resources/css/plugins/animate.min.css" media="all" />



<link rel="stylesheet" type="text/css" href="./resources/css/plugins/magnific-popup.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/slick.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/plugins/slick-theme.css" media="all" />
<!--

-->


  
  <!--********** 【 js 링크 걸기 】********** -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="./resources/js/main.js" type="text/javascript" charset="utf-8"></script>

<script src="./resources/js/plugins/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>



<!-- 
<script src="./resources/js/plugins/isotope.pkgd.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.countdown.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.magnific-popup.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.slimScroll.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery.steps.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/popper.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/slick.min.js" type="text/javascript" charset="utf-8"></script>
<script src="./resources/js/plugins/waypoint.js" type="text/javascript" charset="utf-8"></script> 
-->

  <style>

  .scrap {
    background-color: #bbdefb;
  }

</style>
</head>


<body>
 

  
<!-- 빅데이터 Start -->


<div class="container">	
	<div class="row">

		<section class="content">
			<h1>My Scrap Box</h1>
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-body">						
						<div class="table-container">
						
							<table class="table table-filter" name="scrap">
								<tbody>
									<tr>
										<th>스크랩 리스트</th>
									</tr>
								<c:forEach var="scrapList" items="${scrapList}">

								
									<tr data-status="filter1">
			
										<td>
											<div class="media">
												<a href="recipe_detail?recipe_no=${scrapList.recipe_asso.recipe_no}" class="pull-left">
													<img src="${pageContext.request.contextPath}/resources/image/recipe_upload/${scrapList.recipe_asso.recipe_thumbnail}" class="media-photo" style="height: 100px; width: 100px;">
												</a>
												<div class="media-body">
													<span class="media-meta pull-right">${scrapList.scrap_uploadtime}</span>
													<h4 class="title">
														${scrapList.recipe_asso.recipe_title}
														<span class="pull-right pagado">${scrapList.recipe_asso.recipe_time} / ${scrapList.recipe_asso.recipe_level} </span>
													</h4>
													<p class="summary"><br>  ${scrapList.recipe_asso.recipe_content} </p>
												</div>
											</div>
										</td>
									</tr>									
							</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="4" id="pageTd">
											<%-- page 처리  --%>
											<%@include file="pageProcess_scrap.jsp" %>
										</td>
									</tr>
								</tfoot>
								
							</table>
						</div>
					</div>
				</div>			
			</div>
		</section>
		
	</div>
</div>
 
 
</body>
</html>
