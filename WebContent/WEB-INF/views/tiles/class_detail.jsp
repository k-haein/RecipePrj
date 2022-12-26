<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
    
  <%
  request.setCharacterEncoding("UTF-8");
%>
    
    
    
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Cookiteer</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="./resources/img/favicon.ico">
  
  
  
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css" media="all" />
<link href="${pageContext.request.contextPath}/resources/css/class_detail.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/class_detail_min.css" media="all" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/class_detail_style.css" media="all" />
  
  
  

  
  <!--********** 【 js 링크 걸기 】********** -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>



<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/js/class_detail.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/class_detail_bundle.js"></script>






<script>

/*   상세 정보  접기 / 펼치기  자스   */

function openCloseToc() {
   if (document.getElementById('toc-content').style.display === 'block') {
      document.getElementById('toc-content').style.display = 'none';
      document.getElementById("detail_more_IMG").src = "./resources/image/detail_img/detail_off.png";

   } else {
      document.getElementById('toc-content').style.display = 'block';
      document.getElementById("detail_more_IMG").src = "./resources/image/detail_img/detail_on.png";

   }
}

function openComment() {
   if (document.getElementById('coment_write').style.display === 'block') {
      document.getElementById('coment_write').style.display = 'none';      
      event.preventDefault ? event.preventDefault()
            : (event.returnValue = false);

   } else {
      document.getElementById('coment_write').style.display = 'block';      
      event.preventDefault ? event.preventDefault()
            : (event.returnValue = false);

   }
}




/*   이미지 처리    */

    function handlePhotoFiles(e){
    
        if (e.target.files.length == 0)
            return;
    
        // 2MB보다 크면 제한
        if (e.target.files[0].size > 10485760) {
            alert("사진은 10MB까지만 허용됩니다.");
            return false;
        }
        var il = e.target.id.replace("file_","");
        var reader = new FileReader;
        reader.onload = function(evt) {
            var img = new Image();
            img.src = reader.result;
            img.onload = function () {
                var finalFile = reader.result;
                $.ajax({
                    beforeSend: function(xhr){
                        xhr.setRequestHeader('Content-Type', 'canvas/upload');
                    },
                    type: "POST",
                    url: "/util/upload_mobile.html",
                    data: "canvasData="+finalFile,
                    dataType: "json",
                    cache: "false",
                    processData: false,
                    success: function(json) {
                        //console.log(json);
                        if(json['result'] == "SUCCESS") {
                            $("#add_imgs").hide();
                            $("#img_dd").show();
                            $("#attach_imgs").attr("src",json['url']);
                            $("#image").val(json['url']);
                        } else {
                            alert("처리에 실패하였습니다.");
                        }
                    },
                    error: function (request,status,error) {
                        //alert('오류가 발생하였습니다.');
                        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
                });
            }
        }
        reader.readAsDataURL(e.target.files[0]);
    }

    
    

    $(function() {
        
        $('#file_1').on('change', handlePhotoFiles);
        
                
                
    })        
    
    
    /* 후기 작성 부분 별표 처리 */
    
    function doStar(star) {
        $('#score').val(star);
        
        $('#star').html($('#star'+star).html())
        
        $('input[name=star_rate]').attr('value',star);
        
    }
 
  </script>  
 
<script>  


  /* ------------------------ 후기 ajax ---------------------------- 처리 */   
    

$(document).ready(function(){
       
       
       // 후기 삭제
       $('.deReviewBT').click(function(){
          
                if(confirm("후기를 삭제하시겠습니까?")){
                    var reviewNo = $(this).find('input[name="review_no"]').val();
                   
                   $.ajax({
                      url:"deleteClassReview?review_no="+reviewNo
                      ,success : function(){
                         
                          var classNo = $('#class_no').val(); 
                         
                         alert("삭제가 완료되었습니다!");
                         
                         
                         location.href="class_detail?class_no="+classNo;
                      }
                      ,error : function(request,status,error){
                         $('#errr').html("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
                      }
                   })
                }
       
          })      

       
          
    
          
          
          
          
          

          
         $('#comment_BT').click(function(){
            var class_no = $('#class_no1').val();
            var mem_no = $('#mem_no1').val();
            var type = $('#type').val();
            var star_rate = $('#star_rate').val();
            var review_content = $('#review_content').val();
            
            $.ajax({
               url : "insertClassReview"
               ,type : "POST"
               ,data : {
                  class_no:class_no
                  ,mem_no:mem_no
                  ,type:type
                  ,star_rate:star_rate
                  ,review_content:review_content
               }
               ,success : function(){
                  alert("후기가 등록되었습니다.")
				  location.reload();
                  location.href="class_detail?class_no="+classNo;
               }
               ,error : function(request,status,error){
                  $('#errr').html("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error)
               }
            })      //$.ajax({
         })      //$('#saveSche').click(function(){            
         
       


    });
   
    
    
</script>





  <style>
  
 /*  후기작성 style은 여기다 해줬음.. */
  
  
#star img {
   width: 12px;
   margin: -1px 1px 0 0;
}

.order_table_box {
   
}

.order_table_box table {
   
}

.order_table_box tr {
   border-bottom: 1px solid #e2e2e2;
}

.order_table_box tr:last-child {
   border-bottom: none;
}

.order_table_box th, .order_table_box td {
   font-size: 14px;
}

.order_table_box th {
   color: #666;
   font-weight: normal;
   padding: 10px 0 10px 14px;
}

.order_table_box td {
   padding: 10px 0 10px 8px;
}

.order_table_box td:last-child {
   padding-right: 14px;
}

.order_price_total {
   font-size: 16px;
   text-align: right;
   padding: 12px 15px 20px;
   border-top: 1px solid #e2e2e2;
}

.order_price_total span {
   color: #000;
   padding-right: 10px;
   font-weight: bold;
}

.order_price_total b {
   color: #73b142;
}

.order_table_box .star_mark {
   position: relative;
}

.order_table_box .star_mark a {
   display: block;
   width: 100%;
   height: 34px;
   padding: 6px 12px;
   font-size: 12px;
   line-height: 1.8;
   color: #555555;
   background-color: #ffffff;
   background-image: none;
   border: 1px solid #cccccc;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
   box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
}

.order_table_box .star_mark a span {
   float: right;
   margin: 8px 4px;
}

.order_table_box .star_mark .dropdown-menu {
   width: 100%;
   position: relative
}

.order_table_box .star_mark .dropdown-menu li {
   padding: 2px 14px;
}

.view2_review_star img {
   width: 12px;
   margin: -1px 1px 0 0;
}
</style>
  
  
  
  
</head>
<body>



<app-root>




<!--  --------------------------  클래스 디테인  메일  ---------------------------  -->


  <form class="writeForm" action="class_update?class_no=${classDe.class_no}" method="post" enctype="multipart/form-data">
  <!-- Page Content -->
  
  <div class="container">

 <input type="hidden" name="mem_no" id="mem_no" value="${sessionScope.memNo}" readonly="readonly"> 
 <input type="hidden" name="class_no" id="class_no" value="${classDe.class_no}" readonly="readonly"> 
 
 


      <!-- ------------------- Header content---------------------  -->
      <header class="jumbotron my-4">
      
      
         
            <p class="popBT"><img src="./resources/image/detail_img/pop.png"></p>
            
            <p class="reportBT"> 
               <a href="#"><img src="./resources/image/detail_img/report.png"></a>
            </p>            
         
         
         
   
      <!-- ------------------- 신고작성 디테일---------------------  -->
                  
      <div class="report-content">
            <div class="report-header">
              <h4 class="report-title">Chef Recipe Title_제목</h4>
          <button type="button" class="reportXBT" data-dismiss="modal" aria-label="Close">X</button> 
            </div>
            <div class="report-body">
              <textarea id="errorCont" class="form-control" rows="3" placeholder="이런! 레시피에 문제가 있나요? 자세한 내용을 남겨주시면 신속하게 처리하겠습니다." style="height:260px;"></textarea>
            </div>
          <div class="report-footer">
              <button type="button" class="reportcloseBT" data-dismiss="modal">취소</button>
              <button type="button" class="reportsubmitBT" onclick="submitError()">전송</button>
            </div>   
          </div> 
      <!-- ------------------- 신고작성 디테일---------------------  -->
         
      
         <h1 class="display-3">${classDe.class_title}</h1>
               

         <div class="detail_img">
            <img src="${pageContext.request.contextPath}/resources/image/FoodImg/${classDe.class_thumbnail}" class="classProduct">
      
         </div>

         <figure class="snip1425">
            <img src="${pageContext.request.contextPath}/resources/image/member_upload/${classDe.member.mem_pic}"
               alt="sq-sample19" />
            <figcaption>
               <i class="ion-podium"></i>
               <h4>${classDe.member.mem_nickname}</h4>
               <h2>${classDe.member.mem_email}</h2>
            </figcaption>
         </figure>


                        
                           
<c:set var="strCon" value="${classDe.class_content}"/>

<c:set var="class_content" value="${fn:replace(strCon, '.', '<br>')}"/>   


         <p class="lead">${class_content}</p>
      
         
         

         <p class="class_price">
            <p4>${classDe.class_price}</p4><small>원</small>
         </p>

         <hr>

         <div class="detail_time">
            <div class="detail_icon_img">
               <span> <img src="${pageContext.request.contextPath}/resources/image/detail_img/clock.png">
                  <p1>강의 시간</p1> <p2> ${classDe.class_cooktime} </p2> <p3>분 </p3>
               </span> <span> <img src="${pageContext.request.contextPath}/resources/image/detail_img/calendar.png">
                  <p1>수강 기간</p1> <p2> ${classDe.class_period}  </p2>  <p3>일</p3>
               </span>
                              
            </div>

         </div>
         
                           
         <c:choose> 
            <c:when test="${!empty payck}">
            
            <c:if test="${sessionScope.memNo != classDe.mem_no}">
               <c:if test="${payck == 0}">
                        <ul class="pagination">         
                             <li class="page-item">              
                                   <a class="page-link" href="class_payment?class_no=${classDe.class_no}">Class 신청</a>             
                             </li>                            
                           </ul>
               </c:if>
            </c:if>            
            
            <c:if test="${payck == 1}">   
            
               <ul class="pagination2">
               
                  <d2>클래스를 이미 구매하셨습니다.  </d2>               
                                                    
                        </ul>
            </c:if>
            
            
            
             <c:if test="${sessionScope.memNo == classDe.mem_no}">
                           
               <ul class="pagination2">
               
                  <d2> 본인이 올린 클래스 입니다.  </d2>               
                                                    
                        </ul>
            </c:if>
            
            
            
               
         </c:when>
      </c:choose>


      </header>


      <!-- ------------------- Header content---------------------  -->


      <!--       강의 보기      -->

      <div class="jumbotron my-4">

                        
                      <!--    section    -->
       
         <!--       강의 보기  헤드      -->
         <div class="show_class">
            <img src="${pageContext.request.contextPath}/resources/image/detail_img/detail_icon_02.png">
            <p3>클래스 보기</p3>
            <hr>
         </div>





   <!--   ------------     section  ------------     -->

     <c:if test="${payck == 1}">
   
         <div class="show_class_secction">
            <div class="show_class_content">
               <b>${classDe.class_title}</b> 
            </div>

            <div class="show_class_content_move">
               <p4>
               <span class="starClass">
               
   
 
          
               <a href = "payIdChk">
                영상 보기</p4>
               </a>
               </span>
               
               
            </div>
         </div>

    </c:if>


    
     <c:if test="${sessionScope.memNo == classDe.mem_no}">
   
         <div class="show_class_secction">
            <div class="show_class_content">
               <b>${classDe.class_title}</b> 
            </div>

            <div class="show_class_content_move">
               <p4>
               <span class="starClass">
               
   
 
          
               <a href = "payIdChk">
                영상 보기</p4>
               </a>
               </span>
               
               
            </div>
         </div>

    </c:if>
 
 
 
 
 
 
 <c:if test="${sessionScope.memNo != classDe.mem_no}">
    <c:if test="${payck == 0}">
   
      
            <div id="warningMSG">
            
                  <div class="show_MSG" id="show_MSG">    
                                             
                     <span>클래스 구매 후에 영상 시청 가능합니다. 
                     </span>   
                                    
                  </div>
            </div>
      

    </c:if>
</c:if>
  
 
 
 
         
         
         <div id="show_class_content_class">
         
               <div class="show_freeClass">                
               
                  <span class="video_cn"> 
                     <iframe width="560" height="315"
                     src="${classDe.class_recipe_video}" frameborder="0"
                     allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                     allowfullscreen></iframe>
               </span>
               
               </div> <!-- show_freeVideo  -->
                              
            </div>  <!--   show_class_content_video   -->
         





<!--   ------------     section  ------------     -->

         <div class="show_class_secction">
            <div class="show_class_content">
               <b>재료</b> 
            </div>

            <div class="show_class_content_move">
               <p4>
               <span class="starMate">
               &nbsp보기</p4>
               </span>
            </div>
         </div>

                     
         
                     
         <div id="show_class_content_mate">
         
               <div class="show_freeMate">    
               
               
                  <!--    section    -->
                  <c:choose> 
                     <c:when test="${!empty classList}">
                        
                                       
                        <c:forEach var="list" items="${classList}">        
                           
                           <c:set var="str1" value="${list.mate_name}"/>
                           
                           <c:set var="str2" value="${list.mate_cnt}"/>

                           <c:set var="mate_name" value="${fn:replace(str1, ',', '<p>')}"/>
                           
                           <c:set var="mate_cnt" value="${fn:replace(str2, ',', '<p>')}"/>
   
                              
                              <div id="c_ing">
                              
                              <span class="ing_l">${mate_name}<d1></span>
                              
                              </div>   
                           
                                          
                              <div id="c_inga">    
                                                
                              <span class="ing_r">${mate_cnt}</span>
                              
                              </div>   
                           
                        
                           </c:forEach>
                     </c:when>
                  </c:choose>  
                     
               
               
               </div> <!-- show_freeMate  -->
                              
            </div>  <!--   show_class_content_mate   -->
         
      
         
         
         

         <!--   ------------     section  ------------     -->

         <div class="show_class_secction">
            <div class="show_class_content">
               <b>조리법</b> 
            </div>

            <div class="show_class_content_move">
               <p4>
               <span class="starStep">
               &nbsp보기</p4>
               </span>
            </div>
         </div>

         
         
         <div id="show_class_content_step">
         
               <div class="show_freeStep">                
               
                  
                  
               
                     <!--    section    -->
                  <c:choose> 
                     <c:when test="${!empty classList}">
                        
                                       
                        <c:forEach var="list" items="${classList}">        
                           
                           <c:set var="str1" value="${list.step}"/>

                           <c:set var="step" value="${fn:replace(str1, ',', '<p><d>')}"/>
   
                                 
                              <div id="c_step">
                              
                              <div class="c_s">
                              
                                 <d>${step}
                                 
                              </div>
                              
                                             
                        
                           </c:forEach>
                     </c:when>
                  </c:choose>  
                  
               
               </div> <!-- show_freeVideo  -->
                              
            </div>  <!--   show_class_content_video   -->


   </div>
</div>





      <!-- ------------------- 상세 정보 부분 ---------------------  -->

      <div class="jumbotron my-4">
         <div class="second_ct">


            <!--     second hader   -->
            <span id="toc-toggle" onclick="openCloseToc()">
               <div class="second_header">
                  <img src="${pageContext.request.contextPath}/resources/image/detail_img/detail_icon.png">
                  <p3>클래스 상세 정보</p3>
                  <p4>
                  <img src="${pageContext.request.contextPath}/resources/image/detail_img/detail_on.png"
                     id="detail_more_IMG"></p4>
                  <hr>
               </div>
            </span>



            <ol id="toc-content">

               <div class="second_body">
                  <div class="sc_body_title">
                     <p5>${classDe.class_title}</br>
                     </p5>                     
                  </div>

                  <!--     second boby  secciton    -->
                  <div class="body_ct">
                     <div class="body_ct_img">
                        <span> <img
                           src="${pageContext.request.contextPath}/resources/image/FoodImg/${classDe.class_thumbnail}">
                        </span>
                     </div>

                     <div class="body_ct_title">
                        <span> <p6>${classDe.class_title}</p6>
                        </span>
                     </div>
                     
                                       
<c:set var="strDeCon" value="${classDe.class_detail_info}"/>

<c:set var="class_detail_info" value="${fn:replace(strDeCon, '.', '<br>')}"/>   
                                          
                     
                     <div class="body_ct_content">
                        <span> <p7>${class_detail_info}</p7>
                        </span>
                     </div>
                  </div>


                     
                     <hr>
                  
                     
                  <!--  태그  -->   
                     <div class="body_tag">
                     <img src="${pageContext.request.contextPath}/resources/image/detail_img/tag.png">
                     
                        <li class="tag_text">
                           <a href="getFood?kind_tag_no=${classDe.kindtag.kind_tag_no}" >
                           <h7>#${classDe.kindtag.kind_tag_name}</h7>                           
                           </a>                        
                        </li>
                        
                        <li class="tag_text">
                           <a href="getTheme?theme_tag_no=${classDe.themetag.theme_tag_no}" >
                           <h7>#${classDe.themetag.theme_tag_name}</h7>                           
                           </a>                        
                        </li>
                        
                        <li class="tag_text">
                           <a href="getMaterial?material_tag_no=${classDe.material.material_tag_no}" >
                           <h7>#${classDe.material.material_tag_name}</h7>                           
                           </a>                        
                        </li>
                     </div>  
                     
                  
                  <div class="btWrap">
                        <c:if test="${sessionScope.memNo == classDe.mem_no}">
                              <button id="saveBT" onclick="submit">
                                   글 수정 
                                   </button>   
                                   
                                      
                                   <span class="deleteWrap">
                                 <a class="deleteBT" href="deleteClass?class_no=${list.class_no}">
                                      글삭제
                                 </a>
                                   </span>         
                                                             
                                             
                        </c:if>   
                           
                  </div>
                  
                  
                           
               </div>
               <!--   second_body   -->

            </ol>
            <!--    toc-content    -->

         </div>
         <!--    second_ct    -->

      </div>
      <!--    jumbotron my-4    -->




</form>




      <!-- ------------------- 취소 환불 부분   ---------------------  -->

      <div class="jumbotron my-4">
         <div class="second_ct">


            <!--     second hader   -->
            <div class="second_header">
               <img src="${pageContext.request.contextPath}/resources/image/detail_img/detail_icon_03.png">
               <p3>취소 / 환불 안내</p3>
               <hr>
            </div>
            <p10>온라인 클래스</p10>
            <table class="thired_table" width="100%" cellspacing="0"
               cellpadding="0" radius="10">
               <colgroup>
                  <col width="">
                  <col width="">
                  <col width="">
               </colgroup>
               <tbody>
                  <tr class="table_line1">
                     <th></th>
                     <th>클래스 이용 전</th>
                     <th>클래스 이용 후</th>
                  </tr>
                  <tr class="table_line2">
                     <td>클래스 신청 후,7일 이내</td>
                     <td>전액 환불</td>
                     <td>기이용분 차감 후, 환불 진행</td>
                  </tr>
                  <tr class="table_line2">
                     <td>클래스 신청 후,7일 초과</td>
                     <td>판매금액의 10% 수수료 차감 후 환불<br>(수강기간 종료 시, 환불 불가)
                     </td>
                     <td>환불 불가</td>
                  </tr>
               </tbody>
            </table>


            <div class="info_policy_cont_i">
               ※ 기이용분 = 정상가 × (이용 유료 강의 수 / 전체 유료 강의 수) <br> ※ 유료 강의에 포함된
               레시피를 보시는 경우, 해당 강의를 이용한 것으로 간주하여 기이용분에 포함됩니다.
            </div>


         </div>
         <!--   second_ct   -->

      </div>
      <!--    jumbotron my-4   -->


      <!-- -------------------  수강 후기  ---------------------  -->

<form class="getReviewForm">

      <div class="jumbotron my-4">
         <div class="second_ct">


            <!--     second hader   -->
            <div class="second_header">
               <img src="${pageContext.request.contextPath}/resources/image/detail_img/detail_icon_04.png">
               <p3>클래스 후기</p3>
               <hr>
            </div>


              
      <!--    section    -->
      
      
       
<!--    section    -->
         <c:choose> 
            <c:when test="${!empty reviewllist}">      
               
               
            <!--     후기  Section         -->
            <section>
               <div class="afterWord_Wrap">

                  

                  <c:forEach var="revlist" items="${reviewllist}">        

                   <input type="hidden" name="review_no" id="review_no" value="${revlist.review_no}" readonly="readonly"> 
                   <input type="hidden" name="class_no" id="class_no" value="${revlist.class_no}" readonly="readonly"> 
                  
                  <div class="media-left">
                  
                     <a href="#"> 
                      <img src="${pageContext.request.contextPath}/resources/image/member_upload/${revlist.mem_pic}" class="profileIMG">
                     </a> <b class="info_name_f">${revlist.mem_nickname}</b>

                     <c class="info_date">${revlist.review_date}</c>


                     <span class="info_star"> 
                     <img src="${pageContext.request.contextPath}/resources/image/detail_img/star_${revlist.star_rate}.png" class="afterWord_star">
                     </span>


            <!--    버튼 세션 부분 해야할 부분    -->
   <c:if test="${sessionScope.memNo == revlist.mem_no}">   
            
            
             <a href="javascript:void(0);" id="deletereview" class="deReviewBT"> 삭제 
            <input type="hidden" name="review_no" value="${revlist.review_no}" readonly="readonly">
            </a>
                              
            <%-- 
              <a href="javascript:void(0);" id="deletereview" class="reply-link"> Delete 
              <input type="hidden" name="review_no" value="${row.review_no}" readonly="readonly">
            
                     <d class="info_delete">
                     <a href="deleteClassReview?review_no=${revlist.review_no}" class="deReviewBT">삭제</a>   
                     </d> --%>
   </c:if>                  
                        
                  </div>
                  
                  
                  
                  <div class="info_content">${revlist.review_content}</div>


               </c:forEach>


                  <hr class="info_line">


               </div>
               <!--    afterWord_Wrap    -->

            </section>
            
            </c:when>
         </c:choose>
   
   
   
   

<c:if test="${sessionScope.memNo != classDe.mem_no}">   

            <span id="com-toggle" onclick="openComment()">
            
               <ul class="pagination">
               
                       <li class="page-item"><a class="page-link" routerLink="/recipe-archive">후기작성</a></li>
                 
                  </ul>
               </span>
</c:if>



<c:if test="${sessionScope.memNo == classDe.mem_no}">   

자신의 클래스에는 후기를 작성하실수 없습니다. 

</c:if>

</form>

            <!-- -    -----------------     후기작성  디테일  -------------------------       -->




<form class="insertReviewFrom">


<!--  ================================   후기작성 ajax =====================================     -->
   
      

 <input type="hidden" name="mem_no" id="mem_no1" value="${sessionScope.memNo}" readonly="readonly"> 
  <input type="hidden" name="class_no" id="class_no1" value="${classDe.class_no}" readonly="readonly"> 
  <input type="hidden" name="type" id="type" value="1" readonly="readonly"> 


          <div class="coment_write" id="coment_write">

               <div class="comentForm_head">
                  <button type="button" class="close" data-dismiss="modal"
                     aria-hidden="true">×</button>
                  <h5 class="modal-title">
                     <span class="glyphicon glyphicon-circle-arrow-right"></span> <strong>후기작성</strong>
                  </h5>
               </div>
               <!--   comentForm_head     -->


               <div class="modal-body" style="max-height: 852px; height: 852px;">


                     <div class="container">
                        <div class="D_goods_box">


                           <div class="order_table_box">
                              <table width="100%" cellspacing="0" cellpadding="0">
                                 <colgroup>
                                    <col width="60px">
                                    <col>
                                    <col>
                                 </colgroup>
                                 <tbody>
                                    <tr>

                                     <th class="thclass">평가</th>
                                       <td class="star_mark">
                                       <a id="" href="#" class="dropdown-toggle" data-toggle="dropdown"
                                          aria-haspopup="true" role="button" aria-expanded="true">
                                          
                                  <input type="hidden" name="star_rate" id="star_rate" value="" readonly="readonly"> 
                                       
                                          
                                              <div id="star" style="display: inline;">
                                                <img src="${pageContext.request.contextPath}/resources/image/detail_img/star.png">
                                                <img src="${pageContext.request.contextPath}/resources/image/detail_img/star.png">
                                                <img src="${pageContext.request.contextPath}/resources/image/detail_img/star.png">
                                                <img src="${pageContext.request.contextPath}/resources/image/detail_img/star.png">
                                                <img src="${pageContext.request.contextPath}/resources/image/detail_img/star.png">
                                             </div> 
                                             
                                             
                                       </a>
                                          <ul id="menu3" class="dropdown-menu" role="menu"
                                             aria-labelledby="">
                                             <li role="presentation" onclick="doStar(5)"><span
                                                class="view2_review_star" id="star5"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png">
                                             </span></li>
                                             <li role="presentation" onclick="doStar(4)"><span
                                                class="view2_review_star" id="star4"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star_off.png">
                                             </span></li>
                                             <li role="presentation" onclick="doStar(3)"><span
                                                class="view2_review_star" id="star3"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star_off.png">
                                                   <img src="${pageContext.request.contextPath}/resources/image/detail_img/star_off.png">

                                             </span></li>
                                             <li role="presentation" onclick="doStar(2)"><span
                                                class="view2_review_star" id="star2"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star_off.png">
                                                   <img src="${pageContext.request.contextPath}/resources/image/detail_img/star_off.png">
                                                   <img src="${pageContext.request.contextPath}/resources/image/detail_img/star_off.png">
                                             </span></li>
                                             <li role="presentation" onclick="doStar(1)"><span
                                                class="view2_review_star" id="star1"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star.png"> <img
                                                   src="${pageContext.request.contextPath}/resources/image/detail_img/star_off.png">
                                                   <img src="${pageContext.request.contextPath}/resources/image/detail_img/star_off.png">
                                                   <img src="${pageContext.request.contextPath}/resources/image/detail_img/star_off.png">
                                                   <img src="${pageContext.request.contextPath}/resources/image/detail_img/star_off.png">
                                             </span></li>
                                          </ul></td>
                                    </tr>
                                    <tr>
                                       <td colspan="2" style="padding-left: 14px;">
                                          <hr> <textarea id="review_content" name="review_content" class="form-control"
                                             placeholder="내용을 입력하세요."
                                             style="height: 300px; resize: none; text-align: left;">
                                       </textarea>
                                       </td>
                                    </tr>
                                 </tbody>
                              </table>
                           </div> 
                           <!--    order_table_box     -->



                           <p style="text-align: center; border-top: 1px solid #e2e2e2">
                              <button type="button" class="cmbt cmbt-primary"
                                 style="width: 15%;" id="comment_BT_close">취소</button>
                               <button type="submit" 
                                 class="cmbt cmbt-primary" style="width: 15%;" id="comment_BT"> 저장 </button>
                           </p>


                        </div>
                        <!--    D_goods_box    -->

                     </div>
                     <!--  container   -->


                  <!--   commentFrom     -->

               </div>
               <!--    modal-body    -->

            </div>
            <!--  coment_write   -->


</form>


         </div>
         <!--   second_ct   -->

      </div>
      <!--    jumbotron my-4   -->






   </div>
   <!-- /.row -->

   </div>
   <!-- /.container -->


  
 </app-root> 
 

 
 
 
</body>
</html>