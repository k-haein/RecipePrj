package kr.co.ikosmo.mvc.dao;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.ReviewJoinVO;
import kr.co.ikosmo.mvc.vo.ReviewVO;

public interface ReviewDAO {
	
	 
    /* class_detail 리뷰 후기 등록 처리 */
	 public int insertClassReview(ReviewVO ro) throws ServletException,IOException;
	
	
	 /* class_detail 리뷰 처리 */
	 public List<ReviewJoinVO> getReview(ReviewJoinVO ro) throws Exception; 	 

	 
	 
	 /* 삭제 처리 */	 
	 public int deleteClassReview(int review_no) throws Exception;
	 
	 
	 
	 
	 	
}	
