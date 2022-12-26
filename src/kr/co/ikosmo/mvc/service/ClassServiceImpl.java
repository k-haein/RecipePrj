package kr.co.ikosmo.mvc.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ikosmo.mvc.dao.ClassDAOImpl;
import kr.co.ikosmo.mvc.vo.ClassPayInfoVO;
import kr.co.ikosmo.mvc.vo.ClassVO;

@Service("ClassService")
public class ClassServiceImpl implements ClassService {
	
	
	
	@Autowired
	private ClassDAOImpl classdao;
	
	
	
	
	
	@Override
	public void insertClass(ClassVO vo) throws Exception {
		classdao.insertClass(vo);
		System.out.print(vo.getMem_no());
		System.out.print(vo.getClass_thumbnail());
	}
	
	
	
	@Override
	  public void updateClass(ClassVO vo) throws Exception {		
		
		 classdao.updateClass(vo);		 
		  
	   }
	
	  
	  @Override
		public void deleteClass(int class_no) throws Exception {
			classdao.deleteClass(class_no);
		}


		
		@Override
		 public void classViewCnt(int class_no, HttpSession session) throws Exception {
				long update_time = 0;
				
				if(session.getAttribute("update_time_"+class_no) != null){
					
									
					update_time = (long)session.getAttribute("update_time_"+class_no);
				}
				
				long current_time = System.currentTimeMillis();
				
				
				if(current_time - update_time > 5*1000){
					
					classdao.classViewCnt(class_no);
					
					session.setAttribute("update_time_"+class_no, current_time);
					
				}
			}
		
	  
		  
				@Override
				public void insertPayClass(ClassPayInfoVO vo) throws Exception {
					classdao.insertPayClass(vo);
					
				}
				
		
				
				@Override
				public int getPayidCk(int class_no, int mem_no) throws Exception {
					
					
					return classdao.getPayidCk(class_no, mem_no);
				}
				

}
