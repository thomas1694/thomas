package spring.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class ServiceTest {

	public static void main(String[] args) {
		
		ServiceDAO dao = new ServiceDAO();
		
		//list(dao);
		//read(dao);
		//create(dao);
		update(dao);
		//delete(dao);

	}

	
	private static void read(ServiceDAO dao) {
		int sv_num = 2;
		
		ServiceDTO dto = dao.read(sv_num);
		
		p(dto);
		
	}
	
	private static void list(ServiceDAO dao) {
        
		List<ServiceDTO> list = dao.list();
		for (int i = 0; i < list.size(); i++) {
			ServiceDTO dto = list.get(i);

			p(dto);
			p("--------");
		}
		}
	
	
	private static void update(ServiceDAO dao) {
		int sv_num = 2;
		ServiceDTO dto = dao.read(sv_num);
		dto.setSv_title("자바좃같아");
		dto.setSv_price(30000);
		dto.setSv_content("탈출못해 ㅅㅂ");
		
		if(dao.update(dto)) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
	}

	private static void create(ServiceDAO dao) {
	    ServiceDTO dto = new ServiceDTO();
	    
	    dto.setSv_num(2);
	    dto.setSv_num_upper(2);
	    dto.setSv_timeperson(1);
	    dto.setSv_title("방탕출");
	    dto.setSv_content("ㅋㅋㅋㅋㅋㅋㅋ");
	    dto.setS_id("stest");
	    dto.setSv_price(2000);
	    dto.setSv_template("A2-01");
	    
	    if(dao.create(dto)) {
	    	System.out.println("성공");
	    }else {
	    	System.out.println("실패");
	    }
	    
	}
	
	private static void delete(ServiceDAO dao) {
		int sv_num = 2;
		if(dao.delete(sv_num)) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
	}
	
	
	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(ServiceDTO dto) {
		p("번호:"+dto.getSv_num());
		p("상위카테고리:"+dto.getSv_num_upper());
		p("아이디:"+dto.getS_id());
		p("제목:"+dto.getSv_title());
		p("내용:"+dto.getSv_content());
		p("가격:"+dto.getSv_price());
		p("수용인원수:"+dto.getSv_timeperson());
		p("템플릿:"+dto.getSv_template());
		
	}

}
