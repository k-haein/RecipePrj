<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Recipe_Detail</title>
    <style type="text/css">
    

    
  .info_star img{
	
	width: 20px;
	height: 20px;
	margin-left: 1px;
	margin-top: 1px;
	display: inline-block;
}
	
  .rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 30px;
    height: 30px;
    background-image: url('${pageContext.request.contextPath}/resources/img/starrate.png');
    background-repeat: no-repeat;
    background-size: 30px 30px;
    cursor: pointer;
    background-color: #f0f0f0;
}

.rating .rate_radio:checked + label {
    background-color: #ffee00;
}

/* .reviewstar{    
	position: relative;
    margin-left: -4px;
    z-index: 10;
    width: 27px;
    height: 27px;
    background-image: url('${pageContext.request.contextPath}/resources/img/starrate.png');
    background-repeat: repeat-x;
    background-size: 31px 31px;background-color: #ffee00;} */

.warning_msg {
    display: none;
    position: relative;
    text-align: center;
    background: #ffffff;
    line-height: 26px;
    width: 100%;
    color: red;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #e0e0e0;
}

  </style>
  <!-- <base href="/"> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon">
  
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_header.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_main.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/recipe_list_style.css" media="all" />
  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_magnific-popup.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_slick.css" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plugins/recipe_list_slick-theme.css" media="all" />
  
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

   <script type="text/javascript">
    // 별점 선택 안할시 이벤트
    // 리뷰 5자 미만이면 메시지 표시   
    /*data :  {mem_no : $('#mem_no').val(),
		            recipe_no : $('#recipe_no').val(),
	                star_rate : $('input[name=star_rate]:checked').length,
	                review_content : $('#review_content').val()
	                },*/
   
	                
   $(document).ready(function(){
	  $('#save').click(function(){
		  var review = $('#review_content').val().length;
		  if(rating.rate == 0){
	  		alert("별점을 선택해 주세요");
		  }
	      
	      if(review < 5){
    	    alert("리뷰는 5글자 이상 작성하셔야 합니다");
	      }
	      else{
	    	  reviewform.submit();
    	  }
	      // 댓글 인서트 Ajax
	      var recipe_no = $('#recipe_no').val();
	      $.ajax({
	    	 	type:'post',
		       	url : 'RecipeReviewInsert',
		       	data :  {mem_no : $('#mem_no').val(),
		            recipe_no : $('#recipe_no').val(),
	                star_rate : $('input[name=star_rate]:checked').length,
	                review_content : $('#review_content').val()
	                }, 
		       	success : function(data){
		       		if(data=="success")
	       			{
		       			getCommentList();
		                $("#review_content").val("");
		                location.href="recipe_detail?recipe_no="+recipe_no;
		                // location.href="redirect:recipe_detail?recipe_no="+recipe_no; 
	       			}
		       	},
		       	error : function(request,status,error){
		       		alert('에러');
		       	}
          }); // ajax 닫는곳
	  })  // click 이벤트 닫는곳 
	    
	  // 댓글 딜리트 Ajax
	  $('.reply-link').click(function(){
		  var recipe_no = $('#recipe_no').val();
		  var reviewNo = $(this).find('input[name="review_no"]').val();
		  $.ajax({
			  type:'post',
			  url : 'reviewDelete',
			  data : {'review_no' : reviewNo }, 
			  success : function(data){
				  if(data=="success")
				  {
					  location.reload();
				  }
			  },
			  error : function(request,status,error){
				  alert('에러입니당 ㄹㅇㅋㅋ');
			  }
		  }) // ajax 닫는곳
	  }); // click 이벤트 닫는곳
	  
	  // 스크랩 Ajax 시작
	  $('#like_img').click(function(){
		  //var reviewNo = $(this).find('input[name="review_no"]').val();
		  //alert(reviewNo);
		  var recipe_no = $('#recipe_no').val();
		  $.ajax({
			  type:'post',
			  url : 'scrapcontrol',
			  dataType: 'JSON',
			  data : { 'recipe_no' : $('#recipe_no').val()},
			  async: true,
			  success : function(data){
				  if(data.success > 0)
				  {
					  //$(location).attr('href',"recipe_detail?recipe_no="+recipe_no);
					  //location.href("redirect:recipe_detail?recipe_no="+recipe_no);
					  location.reload();
				  }
			  },
			  error : function(request,status,error){
				  alert("err")
				  //$(location).attr('href',"recipe_detail?recipe_no="+recipe_no);
				  location.href("recipe_detail?recipe_no="+recipe_no);
			  }
		  }) // ajax 닫는곳
	  }); // click 이벤트 닫는곳
  }); // ready function 닫는곳
   
  
  /**
   * 댓글 불러오기(Ajax)
   */
  /* function getCommentList(){
      
      $.ajax({
          type:'GET',
          url : 'recipe_detail',
          dataType : "json",
          data:$("#commentForm").serialize(),
          contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
          success : function(data){
              
              var html = "";
              var cCnt = data.length;
              
              if(data.length > 0){
                  
                  for(i=0; i<data.length; i++){
                      html += "<div>";
                      html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                      html += data[i].comment + "<tr><td></td></tr>";
                      html += "</table></div>";
                      html += "</div>";
                  }
                  
              } else {
                  
                  html += "<div>";
                  html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                  html += "</table></div>";
                  html += "</div>";
                  
              }
              
              $("#cCnt").html(cCnt);
              $("#commentList").html(html);
              
          },
          error:function(request,status,error){
              
         }
          
      });
  } */
  
  
  function doStar(star) {
      $('#score').val(star);
      $('#star').html($('#star'+star).html())
  }
  
  //별점 마킹 모듈 프로토타입으로 생성
  function Rating(){};
  Rating.prototype.rate = 0;
  Rating.prototype.setRate = function(newrate){
      //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
      this.rate = newrate;
      let items = document.querySelectorAll('.rate_radio');
      items.forEach(function(item, idx){
          if(idx < newrate){
              item.checked = true;
          }else{
              item.checked = false;
          }
      });
  }
  let rating = new Rating();//별점 인스턴스 생성
  
  document.addEventListener('DOMContentLoaded', function(){
	    //별점선택 이벤트 리스너
	    document.querySelector('.rating').addEventListener('click',function(e){
	        let elem = e.target;
	        if(elem.classList.contains('rate_radio')){
	            rating.setRate(parseInt(elem.value));
	        }
	    })
  });
  
  
  
  </script>

  
</head>

<body>

  <app-root>

<!-- Subheader Start -->
  <div class="subheader bg-cover dark-overlay dark-overlay-2" style="background-image: url('${pageContext.request.contextPath}/resources/img/main_img.jpg')">
    <div class="container">
      <div class="subheader-inner">
        <h1>Recipe Details</h1>
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/recipe-detail">Home</a></li>
            <li class="breadcrumb-item"><a href="/recipe-detail">Recipes</a></li>
            <li class="breadcrumb-item active" aria-current="page">Recipe Details</li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
  <!-- Subheader End -->



  <!-- Recipe Start -->
  <div class="section section-padding single-post-1">
    <div class="container">

      <div class="row" >
        <div class="detail_div">

          <!-- Content Start -->
          <form name="update" id="update" class="writeForm" action="recipe_update?recipe_no=${detail.recipe_no}" method="post" enctype="multipart/form-data">
          
          <article class="post-single">
            <div class="post-thumbnail">
              <img src="${pageContext.request.contextPath}/resources/image/recipe_upload/${detail.recipe_thumbnail}" alt="post" style="width:730px; height: 478px;">
              <div class="video-player-trigger">
                <a href="${detail.recipe_video}" class="popup-youtube">
                  <i class="fas fa-play"></i>
                  <div class="video-player-icons">
                    <i class="flaticon-pot"></i>
                    <i class="flaticon-taco"></i>
                    <i class="flaticon-bread"></i>
                    <i class="flaticon-chef"></i>
                    <i class="flaticon-diet"></i>
                  </div>
                </a>
              </div>
            </div>
            <div class="like-categories">
            
            
         	<c:if test="${sessionScope.memNo != null && result == 0}">
            	<a href="javascript:void(0);" id='like_img' class='like_img'>
            	<img src='${pageContext.request.contextPath}/resources/img/dislike.png' name="like_png" id="like_png" class="like_png" style="width:40px; height:40px">
            	</a>
            </c:if>
            <c:if test="${sessionScope.memNo != null && result == 1}">
            	<a href="javascript:void(0);" id='like_img' class='like_img'>
            	<img src='${pageContext.request.contextPath}/resources/img/like.png' style="width:40px; height:40px">
            	</a>
            </c:if><br/><br/>
              
              
            </div>
            <h2 class="title">${detail.recipe_title}</h2>
            <span><h5>${detail.recipe_content}</h5></span>
            <div class="post-meta">
              <span><i class="fas fa-concierge-bell"></i> ${detail.scrap_cnt} Scrap</span>
              <span> <i class="far fa-user"></i> Posted by ${detail.mem_nickname}</span>
              <div class="recipe-duration">
                  <span><i class="fas fa-stopwatch"></i>요리시간 ${detail.recipe_time}</span>
              </div>
              <span> <i class="far fa-level"></i>난이도 ${detail.recipe_level}</span>
            </div>
            <c:forEach var="list" items="${list}">
            <div class="post-content">
              <div class="recipe-ingredientss" style="height: 350px;">
                <h4>재료 준비</h4>
                	<div id="mate_name" style=" width: 50%; position:relative; left:0px; bottom:6px;"><h5>${list.mate_name}</h5></div>
                    <div id="mate_cnt" style=" width: 50%; position:relative; left:368px; bottom:145px;"><h5>${list.mate_cnt}</h5></div>
              </div>
              <div class="recipe-instructionss">
                <h4>조리 방법</h4>
                <ul>
                  <li>
                    <h5>Step</h5>
                    <p> 
                       ${list.step} 
                    </p>
                  </li>
                  
                </ul>
              </div>
            </div>
            </c:forEach>
          </article>
	          <c:if test="${sessionScope.memNo == detail.mem_no}"> <!-- 세션회원번호와 해당 게시글의 회원번호가 일치시 수정버튼 보이게 -->
	            <div class="post-categories" style="float: right;">
	            	  <a href="javascript:void(0);" onclick="document.getElementById('update').submit()">내 글 수정</a><!-- 나중에 a 태그에 컨트롤러 연결해서 insert -->           	  
		          	  <a href="deleterecipe?recipe_no=${detail.recipe_no}">내 글 삭제</a>		          
	            </div>
	          </c:if>
          </form>
          
          
          <!-- Related Products End -->
		  <hr/>
          <!-- Comments Start -->
          <!-- Comments Start -->
          <form>
          <div class="comments-list">
            <h4>Comments</h4>
        	<c:choose>
	        	<c:when test="${!empty reviewList}">
		            <c:forEach var="row" items="${reviewList}">
		  			
			            <ul>
			              <li class="comment-item"> 
			                <img src="${pageContext.request.contextPath}/resources/image/member_upload/${row.member.mem_pic}" alt="comment author" onerror="this.src='${pageContext.request.contextPath}/resources/img/chef3.png'">
			                <div class="comment-body">
			                  <h5>${row.member.mem_nickname} &nbsp;
			                  <div class="reviewstar"><img src="${pageContext.request.contextPath}/resources/image/recipe_upload/star_${row.star_rate}.png"></div></h5>
			                  <span>Posted on: ${row.review_date}</span>
			                  <p>${row.review_content}</p>
					          <c:if test="${sessionScope.memNo == row.mem_no}">
				                  <a href="javascript:void(0);" id="deletereview" class="reply-link"> Delete 
				                  <input type="hidden" name="review_no" value="${row.review_no}" readonly="readonly">
				                  </a>
					          </c:if>
			                </div>
			              </li>
			            </ul>
		            </c:forEach> <!-- foreach 문 닫는곳 -->
	          	</c:when>
			</c:choose>
          </div>
          <ul class="pagination">
          
            <c:forEach var="p" items="${p_num}">
                <li class="page-item">
                <input type="submit" class="page-link" formaction="reviewpage" name="page" value="${p}"/>
                </li>
            </c:forEach>   
            
          </ul>
          
      	  </form> 
      	     
          <!-- 댓글 등록하는 곳 -->
          <c:if test="${sessionScope.memNo != null}">
          <div class="comment-form">
            <h4>후기를 남겨주세요</h4>
            <form method="post" id="reviewform" name="reviewform" >
  			<input type="hidden" name="mem_no" id="mem_no" value="${sessionScope.memNo}" readonly="readonly"> 
  			<input type="hidden" name="recipe_no" id="recipe_no" value="${detail.recipe_no}" readonly="readonly">  
            	<div class="review_rating">
		            <div class="rating">
		                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
		                <input type="checkbox" name="star_rate" id="rating1" value="1" class="rate_radio" title="1점">
		                <label for="rating1"></label>
		                <input type="checkbox" name="star_rate" id="rating2" value="2" class="rate_radio" title="2점">
		                <label for="rating2"></label>
		                <input type="checkbox" name="star_rate" id="rating3" value="3" class="rate_radio" title="3점" >
		                <label for="rating3"></label>
		                <input type="checkbox" name="star_rate" id="rating4" value="4" class="rate_radio" title="4점">
		                <label for="rating4"></label>
		                <input type="checkbox" name="star_rate" id="rating5" value="5" class="rate_radio" title="5점">
		                <label for="rating5"></label>
		            </div>
        		</div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <textarea class="form-control" id="review_content" placeholder="댓글을 입력하세요" name="review_content" rows="7"></textarea>
                </div>
              </div>

              <button type="button" id="save" class="btn pull-right btn-success" name="button">등록</button>
              
            </form>
          </div>
           </c:if>
          <!-- Comments End -->
          
          <!-- Comments End -->
			
        </div>
        <!-- Sidebar Start -->
        <div class="col-lg-4">
        
          <app-recipe-sidebar>
          <div class="sidebar">
            <div class="sidebar-widget">
              <h5>요즘 뜨는 인기 레시피</h5>
              
				<c:forEach items="${best}" var="b" varStatus="status" begin="0" end="3">
              <div class="recipe featured-recipe">
                <div class="recipe-thumbnail">
                  <a href="recipe_detail?recipe_no=${b.recipe_no}">
                    <img src="${pageContext.request.contextPath}/resources/image/recipe_upload/${b.recipe_thumbnail}" alt="blog post">
                  </a>
                </div>
                <div class="recipe-body">
                  <h6 class="recipe-title"> <a href="recipe_detail?recipe_no=${b.recipe_no}">${b.recipe_title}</a> </h6>
                  <div class="recipe-meta">
                    <div class="recipe-difficulty">
                      <div class="recipe-difficulty-inner">
                        <span class="active"></span>
                        <span class="active"></span>
                        <span></span>
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
    
  </div>
  <!-- Recipe End -->
  
  
  </app-root>
</body>
</html>
