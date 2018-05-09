package spring.model.freeboard_reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class Freeboard_replyTest {

	public static void main(String[] args) {
		
		
		Freeboard_replyDAO dao = new Freeboard_replyDAO();
		
		//read(dao);
        //create(dao);
		//update(dao);
		//delete(dao);
		//list(dao);
		total(dao);
	}
	
	private static void total(Freeboard_replyDAO dao) {

		int f_num = 1;
		int total = dao.total(f_num);
		p("total:"+total);
	}
	

	private static void list(Freeboard_replyDAO dao) {
		int sno = 1;
		int eno = 5;
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("f_num", 1);
		
		List<Freeboard_replyDTO> list = dao.list(map);
		
		for(int i=0; i<list.size(); i++) {
			Freeboard_replyDTO dto = list.get(i);
			
			p(dto);
			p("------------");
		}
	}

	private static void delete(Freeboard_replyDAO dao) {
		if(dao.delete(1)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void update(Freeboard_replyDAO dao) {
		Freeboard_replyDTO dto = dao.read(1);
		dto.setFr_content("최진형");
		if (dao.update(dto)) {
			p("업데트되었슴당");
		} else {
			p("실패 ㅠㅠ");
			
		}
	}

	private static void create(Freeboard_replyDAO dao) {
		 Freeboard_replyDTO dto = new Freeboard_replyDTO();
		 dto.setFr_content("ㅗㅗㅗㅗㅗㅗ");
		 dto.setId("ctest");
		 dto.setF_num(1);
		 
		 if(dao.create(dto)) {
			System.out.println("성gong"); 
		 }else {
			 System.out.println("실pae");
		 }
	}

	
	private static void read(Freeboard_replyDAO dao) {
		int fr_num = 1;
		
		Freeboard_replyDTO dto = dao.read(fr_num);
		
		p(dto);
		
	}
	private static void p(String string) {
		System.out.println(string);
	}

	private static void p(Freeboard_replyDTO dto) {
		p("번호:"+dto.getFr_num());
		p("내용:"+dto.getFr_content());
		p("등록날짜:"+dto.getFr_wdate());
		p("작성자:"+dto.getId());
	}

}
