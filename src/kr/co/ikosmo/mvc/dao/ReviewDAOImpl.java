package kr.co.ikosmo.mvc.dao;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.ikosmo.mvc.vo.ClassVO;
import kr.co.ikosmo.mvc.vo.ReviewJoinVO;
import kr.co.ikosmo.mvc.vo.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	
	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	  
	  
	 
	 
	  /* class_detail 리뷰 후기 등록 처리 */  
	 @Override 
	  public int insertClassReview(ReviewVO ro) throws ServletException,IOException {
		  System.out.println("===> Mybatis insertClassReview() 출력처리");
		  return mybatis.insert("review.insertClassReview", ro); 
		  
	 }


	 
	 @Override 
	 public List<ReviewJoinVO> getReview(ReviewJoinVO ro) {
	  System.out.println("===> Mybatis getReview() 출력처리"); 
	  List<ReviewJoinVO> reviewllist = mybatis.selectList("review.getReview", ro); 
	  
	  return reviewllist;
	  
	 }

	 
	 
	 /* 삭제 처리 */
	 
	 @Override
		public int deleteClassReview(int review_no) throws Exception {
			System.out.println("===> Mybatis deleteClassReview() 출력처리");
				return mybatis.delete("review.deleteClassReview",review_no);
		}
	 
  
  

}
