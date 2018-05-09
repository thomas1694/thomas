package spring.model.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class QnaTest {

	public static void main(String[] args) {
		
		QnaDAO dao = new QnaDAO();
		
		//create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		//list(dao);
		
		
	}

	private static void delete(QnaDAO dao) {
		int q_num = 2;
		
		try {
			if(dao.delete(q_num)) {
				p("���� ����");
			}else{
				p("���� ���ФФ�");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	private static void list(QnaDAO dao) {
		Map map = new HashMap();
		
		try {
			List list = dao.list(map);
			for(int i=0; i<list.size(); i++) {
				QnaDTO dto = (QnaDTO) list.get(i);
				p(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private static void update(QnaDAO dao) {
		try {
			QnaDTO dto = (QnaDTO) dao.read(1);
			dto.setQ_title("�ٲ��� ��");
			dto.setQ_content("����ٲ�");
			if(dao.update(dto)) {
				p("���� ����");
			}else {
				p("���� ���ФФ�");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private static void read(QnaDAO dao) {
		int q_num = 2;
		try {
			QnaDTO dto = (QnaDTO) dao.read(q_num);
			p(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	private static void p(QnaDTO dto) {
		System.out.println("��ȣ:" + dto.getQ_num());
		System.out.println("����:" + dto.getQ_title());
		System.out.println("����:" + dto.getQ_content());
		System.out.println("�ۼ���:" + dto.getQ_wdate());
		System.out.println("���̵�:" + dto.getId());
		System.out.println("����/�����:" + dto.getQ_lock());
	}

	private static void create(QnaDAO dao) {
		
		QnaDTO dto = new QnaDTO();
		dto.setQ_num(3);
		dto.setQ_title("�������� ����");
		dto.setQ_content("����ϴ°ǰ��� �̻���Ʈ��");
		dto.setId("ctest");
		dto.setQ_lock("L");
		
		try {
			if(dao.create(dto)) {
				p("���� ����");
			}else {
				p("���� ���Ф�");
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
