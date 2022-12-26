<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>마이페이지</title>
<!--   <base href=""> -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="./resources/img/favicon.ico">
  


<link rel="stylesheet" type="text/css" href="./resources/css/header.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/main.css" media="all" />
<link rel="stylesheet" type="text/css" href="./resources/css/style.css" media="all" />



<!-- 따로 추가 -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.3.1/css/all.min.css" rel="stylesheet">
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
  
  
<!--  
  -->
  
  
</head>
<body>
 
  
  <app-root>
 

<!-- 마이페이지 Start -->
<section id="about-us" class="py-5">
    <div class="container">
        <div class="row">
             <!--left sidebar-->
            <div class="col-md-3 pr-md-4">
                <div class="sidebar-left">
                    <!--sidebar menu-->
                    <ul class="list-unstyled sidebar-menu pl-md-2 pr-md-0">
                        <li>
                            <a class="sidebar-item active d-flex justify-content-between align-items-center" href="Myrecipe_list">
                                내가 쓴 레시피 보기
                                <span class="fas fa-copy"></span>
                            </a>
                        </li>
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center"  href="review">
                                나에게 달린 코멘트
                                <span class="side-notif" title="1 new comment"></span>
                                <span class="fas fa-comment"></span>
                            </a>
                        </li>
                        
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center"  href="Myscrap">
                                레시피 스크랩
                                <span class="fas fa-bookmark"></span>
                            </a>
                        </li>                         
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center"  href="MySubscribe">
                                팔로잉 리스트
                                <span class="fas fa-user-friends"></span>
                            </a>
                        </li>                           
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center"  href="MySubscriber">
                                팔로워 리스트
                                <span class="fas fa-user-tag"></span>
                            </a>
                        </li>                       
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center"  href="storeCart">
                                장바구니
                                <span class="fas fa-cart-arrow-down"></span>
                            </a>
                        </li>
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center"  href="MyServiceCenter">
                                고객센터  
                                <span class="side-notif" title="1 new messages"></span>
                                <span class="fas fa-headset"></span>
                            </a>
                        </li>
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center"  href="info_change">
                                회원정보수정
                                <span class="fas fa-user-cog"></span>
                            </a>
                        </li> 
                        <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center" href="logout">
                                로그아웃
                                <span class="fas fa-sign-out-alt"></span>
                            </a>
                        </li>
                          <li>
                            <a class="sidebar-item d-flex justify-content-between align-items-center" href="memberDelete">
                                회원탈퇴
                                <span class="fas fa-user-slash"></span>
                            </a>
                        </li>        
                    </ul>
                </div>
            </div>
            
            <!--Content-->
            <div class="col-md-9">
                <div class="dashboard-area">
                    <div class="row">
                        <div class="col-12">
                            <div class="mb-3 bg-dark">
                                <div class="row">
                                    <div class="col-12">
                                        <a class="position-absolute ml-3 mt-3 text-white" href="info_change" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Edit cover images"><i class="fas fa-cog"></i></a>
                                        <div class="row">
                                            <div class="col-md-6 ml-auto mr-auto">
                                               <div class="profiles p-3 my-4 rounded text-center shadow-sm">
                                                    <div class="avatars">
                                                       <img src="${pageContext.request.contextPath}/resources/image/member_upload/${sessionScope.memPic}"  style="height: 100px; width: 100px;"
                                                       alt="Circle Image" class="avatar-lg rounded-circle img-fluid" data-toggle="tooltip" data-placement="bottom" title="mem_pic" data-original-title="Edit avatar images"
                                                       onerror="this.src='https://image.ibb.co/jw55Ex/def_face.jpg'"></div>
                                                    <div class="names">
                                                        <h3 class="title text-light">"${sessionScope.memNickname}"님 <br>환영합니다.</h3>
                                                        <a href="#" class="btn btn-link btn-facebook"><i class="fab fa-facebook"></i></a>
                                                        <a href="#" class="btn btn-link btn-twitter"><i class="fab fa-twitter"></i></a>
                                                        <a href="#" class="btn btn-link btn-gplus"><i class="fab fa-google-plus"></i></a>
                                                        <a href="#" class="btn btn-link btn-instagram"><i class="fab fa-instagram"></i></a>
                                                        <a href="#" class="btn btn-link btn-youtube"><i class="fab fa-youtube"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                     </div>
                                 </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <ul class="nav nav-pills mb-5" id="pills-tab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active show" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Statistic</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Profile</a>
                                </li>                                
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">Lastest Post</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="pills-class-tab" data-toggle="pill" href="#pills-class" role="tab" aria-controls="pills-class" aria-selected="false">Class</a>
                                </li>

                            </ul>
                            <div class="tab-content" id="pills-tabContent">
                                <div class="tab-pane fade active show" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                                    <div class="row">
                                        <div class="col-lg-4 col-sm-6">
                                            <a class="member-item" href="">
                                                <div class="card mb-2 mb-md-5 py-3">
                                                    <div class="content">
                                                        <div class="row">
                                                            <div class="col-6 d-flex justify-content-center align-items-center">
                                                                <div class="icon-big text-warning text-center">
                                                                    <i class="fas fa-copy"></i>
                                                                </div>
                                                            </div>
                                                            <div class="col-6 d-flex justify-content-center align-items-center">
                                                                <div class="numbers">
                                                                    <p>내 레시피</p>
                                                                    <c:choose>
																		<c:when test="${myRecipeCount == null}">0</c:when>
																		<c:when test="${myRecipeCount != null}">${myRecipeCount}</c:when>
																	</c:choose>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-lg-4 col-sm-6">
                                            <a class="member-item" href="">
                                                <div class="card mb-2 mb-md-5 py-3">
                                                    <div class="content">
                                                        <div class="row">
                                                            <div class="col-6 d-flex justify-content-center align-items-center">
                                                                <div class="icon-big text-info text-center" title="1 new comment">
                                                                    <div class="notif"></div>
                                                                    <i class="fas fa-comment"></i>
                                                                </div>
                                                            </div>
                                                            <div class="col-6 d-flex justify-content-center align-items-center">
                                                                <div class="numbers">
                                                                    <p>코멘트</p>
                                                                    <c:choose>
																		<c:when test="${myReviewCount == null}">0</c:when>
																		<c:when test="${myReviewCount != null}">${myReviewCount}</c:when>
																	</c:choose>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-lg-4 col-sm-6">
                                            <a class="member-item" href="">
                                                <div class="card mb-2 mb-md-5 py-3">
                                                    <div class="content">
                                                        <div class="row">
                                                            <div class="col-6 d-flex justify-content-center align-items-center">
                                                                <div class="icon-big text-danger text-center">
                                                                    <i class="fas fa-bookmark"></i>
                                                                </div>
                                                            </div>
                                                            <div class="col-6 d-flex justify-content-center align-items-center">
                                                                <div class="numbers">
                                                                    <p>레시피 스크랩</p>
                                                                    <c:choose>
																		<c:when test="${myScrapCount == null}">0</c:when>
																		<c:when test="${myScrapCount != null}">${myScrapCount}</c:when>
																	</c:choose>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-lg-4 col-sm-6">
                                            <a class="member-item" href="">
                                                <div class="card mb-2 mb-md-5 py-3">
                                                    <div class="content">
                                                        <div class="row">
                                                            <div class="col-6 d-flex justify-content-center align-items-center">
                                                                <div class="icon-big text-success text-center">
                                                                    <i class="fas fa-utensils"></i>
                                                                </div>
                                                            </div>
                                                            <div class="col-6 d-flex justify-content-center align-items-center">
                                                                <div class="numbers">
                                                                    <p>수강중인 클래스</p>
                                                                    <c:choose>
																		<c:when test="${myClassCount == null}">0</c:when>
																		<c:when test="${myClassCount != null}">${myClassCount}</c:when>
																	</c:choose>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                       <div class="col-lg-4 col-sm-6">
                                            <a class="member-item" href="">
                                                <div class="card mb-2 mb-md-5 py-3">
                                                    <div class="content">
                                                        <div class="row">
                                                            <div class="col-6 d-flex justify-content-center align-items-center">
                                                                <div class="icon-big text-success text-center">
                                                                    <i class="fas fa-user-friends"></i>
                                                                </div>
                                                            </div>
                                                            <div class="col-6 d-flex justify-content-center align-items-center">
                                                                <div class="numbers">
                                                                    <p>팔로잉</p>
                                                                    <c:choose>
																		<c:when test="${mySubscribeAvgCount == null}">0</c:when>
																		<c:when test="${mySubscribeAvgCount != null}">${mySubscribeAvgCount}</c:when>
																	</c:choose>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>                                        
                                        <div class="col-lg-4 col-sm-6">
                                            <a class="member-item" href="">
                                                <div class="card mb-2 mb-md-5 py-3">
                                                    <div class="content">
                                                        <div class="row">
                                                            <div class="col-6 d-flex justify-content-center align-items-center">
                                                                <div class="icon-big text-facebook text-center">
                                                                    <i class="fas fa-user-tag"></i>
                                                                </div>
                                                            </div>
                                                            <div class="col-6 d-flex justify-content-center align-items-center">
                                                                <div class="numbers">
                                                                    <p>팔로워</p>
                                                                    <c:choose>
																		<c:when test="${mySubscriberAvgCount == null}">0</c:when>
																		<c:when test="${mySubscriberAvgCount != null}">${mySubscriberAvgCount}</c:when>
																	</c:choose>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>    
                                       <div class="col-lg-4 col-sm-6">
                                            <a class="member-item" href="">
                                                <div class="card mb-2 mb-md-5 py-3">
                                                    <div class="content">
                                                        <div class="row">
                                                            <div class="col-6 d-flex justify-content-center align-items-center">
                                                                <div class="icon-big text-warning text-center">
                                                                    <i class="fas fa-star"></i>
                                                                </div>
                                                            </div>
                                                            <div class="col-6 d-flex justify-content-center align-items-center">
                                                                <div class="numbers">
                                                                    <p>내 평균 별점</p>
                                                                   <c:choose>
																		<c:when test="${myStarAvgCount == null}">0</c:when>
																		<c:when test="${myStarAvgCount != null}">${myStarAvgCount}</c:when>
																	</c:choose>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                                    <div class="p-3 border mb-3">
                                        <a class="position-absolute" style="right: 25px" href="info_change" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Edit profile"><i class="fas fa-user-cog"></i></a>
                                        <h3>"${sessionScope.memNickname}"님의 정보입니다.</h3>
				
										<p><b>아이디: </b>${sessionScope.memId}</p>
										<p><b>이름: </b>${sessionScope.memName}</p>
										<p><b>닉네임: </b>${sessionScope.memNickname}</p>
										<p><b>이메일: </b>${sessionScope.memEmail}</p>
										<p><b>핸드폰번호: </b>${sessionScope.memPhone}</p>		

                                        
                                    </div>                                     
                                </div>
                                
                               <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                                    <div class="p-3 border mb-3">
                                        <h5>최근 등록한 레시피 보기</h5>
                                        <div class="row">
                                            <div class="col-12">
                                                <ul class="list-unstyled statistics">

												<table>
													<thead>
														<tr>
															<th colspan="5">최근 등록한 레시피</th>
														</tr>
														<tr>
															<td>번호</td>
															<td>섬네일</td>
															<td>제목</td>
															<td>조회수</td>
															<td>등록일자</td>
															
														</tr>
													</thead>
													<tbody>
														<c:forEach var="listv" items="${list}">
															<tr>
																<td>${listv.recipe_no}</td>
																<td><a href="recipe_detail?recipe_no=${listv.recipe_no}"><img src="${pageContext.request.contextPath}/resources/image/recipe_upload/${listv.recipe_thumbnail}"  
																		style="height: 100px; width: 100px;"/></a></td>
																<td><a href="recipe_detail?recipe_no=${listv.recipe_no}">${listv.recipe_title}</a></td>
																<td>${listv.visit_cnt}</td>
																<td>${listv.recipe_uploadtime}</td>
																
															</tr>
														</c:forEach>
													</tbody>
												</table>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                
                                <div class="tab-pane fade" id="pills-class" role="tabpanel" aria-labelledby="pills-class-tab">                                    
                                     <div class="p-3 border mb-3">
									    <h5>수강중인 클래스 보기</h5>
									      <div class="row">
									     <div class="col-12">
									     <ul class="list-unstyled statistics">
									
												<table>
													<thead>
														<tr>
															<th colspan="5">클래스 리스트</th>
														</tr>
														<tr>
															<td>번호</td>
															<td>섬네일</td>
															<td>제목</td>
															<td>가격</td>
															<td>구매일자</td>
															
														</tr>
													</thead>
													<tbody>
														<c:forEach var="classlist" items="${classlist}">
															<tr>
															<!-- 세션값을 여기에서 mem_no로 숨겨받아서 다시 Controller로  -->
															<input type="hidden" name="mem_no" id="mem_no" value="${sessionScope.memNo}"/>
																<td>${classlist.class_no}</td>
																<td><a href="class_detail?class_no=${classlist.class_no}"><img src="${pageContext.request.contextPath}/resources\image\FoodImg/${classlist.class_thumbnail}"  
																					style="height: 100px; width: 100px;"/></a></td>
																<td><a href="class_detail?class_no=${classlist.class_no}">${classlist.class_title}</a></td>
																<td>${classlist.class_price}</td>
																<td>${classlist.payinfo.pay_info_date}</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
									
									           </ul>
									      </div>
									  </div>
									</div>
                                </div>
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
  <!--마이페이지 End -->

  
 </app-root> 
 
</body>
</html>
