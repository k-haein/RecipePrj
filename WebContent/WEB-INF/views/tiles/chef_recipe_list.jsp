<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Cookiteer</title>
  <!-- <base href="/"> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_header.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_main.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_style.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chef_list.css" media="all" />
  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_magnific-popup.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_slick.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_slick-theme.css" media="all" />
  
 <style type="text/css">
 
 #chef_search_category_text{
 
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
    $(document).ready(function(){
                ToggleCategory();
      $('.like_img').click(function(){
		  //var reviewNo = $(this).find('input[name="review_no"]').val();
		  //alert(reviewNo);
		  var subscribe_mem_no = $(this).find('input[name="subscribe_mem_no"]').val();
		  var kind_tag_no = $(this).find('input[name="kind_tag_no"]').val();
		  //var likeimgurl = $(this).find('${pageContext.request.contextPath}/resources/img/like.png')
		  //var dislikeimgurl = $(this).find('${pageContext.request.contextPath}/resources/img/dislike.png')
		  //var aaa = $(this).find('img[src^=.png]').val()
		  //alert(aaa);
		  //alert(subscribe_mem_no);
		  //alert(kind_tag_no);
		  $.ajax({
			  type:'post',
			  url : 'subscribe',
			  dataType: 'JSON',
			  data : { 'subscribe_mem_no' : subscribe_mem_no,
				  		'kind_tag_no' : kind_tag_no},
			  async: true,
			  success : function(data){
				  if(data.success > 0) //
				  {
					  if(confirm("구독을 취소 하시겠습니까?")){
					  alert("구독을 취소 하였습니다")
					  location.href="chef_recipe_list";
			  		  }
				  }
				  else{
					  //$('#like_png').attr('src', dislikeimgurl);
					  if(confirm("구독을 등록 하시겠습니까?")){
					  alert("구독을 등록 하였습니다")
					  location.href="chef_recipe_list";
					  location.reload();
				  	  }
				  }
			  },
			  error : function(request,status,error){
				  alert("err")
				  //$(location).attr('href',"recipe_detail?recipe_no="+recipe_no);
			  }
		  })
	  });
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

    function ToggleCategory()
    {
        $('#id_search_category').toggle();
        if ($('#id_search_category').is(":visible"))
        {
            $('#id_search_category_text').text('카테고리 닫기');
            $('#id_search_category_img').attr("src",'https://recipe1.ezmember.co.kr/img/icon_arrow9_up.gif');
        }
        else
        {
            $('#id_search_category_text').text('카테고리 열기');
            $('#id_search_category_img').attr("src",'https://recipe1.ezmember.co.kr/img/icon_arrow9_down.gif');
        }

    }

    function ChefCategory()
    {
        $('#chef_search_category').toggle();
        if ($('#chef_search_category').is(":visible"))
        {
            $('#chef_search_category_text').text('close');
            $('#chef_search_category_img').attr("src",'https://recipe1.ezmember.co.kr/img/icon_arrow9_up.gif');
        }
        else
        {
            $('#chef_search_category_text').text('open');
            $('#chef_search_category_img').attr("src",'https://recipe1.ezmember.co.kr/img/icon_arrow9_down.gif');
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
      
      
         <form class="ct-newsletter" action="chefSearch" method="get">
	      	<!-- <select id="recipeSearchKey" name="recipeSearchKey" 
	      	style="height: 50px; padding: 8px 15px; border-radius: 8px; border: 1px solid #efefef; width: 17%; 
	      	color: #6e6e6e; border-color: #e5e1dc;background-color: #fff; letter-spacing: 0.1px; font-size: 15px;">
				<option value="이름">이름</option>						
			</select> -->
			
	        <input type="text" id="chef_Keyword" name="chef_Keyword" class="form-control" placeholder="쉐프를 검색해 보세요" >
	        
	        <button type="submit" class="btn-custom primary" name="button">search</button>
	      </form>
	      
	      
        </nav>
      </div>
    </div>
  </div>
  <!-- Subheader End -->
	
  <!-- Recipes Start -->
  <section class="section">
    <div class="container">
     <div class="sidebar-widget tags" id="chef_search_category">
              <h5>Popular Tags</h5>
         <c:forEach items="${kind}" var="k">
         <a href="chefkindTagSelect?kind_tag_no=${k.kind_tag_no}">${k.kind_tag_name}</a>
         </c:forEach>
     </div>
     <a href="javascript:ChefCategory()">
     <span id="chef_search_category_text">close</span>
     <span><img id="chef_search_category_img" src="https://recipe1.ezmember.co.kr/img/icon_arrow9_up.gif"></span>
     </a><br/><br/>
		
	<form>
      <div class="row">
        <!-- Recipes Start -->
        <div class="col-lg-8">
        <c:choose>
        <c:when test="${!empty chef_list}">
        <c:forEach items="${chef_list}" var="row">
          <div class="recipe recipe-list">
            <div class="recipe-thumbnail">
              <a href="memTagSelect?mem_no=${row.mem_no}">
                <img src="${pageContext.request.contextPath}/resources/image/member_upload/${row.mem_pic}" alt="blog post" onerror="this.src='${pageContext.request.contextPath}/resources/img/chef3.png'">
              </a>
            </div>
            <div class="recipe-body">
              <h5 class="recipe-title"> <a href="memTagSelect?mem_no=${row.mem_no}">${row.mem_nickname}</a>
              
              
              <c:if test="${sessionScope.memNo != null}">
              	<a href="javascript:void(0);" id='like_img' class='like_img'>
              	<input type="hidden" id="kind_tag_no" name="kind_tag_no" class="kind_tag_no" value="${row.kind_tag_no}">
              	<input type="hidden" id="subscribe_mem_no" name="subscribe_mem_no" class="subscribe_mem_no" value="${row.mem_no}">
              	<img src='${pageContext.request.contextPath}/resources/img/plus.png' name="like_png" id="like_png" class="like_png" style="width:30px; height:30px">
              	</a>
              </c:if>
              	
              
                </h5>
              <!-- <p class="recipe-text">이탈리아 음식 전문가 김양식 쉐프입니다 베네치아의 레스토랑에서 5년동안 헤드쉐프로.....어쩌고..저쩌고....</p> -->
              <div class="recipe-meta">
                <div class="recipe-difficulty">
                  <div class="recipe-difficulty-inner">
                    <span class="active"></span>
                    <span></span>
                    <span></span>
                  </div>
                  <span><d12>${row.kind_tag_name}</d12></span>
                </div>
                <div class="recipe-steps">
                  <span><i class="fas fa-concierge-bell"></i><d12>${row.recipe_cnt} Posting</d12></span>
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
                <input type="submit" class="page-link" formaction="chefpage" name="page" value="${p}"/>
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
            <c:forEach items="${bestchef}" var="bestc" varStatus="status" begin="0" end="3">
              <h5>인기 쉐프</h5>
              <article class="media">
                <a href="/blog-single-v2"><img src="${pageContext.request.contextPath}/resources/image/member_upload/${bestc.mem_pic}" alt="post"></a>
                <div class="media-body">
                  <h6> <a href="/blog-single-v2">${bestc.mem_nickname}</a> </h6>
                  <p><d12>${bestc.kind_tag_name}</d12></p>
                </div>
              </article>
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
  

<!--     ------------------   footer 영역    -------------------        -->

<!-- Newsletter start -->
 
  <!-- Newsletter End -->
  

  <!-- Footer Start -->
  
  <!-- Footer End -->
  
 
  </app-root>
</body>
</html>
