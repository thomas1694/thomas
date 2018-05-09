package spring.model.page_image;

import gobook.message.MessageDTO;

public class Page_ImageTest {

	public static void main(String[] args) {
		Page_ImageDAO dao = new Page_ImageDAO();
		
		//create(dao);
		//read(dao);
		//update(dao);
		delete(dao);
	}
	
	private static void delete(Page_ImageDAO dao) {
		try {
			if(dao.delete(1)) {
				p("성공");
			} else {
				p("실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void update(Page_ImageDAO dao) {
		try {
			Page_ImageDTO dto = (Page_ImageDTO) dao.read(1);
			dto.setPg_filename("1231231.jpg");
			dto.setPg_filesize(1123);
			if(dao.update(dto)) {
				p("성공");
			} else {
				p("실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void read(Page_ImageDAO dao) {
		try {
			p(dao.read(1));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

	private static void create(Page_ImageDAO dao) {
		Page_ImageDTO dto = new Page_ImageDTO();
		dto.setPg_num(1);
		dto.setPg_filename("aaa.jpg");
		dto.setPg_filesize(111);
		dto.setS_id("stest");
		try {
			if(dao.create(dto)) {
				p("성공");
			} else {
				p("실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void p(Object obj) {
		Page_ImageDTO dto = (Page_ImageDTO) obj;
		p("번호 : " + dto.getPg_num());
		p("파일이름 : " + dto.getPg_filename());
		p("파일크기 : " + dto.getPg_filesize());
		p("회원 ID : " + dto.getS_id());
		
	}

	private static void p(String string) {
		System.out.println(string);
	}

}
