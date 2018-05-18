package spring.model.freeboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class FreeboardTest {

	public static void main(String[] args) {
		
		
		FreeboardDAO dao = new FreeboardDAO();
		
		read(dao);
        //create(dao);
		//update(dao);
		//delete(dao);
		//list(dao);
		//total(dao);
	}
	
	private static void total(FreeboardDAO dao) throws Exception {

			Map map = new HashMap();
			map.put("col", "id");
			map.put("word", "");
			
			int total = dao.total(map);
			
			p("레코드 개수: " + total);
		}
	

	private static void list(FreeboardDAO dao) throws Exception {
		Map map = new HashMap();
		map.put("col", "id");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<FreeboardDTO> list = dao.list(map);
		for (int i=0; i < list.size(); i++) {
			FreeboardDTO dto = list.get(i);
			p(dto);
			p("------------------");
		}
	}

	private static void delete(FreeboardDAO dao) {
		if(dao.delete(2)) {
			p("성공");
		}else {
			p("실패");
		}
	}

	private static void update(FreeboardDAO dao) {
		FreeboardDTO dto = dao.read(1);
		dto.setF_title("우하하하");
		dto.setF_content("최진형");
		if (dao.update(dto)) {
			p("업데트되었슴당");
		} else {
			p("실패 ㅠㅠ");
			
		}
	}

	private static void create(FreeboardDAO dao) throws Exception {
		 FreeboardDTO dto = new FreeboardDTO();
		 dto.setF_title("뭘좀아는친군데?");
		 dto.setF_content("ㅗㅗㅗㅗㅗㅗ");
		 dto.setId("ctest");
		 dto.setF_filename("ddfsdfsdf");
		 dto.setF_filesize(1);
		 if(dao.create(dto)) {
			System.out.println("성gong"); 
		 }else {
			 System.out.println("실pae");
		 }
	}

	
	private static void read(FreeboardDAO dao) {
		int f_num = 3;
		
		FreeboardDTO dto = dao.read(f_num);
		
		p(dto);
		
	}

	

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(FreeboardDTO dto) {
		p("번호:"+dto.getF_num());
		p("내용:"+dto.getF_content());
		p("등록날짜:"+dto.getF_wdate());
		p("작성자:"+dto.getId());
		p("grpno:"+dto.getF_grpno());
		p("ansnum:"+dto.getF_ansnum());
		p("indent:"+dto.getF_indent());
		
	}

}
