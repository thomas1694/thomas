package spring.model.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemberTest {
	
	public static void main(String[] args) {
		MemberDAO dao=new MemberDAO();
		create(dao);
		//read(dao);
		//list(dao);
		//delete(dao);
		//total(dao);
	}

	private static void total(MemberDAO dao) {
		Map map=new HashMap();
		try {
			System.out.println(dao.total(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private static void delete(MemberDAO dao) {

		String id="stest6";
		try {
			if(dao.delete(id)){
				p("삭제성공");
			}else{
				p("삭제 실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private static void list(MemberDAO dao) {
		
		Map map=new HashMap();
		List list;
		try {
			list = dao.list(map);
			for(int i=0;i<list.size();i++){
				MemberDTO dto=(MemberDTO)list.get(i);
				p(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static void p(MemberDTO dto) {
		System.out.println(dto.getId());
		System.out.println(dto.getGrade());
		System.out.println("================================");
		
	}

	private static void read(MemberDAO dao) {
		String pk="stest";
		try {
			MemberDTO dto=(MemberDTO) dao.read(pk);
			String id=dto.getId();
			System.out.println(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private static void create(MemberDAO dao) {
		MemberDTO dto=new MemberDTO();
		dto.setId("stest5");
		dto.setGrade("S");
		
		try {
			if(dao.create(dto)){
				p("생성 성공!");
			}else{
				p("생성 실패!");
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
