package spring.model.s_member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class S_MemberTest {
	
	public static void main(String[] args) {
		S_MemberDAO dao=new S_MemberDAO();
		//create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		//list(dao);
		//total(dao);
		passCheck(dao);
	}

	private static void passCheck(S_MemberDAO dao) {
		Map map=new HashMap();
		map.put("s_id", "stest");
		map.put("s_passwd", "1234");
		if(dao.passwdCheck(map)){
			p("로그인 성공");
		}else{
			p("비번 틀림");
		}
	}

	private static void read(S_MemberDAO dao) {
		String id="stest";
		try {
			S_MemberDTO dto=(S_MemberDTO) dao.read(id);
			p(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private static void update(S_MemberDAO dao) {
		S_MemberDTO dto=new S_MemberDTO();
		dto.setS_category("카테고리");
		dto.setS_email("비밀이야@우주소녀");
		dto.setS_hour("MON/13002000");
		dto.setS_info("연정이가 노래를잘함");
		dto.setS_location("37.493484,126.726519");
		dto.setS_name("유연정");
		dto.setS_passwd("1231");
		dto.setS_tel("10101011");
		
		try {
			if(dao.update(dto)){
				p("수정 성공");
			}else{
				p("수정 실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private static void delete(S_MemberDAO dao) {
		String id="stest2";
		try {
			if(dao.delete(id)){
				p("삭제성공");
			}else{
				p("삭제실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private static void list(S_MemberDAO dao) {
		Map map=new HashMap();
		try {
			List list=dao.list(map);
			for(int i=0;i<list.size();i++){
				S_MemberDTO dto=(S_MemberDTO)list.get(i);
				p(dto);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private static void p(S_MemberDTO dto) {
		p(dto.getS_id());
		p("===================");
	}

	private static void total(S_MemberDAO dao) {
		Map map=new HashMap();
		try {
			System.out.println("total="+dao.total(map));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}



		

	private static void create(S_MemberDAO dao) {
		S_MemberDTO dto=new S_MemberDTO();
		dto.setS_id("stest2");
		dto.setS_email("stest2@test.com");
		dto.setS_passwd("1234");
		dto.setS_tel("010-1234-5678");
		dto.setS_category("caffe");
		dto.setS_location("37.493484,126.726519");
		dto.setS_name("이디야");
		dto.setS_info("커피가 맛나요");
		dto.setS_hour("MON/09001700;TUE/09001700;WEN/09001700;THU/09001700;FRI/09001700;SAT/09001700;SUN/09001700;");
		
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
