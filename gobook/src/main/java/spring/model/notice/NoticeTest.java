package spring.model.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NoticeTest {

	public static void main(String[] args) {
		
		NoticeDAO dao = new NoticeDAO();
		
		create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		//list(dao);
		//total(dao);
		
		
	}

	private static void total(NoticeDAO dao) {
		// TODO Auto-generated method stub
		
	}

	private static void list(NoticeDAO dao) {
		Map map = new HashMap();
		try {
		List list = dao.list(map);
		for(int i=0; i<list.size(); i++) {
			NoticeDTO dto = (NoticeDTO) list.get(i); 
			p(dto);
		}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private static void delete(NoticeDAO dao) {
		int n_num = 1;
		try {
			if(dao.delete(n_num)) {
				p("��������!");
			}else {
				p("��������");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		
	}

	private static void update(NoticeDAO dao) {
		
		try {
			NoticeDTO dto = (NoticeDTO) dao.read(1);
			dto.setN_title("����������");
			dto.setN_content("õ�翴��;;");
			if(dao.update(dto)) {
				p("��������");
			}else {
				p("������Ʈ����!");
}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private static void read(NoticeDAO dao) {
		
		int n_num = 2;
		NoticeDTO dto;
		try {
			dto = (NoticeDTO) dao.read(n_num);
			p(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	private static void p(NoticeDTO dto) {
		System.out.println("��ȣ:" + dto.getN_num());
		System.out.println("����:" + dto.getN_title());
		System.out.println("����:" + dto.getN_content());
		System.out.println("��ϳ�¥:" + dto.getN_wdate());
		System.out.println("������ID:" + dto.getA_id());
		System.out.println("-----------------------");
		
	}

	private static void create(NoticeDAO dao) {
		NoticeDTO dto = new NoticeDTO();
		dto.setN_num(4);
		dto.setN_title("�����Դϴ�");
		dto.setN_content("õ��");
		//dto.setN_wdate("2018-05-03");
		dto.setA_id("atest");
		
		try {
			if(dao.create(dto)) {
				p("����");
			}else {
				p("���Ф�");
}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
	private static void p(String string) {
		System.out.println(string);
		
	}	
	
	
	}


