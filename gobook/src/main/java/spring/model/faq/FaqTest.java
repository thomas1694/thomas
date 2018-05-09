package spring.model.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FaqTest {

	public static void main(String[] args) {
		
		FaqDAO dao = new FaqDAO();
		
		//create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		list(dao);
		//total(dao);
		

	}

	private static void delete(FaqDAO dao) {
		int faq_num=3;
		try {
			if(dao.delete(3)) {
				p("���� ����");
			}else {
				p("���� ���Ф�");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void update(FaqDAO dao) {
		try {
			FaqDTO dto = (FaqDTO) dao.read(2);
			dto.setFaq_category("���̿�");
			dto.setFaq_title("ȯ�����ּ�");
			dto.setFaq_content("ȯ�Ҿ����ָ� �Ű���");
			if(dao.update(dto)) {
				p("���� ����");
			}else {
				p("���� ����");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void list(FaqDAO dao) {
		Map map = new HashMap();
		try {
			List list = dao.list(map);
			for(int i=0; i<list.size(); i++) {
				FaqDTO dto = (FaqDTO) list.get(i);
				p(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

	private static void read(FaqDAO dao) {
		int faq_num = 3;
		FaqDTO dto = new FaqDTO();
		try {
			dto = (FaqDTO) dao.read(faq_num);
			p(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private static void p(FaqDTO dto) {
		
		System.out.println("��ȣ:" + dto.getFaq_num());
		System.out.println("�з�:" + dto.getFaq_category());
		System.out.println("����:" + dto.getFaq_title());
		System.out.println("����:" + dto.getFaq_content());
		System.out.println("����:" + dto.getFaq_wdate());
		System.out.println("������ID:" + dto.getA_id());
		System.out.println("=======================");
		
	}

	private static void create(FaqDAO dao) {
		FaqDTO dto = new FaqDTO();
		dto.setFaq_num(3);
		dto.setFaq_category("���");
		dto.setFaq_title("����� ��� �ǳ���");
		dto.setFaq_content("�뷫���� �ݾ� �ñ�!");
		dto.setA_id("atest");
		
		try {
			if(dao.create(dto)) {
				p("���� ����");
			}else {
				p("���� ����!");
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
