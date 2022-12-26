<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Recipe_list</title>
  <!-- <base href="/"> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" >

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_header.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_main.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_style.css" media="all" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_magnific-popup.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_slick.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_slick-theme.css" media="all" />
  
 <style type="text/css">
 #search_category_text{
 	margin: 0 0 0 85%;
 }
 </style>
  
  
  
  
  
    <!--********** 【 js 링크 걸기 】********** -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js" type="text/javascript" charset="utf-8"></script>

<script src="${pageContext.request.contextPath}/resources/js/plugins/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>



<script src="${pageContext.request.contextPath}/resources/js/plugins/isotope.pkgd.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery.countdown.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery.magnific-popup.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery.slimScroll.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery.steps.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/popper.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/slick.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/waypoint.js" type="text/javascript" charset="utf-8"></script>

<!--  
  -->

<script>
    var _IS_SEARCH_RESTRICT = false;
    $(document).ready( function() {
                ToggleCategory();
            });

    function goSearchRecipe(ca, val)
    {
        if (val == 'reco' && _IS_SEARCH_RESTRICT) {
            viewPremiumSearchModal();
        } else {
            $("#srRecipeFrm [name='"+ca+"']").val(val);
            $("[name='lastcate']").val(ca);
            $("#srRecipeFrm").submit();
        }
    }

    function doSetSearch(filters, val)
    {
        if(!filters || !val) return ;
        $("[id^=li_"+filters+"_]").removeClass("active");
        // cancel
        if($("#dsf_"+filters).val() == val)
        {
            $("#dsf_"+filters).val('');
        }
        else
        {
            $("#li_"+filters+"_"+val).addClass("active");
            $("#dsf_"+filters).val(val);
        }
    }

    function doDetailSearch()
    {
        $("[name=dsearch]").val("y");
        if($("#ni_resource").val()) $("[name=niresource]").val($("#ni_resource").val());
        $("#srRecipeFrm").submit();
    }

    function SearchCategory()
    {
        $('#search_category').toggle();
        if ($('#search_category').is(":visible"))
        {
            $('#search_category_text').text('close');
            $('#search_category_img').attr("src",'https://recipe1.ezmember.co.kr/img/icon_arrow9_up.gif');
        }
        else
        {
            $('#search_category_text').text('open');
            $('#search_category_img').attr("src",'https://recipe1.ezmember.co.kr/img/icon_arrow9_down.gif');
        }

    }
</script>

</head>
<body>
  <app-root>
  


<!-- Subheader Start -->
  <div class="subheader bg-cover dark-overlay dark-overlay-2" style="background-image: url('${pageContext.request.contextPath}/resources/img/main_img.jpg')">
    <div class="container">
      <div class="subheader-inner">
        <div class="container">
	     
	      <form class="ct-newsletter" action="recipeSearch" method="get">
	      	<select id="recipeSearchKey" name="recipeSearchKey" 
	      	style="height: 50px; padding: 8px 15px; border-radius: 8px; border: 1px solid #efefef; width: 17%; 
	      	color: #6e6e6e; border-color: #e5e1dc;background-color: #fff; letter-spacing: 0.1px; font-size: 15px;">
				<option value="">제목</option>
				<option value="재료">재료</option>							
			</select>
			
	        <input type="text" id="recipeSearch_Keyword" name="recipeSearch_Keyword" class="form-control" placeholder="제목이나 재료를 검색하세요" value="${sessionScope.recipeSearch_Keyword}">
	        
	        <button type="submit" class="btn-custom primary" name="button"> <a href='http://127.0.0.1:8000/RecipePrj_01/'  style="color: white">Search</a> <i class="far fa-paper-plane"></i> </button>
	      </form>
	      
    	</div>
      </div>
    </div>
  </div>
  <!-- Subheader End -->
	
  <!-- Recipes Start -->
  <section class="section">
    <div class="container">
     <div class="sidebar-widget tags" id="search_category">
              <h5>Popular Tags</h5>
              <div id="kind">
              <c:forEach items="${kind}" var="k">
              <a href="kindTagSelect?kind_tag_no=${k.kind_tag_no}">${k.kind_tag_name}</a>
              </c:forEach>
              </div>
              <div id="material">
              <c:forEach items="${mate}" var="m">
              <a href="materialTagSelect?material_tag_no=${m.material_tag_no}">${m.material_tag_name}</a>
              </c:forEach>
              </div>
              <div id="theme">
              <c:forEach items="${theme}" var="t">
              <a href="themeTagSelect?theme_tag_no=${t.theme_tag_no}">${t.theme_tag_name}</a>
              </c:forEach>
              </div>
     </div>
     <a href="javascript:SearchCategory()" style="display:block;width:100%;">
     <span id="search_category_text">close</span>
     <span><img id="search_category_img" src="https://recipe1.ezmember.co.kr/img/icon_arrow9_up.gif"></span>
     </a><br/><br/>
    
    <form>
      <div class="row">
        <!-- Recipes Start -->
        <div class="col-lg-8">
        <c:choose>
        <c:when test="${!empty recipe_list}">
        	<c:forEach items="${recipe_list}" var="row">
          <div class="recipe recipe-list">
            <div class="recipe-thumbnail">
              <a href="recipe_detail?recipe_no=${row.recipe_no}">
                <img src="${pageContext.request.contextPath}/resources/image/recipe_upload/${row.recipe_thumbnail}" alt="blog post" style="height: 130px; width: 200px;">
              </a>
            </div>
            <div class="recipe-body">
              <h5 class="recipe-title"><a href="recipe_detail?recipe_no=${row.recipe_no}">${row.recipe_title}</a> </h5>
              <p class="recipe-text">${row.recipe_content}</p>
              <div class="recipe-meta">
                <div class="recipe-difficulty">
                  <div class="recipe-difficulty-inner">
                  	<c:if test="${row.recipe_level eq 'Hard'}">
                    <span class="active"></span>
                    <span class="active"></span>
                    <span class="active"></span>
                    </c:if>
                  	<c:if test="${row.recipe_level eq 'Normal'}">
                    <span class="active"></span>
                    <span class="active"></span>
                    <span></span>
                    </c:if>
                  	<c:if test="${row.recipe_level eq 'Easy'}">
                    <span class="active"></span>
                    <span></span>
                    <span></span>
                    </c:if>
                  </div>
                  <span>${row.recipe_level}</span>
                </div>
                <div class="recipe-steps">
                  <span><i class="fas fa-concierge-bell"></i>Posted by ${row.mem_nickname}</span>
                </div>
                <div class="recipe-duration">
                  <span><i class="fas fa-stopwatch"></i>조회수 ${row.visit_cnt}</span>
                </div>
              </div>
            </div>
          </div>
          	</c:forEach>
          	</c:when>
			</c:choose>
			
          <!-- Pagination Start -->
            
            <ul class="pagination">
          
            <c:forEach var="p" items="${p_num}">
                <li class="page-item">
                <input type="submit" class="page-link" formaction="repage" name="page" value="${p}"/>
                </li>
            </c:forEach>   
            
            </ul>
                        
          <!-- Pagination End -->

       		 </div>    
       		 <!-- Recipes End -->
	</form>
        <!-- Sidebar Start -->
        <div class="col-lg-4">
          <app-recipe-sidebar>
          <div class="sidebar">

            <div class="sidebar-widget">
              <h5>요즘 뜨는 인기 레시피</h5>
              
				<c:forEach items="${best}" var="b" varStatus="status" begin="0" end="2">
              <div class="recipe featured-recipe">
                <div class="recipe-thumbnail">
                  <a href="recipe_detail?recipe_no=${b.recipe_no}">
                    <img src="${pageContext.request.contextPath}/resources/image/recipe_upload/${b.recipe_thumbnail}" alt="blog post" style="height: 250px; width: 350px;">
                  </a>
                </div>
                <div class="recipe-body">
                  <h6 class="recipe-title"> <a href="recipe_detail?recipe_no=${b.recipe_no}">${b.recipe_title}</a> </h6>
                  <div class="recipe-meta">
                    <div class="recipe-difficulty">
                      <div class="recipe-difficulty-inner">
                        <c:if test="${row.recipe_level eq 'Hard'}">
		                    <span class="active"></span>
		                    <span class="active"></span>
		                    <span class="active"></span>
	                    </c:if>
	                  	<c:if test="${row.recipe_level eq 'Normal'}">
		                    <span class="active"></span>
		                    <span class="active"></span>
		                    <span></span>
	                    </c:if>
	                  	<c:if test="${row.recipe_level eq 'Easy'}">
		                    <span class="active"></span>
		                    <span></span>
		                    <span></span>
	                    </c:if>
                      </div>
                      <span>${b.recipe_level}</span>
                    </div>
                    <div class="recipe-steps">
                      <span><i class="fas fa-concierge-bell"></i>조회수 : ${b.visit_cnt}</span>
                    </div>
                  </div>
                </div>
              </div>
				</c:forEach>
            </div>

          </div>
          </app-recipe-sidebar>
        </div>
        <!-- Sidebar End -->

      </div>

    </div>
  </section>
  <!-- Recipes End -->
  <!-- Newsletter start  -->
 
  </app-root>
</body>
</html>
