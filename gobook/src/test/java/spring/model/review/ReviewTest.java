package spring.model.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sun.security.util.PropertyExpander.ExpandException;


public class ReviewTest {

	public static void main(String[] args) {
		
		ReviewDAO dao = new ReviewDAO();
		
		//read(dao);
		//create(dao);
		//update(dao);
		//delete(dao);
		//list(dao);
		total(dao);
		//upRe_count(dao);
	}  
 
	
	


	private static void upRe_count(ReviewDAO dao) {
		int pk=6;
		try {
			ReviewDTO dto=(ReviewDTO) dao.read(pk);
			p("전"+dto.getRe_count());
			dao.re_count(pk);
			dto=(ReviewDTO)dao.read(pk);
			p("후"+dto.getRe_count());
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	
			
	



	private static void update(ReviewDAO dao) {
		ReviewDTO dto;
		try {
			dto = (ReviewDTO) dao.read(6);
			dto.setRe_title("12321");
			dto.setRe_content("43423");
			dto.setRe_rating(1);
			
			if(dao.update(dto)) {
				p("업");
			}else {
				p("ss");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	private static void delete(ReviewDAO dao) {
		
		int re_num = 2;
		try {
			if(dao.delete(re_num)){
				p("삭제성공");
			}else{
				p("삭제 실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}



	private static void list(ReviewDAO dao) {
		Map map = new HashMap();
		map.put("sno", 1);
		map.put("eno", 5);
		List list;
		try {
			list = dao.list(map);
			for(int i=0; i<list.size();i++) {
				ReviewDTO dto = (ReviewDTO)list.get(i);
				p(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}


	private static void total(ReviewDAO dao) {
		Map map = new HashMap();
		
		try {
			System.out.println(dao.total(map));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}


	private static void create(ReviewDAO dao) {
		
		ReviewDTO dto = new ReviewDTO();
		dto.setRe_title("123");
		dto.setRe_content("13432");
		dto.setRe_rating(1);
		dto.setC_id("ctest");
		dto.setS_id("stest");
		
		
		try {
		if(dao.create(dto)) {
			p("성공");
		}else {
			p("실패");
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
	}


	private static void read(ReviewDAO dao) {
		int pk=6;
		try {
			ReviewDTO dto=(ReviewDTO) dao.read(pk);
			p(dto);			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(ReviewDTO dto) {
		p("번호:"+dto.getRe_num());
		p("제목:"+dto.getRe_title());
		p("내용:"+dto.getRe_content());
		p("파일이름:"+dto.getRe_filename());
		p("파일사이즈:"+dto.getRe_filesize());
		p("조회수:"+dto.getRe_count());
		p("조아요:"+dto.getRe_rating());
		p("조아요2:"+dto.getRe_like());
		p("c아이디:"+dto.getC_id());
		p("s아이디:"+dto.getS_id());
		p("날짜:"+dto.getRe_wdate());

		
	}

}
