package spring.model.c_member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import www.dao.BbsDTO;

public class C_MemberTest {
	
	public static void main(String[] args) {
		Admin_MemberDAO dao=new Admin_MemberDAO();
		//create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		//list(dao);
		//passwdCheck(dao);
		//updatePasswd(dao);
		//emailCheck(dao);
		//idCheck(dao);
	}

	private static void idCheck(Admin_MemberDAO dao) {
		if(dao.idCheck("c_user9")) {
			p("중복id임. 사용불가능");
		}else {
			p("중복아님, id사용가능");
		}	
		
	}

	private static void emailCheck(Admin_MemberDAO dao) {
		if(dao.emailCheck("user1@gmail.com")) {
			p("중복임. 사용불가능");
		}else {
			p("중복아님, 사용가능");
		}		
	}

	private static void updatePasswd(Admin_MemberDAO dao) {
		//맵에 아이디 비번 넣어서 업데이트
		Map map = new HashMap();
		map.put("c_id", "c_user1");
		map.put("c_passwd", "1234");
		map.put("c_new_passwd", "2222");
		
		try {
			if(dao.updatePasswd(map)) {
				p("패스워드변경 성공");
			}else {
				p("패스워드 변경 실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	private static void passwdCheck(Admin_MemberDAO dao) {
		Map map = new HashMap();
		map.put("c_id", "c_user1");
		map.put("c_passwd", "1234");
		
		if(dao.passwdCheck(map)) {
			p("패스워드 일치");
		}else {
			p("패스워드 불일치");
		}
	}


	private static void list(Admin_MemberDAO dao) {
		Map map = new HashMap();
		map.put("col", "c_name");
		map.put("word", "몰랑");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<C_MemberDTO> list;
		try {
			list = dao.list(map);
			
			for (int i=0; i<list.size(); i++) {
				C_MemberDTO dto = list.get(i);
				p(dto);
				p("------------------------------");
			}	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
	}

	private static void delete(Admin_MemberDAO dao) {
		String pk = "c_user1";
		
		try {
			if(dao.delete(pk)) {
				p("삭제성공");
			}else {
				p("삭제실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}

	private static void update(Admin_MemberDAO dao) {
		C_MemberDTO dto = new C_MemberDTO();
		dto.setC_id("c_user1");
		dto.setC_tel("010-9999-9999");
		dto.setC_zipcode("22-11");
		dto.setC_address1("우리동네시");
		dto.setC_address2("어딘가아파트 106-802");
		dto.setC_email("user1@naver.com");
		dto.setC_interest("맛집,사교");
		dto.setC_nickname("생귤탱귤");
		
		try {
			if(dao.update(dto)) {
				p("수정성공!");
			}else {
				p("수정실패!");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	

	private static void read(Admin_MemberDAO dao) {
		String pk = "c_user1";
		C_MemberDTO dto = null;
		try {
			dto = dao.read(pk);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		p(dto);
	}


	private static void create(Admin_MemberDAO dao) {
		C_MemberDTO dto=new C_MemberDTO();
		dto.setC_id("c_user1");
		dto.setC_passwd("1234");
		dto.setC_gender("m");
		dto.setC_tel("010-1111-1111");
		dto.setC_zipcode("22-11");
		dto.setC_address1("우리동네시");
		dto.setC_address2("어딘가아파트 106-802");
		dto.setC_birth("1998-04-20");
		dto.setC_email("user1@naver.com");
		dto.setC_interest("병원,운동");
		dto.setC_name("김고북");
		dto.setC_nickname("몰랑이");

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
	
	private static void p(C_MemberDTO dto) {
		System.out.println("아이디:" + dto.getC_id());
		System.out.println("비번:" +dto.getC_passwd());
		System.out.println("성별:" +dto.getC_gender());
		System.out.println("전화번호:" +dto.getC_tel());
		System.out.println("우편번호:" +dto.getC_zipcode());
		System.out.println("주소:" +dto.getC_address1());
		System.out.println("상세주소:" +dto.getC_address2());
		System.out.println("생일:" +dto.getC_birth());
		System.out.println("이메일:" +dto.getC_email());
		System.out.println("관심분야:" +dto.getC_interest());
		System.out.println("닉네임:" +dto.getC_nickname());
		System.out.println("성명:" +dto.getC_name());
		
	}
	
}
