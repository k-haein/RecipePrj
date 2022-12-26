<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

   
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Comments Start -->
          <div class="comments-list">
            <h4>2 Comments</h4>
        	<c:choose>
	        	<c:when test="${!empty reviewList}">
		            <c:forEach var="row" items="${reviewList}">
		  			<input type="hidden" name="review_no" class="review_no" id="review_no" value="${row.review_no}" readonly="readonly">
			            <ul>
			              <li class="comment-item">      ${row.review_no}
			                <img src="${pageContext.request.contextPath}/resources/image/member_upload/${row.member.mem_pic}" alt="comment author">
			                <div class="comment-body">
			                  <h5>${row.member.mem_nickname} &nbsp;
			                  <div class="reviewstar"><img src="${pageContext.request.contextPath}/resources/img/starrate${row.star_rate}.png"></div></h5>
			                  <span>Posted on: ${row.review_date}</span>
			                  <p>${row.review_content}</p>
					          <c:if test="${sessionScope.memNo == row.mem_no}">
				                  <a href="javascript:void(0);" id="deletereview" class="reply-link"> Delete </a>
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
          
          
          
          
          
          <!-- 댓글 등록하는 곳 -->
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
          <!-- Comments End -->
</body>
</html>