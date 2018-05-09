package spring.model.statistics;

import gobook.c_member.C_MemberDAO;
import gobook.c_member.C_MemberDTO;

public class StaticTest {

	public static void main(String[] args) {
		StaticDAO dao = new StaticDAO();
		create(dao);
		//read(dao);
		//update(dao);
		//delete(dao);
		//list(dao);

	}

	private static void create(StaticDAO dao) {
		StaticDTO dto = new StaticDTO();
		dto.setS_id("stest");
		dto.setStat_visitcount(0);
		dto.setStat_femalevisit(0);
		dto.setStat_malevisit(0);
		dto.setStat_totalreserve_day(2);
		
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
	
	private static void p(StaticDTO dto) {
		p("아이디:" + dto.getS_id());
		p("방문자수:" + dto.getStat_visitcount());
		p("남자방문자수:" + dto.getStat_malevisit());
		p("여자방문자수:" + dto.getStat_femalevisit());
		p("날짜:" + dto.getStat_date());
		p("일간예약수:" + dto.getStat_totalreserve_day());
		p("일간판매액:" + dto.getStat_income());
		
	}
}
