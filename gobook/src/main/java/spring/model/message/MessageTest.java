package spring.model.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MessageTest {
	
	public static void main(String[] args) {
		MessageDAO dao = new MessageDAO();
		
		//create(dao);
		//read(dao);
		//delete(dao);
		//list(dao);
		//sendList(dao);
		//total(dao);
		//sendTotal(dao);
		upReadCheck(dao);
	}

	private static void upReadCheck(MessageDAO dao) {
		try {
			if(dao.upReadCheck(2)) {
				p("성공");
			} else {
				p("실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private static void sendtotal(MessageDAO dao) {
		Map map = new HashMap<>();
		map.put("col", "m_content");
		map.put("word", "테스트");
		map.put("id", "atest");
		try {
			p("보낸개수 : " + dao.sendTotal(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private static void total(MessageDAO dao) {
		Map map = new HashMap<>();
		map.put("col", "m_content");
		map.put("word", "테스트");
		map.put("id", "ctest");
		try {
			p("받은개수 : " + dao.total(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private static void sendlist(MessageDAO dao) {
		Map map = new HashMap();
		map.put("col", "");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		map.put("id", "atest");
		try {
			List list = dao.sendList(map);
			for(int i=0; i<list.size(); i++) {
				p("보낸개수 : " + list.get(i));
				p("---------------");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void list(MessageDAO dao) {
		Map map = new HashMap();
		map.put("col", "m_content");
		map.put("word", "테스트");
		map.put("sno", 1);
		map.put("eno", 5);
		map.put("id", "ctest");
		try {
			List list = dao.list(map);
			for(int i=0; i<list.size(); i++) {
				p(list.get(i));
				p("---------------");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void delete(MessageDAO dao) {
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

	private static void read(MessageDAO dao) {
		try {
			p(dao.read(1));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}

	private static void create(MessageDAO dao) {
		MessageDTO dto = new MessageDTO();
		dto.setM_content("메세트 테스트으으으");
		dto.setM_sendid("atest");
		dto.setM_receiveid("ctest");
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
		MessageDTO dto = (MessageDTO) obj;
		p("번호 : " + dto.getM_num());
		p("내용 : " + dto.getM_content());
		p("날짜 : " + dto.getM_wdate());
		p("보낸 ID : " + dto.getM_sendid());
		p("받은 ID : " + dto.getM_receiveid());
		p("읽음확인 : " + dto.getM_readcheck());
		
	}

	private static void p(String string) {
		System.out.println(string);
	}
	
}
